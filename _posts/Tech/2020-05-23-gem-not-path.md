---
layout: blog-posts
title:  "Can't find Gem Jekyll error"
date:   2020-05-23 11:32:00
categories: tech
tags:
- ruby, gems, jekyll
---

After a long time without using jekyll to serve my website, I come across this error when executing ```jekyll serve```:


```
/usr/lib/ruby/2.7.0/rubygems.rb:275:in `find_spec_for_exe':
	can't find gem jekyll (>= 0.a) with executable jekyll (Gem::GemNotFoundException)
```

Uninstall Jekyll and try to install following the guide in the [official docs](https://jekyllrb.com/).

```sh
[asari@asari-pc ~]$ gem uninstall jekyll 
Remove executables: 
        jekyll 
in addition to the gem? [Yn]  y 
Removing jekyll 
Successfully uninstalled jekyll-4.0.1 

```
>the error that comes with the install (don't mind for the interruption command, just pay attention to the WARNING.): 

teste
```sh
[asari@asari-pc ~]$ gem install bundler jekyll 
WARNING:  You don't have /home/asari/.gem/ruby/2.7.0/bin in your PATH, 
          gem executables will not run. 
Successfully installed bundler-2.1.4 
Parsing documentation for bundler-2.1.4 
Done installing documentation for bundler after 4 seconds 
^CERROR:  Interrupted 
```

So, basically, to install Jekyll and use gems inside your directory, you need to have a __Environment Variable__ that points to your ruby's binaries. If you already haven't, uninstall the current Jekyll (just follow the penultimate snippet code above). The environment variable can be put in different files, but if you have an Xsession, is more likely that ```~/.profile``` will work.

> PS: how do I know if I have a Xsession?

```sh
[asari@asari-pc ~]$ gem uninstall jekyll 
Remove executables: 
        jekyll 
in addition to the gem? [Yn]  y 
Removing jekyll 
Successfully uninstalled jekyll-4.0.1 

```
>uninstalling jekyll

put ```PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin" ``` under your ```~/.profile```. It means, in bash:

1. PATH="$PATH:
2. $(ruby -e 'puts Gem.user_dir')/bin"



```
#
# ~/.profile
#
#

[[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] || export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano

[[ -f ~/.extend.profile ]] && . ~/.extend.profile

# export FILE="ranger"
# export TERMINAL="st"


#PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin" 
```
example

then restart your session. Now, you should be able to run it without errors.

{% raw %}
```sh
[asari@asari-pc ~]$ gem install bundler jekyll 
Successfully installed bundler-2.1.4 
Parsing documentation for bundler-2.1.4 
Done installing documentation for bundler after 4 seconds 
Fetching jekyll-4.0.1.gem 
------------------------------------------------------------------------------------- 
Jekyll 4.0 comes with some major changes, notably: 
  * Our `link` tag now comes with the `relative_url` filter incorporated into it. 
    You should no longer prepend `{{ site.baseurl }}` to `{% link foo.md %}` 
    For further details: https://github.com/jekyll/jekyll/pull/6727 
  * Our `post_url` tag now comes with the `relative_url` filter incorporated into it. 
    You shouldn't prepend `{{ site.baseurl }}` to `{% post_url 2019-03-27-hello %}` 
    For further details: https://github.com/jekyll/jekyll/pull/7589 
  * Support for deprecated configuration options has been removed. We will no longer 
    output a warning and gracefully assign their values to the newer counterparts 
    internally. 
------------------------------------------------------------------------------------- 
Successfully installed jekyll-4.0.1 
Parsing documentation for jekyll-4.0.1 
Installing ri documentation for jekyll-4.0.1 
Done installing documentation for jekyll after 2 seconds 
2 gems installed 
```
{% endraw %}
---

Further reading/sources

- [Uninstalling RubyGems (just ctrl+f)](https://wiki.archlinux.org/index.php/RVM#Gems)
- [Allowing RubyGems to be executed](https://wiki.archlinux.org/index.php/ruby#Setup)
- [Choosing between .bashrc, .profile, .bash_profile](https://superuser.com/a/789465/905337)
- [What is the difference between ~/.profile and ~/.bash_profile?](https://unix.stackexchange.com/a/45687/358160)
 
---

Forum sources (just the topics to contextualize though)

- [WARNING: You don't have <\a directory> in your PATH, gem executables will not run](https://askubuntu.com/questions/406643/warning-you-dont-have-a-directory-in-your-path-gem-executables-will-not-run)
