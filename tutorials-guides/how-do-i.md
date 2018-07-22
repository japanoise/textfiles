# How do I...

## ...create a git remote without using GitHub, GitLab, etc?

[Stack overflow answer here.](https://stackoverflow.com/a/6649016)

Basically:

1. `ssh username@server`
2. `mkdir mygitrepo.git`
3. `cd mygitrepo.git`
4. `git init --bare`
5. `exit`
6. `git remote add origin ssh://username@server/path/to/mygitrepo.git`
7. `git push origin master`
