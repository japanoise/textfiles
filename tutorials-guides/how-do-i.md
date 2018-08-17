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

## ...make my keyboard layout better?

On Linux, you can use setxkbmap to tweak the options on your keyboard. In lxde
(or at least Lubuntu's lxde) you do this by adding a keyboard layout handler
widget, setting up your layouts there, and adding special rules in the box.

A list of special rules is in `/usr/share/X11/xkb/rules/base.lst`.

Here's some I use:

- `ctrl:swap_lalt_lctl_lwin` - Makes the LHS modifiers go WIN-ALT-CTRL - this is
  better for Emacs and is burned into my fingers.
- `compose:caps` - Puts `<Compose>` on the otherwise-useless `<Caps-Lock>` key.
- `grp:sclk_toggle` - Use `<ScrLk>` (scroll lock) as a layout switcher - good
  for switching between your favourite sane keyboard layout and QWERTY. You will
  never, ever use scroll lock for anything else!

## ...use WIN rather than ALT as a modifier in Openbox?

1. Find your rc file (on lubuntu it's `.config/openbox/lubuntu-rc.xml`)
2. Go to the tag `<context name="Frame">`
3. Change relevant actions from `A` to `W` e.g. `A-Left` → `W-Left`
4. Save and close
5. `openbox --reconfigure` (on lubuntu, `openbox-lubuntu --reconfigure`)
