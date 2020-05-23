---
layout: blog-posts
title:  "Japanese input in linux with Fcitx-Mozc"
date:   2020-05-23 00:56:42
categories: tech
tags:
- nihongo, xsession, xim, qt5, gtk3
---

Install fcitx-mozc

Create .pam_environment file in your home directory with the following contents:

```
XMODIFIERS=@im=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
DefaultIMModule=fcitx
```

Run ```fcitx-autostart``` in terminal. Re-login. Press ```Ctrl+Shift``` in text editor. Japanese input should become available. Pressing Ctrl+Shift should switch you back to your default language input. No need to add kbd layouts.

PS: if using KDE, add input method plasmoid to the panel.


---

further reading:

1. [xsession](https://en.m.wikipedia.org/wiki/X_session_manager)
2.
3.

