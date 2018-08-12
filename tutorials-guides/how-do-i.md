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

## ...make an emacs daemon run on startup?

If your system is infected with the systemdick:

1. `mkdir -p ~/.config/systemd/user/`
2. Enter the following into ~/.config/systemd/user/emacsd.service:
```
[Unit]
Description=Emacs: the extensible, self-documenting text editor
Documentation=man:emacs(1) info:Emacs


[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(progn (setq kill-emacs-hook nil) (kill-emacs))"
Restart=on-failure
Environment=DISPLAY=:%i
TimeoutStartSec=0

[Install]
WantedBy=default.target
```
3. `systemctl --user enable emacsd`
4. `systemctl --user start emacsd`

[(source)](http://wikemacs.org/wiki/Emacs_server#Linux)
