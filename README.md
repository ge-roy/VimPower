# About

Use this **.vimrc** file to make from your Vim a python IDE you'll love.

> Make sure your Vim is compiled with python 2 or python 3 support. Some of the plugins require it
> and won't work properly in case python support is missing.
> Vim 7.6 or higher preferred.

Raspberry Pi users can install pkg vim-nox which supports scripting languages:

```sh
sudo apt-get remove vim
sudo apt-get install vim-nox
```

Tested on:

> macOS High Sierra with default Vim pkg:
> VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Jun 25 2019 20:35:29)
> Included patches: 1-503, 505-680, 682-1283, 1365
> Compiled by root@apple.com
>
> macOS Catalina with Homebrew Vim pkg:
> VIM - Vi IMproved 8.1 (2018 May 18, compiled Feb 17 2020 07:29:12)
> Included patches: 1-2234
> Compiled by Homebrew

To check if your Vim supports python type next command:

```sh
~$ vi --version | grep python
```

An output should be something like this:

```sh
+cmdline_hist      +langmap           -python            +visual
+cmdline_info      +libcall           +python3           +visualextra
```

If you see + sign within one of them you are ready to go.
Before moving forward double check if you have already flake8 installed or use file `pipflake8req.txt` for doing this:

```sh                          
pip install -r pipflake8req.txt
```

### How to upgrade your Vim

Here are a few ways it can be done on your system.

- ##### If you are new to Vim

1. Make sure to delete your current `.vimrc` settings file and `.vim/` folder from your home directory `/home/<username>/` (`~/`) by typing:
```sh
~$ sudo rm ~/.vimrc
~$ sudo rm -r ~/.vim/
```
2. Place `.vimrc` file in a root of your home directory:
```sh
~$ cp </path/to/.vimrc> ~/
```
3. Use the command below to install Vim plugin manager (it will also create a new `~/.vim/` folder):
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
4. Place ***colors*** folder inside `.vim/`:
```sh
~$ cp -r </path/to/colors> ~/.vim/
```
5. Powerline plugin requires adopted fonts to display information correctly, grab this repo and install fonts:
```sh
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
```
6. Open your terminal preference and chose some of the fonts you've installed on previous step.
FYI: ***Literation Mono Powerline*** is a good one;
7. Run Vim:
```sh
~$ vi
```
Since there are a bunch of different plugins settings it should rise a lot of errors, no worries, press `<enter>` and go to the next step;
8. Inside Vim use command `:PluginInstall`. This will invoke Vundle to install/upgrade all of the pkgs specified in the settings file;
9. Restart Vim:
```sh
:q
~$ vi
```
10. Powerline plugin has ability to provide information about a venv you are using now (see "Commands and tips" section below). If this feature doesn't work automatically use this to fix it:
```sh
:Explore
```
Navigate to `~/.vim/bundle/powerline/powerline/config_files/themes/vim/default.json` and add:
```javascript
{
        "function": "powerline.segments.common.env.virtualenv",
        "draw_soft_divider": false,
        "after": " ",
        "before": "ⓔ "
},
```
Congrats, you are all set.

- ##### If you have already your own Vim config file

1. Take a look at `.vimrc` and grab any plugins and settings you want to use in your Vim. See "Used plugins" section to determine some useful info about them;
2. Try out Lucius themes, especially `:LuciusDarkLowContrast`.

- ##### For those who do not want to do most steps manually

1. Make sure to delete your current `.vimrc` settings file and `.vim/` folder from your home directory `/home/<username>/` (`~/`) by typing:
```sh
~$ sudo rm ~/.vimrc
~$ sudo rm -r ~/.vim/
```
2. Place `.vimrc` file in a root of your home directory:
```sh
~$ cp </path/to/.vimrc> ~/
```
3. Download [archive](https://drive.google.com/file/d/1eUH2VJEooC9KmXSZbwb1lqeHpDw8xDF7/view?usp=sharing) contains `.vim/` folder;
4. Place it in a home directory:
```sh
~$ cp -r </path/to/.vim> ~/
```

Enjoy!

### Additional information

- Used plugins

| Plugin | URL |
|--------|-----|
| gmarik/Vundle.vim            | https://github.com/VundleVim/Vundle.vim         |
| vim-scripts/indentpython.vim | https://github.com/vim-scripts/indentpython.vim |
| tmhedberg/SimpylFold         | https://github.com/tmhedberg/SimpylFold         |
| davidhalter/jedi-vim         | https://github.com/davidhalter/jedi-vim         |
| jnurmine/Zenburn             | https://github.com/jnurmine/Zenburn             |
| Lokaltog/powerline           | https://github.com/powerline/powerline          |
| jmcantrell/vim-virtualenv    | https://github.com/jmcantrell/vim-virtualenv    |
| vim-syntastic/syntastic      | https://github.com/vim-syntastic/syntastic      |
| scrooloose/nerdtree          | https://github.com/preservim/nerdtree           |
| Yggdroot/indentLine          | https://github.com/Yggdroot/indentLine          |

- Commands and tips

   + Close any open or active window/tab: `:q`;
   + Change Lucius themes `:Lucius` + `<tab>` or you may try out other themes from the box `:color` + `<tab>`;
   + Open files tree `:NERDTree`;
   + List of available virtual environments `:VirtualEnvList`;
   + To activate particular venv `:VirtualEnvActivate <venv name>`;
   + Fold your code: `<space>` or `za`.
   + Don't forget to use `<tab>` to get autocomplete your commands;
   + Want to move faster through you code? This small [article](https://medium.com/usevim/vim-101-quick-movement-c12889e759e0) can be very helpful in this case.
   + Move between open files/file tree:
```sh
                      ^
                  `CTRL + K`
          < `CTRL + H`  `CTRL + L` >
                  `CTRL + J`
                      v
```
