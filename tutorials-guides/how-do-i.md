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

## ...merge a pull request from a different fork on GitHub?

1. Add the other fork as a remote:
   `git remote add otherfork git://github.com/request-author/project.git`
2. Fetch the commits from the other fork:
   `git fetch otherfork`
3. Merge the commits:
   `git merge otherfork/pull-request-branch`

## ...change a Gerrit configuration?

You can't use push/pull the same way as you can with a normal branch. Instead,
you have to dance around it a bit.

```
mkdir gtproj
cd gtproj
git init
git remote add origin ssh://<USER>@<GERRITHOST>:29418/<PROJECT>
git fetch origin refs/meta/config:refs/remotes/origin/meta/config
git checkout meta/config
```

Make the changes, then:

```
git commit -a -m "Added label - Verified"
git push origin meta/config:meta/config
```

Finally, get everything up to date again:

```
git fetch origin refs/meta/config:refs/remotes/origin/meta/config
```

## ...convert between Intel Hex format and binary?

First install srec/srecord, so you get the srec_cat program.

hex → bin:

```
srec_cat myfile.hex -Intel -output myfile.bin -binary
```

bin → hex:

```
srec_cat myfile.bin -binary -output myfile.hex -Intel
```

## ...use an SSH proxy for Firefox?

[Answer from here.](https://calomel.org/firefox_ssh_proxy.html)

1. Go to about:preferences and scroll down to the bottom
2. Click "Settings" in the Network Settings subheading
3. Manual proxy configuration
4. SOCKS Host 127.0.0.1 port 8080 with SOCKSv5 ticked
5. Go to about:config
6. Set `network.proxy.socks_remote_dns` to true
7. Run `ssh -C2qTnN -D 8080 username@remote_machine.com`

## ...use Perl as a better `sed`?

[Answer from here.](https://stackoverflow.com/a/37686753)

- Pipe replace: `perl -p -e 's/.../.../g' file`
- Multi-regex: `perl -p -e s/a/b/g;s/d/c/g' file`
- Inline replace: `perl -pi -e 's/.../.../g' file`
