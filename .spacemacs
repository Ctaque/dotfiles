  ;; -*- mode: emacs-lisp -*-
  ;; This file is loaded by Spacemacs at startup.
  ;; It must be stored in your home directory.

  (defun dotspacemacs/layers ()
  "Configuration Layers declaration.
  You should not put any user code in this function besides modifying the variable
  values."
  (setq-default
  ;; Base distribution to use. This is a layer contained in the directory
  ;; `+distribution'. For now available distributions are `spacemacs-base'
  ;; or `spacemacs'. (default 'spacemacs)
  dotspacemacs-distribution 'spacemacs
  ;; Lazy installation of layers (i.e. layers are installed only when a file
  ;; with a supported type is opened). Possible values are `all', `unused'
  ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
  ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
  ;; lazy install any layer that support lazy installation even the layers
  ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
  ;; installation feature and you have to explicitly list a layer in the
  ;; variable `dotspacemacs-configuration-layers' to install it.
  ;; (default 'unused)
  dotspacemacs-enable-lazy-installation 'unused
  ;; If non-nil then Spacemacs will ask for confirmation before installing
  ;; a layer lazily. (default t)
  dotspacemacs-ask-for-lazy-installation t
  ;; If non-nil layers with lazy install support are lazy installed.
  ;; List of additional paths where to look for configuration layers.
  ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
  dotspacemacs-configuration-layer-path '()
  ;; List of configuration layers to load.
  dotspacemacs-configuration-layers
  '(elm
    rust
    ;; ((rust-mode (rust-backend . lsp)))
    react
    (typescript :variables
                typescript-fmt-on-save t)
    themes-megapack
    scala
    lsp
    emoji
    yaml
    sql
    html
    javascript
    ;; (lsp :variables
    ;;      lsp-rust-server 'rust-analyzer)
    php
    erc
    rcirc
    ;; ----------------------------------------------------------------
    ;; Example of useful layers you may want to use right away.
    ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
    ;; <M-m f e R> (Emacs style) to install them.
    ;; ----------------------------------------------------------------
    helm
    auto-completion
    ;; better-defaults
    emacs-lisp
    git
    markdown
    org
    ranger
    shell
    ;; spell-checking
    syntax-checking
    version-control
    )
  ;; List of additional packages that will be installed without being
  ;; wrapped in a layer. If you need some configuration for these
  ;; packages, then consider creating a layer. You can also put the
  ;; configuration in `dotspacemacs/user-config.
  dotspacemacs-additional-packages ()
  ;; A list of packages that cannot be updated.
  dotspacemacs-frozen-packages ()
  ;; A list of packages that will not be installed and loaded.
  dotspacemacs-excluded-packages ()
  ;; Defines the behaviour of Spacemacs when installing packages.
  ;; Possible values are `used-only, `used-but-keep-unused' and `all'.
  ;; `used-only' installs only explicitly used packages and uninstall any
  ;; unused packages as well as their unused dependencies.
  ;; `used-but-keep-unused' installs only the used packages but won't uninstall
  ;; them if they become unused. `all' installs *all* packages supported by
  ;; Spacemacs and never uninstall them. (default is `used-only')
  dotspacemacs-install-packages 'used-only))

  (defun dotspacemacs/init ()
  "Initialization function.
  This function is called at the very startup of Spacemacs initialization
  before layers configuration.
  You should not put any user code in there besides modifying the variable
  values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
  ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
  ;; possible. Set it to nil if you have no way to use HTTPS in your
  ;; environment, otherwise it is strongly recommended to let it set to t.
  ;; This variable has no effect if Emacs is launched with the parameter
  ;; `--insecure' which forces the value of this variable to nil.
  ;; (default t)
  dotspacemacs-elpa-https t
  ;; Maximum allowed time in seconds to contact an ELPA repository.
  dotspacemacs-elpa-timeout 5
  ;; If non nil then spacemacs will check for updates at startup
  ;; when the current branch is not `develop'. Note that checking for
  ;; new versions works via git commands, thus it calls GitHub services
  ;; whenever you start Emacs. (default nil)
  dotspacemacs-check-for-update t
  ;; If non-nil, a form that evaluates to a package directory. For example, to
  ;; use different package directories for different Emacs versions, set this
  ;; to `emacs-version'.
  dotspacemacs-elpa-subdirectory nil
  ;; One of `vim', `emacs' or `hybrid'.
  ;; `hybrid' is like `vim' except that `insert state' is replaced by the
  ;; `hybrid state' with `emacs' key bindings. The value can also be a list
  ;; with `:variables' keyword (similar to layers). Check the editing styles
  ;; section of the documentation for details on available variables.
  ;; (default 'vim)
  dotspacemacs-editing-style 'vim
  ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
  dotspacemacs-verbose-loading nil
  ;; Specify the startup banner. Default value is `official', it displays
  ;; the official spacemacs logo. An integer value is the index of text
  ;; banner, `random' chooses a random text banner in `core/banners'
  ;; directory. A string value must be a path to an image format supported
  ;; by your Emacs build.
  ;; If the value is nil then no banner is displayed. (default 'official)
  dotspacemacs-startup-banner 'official
  ;; List of items to show in startup buffer or an association list of
  ;; the form `(list-type . list-size)`. If nil then it is disabled.
  ;; Possible values for list-type are:
  ;; `recents' `bookmarks' `projects' `agenda' `todos'."
  ;; List sizes may be nil, in which case
  ;; `spacemacs-buffer-startup-lists-length' takes effect.
  dotspacemacs-startup-lists '((recents . 5)
                              (projects . 7))
  ;; True if the home buffer should respond to resize events.
  dotspacemacs-startup-buffer-responsive t
  ;; Default major mode of the scratch buffer (default `text-mode')
  dotspacemacs-scratch-mode 'text-mode
  ;; List of themes, the first of the list is loaded when spacemacs starts.
  ;; Press <SPC> T n to cycle to the next theme in the list (works great
  ;; with 2 themes variants, one dark and one light)
  dotspacemacs-themes '(doom-dracula
                        gruvbox-dark-soft
                        spacemacs-light)
  ;; If non nil the cursor color matches the state color in GUI Emacs.
  dotspacemacs-colorize-cursor-according-to-state t
  ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
  ;; quickly tweak the mode-line size to make separators look not too crappy.
  dotspacemacs-default-font '("Source Code Pro"
                              :size 13
                              :weight normal
                              :width normal
                              :powerline-scale 1.1)
  ;; The leader key
  dotspacemacs-leader-key "SPC"
  ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
  ;; (default "SPC")
  dotspacemacs-emacs-command-key "SPC"
  ;; The key used for Vim Ex commands (default ":")
  dotspacemacs-ex-command-key ":"
  ;; The leader key accessible in `emacs state' and `insert state'
  ;; (default "M-m")
  dotspacemacs-emacs-leader-key "M-m"
  ;; Major mode leader key is a shortcut key which is the equivalent of
  ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
  dotspacemacs-major-mode-leader-key ","
  ;; Major mode leader key accessible in `emacs state' and `insert state'.
  ;; (default "C-M-m")
  dotspacemacs-major-mode-emacs-leader-key "C-M-m"
  ;; These variables control whether separate commands are bound in the GUI to
  ;; the key pairs C-i, TAB and C-m, RET.
  ;; Setting it to a non-nil value, allows for separate commands under <C-i>
  ;; and TAB or <C-m> and RET.
  ;; In the terminal, these pairs are generally indistinguishable, so this only
  ;; works in the GUI. (default nil)
  dotspacemacs-distinguish-gui-tab nil
  ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
  dotspacemacs-remap-Y-to-y$ nil
  ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
  ;; there. (default t)
  dotspacemacs-retain-visual-state-on-shift t
  ;; If non-nil, J and K move lines up and down when in visual mode.
  ;; (default nil)
  dotspacemacs-visual-line-move-text nil
  ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
  ;; (default nil)
  dotspacemacs-ex-substitute-global nil
  ;; Name of the default layout (default "Default")
  dotspacemacs-default-layout-name "Default"
  ;; If non nil the default layout name is displayed in the mode-line.
  ;; (default nil)
  dotspacemacs-display-default-layout nil
  ;; If non nil then the last auto saved layouts are resume automatically upon
  ;; start. (default nil)
  dotspacemacs-auto-resume-layouts nil
  ;; Size (in MB) above which spacemacs will prompt to open the large file
  ;; literally to avoid performance issues. Opening a file literally means that
  ;; no major mode or minor modes are active. (default is 1)
  dotspacemacs-large-file-size 1
  ;; Location where to auto-save files. Possible values are `original' to
  ;; auto-save the file in-place, `cache' to auto-save the file to another
  ;; file stored in the cache directory and `nil' to disable auto-saving.
  ;; (default 'cache)
  dotspacemacs-auto-save-file-location 'cache
  ;; Maximum number of rollback slots to keep in the cache. (default 5)
  dotspacemacs-max-rollback-slots 5
  ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
  dotspacemacs-helm-resize nil
  ;; if non nil, the helm header is hidden when there is only one source.
  ;; (default nil)
  dotspacemacs-helm-no-header nil
  ;; define the position to display `helm', options are `bottom', `top',
  ;; `left', or `right'. (default 'bottom)
  dotspacemacs-helm-position 'bottom
  ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
  ;; in all non-asynchronous sources. If set to `source', preserve individual
  ;; source settings. Else, disable fuzzy matching in all sources.
  ;; (default 'always)
  dotspacemacs-helm-use-fuzzy 'always
  ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
  ;; several times cycle between the kill ring content. (default nil)
  dotspacemacs-enable-paste-transient-state nil
  ;; Which-key delay in seconds. The which-key buffer is the popup listing
  ;; the commands bound to the current keystroke sequence. (default 0.4)
  dotspacemacs-which-key-delay 0.4
  ;; Which-key frame position. Possible values are `right', `bottom' and
  ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
  ;; right; if there is insufficient space it displays it at the bottom.
  ;; (default 'bottom)
  dotspacemacs-which-key-position 'bottom
  ;; If non nil a progress bar is displayed when spacemacs is loading. This
  ;; may increase the boot time on some systems and emacs builds, set it to
  ;; nil to boost the loading time. (default t)
  dotspacemacs-loading-progress-bar t
  ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
  ;; (Emacs 24.4+ only)
  dotspacemacs-fullscreen-at-startup nil
  ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
  ;; Use to disable fullscreen animations in OSX. (default nil)
  dotspacemacs-fullscreen-use-non-native nil
  ;; If non nil the frame is maximized when Emacs starts up.
  ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
  ;; (default nil) (Emacs 24.4+ only)
  dotspacemacs-maximized-at-startup nil
  ;; A value from the range (0..100), in increasing opacity, which describes
  ;; the transparency level of a frame when it's active or selected.
  ;; Transparency can be toggled through `toggle-transparency'. (default 90)
  dotspacemacs-active-transparency 90
  ;; A value from the range (0..100), in increasing opacity, which describes
  ;; the transparency level of a frame when it's inactive or deselected.
  ;; Transparency can be toggled through `toggle-transparency'. (default 90)
  dotspacemacs-inactive-transparency 90
  ;; If non nil show the titles of transient states. (default t)
  dotspacemacs-show-transient-state-title t
  ;; If non nil show the color guide hint for transient state keys. (default t)
  dotspacemacs-show-transient-state-color-guide t
  ;; If non nil unicode symbols are displayed in the mode line. (default t)
  dotspacemacs-mode-line-unicode-symbols nil
  ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
  ;; scrolling overrides the default behavior of Emacs which recenters point
  ;; when it reaches the top or bottom of the screen. (default t)
  dotspacemacs-mode-line-theme 'vim-powerline
  dotspacemacs-smooth-scrolling t
  ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
  ;; derivatives. If set to `relative', also turns on relative line numbers.
  ;; (default nil)
  dotspacemacs-line-numbers t
  ;; Code folding method. Possible values are `evil' and `origami'.
  ;; (default 'evil)
  dotspacemacs-folding-method 'evil
  ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
  ;; (default nil)
  dotspacemacs-smartparens-strict-mode t
  ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
  ;; over any automatically added closing parenthesis, bracket, quote, etc…
  ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
  dotspacemacs-smart-closing-parenthesis nil
  ;; Select a scope to highlight delimiters. Possible values are `any',
  ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
  ;; emphasis the current one). (default 'all)
  dotspacemacs-highlight-delimiters 'all
  ;; If non nil, advise quit functions to keep server open when quitting.
  ;; (default nil)
  dotspacemacs-persistent-server nil
  ;; List of search tool executable names. Spacemacs uses the first installed
  ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
  ;; (default '("ag" "pt" "ack" "grep"))
  dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
  ;; The default package repository used if no explicit repository has been
  ;; specified with an installed package.
  ;; Not used for now. (default nil)
  dotspacemacs-default-package-repository nil
  ;; Delete whitespace while saving buffer. Possible values are `all'
  ;; to aggressively delete empty line and long sequences of whitespace,
  ;; `trailing' to delete only the whitespace at end of lines, `changed'to
  ;; delete only whitespace for changed lines or `nil' to disable cleanup.
  ;; (default nil)
  dotspacemacs-whitespace-cleanup nil
  ))

  (defun dotspacemacs/user-init ()
  "Initialization function for user code.
  It is called immediately after `dotspacemacs/init', before layer configuration
  executes.
  This function is mostly useful for variables that need to be set
  before packages are loaded. If you are unsure, you should try in setting them in
  `dotspacemacs/user-config' first."
  )

  (defun dotspacemacs/user-config ()
  "Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after
  layers configuration.
  This is the place where most of your configurations should be done. Unless it is
  explicitly specified that a variable should be set before a package is loaded,
  you should place your code here."
  (setq powerline-default-separator 'slant)

  (setq org-latex-listings 'minted
        org-src-tab-acts-natively t
        org-latex-packages-alist '(("" "minted"))
        org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  ;; typescript-tsx-mode LSP 4 spaces indentation
  (add-hook 'typescript-tsx-mode-hook (lambda () (setq-local tab-width 4)))
  (add-hook 'typescript-mode-hook (lambda () (setq-local tab-width 4)))
   )

  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#f1c40f" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")) t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (cargo toml-mode racer flycheck-rust rust-mode lv transient company-lsp dart-mode lsp-ui lsp-mode ht company-flow noflet ensime sbt-mode scala-mode white-sand-theme rebecca-theme org-mime exotica-theme rcirc-notify rcirc-color erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks org-category-capture ghub let-alist tide typescript-mode zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatland-theme farmhouse-theme espresso-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme pdf-tools tablist ox-reveal emoji-cheat-sheet-plus company-emoji winum ranger fuzzy xterm-color shell-pop org-projectile org-present org-pomodoro alert log4e gntp multi-term htmlize helm-company helm-c-yasnippet gnuplot eshell-z eshell-prompt-extras esh-help company-web web-completion-data company-tern dash-functional auto-yasnippet ac-ispell company-statistics company mwim git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck auto-dictionary org-download diff-hl smeargle orgit org mmm-mode markdown-toc magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor markdown-mode yaml-mode dracula-theme tern web-mode neotree expand-region php-mode flatui-theme sql-indent tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode auto-complete php-eldoc php+-mode phpunit phpcbf php-extras php-auto-yasnippets yasnippet drupal-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#ecf0f1")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9")
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
  
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#f1c40f" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (posframe lsp-treemacs lsp-java helm-lsp cargo toml-mode racer flycheck-rust rust-mode lv transient company-lsp dart-mode lsp-ui lsp-mode ht company-flow noflet ensime sbt-mode scala-mode white-sand-theme rebecca-theme org-mime exotica-theme rcirc-notify rcirc-color erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks org-category-capture ghub let-alist tide typescript-mode zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatland-theme farmhouse-theme espresso-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme pdf-tools tablist ox-reveal emoji-cheat-sheet-plus company-emoji winum ranger fuzzy xterm-color shell-pop org-projectile org-present org-pomodoro alert log4e gntp multi-term htmlize helm-company helm-c-yasnippet gnuplot eshell-z eshell-prompt-extras esh-help company-web web-completion-data company-tern dash-functional auto-yasnippet ac-ispell company-statistics company mwim git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck auto-dictionary org-download diff-hl smeargle orgit org mmm-mode markdown-toc magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor markdown-mode yaml-mode dracula-theme tern web-mode neotree expand-region php-mode flatui-theme sql-indent tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode auto-complete php-eldoc php+-mode phpunit phpcbf php-extras php-auto-yasnippets yasnippet drupal-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#ecf0f1")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9")
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
