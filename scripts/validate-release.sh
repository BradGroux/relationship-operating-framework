#!/usr/bin/env bash
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
test -z "$(git status --porcelain)" || { echo 'Working tree is not clean.' >&2; exit 1; }
python3 - "${1:-v$(cat VERSION)}" <<'PY'
import datetime, json, re, subprocess, sys
repo = 'BradGroux/relationship-operating-framework'
tag = sys.argv[1]
def run(*args):
    return subprocess.check_output(args, text=True).strip()
def api(path):
    return json.loads(run('gh', 'api', '--hostname', 'github.com', path))
def require(value, message):
    if not value:
        raise SystemExit(message)
legacy = tag in ('v1.0.0', 'v1.1.0')
require(legacy or re.fullmatch(r'v\d{4}\.\d{2}\.\d{2}(?:\.[1-9]\d*)?', tag), 'Invalid release tag')
require(api('user')['login'] == 'BradGroux', 'Wrong GitHub identity')
obj = run('git', 'rev-parse', '--verify', f'refs/tags/{tag}^{{tag}}')
commit = run('git', 'rev-parse', f'refs/tags/{tag}^{{commit}}')
ref = api(f'repos/{repo}/git/ref/tags/{tag}')['object']
require(ref['type'] == 'tag' and ref['sha'] == obj, 'Remote annotated tag mismatch')
remote = api(f'repos/{repo}/git/tags/{obj}')
require(remote['object']['type'] == 'commit' and remote['object']['sha'] == commit, 'Peeled commit mismatch')
require(remote['tag'] == tag and remote['tagger']['name'] == 'Brad Groux', 'Tag identity mismatch')
ls = run('git', 'ls-remote', f'https://github.com/{repo}.git', f'refs/tags/{tag}', f'refs/tags/{tag}^{{}}')
require(f'{obj}\trefs/tags/{tag}' in ls and f'{commit}\trefs/tags/{tag}^{{}}' in ls, 'Git transport tag mismatch')
release = api(f'repos/{repo}/releases/tags/{tag}')
require(release['tag_name'] == tag and not release['draft'] and not release['prerelease'], 'Release is not final')
require(release['author']['login'] == 'BradGroux' and release.get('performed_via_github_app') is None, 'Release author mismatch')
require(not release['assets'], 'Unexpected release assets')
if legacy:
    if tag == 'v1.1.0':
        require(run('git', 'show', f'{tag}:VERSION') == tag[1:], 'Historical VERSION mismatch')
    print('Historical identity/state verified; legacy public bodies lack an exact committed source. No current-content or body-equivalence claim.')
else:
    require(run('git', 'rev-parse', 'HEAD') == commit, 'Current release must target HEAD')
    require(run('git', 'show', f'{tag}:VERSION') == tag[1:], 'VERSION mismatch')
    subprocess.run(['./scripts/validate-repository.sh'], check=True)
    notes = run('git', 'show', f'{tag}:project/releases/{tag}.md')
    require(notes.replace('\r\n', '\n').rstrip() == release['body'].replace('\r\n', '\n').rstrip(), 'Release body differs from committed notes')
    date = datetime.datetime.strptime(tag[1:11], '%Y.%m.%d').date().isoformat()
    require(release['published_at'][:10] == date, 'Publication date differs from edition')
print(f'Release verified: {tag} object {obj} commit {commit}')
PY
