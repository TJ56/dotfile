```  
                                  _oo8oo_
                                 o8888888o
                                 88" . "88
                                 (| -_- |)
                                 0\  =  /0
                               ___/'==='\___
                             .' \\|     |// '.
                            / \\|||  :  |||// \
                           / _||||| -:- |||||_ \
                          |   | \\\  -  /// |   |
                          | \_|  ''\---/''  |_/ |
                          \  .-\__  '-'  __/-.  /
                        ___'. .'  /--.--\  '. .'___
                     ."" '<  '.___\_<|>_/___.'  >' "".
                    | | :  `- \`.:`\ _ /`:.`/ -`  : | |
                    \  \ `-.   \_ __\ /__ _/   .-` /  /
                =====`-.____`.___ \_____/ ___.`____.-`=====
                                  `=---=`
  
  
            ~~~~~~~ https://github.com/TJ56/dotfiles.git ~~~~~~~
 
                        God Bless Code No Bug Forever
```

TJ's DotFiles
===

This is an repository of the setting files and plugins for some useful tools(screen, tmux, vim, zsh, ...).

# PEREQUISITES:

### General Packages installation

* git
* svn
* zsh
* screen
* tmux
    - version >= 1.9
* vim
    - version >= 7.3

> ##### package-name
> - Debian distro:
> 
>   sudo apt-get install package-name
        
> - Arch Linux:
>
>       pacman -S package-name


### Specific Packages installation

> ##### ctags
> - Debian
>     
>       sudo apt-ge install exuberant-ctags    

> - Arch Linux
>
>       pacman -S ctags


# HOW TO INSTALL

### 1. Clone the repository
    # git clone https://github.com/TJ56/dotfiles.git
    
### 2. Install the preferred topics
* >#Prepare 

    >touch default rc-file if it doesn't exist in your home/ directory (~/.bashrc & ~/.zshrc ..etc)

        # touch .screenrc
        # touch .tmux.conf
        # touch .vimrc
        # mkdir .vim
        # mkdir .zsh

* >#screen/tmux

    >add the following settings to your default shell rc-file(~/.bashrc or ~/.zshrc)
    to enable 256color settings

        ...
        export TERM=xterm
        #enable 256color for terminal multiplexs
        alias tmux='TERM=xterm-256color tmux -2'
        alias screen='TERM=xterm-256color screen'
        ...

    >soft-link the setting files

        # rm ~/.screenrc  && ln -s dotfiles/.screenrc  ~/.screenrc  
        # rm ~/.tmux.conf && ln -s dotfiles/.tmux.conf ~/.tmux.conf  
    
* >#tmux tpm plugin management

    > dotfiles/.tmux/plugins/tpm, update as needed

        # git pull 
         
    > if directory is empty

        # git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
* >#Vim

    >In case you want to save your original Vim setting, you can move the original .vim/ as below

        # mv ~/.vim ~/dotfiles/.vim/extfdr

    >soft-link commands:

        # rm ~/.vimrc   && ln -s dotfiles/.vimrc ~/.vimrc  
        # rm ~/.vim -rf && ln -s dotfiles/.vim   ~/.vim  

* ># zsh

    >soft-link commands:

        # rm ~/.zshrc   && ln -s dotfiles/.zshrc ~/.zshrc
        # rm ~/.zsh -rf && ln -s dotfiles/.zsh   ~/.zsh

* ># ydict (Yahoo Dictionary on console):

    >_svn_ is required

        # cd ~/dotfiles
        # ./commands/update_ydict.sh 

* ># Others

    >my gnt setting file for finch

        # rm ~/.gntrc && ln -s dotfiles/.gntrc ~/.gntrc  


### 3. Sync files

* >### Pull the submodules' files

        # cd dotfiles  
        # git pull
        # ./commands/submod_sync.sh
        # ./commands/submod_upgrade.sh


##Vim PLUGIN INFO

###Other Installed ViM Plugins in the repository

+ >#[auto-pairs](https://github.com/vim-scripts/Auto-Pairs): 

    >Insert or delete brackets, parens, quotes in pair.

+ >#[crefvim](http://github.com/vim-scripts/CRefVim)

    >C reference support for ViM(Howto is described in [my blog](http://samuelololol.blogspot.com/2010/01/crefvim-c-reference-manual-especially.html))

+ >#[doxygentoolkit](https://github.com/vim-scripts/DoxygenToolkit.vim)

    >Simplify Doxygen documentation in C, C++, Python.

<!--
+ >#[LanguageTool](http://www.vim.org/scripts/script.php?script_id=3223)  
  
    >[LanguageTool](http://www.languagetool.org/) : Grammar checker for English, French, German (etc.) in Vim   
    (require _java-jdk_ support)  
    Project Homepage: [http://www.languagetool.org/](http://www.languagetool.org/)  
    Project CVS:   

        cvs -z3 \   
        -d:pserver:anonymous@languagetool.cvs.sourceforge.net:/cvsroot/languagetool \   
        co -P JLanguageTool   
-->

+ >#[matchit](https://github.com/vim-scripts/matchit.zip)

    >Extended % matching for HTML, LaTeX, and many other languages

+ >#[nerdtree](https://github.com/scrooloose/nerdtree): 

    >A tree explorer plugin for navigating the filesystem

+ >#[neocomplcache](https://github.com/Shougo/neocomplcache): 

    >Ultimate auto-completion system for Vim

+ >#[neocomplcache-snippets-complete](https://github.com/Shougo/neocomplcache-snippets-complete): 

    >neocomplcache complete snippets source

+ >#[surround](https://github.com/vim-scripts/surround.vim):

    >Delete/change/add parentheses/quotes/XML-tags/much more with ease

+ >#[tagbar](https://github.com/majutsushi/tagbar)
    
    >Vim plugin that displays tags in a window, ordered by class etc.

+ >#[valgrind](https://github.com/vim-scripts/valgrind.vim)

    >Navigate in the output of the memory checker valgrind

+ >#[EasyMotion](https://github.com/Lokaltog/vim-easymotion)

    >Vim motions on speed!

+ >#[vim-pathogen](https://github.com/tpope/vim-pathogen)

    >pathogen.vim: manage your runtimepath

+ >#[VisIncr](https://github.com/vim-scripts/VisIncr)

    >visincrPlugin.vim: making a column of increasing or decreasing numbers, dates, or daynames

## Vim Personal Features
   
+ >#Cscope/ctags

    >generating meta files for Cscpoe/ctags

        :CSCTgenC cscope  "generating cscope.out and processing the add into Vim
        :CSCTgenC ctags   "generation ctags for taglist/tagbar
        :CSCTgenC clean   "remove cscope/ctags files
    
+ >#Switch Window

        gw: "next window"
        gW: "last window"

+ >#Move tab to next as an window

        ,: "move window to next tab"
        .: "move window to last tab"

+ >#Key-binding

        NERDTree:           <F2>
        Taglist:            <F3>
        Tagbar:             <F4>
        Update file:        <F5> (update and go the bottom of the file <C-\><C-R>)
        Scroll bind/unbind: <F6>
        Set paste/nopaste:  <F7>
        Update NERDTree list: <Leader><r>
        Open/Close QuickFix:  <Leader><q>
        Yahoo Dictionary: <C-K> (cursor on the word, or virtual mode selected)

+ >#English/Chinese Dictionary Translateion

    >_ydict_ is required

        1. Select a pharse in virtaul-mode and press <C-k> or
        2. put the cursor under a word and press <C-k>

##OTHER FEATURES:
+ >#zsh

    >[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

          A community-driven framework for managing your zsh configuration. 
        Includes 40+ optional plugins (rails, git, OSX, hub, capistrano, 
        brew, ant, macports, etc), over 80 terminal themes to spice up your 
        morning, and an auto-update tool so that makes it easy to keep up 
        with the latest updates from the community.

    >[Theme](https://github.com/robbyrussell/oh-my-zsh/wiki/themes): 
    [https://github.com/robbyrussell/oh-my-zsh/wiki/themes](https://github.com/robbyrussell/oh-my-zsh/wiki/themes)


+ >#screen

    >**Key-binding**

    **window behavior**

            window-kill    <F9>
            window-create  <F10>
            prev-window    <F11>
            next-window    <F12>

    **content copy**

            copy mode              <C-a>[
            select                 <space>
            copy(yank)             <space>
            paste                  <C-a>]

+ >#tmux

    >![dotfiles][1]

    >Key-binding

    **window/pane behavior**

            prefix key       <C-a>
            kill-pane        <F9>
            new-window       <F10>
            previous-window  <F11>
            next-window      <F12>

    **pane split**
    
            split pane             <C-a>s
            split pane vertically  <C-a>v

    **content copy**

            copy mode        <C-a>[
            select           v
            copy(yank)       y
            paste            <C-a>]

    **mouse mode**

            ON               <C-a> m   (xtrem scroll mode, convenient for tmux-system copy behavior)
            OFF              <C-a> M   (enable the X-system native copy/paste behavior)

<!--
+ LanguageTool installation 

    > Requirements:  

        (gentoo)  
        >= _dev-java/sun-jdk_-1.604  
        _dev-java/ant_  
        _dev-vcs/cvs_  

    > Use the following commands

        # cd ~/dotfiles  
        # ./commands/build_languagetool.sh
-->
[1]: https://raw.github.com/samuelololol/dotfiles/master/.img/tmux-statusbar-window-titles.png

<!-- {{{ 
* my custom Vim script  

    samuelololol/plugin/

        mycodetoblogger.vim  function of blogger posting
        mycscope.vim         key map for cscope  
        mycsct.vim           ctags/cscope detection and generation  
        mymaptoggle.vim      contain a function used by MoveTo*()  
        mymvtotab.vim        MoveTo*() function used for moving tab  
        myvalgrind.vim       valgrind setting for Vim
        myydict.vim          bind key to look up yahoo dictionary 
        mybrace.vim.bak      brace utils (suspending, using auto-pairs) 
        ...

NOTES
===========
            1. add submodule with single script command:

                ~/dotfiles/ $ ./commands/add_submodule.sh <FULL GIT REPO PATH> \
                                ./.vim/bundle/<local folder name for the plugin>

            2. delete submodule 

                Delete the relevant section from the .gitmodules file.
                Delete the relevant section from .git/config.
                Run git rm --cached path_to_submodule (no trailing slash).
                Commit and delete the now untracked submodule files.

            3. add git tag
                
               add tag:
                    git tag -a <tag> <commit sha1>

               upload tag:
                    single tag: git push origin <tag>
                    multiple:   git push origin --tags

            4. delete tag

               local:
                    git tag -d <tag>
               remote:
                    git push origin :ref/tags/<mytag>
                    
            5. show remote branch and push place
            	local:
                	git remote show origin
}}} 
vim:fdm=marker
-->
