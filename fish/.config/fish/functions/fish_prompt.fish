# name: bobthefish
#
# bobthefish is a Powerline-style, Git-aware fish theme optimized for awesome.
#
# You will need a Powerline-patched font for this to work:
#
#     https://powerline.readthedocs.org/en/master/installation.html#patched-fonts
#
# I recommend picking one of these:
#
#     https://github.com/Lokaltog/powerline-fonts
#
# For more advanced awesome, install a nerd fonts patched font (and be sure to
# enable nerd fonts support with `set -g theme_nerd_fonts yes`):
#
#     https://github.com/ryanoasis/nerd-fonts
#
# You can override some default prompt options in your config.fish:
#
#     set -g theme_display_git no
#     set -g theme_display_git_dirty no
#     set -g theme_display_git_untracked no
#     set -g theme_display_git_ahead_verbose yes
#     set -g theme_display_git_dirty_verbose yes
#     set -g theme_display_git_stashed_verbose yes
#     set -g theme_display_git_master_branch yes
#     set -g theme_git_worktree_support yes
#     set -g theme_display_vagrant yes
#     set -g theme_display_docker_machine no
#     set -g theme_display_k8s_context yes
#     set -g theme_display_hg yes
#     set -g theme_display_virtualenv no
#     set -g theme_display_ruby no
#     set -g theme_display_user ssh
#     set -g theme_display_hostname ssh
#     set -g theme_display_vi no
#     set -g theme_display_nvm yes
#     set -g theme_avoid_ambiguous_glyphs yes
#     set -g theme_powerline_fonts no
#     set -g theme_nerd_fonts yes
#     set -g theme_show_exit_status yes
#     set -g default_user your_normal_user
#     set -g theme_color_scheme dark
#     set -g fish_prompt_pwd_dir_length 0
#     set -g theme_project_dir_length 1
#     set -g theme_newline_cursor yes

# Credict https://github.com/oh-my-fish/theme-bobthefish/blob/master/fish_prompt.fish

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1


function __bobthefish_glyphs -S -d 'Define glyphs used by bobthefish'
  # Powerline glyphs
  set -x branch_glyph            \uE0A0
  set -x right_black_arrow_glyph \uE0B0
  set -x right_arrow_glyph       \uE0B1
  set -x left_black_arrow_glyph  \uE0B2
  set -x left_arrow_glyph        \uE0B3

  # Additional glyphs
  set -x detached_glyph          \u27A6
  set -x tag_glyph               \u2302
  set -x nonzero_exit_glyph      '! '
  set -x superuser_glyph         '$ '
  set -x bg_job_glyph            '% '
  set -x hg_glyph                \u263F

  # Python glyphs
  set -x superscript_glyph       \u00B9 \u00B2 \u00B3
  set -x virtualenv_glyph        \u25F0
  set -x pypy_glyph              \u1D56

  set -x ruby_glyph              ''
  set -x go_glyph                ''

  # Desk glyphs
  set -x desk_glyph              \u25F2

  # Kubernetes glyphs
  set -x k8s_glyph               \u2388 # '⎈'

  # Vagrant glyphs
  set -x vagrant_running_glyph   \u2191 # ↑ 'running'
  set -x vagrant_poweroff_glyph  \u2193 # ↓ 'poweroff'
  set -x vagrant_aborted_glyph   \u2715 # ✕ 'aborted'
  set -x vagrant_saved_glyph     \u21E1 # ⇡ 'saved'
  set -x vagrant_stopping_glyph  \u21E3 # ⇣ 'stopping'
  set -x vagrant_unknown_glyph   '!'    # strange cases

  # Git glyphs
  set -x git_dirty_glyph      '*'
  set -x git_staged_glyph     '~'
  set -x git_stashed_glyph    '$'
  set -x git_untracked_glyph  '…'
  set -x git_ahead_glyph      \u2191 # '↑'
  set -x git_behind_glyph     \u2193 # '↓'
  set -x git_plus_glyph       '+'
  set -x git_minus_glyph      '-'
  set -x git_plus_minus_glyph '±'

  # Disable Powerline fonts (unless we're using nerd fonts instead)
  if [ "$theme_powerline_fonts" = "no" -a "$theme_nerd_fonts" != "yes" ]
    set branch_glyph            \u2387
    set right_black_arrow_glyph ''
    set right_arrow_glyph       ''
    set left_black_arrow_glyph  ''
    set left_arrow_glyph        ''
  end

  # Use prettier Nerd Fonts glyphs
  if [ "$theme_nerd_fonts" = "yes" ]
    set branch_glyph     \uF418
    set detached_glyph   \uF417
    set tag_glyph        \uF412

    set virtualenv_glyph \uE73C ' '
    set ruby_glyph       \uE791 ' '
    set go_glyph         \uE626 ' '
    set node_glyph       \uE718 ' '

    set vagrant_running_glyph  \uF431 # ↑ 'running'
    set vagrant_poweroff_glyph \uF433 # ↓ 'poweroff'
    set vagrant_aborted_glyph  \uF468 # ✕ 'aborted'
    set vagrant_unknown_glyph  \uF421 # strange cases

    set git_dirty_glyph      \uF448 '' # nf-oct-pencil
    set git_staged_glyph     \uF0C7 '' # nf-fa-save
    set git_stashed_glyph    \uF0C6 '' # nf-fa-paperclip
    set git_untracked_glyph  \uF128 '' # nf-fa-question
    # set git_untracked_glyph  \uF141 '' # nf-fa-ellipsis_h

    set git_ahead_glyph      \uF47B # nf-oct-chevron_up
    set git_behind_glyph     \uF47C # nf-oct-chevron_down

    set git_plus_glyph       \uF0DE # fa-sort-asc
    set git_minus_glyph      \uF0DD # fa-sort-desc
    set git_plus_minus_glyph \uF0DC # fa-sort
  end

  # Avoid ambiguous glyphs
  if [ "$theme_avoid_ambiguous_glyphs" = "yes" ]
    set git_untracked_glyph '...'
  end
end


function __bobthefish_colors -S -a color_scheme -d 'Define colors used by bobthefish'
  switch "$color_scheme"
    case 'user'
      __bobthefish_user_color_scheme_deprecated
      return

    case 'terminal' 'terminal-dark*'
      set -l colorfg black
      [ "$color_scheme" = 'terminal-dark-white' ]; and set colorfg white
      set -x color_initial_segment_exit     white red --bold
      set -x color_initial_segment_su       white green --bold
      set -x color_initial_segment_jobs     white blue --bold

      set -x color_path                     black white
      set -x color_path_basename            black white --bold
      set -x color_path_nowrite             magenta $colorfg
      set -x color_path_nowrite_basename    magenta $colorfg --bold

      set -x color_repo                     green $colorfg
      set -x color_repo_work_tree           black $colorfg --bold
      set -x color_repo_dirty               brred $colorfg
      set -x color_repo_staged              yellow $colorfg

      set -x color_vi_mode_default          brblue $colorfg --bold
      set -x color_vi_mode_insert           brgreen $colorfg --bold
      set -x color_vi_mode_visual           bryellow $colorfg --bold

      set -x color_vagrant                  brcyan $colorfg
      set -x color_k8s                      magenta white --bold
      set -x color_username                 white black --bold
      set -x color_hostname                 white black
      set -x color_rvm                      brmagenta $colorfg --bold
      set -x color_nvm                      brgreen $colorfg --bold
      set -x color_virtualfish              brblue $colorfg --bold
      set -x color_virtualgo                brblue $colorfg --bold
      set -x color_desk                     brblue $colorfg --bold

    case 'terminal-light*'
      set -l colorfg white
      [ "$color_scheme" = 'terminal-light-black' ]; and set colorfg black
      set -x color_initial_segment_exit     black red --bold
      set -x color_initial_segment_su       black green --bold
      set -x color_initial_segment_jobs     black blue --bold

      set -x color_path                     white black
      set -x color_path_basename            white black --bold
      set -x color_path_nowrite             magenta $colorfg
      set -x color_path_nowrite_basename    magenta $colorfg --bold

      set -x color_repo                     green $colorfg
      set -x color_repo_work_tree           white $colorfg --bold
      set -x color_repo_dirty               brred $colorfg
      set -x color_repo_staged              yellow $colorfg

      set -x color_vi_mode_default          brblue $colorfg --bold
      set -x color_vi_mode_insert           brgreen $colorfg --bold
      set -x color_vi_mode_visual           bryellow $colorfg --bold

      set -x color_vagrant                  brcyan $colorfg
      set -x color_k8s                      magenta white --bold
      set -x color_username                 black white --bold
      set -x color_hostname                 black white
      set -x color_rvm                      brmagenta $colorfg --bold
      set -x color_nvm                      brgreen $colorfg --bold
      set -x color_virtualfish              brblue $colorfg --bold
      set -x color_virtualgo                brblue $colorfg --bold
      set -x color_desk                     brblue $colorfg --bold

    case 'terminal2' 'terminal2-dark*'
      set -l colorfg black
      [ "$color_scheme" = 'terminal2-dark-white' ]; and set colorfg white
      set -x color_initial_segment_exit     grey red --bold
      set -x color_initial_segment_su       grey green --bold
      set -x color_initial_segment_jobs     grey blue --bold

      set -x color_path                     brgrey white
      set -x color_path_basename            brgrey white --bold
      set -x color_path_nowrite             magenta $colorfg
      set -x color_path_nowrite_basename    magenta $colorfg --bold

      set -x color_repo                     green $colorfg
      set -x color_repo_work_tree           brgrey $colorfg --bold
      set -x color_repo_dirty               brred $colorfg
      set -x color_repo_staged              yellow $colorfg

      set -x color_vi_mode_default          brblue $colorfg --bold
      set -x color_vi_mode_insert           brgreen $colorfg --bold
      set -x color_vi_mode_visual           bryellow $colorfg --bold

      set -x color_vagrant                  brcyan $colorfg
      set -x color_k8s                      magenta white --bold
      set -x color_username                 brgrey white --bold
      set -x color_hostname                 brgrey white
      set -x color_rvm                      brmagenta $colorfg --bold
      set -x color_nvm                      brgreen $colorfg --bold
      set -x color_virtualfish              brblue $colorfg --bold
      set -x color_virtualgo                brblue $colorfg --bold
      set -x color_desk                     brblue $colorfg --bold

    case 'terminal2-light*'
      set -l colorfg white
      [ "$color_scheme" = 'terminal2-light-black' ]; and set colorfg black
      set -x color_initial_segment_exit     brgrey red --bold
      set -x color_initial_segment_su       brgrey green --bold
      set -x color_initial_segment_jobs     brgrey blue --bold

      set -x color_path                     grey black
      set -x color_path_basename            grey black --bold
      set -x color_path_nowrite             magenta $colorfg
      set -x color_path_nowrite_basename    magenta $colorfg --bold

      set -x color_repo                     green $colorfg
      set -x color_repo_work_tree           grey $colorfg --bold
      set -x color_repo_dirty               brred $colorfg
      set -x color_repo_staged              yellow $colorfg

      set -x color_vi_mode_default          brblue $colorfg --bold
      set -x color_vi_mode_insert           brgreen $colorfg --bold
      set -x color_vi_mode_visual           bryellow $colorfg --bold

      set -x color_vagrant                  brcyan $colorfg
      set -x color_k8s                      magenta white --bold
      set -x color_username                 grey black --bold
      set -x color_hostname                 grey black
      set -x color_rvm                      brmagenta $colorfg --bold
      set -x color_nvm                      brgreen $colorfg --bold
      set -x color_virtualfish              brblue $colorfg --bold
      set -x color_virtualgo                brblue $colorfg --bold
      set -x color_desk                     brblue $colorfg --bold

    case 'zenburn'
      set -l grey   333333 # a bit darker than normal zenburn grey
      set -l red    CC9393
      set -l green  7F9F7F
      set -l yellow E3CEAB
      set -l orange DFAF8F
      set -l blue   8CD0D3
      set -l white  DCDCCC

      set -x color_initial_segment_exit     $white $red --bold
      set -x color_initial_segment_su       $white $green --bold
      set -x color_initial_segment_jobs     $white $blue --bold

      set -x color_path                     $grey $white
      set -x color_path_basename            $grey $white --bold
      set -x color_path_nowrite             $grey $red
      set -x color_path_nowrite_basename    $grey $red --bold

      set -x color_repo                     $green $grey
      set -x color_repo_work_tree           $grey $grey --bold
      set -x color_repo_dirty               $red $grey
      set -x color_repo_staged              $yellow $grey

      set -x color_vi_mode_default          $grey $yellow --bold
      set -x color_vi_mode_insert           $green $white --bold
      set -x color_vi_mode_visual           $yellow $grey --bold

      set -x color_vagrant                  $blue $green --bold
      set -x color_k8s                      $green $white --bold
      set -x color_username                 $grey $blue --bold
      set -x color_hostname                 $grey $blue
      set -x color_rvm                      $red $grey --bold
      set -x color_nvm                      $green $white --bold
      set -x color_virtualfish              $blue $grey --bold
      set -x color_virtualgo                $blue $grey --bold
      set -x color_desk                     $blue $grey --bold

    case 'base16-light'
      set -l base00 181818
      set -l base01 282828
      set -l base02 383838
      set -l base03 585858
      set -l base04 b8b8b8
      set -l base05 d8d8d8
      set -l base06 e8e8e8
      set -l base07 f8f8f8
      set -l base08 ab4642 # red
      set -l base09 dc9656 # orange
      set -l base0A f7ca88 # yellow
      set -l base0B a1b56c # green
      set -l base0C 86c1b9 # cyan
      set -l base0D 7cafc2 # blue
      set -l base0E ba8baf # violet
      set -l base0F a16946 # brown

      set -l colorfg $base00

      set -x color_initial_segment_exit     $base02 $base08 --bold
      set -x color_initial_segment_su       $base02 $base0B --bold
      set -x color_initial_segment_jobs     $base02 $base0D --bold

      set -x color_path                     $base06 $base02
      set -x color_path_basename            $base06 $base01 --bold
      set -x color_path_nowrite             $base06 $base08
      set -x color_path_nowrite_basename    $base06 $base08 --bold

      set -x color_repo                     $base0B $colorfg
      set -x color_repo_work_tree           $base06 $colorfg --bold
      set -x color_repo_dirty               $base08 $colorfg
      set -x color_repo_staged              $base09 $colorfg

      set -x color_vi_mode_default          $base04 $colorfg --bold
      set -x color_vi_mode_insert           $base0B $colorfg --bold
      set -x color_vi_mode_visual           $base09 $colorfg --bold

      set -x color_vagrant                  $base0C $colorfg --bold
      set -x color_k8s                      $base06 $colorfg --bold
      set -x color_username                 $base02 $base0D --bold
      set -x color_hostname                 $base02 $base0D
      set -x color_rvm                      $base08 $colorfg --bold
      set -x color_nvm                      $base0B $colorfg --bold
      set -x color_virtualfish              $base0D $colorfg --bold
      set -x color_virtualgo                $base0D $colorfg --bold
      set -x color_desk                     $base0D $colorfg --bold

    case 'base16' 'base16-dark'
      set -l base00 181818
      set -l base01 282828
      set -l base02 383838
      set -l base03 585858
      set -l base04 b8b8b8
      set -l base05 d8d8d8
      set -l base06 e8e8e8
      set -l base07 f8f8f8
      set -l base08 ab4642 # red
      set -l base09 dc9656 # orange
      set -l base0A f7ca88 # yellow
      set -l base0B a1b56c # green
      set -l base0C 86c1b9 # cyan
      set -l base0D 7cafc2 # blue
      set -l base0E ba8baf # violet
      set -l base0F a16946 # brown

      set -l colorfg $base07

      set -x color_initial_segment_exit     $base05 $base08 --bold
      set -x color_initial_segment_su       $base05 $base0B --bold
      set -x color_initial_segment_jobs     $base05 $base0D --bold

      set -x color_path                     $base02 $base05
      set -x color_path_basename            $base02 $base06 --bold
      set -x color_path_nowrite             $base02 $base08
      set -x color_path_nowrite_basename    $base02 $base08 --bold

      set -x color_repo                     $base0B $colorfg
      set -x color_repo_work_tree           $base02 $colorfg --bold
      set -x color_repo_dirty               $base08 $colorfg
      set -x color_repo_staged              $base09 $colorfg

      set -x color_vi_mode_default          $base03 $colorfg --bold
      set -x color_vi_mode_insert           $base0B $colorfg --bold
      set -x color_vi_mode_visual           $base09 $colorfg --bold

      set -x color_vagrant                  $base0C $colorfg --bold
      set -x color_k8s                      $base0B $colorfg --bold
      set -x color_username                 $base02 $base0D --bold
      set -x color_hostname                 $base02 $base0D
      set -x color_rvm                      $base08 $colorfg --bold
      set -x color_nvm                      $base0B $colorfg --bold
      set -x color_virtualfish              $base0D $colorfg --bold
      set -x color_virtualgo                $base0D $colorfg --bold
      set -x color_desk                     $base0D $colorfg --bold

    case 'solarized-light'
      set -l base03  002b36
      set -l base02  073642
      set -l base01  586e75
      set -l base00  657b83
      set -l base0   839496
      set -l base1   93a1a1
      set -l base2   eee8d5
      set -l base3   fdf6e3
      set -l yellow  b58900
      set -l orange  cb4b16
      set -l red     dc322f
      set -l magenta d33682
      set -l violet  6c71c4
      set -l blue    268bd2
      set -l cyan    2aa198
      set -l green   859900

      set colorfg $base03

      set -x color_initial_segment_exit     $base02 $red --bold
      set -x color_initial_segment_su       $base02 $green --bold
      set -x color_initial_segment_jobs     $base02 $blue --bold

      set -x color_path                     $base2 $base00
      set -x color_path_basename            $base2 $base01 --bold
      set -x color_path_nowrite             $base2 $orange
      set -x color_path_nowrite_basename    $base2 $orange --bold

      set -x color_repo                     $green $colorfg
      set -x color_repo_work_tree           $base2 $colorfg --bold
      set -x color_repo_dirty               $red $colorfg
      set -x color_repo_staged              $yellow $colorfg

      set -x color_vi_mode_default          $blue $colorfg --bold
      set -x color_vi_mode_insert           $green $colorfg --bold
      set -x color_vi_mode_visual           $yellow $colorfg --bold

      set -x color_vagrant                  $violet $colorfg --bold
      set -x color_k8s                      $green $colorfg --bold
      set -x color_username                 $base2 $blue --bold
      set -x color_hostname                 $base2 $blue
      set -x color_rvm                      $red $colorfg --bold
      set -x color_nvm                      $green $colorfg --bold
      set -x color_virtualfish              $cyan $colorfg --bold
      set -x color_virtualgo                $cyan $colorfg --bold
      set -x color_desk                     $cyan $colorfg --bold

    case 'solarized' 'solarized-dark'
      set -l base03  002b36
      set -l base02  073642
      set -l base01  586e75
      set -l base00  657b83
      set -l base0   839496
      set -l base1   93a1a1
      set -l base2   eee8d5
      set -l base3   fdf6e3
      set -l yellow  b58900
      set -l orange  cb4b16
      set -l red     dc322f
      set -l magenta d33682
      set -l violet  6c71c4
      set -l blue    268bd2
      set -l cyan    2aa198
      set -l green   859900

      set colorfg $base3

      set -x color_initial_segment_exit     $base2 $red --bold
      set -x color_initial_segment_su       $base2 $green --bold
      set -x color_initial_segment_jobs     $base2 $blue --bold

      set -x color_path                     $base02 $base0
      set -x color_path_basename            $base02 $base1 --bold
      set -x color_path_nowrite             $base02 $orange
      set -x color_path_nowrite_basename    $base02 $orange --bold

      set -x color_repo                     $green $colorfg
      set -x color_repo_work_tree           $base02 $colorfg --bold
      set -x color_repo_dirty               $red $colorfg
      set -x color_repo_staged              $yellow $colorfg

      set -x color_vi_mode_default          $blue $colorfg --bold
      set -x color_vi_mode_insert           $green $colorfg --bold
      set -x color_vi_mode_visual           $yellow $colorfg --bold

      set -x color_vagrant                  $violet $colorfg --bold
      set -x color_k8s                      $green $colorfg --bold
      set -x color_username                 $base02 $blue --bold
      set -x color_hostname                 $base02 $blue
      set -x color_rvm                      $red $colorfg --bold
      set -x color_nvm                      $green $colorfg --bold
      set -x color_virtualfish              $cyan $colorfg --bold
      set -x color_virtualgo                $cyan $colorfg --bold
      set -x color_desk                     $cyan $colorfg --bold

    case 'light'
      #               light  medium dark
      #               ------ ------ ------
      set -l red      cc9999 ce000f 660000
      set -l green    addc10 189303 0c4801
      set -l blue     48b4fb 005faf 255e87
      set -l orange   f6b117 unused 3a2a03
      set -l brown    bf5e00 803f00 4d2600
      set -l grey     cccccc 999999 333333
      set -l white    ffffff
      set -l black    000000
      set -l ruby_red af0000

      set -x color_initial_segment_exit     $grey[3] $red[2] --bold
      set -x color_initial_segment_su       $grey[3] $green[2] --bold
      set -x color_initial_segment_jobs     $grey[3] $blue[3] --bold

      set -x color_path                     $grey[1] $grey[2]
      set -x color_path_basename            $grey[1] $grey[3] --bold
      set -x color_path_nowrite             $red[1] $red[3]
      set -x color_path_nowrite_basename    $red[1] $red[3] --bold

      set -x color_repo                     $green[1] $green[3]
      set -x color_repo_work_tree           $grey[1] $white --bold
      set -x color_repo_dirty               $red[2] $white
      set -x color_repo_staged              $orange[1] $orange[3]

      set -x color_vi_mode_default          $grey[2] $grey[3] --bold
      set -x color_vi_mode_insert           $green[2] $grey[3] --bold
      set -x color_vi_mode_visual           $orange[1] $orange[3] --bold

      set -x color_vagrant                  $blue[1] $white --bold
      set -x color_k8s                      $green[1] $colorfg --bold
      set -x color_username                 $grey[1] $blue[3] --bold
      set -x color_hostname                 $grey[1] $blue[3]
      set -x color_rvm                      $ruby_red $grey[1] --bold
      set -x color_nvm                      $green $grey[1] --bold
      set -x color_virtualfish              $blue[2] $grey[1] --bold
      set -x color_virtualgo                $blue[2] $grey[1] --bold
      set -x color_desk                     $blue[2] $grey[1] --bold

    case 'gruvbox'
      #               light  medium  dark  darkest
      #               ------ ------ ------ -------
      set -l red      fb4934 cc241d
      set -l green    b8bb26 98971a
      set -l yellow   fabd2f d79921
      set -l aqua     8ec07c 689d6a
      set -l blue     83a598 458588
      set -l grey     cccccc 999999 333333
      set -l fg       fbf1c7 ebdbb2 d5c4a1 a89984
      set -l bg       504945 282828

      set -x color_initial_segment_exit  $fg[1] $red[2] --bold
      set -x color_initial_segment_su    $fg[1] $green[2] --bold
      set -x color_initial_segment_jobs  $fg[1] $aqua[2] --bold

      set -x color_path                  $bg[1] $fg[2]
      set -x color_path_basename         $bg[1] $fg[2] --bold
      set -x color_path_nowrite          $red[1] $fg[2]
      set -x color_path_nowrite_basename $red[1] $fg[2] --bold

      set -x color_repo                  $green[2] $bg[1]
      set -x color_repo_work_tree        $bg[1] $fg[2] --bold
      set -x color_repo_dirty            $red[2] $fg[2]
      set -x color_repo_staged           $yellow[1] $bg[1]

      set -x color_vi_mode_default       $fg[4] $bg[2] --bold
      set -x color_vi_mode_insert        $blue[1] $bg[2] --bold
      set -x color_vi_mode_visual        $yellow[1] $bg[2] --bold

      set -x color_vagrant               $blue[2] $fg[2] --bold
      set -x color_k8s                   $green[2] $fg[2] --bold
      set -x color_username              $fg[3] $blue[2] --bold
      set -x color_hostname              $fg[3] $blue[2]
      set -x color_rvm                   $red[2] $fg[2] --bold
      set -x color_nvm                   $green[1] $fg[2] --bold
      set -x color_virtualfish           $blue[2] $fg[2] --bold
      set -x color_virtualgo             $blue[2] $fg[2] --bold
      set -x color_desk                  $blue[2] $fg[2] --bold

    case 'dracula' # https://draculatheme.com
      set -l bg           282a36
      set -l current_line 44475a
      set -l selection    44475a
      set -l fg           f8f8f2
      set -l comment      6272a4
      set -l cyan         8be9fd
      set -l green        50fa7b
      set -l orange       ffb86c
      set -l pink         ff79c6
      set -l purple       bd93f9
      set -l red          ff5555
      set -l yellow       f1fa8c

      set -x color_initial_segment_exit  $fg $red  --bold
      set -x color_initial_segment_su    $fg $purple --bold
      set -x color_initial_segment_jobs  $fg $comment --bold

      set -x color_path                  $selection $fg
      set -x color_path_basename         $selection $fg --bold
      set -x color_path_nowrite          $selection $red
      set -x color_path_nowrite_basename $selection $red --bold

      set -x color_repo                  $green $bg
      set -x color_repo_work_tree        $selection $fg --bold
      set -x color_repo_dirty            $red $bg
      set -x color_repo_staged           $yellow $bg

      set -x color_vi_mode_default       $bg $yellow --bold
      set -x color_vi_mode_insert        $green $bg --bold
      set -x color_vi_mode_visual        $orange $bg --bold

      set -x color_vagrant               $pink $bg --bold
      set -x color_k8s                   $green $fg --bold
      set -x color_username              $selection $cyan --bold
      set -x color_hostname              $selection $cyan
      set -x color_rvm                   $red $bg --bold
      set -x color_nvm                   $green $bg --bold
      set -x color_virtualfish           $comment $bg --bold
      set -x color_virtualgo             $cyan $bg --bold
      set -x color_desk                  $comment $bg --bold

    case '*' # default dark theme
      #               light  medium dark
      #               ------ ------ ------
      set -l red      cc9999 ce000f 660000
      set -l green    addc10 189303 0c4801
      set -l blue     48b4fb 005faf 255e87
      set -l orange   f6b117 unused 3a2a03
      set -l brown    bf5e00 803f00 4d2600
      set -l grey     cccccc 999999 333333
      set -l white    ffffff
      set -l black    000000
      set -l ruby_red af0000
      set -l go_blue  00d7d7

      set -x color_initial_segment_exit     $white $red[2] --bold
      set -x color_initial_segment_su       $white $green[2] --bold
      set -x color_initial_segment_jobs     $white $blue[3] --bold

      set -x color_path                     $grey[3] $grey[2]
      set -x color_path_basename            $grey[3] $white --bold
      set -x color_path_nowrite             $red[3] $red[1]
      set -x color_path_nowrite_basename    $red[3] $red[1] --bold

      set -x color_repo                     $green[1] $green[3]
      set -x color_repo_work_tree           $grey[3] $white --bold
      set -x color_repo_dirty               $red[2] $white
      set -x color_repo_staged              $orange[1] $orange[3]

      set -x color_vi_mode_default          $grey[2] $grey[3] --bold
      set -x color_vi_mode_insert           $green[2] $grey[3] --bold
      set -x color_vi_mode_visual           $orange[1] $orange[3] --bold

      set -x color_vagrant                  $blue[1] $white --bold
      set -x color_k8s                      $green[2] $white --bold
      set -x color_username                 $grey[1] $blue[3] --bold
      set -x color_hostname                 $grey[1] $blue[3]
      set -x color_rvm                      $ruby_red $grey[1] --bold
      set -x color_nvm                      $green[1] $white --bold
      set -x color_virtualfish              $blue[2] $grey[1] --bold
      set -x color_virtualgo                $go_blue $black --bold
      set -x color_desk                     $blue[2] $grey[1] --bold
  end
end

function __bobthefish_user_color_scheme_deprecated
  set -q __color_initial_segment_exit;  or set -l __color_initial_segment_exit  ffffff ce000f --bold
  set -q __color_initial_segment_su;    or set -l __color_initial_segment_su    ffffff 189303 --bold
  set -q __color_initial_segment_jobs;  or set -l __color_initial_segment_jobs  ffffff 255e87 --bold
  set -q __color_path;                  or set -l __color_path                  333333 999999
  set -q __color_path_basename;         or set -l __color_path_basename         333333 ffffff --bold
  set -q __color_path_nowrite;          or set -l __color_path_nowrite          660000 cc9999
  set -q __color_path_nowrite_basename; or set -l __color_path_nowrite_basename 660000 cc9999 --bold
  set -q __color_repo;                  or set -l __color_repo                  addc10 0c4801
  set -q __color_repo_work_tree;        or set -l __color_repo_work_tree        333333 ffffff --bold
  set -q __color_repo_dirty;            or set -l __color_repo_dirty            ce000f ffffff
  set -q __color_repo_staged;           or set -l __color_repo_staged           f6b117 3a2a03
  set -q __color_vi_mode_default;       or set -l __color_vi_mode_default       999999 333333 --bold
  set -q __color_vi_mode_insert;        or set -l __color_vi_mode_insert        189303 333333 --bold
  set -q __color_vi_mode_visual;        or set -l __color_vi_mode_visual        f6b117 3a2a03 --bold
  set -q __color_vagrant;               or set -l __color_vagrant               48b4fb ffffff --bold
  set -q __color_username;              or set -l __color_username              cccccc 255e87 --bold
  set -q __color_hostname;              or set -l __color_hostname              cccccc 255e87
  set -q __color_rvm;                   or set -l __color_rvm                   af0000 cccccc --bold
  set -q __color_virtualfish;           or set -l __color_virtualfish           005faf cccccc --bold
  set -q __color_virtualgo;             or set -l __color_virtualgo             005faf cccccc --bold
  set -q __color_desk;                  or set -l __color_desk                  005faf cccccc --bold

  set_color black -b red --bold
  echo "The 'user' color scheme is deprecated."
  set_color normal
  set_color black -b red
  echo "To define a custom color scheme, create a 'bobthefish_colors' function:"
  set_color normal
  echo

  echo "function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
  # optionally include a base color scheme...
  ___bobthefish_colors default
  # then override everything you want! note that these must be defined with `set -x`
  set -x color_initial_segment_exit  $__color_initial_segment_exit
  set -x color_initial_segment_su    $__color_initial_segment_su
  set -x color_initial_segment_jobs  $__color_initial_segment_jobs
  set -x color_path                  $__color_path
  set -x color_path_basename         $__color_path_basename
  set -x color_path_nowrite          $__color_path_nowrite
  set -x color_path_nowrite_basename $__color_path_nowrite_basename
  set -x color_repo                  $__color_repo
  set -x color_repo_work_tree        $__color_repo_work_tree
  set -x color_repo_dirty            $__color_repo_dirty
  set -x color_repo_staged           $__color_repo_staged
  set -x color_vi_mode_default       $__color_vi_mode_default
  set -x color_vi_mode_insert        $__color_vi_mode_insert
  set -x color_vi_mode_visual        $__color_vi_mode_visual
  set -x color_vagrant               $__color_vagrant
  set -x color_username              $__color_username
  set -x color_hostname              $__color_hostname
  set -x color_rvm                   $__color_rvm
  set -x color_virtualfish           $__color_virtualfish
  set -x color_virtualgo             $__color_virtualgo
  set -x color_desk                  $__color_desk
end"

  echo
end

function __bobthefish_glyphs -S -d 'Define glyphs used by bobthefish'
  # Powerline glyphs
  set -x branch_glyph            \uE0A0
  set -x right_black_arrow_glyph \uE0B0
  set -x right_arrow_glyph       \uE0B1
  set -x left_black_arrow_glyph  \uE0B2
  set -x left_arrow_glyph        \uE0B3

  # Additional glyphs
  set -x detached_glyph          \u27A6
  set -x tag_glyph               \u2302
  set -x nonzero_exit_glyph      '! '
  set -x superuser_glyph         '$ '
  set -x bg_job_glyph            '% '
  set -x hg_glyph                \u263F

  # Python glyphs
  set -x superscript_glyph       \u00B9 \u00B2 \u00B3
  set -x virtualenv_glyph        \u25F0
  set -x pypy_glyph              \u1D56

  set -x ruby_glyph              ''
  set -x go_glyph                ''

  # Desk glyphs
  set -x desk_glyph              \u25F2

  # Kubernetes glyphs
  set -x k8s_glyph               \u2388 # '⎈'

  # Vagrant glyphs
  set -x vagrant_running_glyph   \u2191 # ↑ 'running'
  set -x vagrant_poweroff_glyph  \u2193 # ↓ 'poweroff'
  set -x vagrant_aborted_glyph   \u2715 # ✕ 'aborted'
  set -x vagrant_saved_glyph     \u21E1 # ⇡ 'saved'
  set -x vagrant_stopping_glyph  \u21E3 # ⇣ 'stopping'
  set -x vagrant_unknown_glyph   '!'    # strange cases

  # Git glyphs
  set -x git_dirty_glyph      '*'
  set -x git_staged_glyph     '~'
  set -x git_stashed_glyph    '$'
  set -x git_untracked_glyph  '…'
  set -x git_ahead_glyph      \u2191 # '↑'
  set -x git_behind_glyph     \u2193 # '↓'
  set -x git_plus_glyph       '+'
  set -x git_minus_glyph      '-'
  set -x git_plus_minus_glyph '±'

  # Disable Powerline fonts (unless we're using nerd fonts instead)
  if [ "$theme_powerline_fonts" = "no" -a "$theme_nerd_fonts" != "yes" ]
    set branch_glyph            \u2387
    set right_black_arrow_glyph ''
    set right_arrow_glyph       ''
    set left_black_arrow_glyph  ''
    set left_arrow_glyph        ''
  end

  # Use prettier Nerd Fonts glyphs
  if [ "$theme_nerd_fonts" = "yes" ]
    set branch_glyph     \uF418
    set detached_glyph   \uF417
    set tag_glyph        \uF412

    set virtualenv_glyph \uE73C ' '
    set ruby_glyph       \uE791 ' '
    set go_glyph         \uE626 ' '
    set node_glyph       \uE718 ' '

    set vagrant_running_glyph  \uF431 # ↑ 'running'
    set vagrant_poweroff_glyph \uF433 # ↓ 'poweroff'
    set vagrant_aborted_glyph  \uF468 # ✕ 'aborted'
    set vagrant_unknown_glyph  \uF421 # strange cases

    set git_dirty_glyph      \uF448 '' # nf-oct-pencil
    set git_staged_glyph     \uF0C7 '' # nf-fa-save
    set git_stashed_glyph    \uF0C6 '' # nf-fa-paperclip
    set git_untracked_glyph  \uF128 '' # nf-fa-question
    # set git_untracked_glyph  \uF141 '' # nf-fa-ellipsis_h

    set git_ahead_glyph      \uF47B # nf-oct-chevron_up
    set git_behind_glyph     \uF47C # nf-oct-chevron_down

    set git_plus_glyph       \uF0DE # fa-sort-asc
    set git_minus_glyph      \uF0DD # fa-sort-desc
    set git_plus_minus_glyph \uF0DC # fa-sort
  end

  # Avoid ambiguous glyphs
  if [ "$theme_avoid_ambiguous_glyphs" = "yes" ]
    set git_untracked_glyph '...'
  end
end


# ==============================
# Helper methods
# ==============================

function __bobthefish_basename -d 'basically basename, but faster'
    string replace -r '^.*/' '' -- $argv
end

function __bobthefish_dirname -d 'basically dirname, but faster'
    string replace -r '/[^/]+/?$' '' -- $argv
end

function __bobthefish_pwd -d 'Get a normalized $PWD'
    # The pwd builtin accepts `-P` on at least Fish 3.x, but fall back to $PWD if that doesn't work
    builtin pwd -P 2>/dev/null
    or echo $PWD
end

function __bobthefish_git_branch -S -d 'Get the current git branch (or commitish)'
    set -l ref (command git symbolic-ref HEAD 2>/dev/null)
    and begin
        [ "$theme_display_git_master_branch" != 'yes' -a "$ref" = 'refs/heads/master' ]
        and echo $branch_glyph
        and return

        # truncate the middle of the branch name, but only if it's 25+ characters
        set -l truncname (string replace -r '^(.{28}).{3,}(.{5})$' "\$1…\$2" $ref)

        string replace -r '^refs/heads/' "$branch_glyph " $truncname
        and return
    end

    set -l tag (command git describe --tags --exact-match 2>/dev/null)
    and echo "$tag_glyph $tag"
    and return

    set -l branch (command git show-ref --head -s --abbrev | head -n1 2>/dev/null)
    echo "$detached_glyph $branch"
end

function __bobthefish_hg_branch -S -d 'Get the current hg branch'
    set -l branch (command hg branch 2>/dev/null)
    set -l book (command hg book | command grep \* | cut -d\  -f3)
    echo "$branch_glyph $branch @ $book"
end

function __bobthefish_pretty_parent -S -a child_dir -d 'Print a parent directory, shortened to fit the prompt'
    set -q fish_prompt_pwd_dir_length
    or set -l fish_prompt_pwd_dir_length 1

    # Replace $HOME with ~
    set -l real_home ~
    set -l parent_dir (string replace -r '^'"$real_home"'($|/)' '~$1' (__bobthefish_dirname $child_dir))

    # Must check whether `$parent_dir = /` if using native dirname
    if [ -z "$parent_dir" ]
        echo -n /
        return
    end

    if [ $fish_prompt_pwd_dir_length -eq 0 ]
        echo -n "$parent_dir/"
        return
    end

    string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' "$parent_dir/"
end

function __bobthefish_ignore_vcs_dir -a real_pwd -d 'Check whether the current directory should be ignored as a VCS segment'
    for p in $theme_vcs_ignore_paths
        set ignore_path (realpath $p 2>/dev/null)
        switch $real_pwd/
            case $ignore_path/\*
                echo 1
                return
        end
    end
end

function __bobthefish_git_project_dir -S -a real_pwd -d 'Print the current git project base directory'
    [ "$theme_display_git" = 'no' ]
    and return

    set -q theme_vcs_ignore_paths
    and [ (__bobthefish_ignore_vcs_dir $real_pwd) ]
    and return

    if [ "$theme_git_worktree_support" != 'yes' ]
        set -l git_toplevel (command git rev-parse --show-toplevel 2>/dev/null)

        [ -z "$git_toplevel" ]
        and return

        # If there are no symlinks, just use git toplevel
        switch $real_pwd/
            case $git_toplevel/\*
                echo $git_toplevel
                return
        end

        # Otherwise, we need to find the equivalent directory in the $PWD
        set -l d $real_pwd
        while not [ -z "$d" ]
            if [ (realpath "$d") = "$git_toplevel" ]
                echo $d
                return
            end

            [ "$d" = '/' ]
            and return

            set d (__bobthefish_dirname $d)
        end
        return
    end

    set -l git_dir (command git rev-parse --git-dir 2>/dev/null)
    or return

    pushd $git_dir
    set git_dir $real_pwd
    popd

    switch $real_pwd/
        case $git_dir/\*
            # Nothing works quite right if we're inside the git dir
            # TODO: fix the underlying issues then re-enable the stuff below

            # # if we're inside the git dir, sweet. just return that.
            # set -l toplevel (command git rev-parse --show-toplevel 2>/dev/null)
            # if [ "$toplevel" ]
            #   switch $git_dir/
            #     case $toplevel/\*
            #       echo $git_dir
            #   end
            # end
            return
    end

    set -l project_dir (__bobthefish_dirname $git_dir)

    switch $real_pwd/
        case $project_dir/\*
            echo $project_dir
            return
    end

    set project_dir (command git rev-parse --show-toplevel 2>/dev/null)
    switch $real_pwd/
        case $project_dir/\*
            echo $project_dir
    end
end

function __bobthefish_hg_project_dir -S -a real_pwd -d 'Print the current hg project base directory'
    [ "$theme_display_hg" = 'yes' ]
    or return

    set -q theme_vcs_ignore_paths
    and [ (__bobthefish_ignore_vcs_dir $real_pwd) ]
    and return

    set -l d $real_pwd
    while not [ -z "$d" ]
        if [ -e $d/.hg ]
            command hg root --cwd "$d" 2>/dev/null
            return
        end

        [ "$d" = '/' ]
        and return

        set d (__bobthefish_dirname $d)
    end
end

function __bobthefish_project_pwd -S -a project_root_dir -a real_pwd -d 'Print the working directory relative to project root'
    set -q theme_project_dir_length
    or set -l theme_project_dir_length 0

    set -l project_dir (string replace -r '^'"$project_root_dir"'($|/)' '' $real_pwd)

    if [ $theme_project_dir_length -eq 0 ]
        echo -n $project_dir
        return
    end

    string replace -ar '(\.?[^/]{'"$theme_project_dir_length"'})[^/]*/' '$1/' $project_dir
end

function __bobthefish_git_ahead -S -d 'Print the ahead/behind state for the current branch'
    if [ "$theme_display_git_ahead_verbose" = 'yes' ]
        __bobthefish_git_ahead_verbose
        return
    end

    set -l ahead 0
    set -l behind 0
    for line in (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
        switch "$line"
            case '>*'
                if [ $behind -eq 1 ]
                    echo '±'
                    return
                end
                set ahead 1
            case '<*'
                if [ $ahead -eq 1 ]
                    echo "$git_plus_minus_glyph"
                    return
                end
                set behind 1
        end
    end

    if [ $ahead -eq 1 ]
        echo "$git_plus_glyph"
    else if [ $behind -eq 1 ]
        echo "$git_minus_glyph"
    end
end

function __bobthefish_git_ahead_verbose -S -d 'Print a more verbose ahead/behind state for the current branch'
    set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
    or return

    set -l behind (count (for arg in $commits; echo $arg; end | command grep '^<'))
    set -l ahead (count (for arg in $commits; echo $arg; end | command grep -v '^<'))

    switch "$ahead $behind"
        case '' # no upstream
        case '0 0' # equal to upstream
            return
        case '* 0' # ahead of upstream
            echo "$git_ahead_glyph$ahead"
        case '0 *' # behind upstream
            echo "$git_behind_glyph$behind"
        case '*' # diverged from upstream
            echo "$git_ahead_glyph$ahead$git_behind_glyph$behind"
    end
end

function __bobthefish_git_dirty_verbose -S -d 'Print a more verbose dirty state for the current working tree'
    set -l changes (command git diff --numstat | awk '{ added += $1; removed += $2 } END { print "+" added "/-" removed }')
    or return

    echo "$changes " | string replace -r '(\+0/(-0)?|/-0)' ''
end

function __bobthefish_git_stashed -S -d 'Print the stashed state for the current branch'
    if [ "$theme_display_git_stashed_verbose" = 'yes' ]
        set -l stashed (command git rev-list --walk-reflogs --count refs/stash 2>/dev/null)
        or return

        echo -n "$git_stashed_glyph$stashed"
    else
        command git rev-parse --verify --quiet refs/stash >/dev/null
        and echo -n "$git_stashed_glyph"
    end
end


# ==============================
# Segment functions
# ==============================

function __bobthefish_start_segment -S -d 'Start a prompt segment'
    set -l bg $argv[1]
    set -e argv[1]
    set -l fg $argv[1]
    set -e argv[1]

    set_color normal # clear out anything bold or underline...
    set_color -b $bg $fg $argv

    switch "$__bobthefish_current_bg"
        case ''
            # If there's no background, just start one
            echo -n ' '
        case "$bg"
            # If the background is already the same color, draw a separator
            echo -ns $right_arrow_glyph ' '
        case '*'
            # otherwise, draw the end of the previous segment and the start of the next
            set_color $__bobthefish_current_bg
            echo -ns $right_black_arrow_glyph ' '
            set_color $fg $argv
    end

    set __bobthefish_current_bg $bg
end

function __bobthefish_path_segment -S -a segment_dir -d 'Display a shortened form of a directory'
    set -l segment_color $color_path
    set -l segment_basename_color $color_path_basename

    if not [ -w "$segment_dir" ]
        set segment_color $color_path_nowrite
        set segment_basename_color $color_path_nowrite_basename
    end

    __bobthefish_start_segment $segment_color

    set -l directory
    set -l parent

    switch "$segment_dir"
        case /
            set directory '/'
        case "$HOME"
            set directory '~'
        case '*'
            set parent (__bobthefish_pretty_parent "$segment_dir")
            set directory (__bobthefish_basename "$segment_dir")
    end

    echo -n $parent
    set_color -b $segment_basename_color
    echo -ns $directory ' '
end

function __bobthefish_finish_segments -S -d 'Close open prompt segments'
    if [ -n "$__bobthefish_current_bg" ]
        set_color normal
        set_color $__bobthefish_current_bg
        echo -ns $right_black_arrow_glyph ' '
    end

    if [ "$theme_newline_cursor" = 'yes' ]
        echo -ens "\n"
        set_color $fish_color_autosuggestion

        if set -q theme_newline_prompt
            echo -ens "$theme_newline_prompt"
        else if [ "$theme_powerline_fonts" = "no" ]
            echo -ns '> '
        else
            echo -ns "$right_arrow_glyph "
        end
    else if [ "$theme_newline_cursor" = 'clean' ]
        echo -ens "\n"
    end

    set_color normal
    set __bobthefish_current_bg
end


# ==============================
# Status and input mode segments
# ==============================

function __bobthefish_prompt_status -S -a last_status -d 'Display flags for a non-zero exit status, root user, and background jobs'
    set -l nonzero
    set -l superuser
    set -l bg_jobs

    # Last exit was nonzero
    [ $last_status -ne 0 ]
    and set nonzero 1

    # If superuser (uid == 0)
    #
    # Note that iff the current user is root and '/' is not writeable by root this
    # will be wrong. But I can't think of a single reason that would happen, and
    # it is literally 99.5% faster to check it this way, so that's a tradeoff I'm
    # willing to make.
    [ -w / ]
    and [ (id -u) -eq 0 ]
    and set superuser 1

    # Jobs display
    jobs -p >/dev/null
    and set bg_jobs 1

    if [ "$nonzero" -o "$superuser" -o "$bg_jobs" ]
        __bobthefish_start_segment $color_initial_segment_exit
        if [ "$nonzero" ]
            set_color normal
            set_color -b $color_initial_segment_exit
            if [ "$theme_show_exit_status" = 'yes' ]
                echo -ns $last_status ' '
            else
                echo -n $nonzero_exit_glyph
            end
        end

        if [ "$superuser" ]
            set_color normal
            if [ -z "$FAKEROOTKEY" ]
                set_color -b $color_initial_segment_su
            else
                set_color -b $color_initial_segment_exit
            end

            echo -n $superuser_glyph
        end

        if [ "$bg_jobs" ]
            set_color normal
            set_color -b $color_initial_segment_jobs
            echo -n $bg_job_glyph
        end
    end
end

function __bobthefish_prompt_vi -S -d 'Display vi mode'
    [ "$theme_display_vi" != 'no' ]
    or return

    [ "$fish_key_bindings" = 'fish_vi_key_bindings' \
        -o "$fish_key_bindings" = 'hybrid_bindings' \
        -o "$fish_key_bindings" = 'fish_hybrid_key_bindings' \
        -o "$theme_display_vi" = 'yes' ]
    or return

    switch $fish_bind_mode
        case default
            __bobthefish_start_segment $color_vi_mode_default
            echo -n 'N '
        case insert
            __bobthefish_start_segment $color_vi_mode_insert
            echo -n 'I '
        case replace_one replace-one
            __bobthefish_start_segment $color_vi_mode_insert
            echo -n 'R '
        case visual
            __bobthefish_start_segment $color_vi_mode_visual
            echo -n 'V '
    end
end


# ==============================
# Container and VM segments
# ==============================

function __bobthefish_prompt_vagrant -S -d 'Display Vagrant status'
    [ "$theme_display_vagrant" = 'yes' -a -f Vagrantfile ]
    or return

    # .vagrant/machines/$machine/$provider/id
    for file in .vagrant/machines/*/*/id
        read -l id <"$file"

        if [ -n "$id" ]
            switch "$file"
                case '*/virtualbox/id'
                    __bobthefish_prompt_vagrant_vbox $id
                case '*/vmware_fusion/id'
                    __bobthefish_prompt_vagrant_vmware $id
                case '*/parallels/id'
                    __bobthefish_prompt_vagrant_parallels $id
            end
        end
    end
end

function __bobthefish_prompt_vagrant_vbox -S -a id -d 'Display VirtualBox Vagrant status'
    set -l vagrant_status
    set -l vm_status (VBoxManage showvminfo --machinereadable $id 2>/dev/null | command grep 'VMState=' | tr -d '"' | cut -d '=' -f 2)

    switch "$vm_status"
        case 'running'
            set vagrant_status "$vagrant_status$vagrant_running_glyph"
        case 'poweroff'
            set vagrant_status "$vagrant_status$vagrant_poweroff_glyph"
        case 'aborted'
            set vagrant_status "$vagrant_status$vagrant_aborted_glyph"
        case 'saved'
            set vagrant_status "$vagrant_status$vagrant_saved_glyph"
        case 'stopping'
            set vagrant_status "$vagrant_status$vagrant_stopping_glyph"
        case ''
            set vagrant_status "$vagrant_status$vagrant_unknown_glyph"
    end

    [ -z "$vagrant_status" ]
    and return

    __bobthefish_start_segment $color_vagrant
    echo -ns $vagrant_status ' '
end

function __bobthefish_prompt_vagrant_vmware -S -a id -d 'Display VMWare Vagrant status'
    set -l vagrant_status
    if [ (pgrep -f "$id") ]
        set vagrant_status "$vagrant_status$vagrant_running_glyph"
    else
        set vagrant_status "$vagrant_status$vagrant_poweroff_glyph"
    end

    [ -z "$vagrant_status" ]
    and return

    __bobthefish_start_segment $color_vagrant
    echo -ns $vagrant_status ' '
end

function __bobthefish_prompt_vagrant_parallels -S -d 'Display Parallels Vagrant status'
    set -l vagrant_status
    set -l vm_status (prlctl list $id -o status 2>/dev/null | command tail -1)

    switch "$vm_status"
        case 'running'
            set vagrant_status "$vagrant_status$vagrant_running_glyph"
        case 'stopped'
            set vagrant_status "$vagrant_status$vagrant_poweroff_glyph"
        case 'paused'
            set vagrant_status "$vagrant_status$vagrant_saved_glyph"
        case 'suspended'
            set vagrant_status "$vagrant_status$vagrant_saved_glyph"
        case 'stopping'
            set vagrant_status "$vagrant_status$vagrant_stopping_glyph"
        case ''
            set vagrant_status "$vagrant_status$vagrant_unknown_glyph"
    end

    [ -z "$vagrant_status" ]
    and return

    __bobthefish_start_segment $color_vagrant
    echo -ns $vagrant_status ' '
end

function __bobthefish_prompt_docker -S -d 'Display Docker machine name'
    [ "$theme_display_docker_machine" = 'no' -o -z "$DOCKER_MACHINE_NAME" ]
    and return

    __bobthefish_start_segment $color_vagrant
    echo -ns $DOCKER_MACHINE_NAME ' '
end

function __bobthefish_k8s_context -S -d 'Get the current k8s context'
    set -l config_paths "$HOME/.kube/config"
    [ -n "$KUBECONFIG" ]
    and set config_paths (string split ':' "$KUBECONFIG") $config_paths

    for file in $config_paths
        [ -f "$file" ]
        or continue

        while read -l key val
            if [ "$key" = 'current-context:' ]
                set -l context (string trim -c '"\' ' -- $val)
                [ -z "$context" ]
                and return 1

                echo $context
                return
            end
        end <$file
    end

    return 1
end

function __bobthefish_k8s_namespace -S -d 'Get the current k8s namespace'
    kubectl config view --minify --output "jsonpath={..namespace}"
end

function __bobthefish_prompt_k8s_context -S -d 'Show current Kubernetes context'
    [ "$theme_display_k8s_context" = 'yes' ]
    or return

    set -l context (__bobthefish_k8s_context)
    or return

    set -l namespace (__bobthefish_k8s_namespace)

    set -l segment $k8s_glyph " " $context
    [ -n "$namespace" ]
    and set segment $segment ":" $namespace

    __bobthefish_start_segment $color_k8s
    echo -ns $segment " "
end


# ==============================
# User / hostname info segments
# ==============================

# Polyfill for fish < 2.5.0
if not type -q prompt_hostname
    if not set -q __bobthefish_prompt_hostname
        set -g __bobthefish_prompt_hostname (hostname | string replace -r '\..*' '')
    end

    function prompt_hostname
        echo $__bobthefish_prompt_hostname
    end
end

function __bobthefish_prompt_user -S -d 'Display current user and hostname'
    [ "$theme_display_user" = 'yes' -o \( "$theme_display_user" != 'no' -a -n "$SSH_CLIENT" \) -o \( -n "$default_user" -a "$USER" != "$default_user" \) ]
    and set -l display_user

    [ "$theme_display_hostname" = 'yes' -o \( "$theme_display_hostname" != 'no' -a -n "$SSH_CLIENT" \) ]
    and set -l display_hostname

    if set -q display_user
        __bobthefish_start_segment $color_username
        echo -ns (whoami)
    end

    if set -q display_hostname
        if set -q display_user
            # reset colors without starting a new segment...
            # (so we can have a bold username and non-bold hostname)
            set_color normal
            set_color -b $color_hostname[1] $color_hostname[2..-1]
            echo -ns '@' (prompt_hostname)
        else
            __bobthefish_start_segment $color_hostname
            echo -ns (prompt_hostname)
        end
    end

    set -q display_user
    or set -q display_hostname
    and echo -ns ' '
end


# ==============================
# Virtual environment segments
# ==============================

function __bobthefish_rvm_parse_ruby -S -a ruby_string -a scope -d 'Parse RVM Ruby string'
    # Function arguments:
    # - 'ruby-2.2.3@rails', 'jruby-1.7.19'...
    # - 'default' or 'current'
    set -l IFS @
    echo "$ruby_string" | read __ruby __rvm_{$scope}_ruby_gemset __
    set IFS -
    echo "$__ruby" | read __rvm_{$scope}_ruby_interpreter __rvm_{$scope}_ruby_version __
    set -e __ruby
    set -e __
end

function __bobthefish_rvm_info -S -d 'Current Ruby information from RVM'
    # look for rvm install path
    set -q rvm_path
    or set -l rvm_path ~/.rvm /usr/local/rvm

    # More `sed`/`grep`/`cut` magic...
    set -l __rvm_default_ruby (grep GEM_HOME $rvm_path/environments/default 2>/dev/null | sed -e"s/'//g" | sed -e's/.*\///')
    set -l __rvm_current_ruby (rvm-prompt i v g)

    [ "$__rvm_default_ruby" = "$__rvm_current_ruby" ]
    and return

    set -l __rvm_default_ruby_gemset
    set -l __rvm_default_ruby_interpreter
    set -l __rvm_default_ruby_version
    set -l __rvm_current_ruby_gemset
    set -l __rvm_current_ruby_interpreter
    set -l __rvm_current_ruby_version

    # Parse default and current Rubies to global variables
    __bobthefish_rvm_parse_ruby $__rvm_default_ruby default
    __bobthefish_rvm_parse_ruby $__rvm_current_ruby current
    # Show unobtrusive RVM prompt

    # If interpreter differs form default interpreter, show everything:
    if [ "$__rvm_default_ruby_interpreter" != "$__rvm_current_ruby_interpreter" ]
        if [ "$__rvm_current_ruby_gemset" = 'global' ]
            rvm-prompt i v
        else
            rvm-prompt i v g
        end
        # If version differs form default version
    else if [ "$__rvm_default_ruby_version" != "$__rvm_current_ruby_version" ]
        if [ "$__rvm_current_ruby_gemset" = 'global' ]
            rvm-prompt v
        else
            rvm-prompt v g
        end
        # If gemset differs form default or 'global' gemset, just show it
    else if [ "$__rvm_default_ruby_gemset" != "$__rvm_current_ruby_gemset" ]
        rvm-prompt g
    end
end

function __bobthefish_prompt_rubies -S -d 'Display current Ruby information'
    [ "$theme_display_ruby" = 'no' ]
    and return

    set -l ruby_version
    if type -fq rvm-prompt
        set ruby_version (__bobthefish_rvm_info)
    else if type -fq rbenv
        set ruby_version (rbenv version-name)
        # Don't show global ruby version...
        set -q RBENV_ROOT
        or set -l RBENV_ROOT $HOME/.rbenv

        [ -e "$RBENV_ROOT/version" ]
        and read -l global_ruby_version <"$RBENV_ROOT/version"

        [ "$global_ruby_version" ]
        or set -l global_ruby_version system

        [ "$ruby_version" = "$global_ruby_version" ]
        and return
    else if type -q chruby # chruby is implemented as a function, so omitting the -f is intentional
        set ruby_version $RUBY_VERSION
    else if type -fq asdf
        asdf current ruby 2>/dev/null | read -l asdf_ruby_version asdf_provenance
        or return

        # If asdf changes their ruby version provenance format, update this to match
        [ "$asdf_provenance" = "(set by $HOME/.tool-versions)" ]
        and return

        set ruby_version $asdf_ruby_version
    end

    [ -z "$ruby_version" ]
    and return

    __bobthefish_start_segment $color_rvm
    echo -ns $ruby_glyph $ruby_version ' '
end

function __bobthefish_virtualenv_python_version -S -d 'Get current Python version'
    switch (python --version 2>&1 | tr '\n' ' ')
        case 'Python 2*PyPy*'
            echo $pypy_glyph
        case 'Python 3*PyPy*'
            echo -s $pypy_glyph $superscript_glyph[3]
        case 'Python 2*'
            echo $superscript_glyph[2]
        case 'Python 3*'
            echo $superscript_glyph[3]
    end
end

function __bobthefish_prompt_virtualfish -S -d "Display current Python virtual environment (only for virtualfish, virtualenv's activate.fish changes prompt by itself) or conda environment."
    [ "$theme_display_virtualenv" = 'no' -o -z "$VIRTUAL_ENV" -a -z "$CONDA_DEFAULT_ENV" ]
    and return

    set -l version_glyph (__bobthefish_virtualenv_python_version)

    if [ "$version_glyph" ]
        __bobthefish_start_segment $color_virtualfish
        echo -ns $virtualenv_glyph $version_glyph ' '
    end

    if [ "$VIRTUAL_ENV" ]
        echo -ns (basename "$VIRTUAL_ENV") ' '
    else if [ "$CONDA_DEFAULT_ENV" ]
        echo -ns (basename "$CONDA_DEFAULT_ENV") ' '
    end
end

function __bobthefish_prompt_virtualgo -S -d 'Display current Go virtual environment'
    [ "$theme_display_virtualgo" = 'no' -o -z "$VIRTUALGO" ]
    and return

    __bobthefish_start_segment $color_virtualgo
    echo -ns $go_glyph ' ' (basename "$VIRTUALGO") ' '
    set_color normal
end

function __bobthefish_prompt_desk -S -d 'Display current desk environment'
    [ "$theme_display_desk" = 'no' -o -z "$DESK_ENV" ]
    and return

    __bobthefish_start_segment $color_desk
    echo -ns $desk_glyph ' ' (basename  -a -s ".fish" "$DESK_ENV") ' '
    set_color normal
end

function __bobthefish_prompt_nvm -S -d 'Display current node version through NVM'
    [ "$theme_display_nvm" = 'yes' -a -n "$NVM_DIR" ]
    or return

    set -l node_version (nvm current 2> /dev/null)

    [ -z $node_version -o "$node_version" = 'none' -o "$node_version" = 'system' ]
    and return

    __bobthefish_start_segment $color_nvm
    echo -ns $node_glyph $node_version ' '
    set_color normal
end


# ==============================
# VCS segments
# ==============================

function __bobthefish_prompt_hg -S -a hg_root_dir -a real_pwd -d 'Display the actual hg state'
    set -l dirty (command hg stat; or echo -n '*')

    set -l flags "$dirty"
    [ "$flags" ]
    and set flags ""

    set -l flag_colors $color_repo
    if [ "$dirty" ]
        set flag_colors $color_repo_dirty
    end

    __bobthefish_path_segment $hg_root_dir

    __bobthefish_start_segment $flag_colors
    echo -ns $hg_glyph ' '

    __bobthefish_start_segment $flag_colors
    echo -ns (__bobthefish_hg_branch) $flags ' '
    set_color normal

    set -l project_pwd (__bobthefish_project_pwd $hg_root_dir $real_pwd)
    if [ "$project_pwd" ]
        if [ -w "$real_pwd" ]
            __bobthefish_start_segment $color_path
        else
            __bobthefish_start_segment $color_path_nowrite
        end

        echo -ns $project_pwd ' '
    end
end

function __bobthefish_prompt_git -S -a git_root_dir -a real_pwd -d 'Display the actual git state'
    set -l dirty ''
    if [ "$theme_display_git_dirty" != 'no' ]
        set -l show_dirty (command git config --bool bash.showDirtyState 2>/dev/null)
        if [ "$show_dirty" != 'false' ]
            set dirty (command git diff --no-ext-diff --quiet --exit-code 2>/dev/null; or echo -n "$git_dirty_glyph")
            if [ "$dirty" -a "$theme_display_git_dirty_verbose" = 'yes' ]
                set dirty "$dirty"(__bobthefish_git_dirty_verbose)
            end
        end
    end

    set -l staged (command git diff --cached --no-ext-diff --quiet --exit-code 2>/dev/null; or echo -n "$git_staged_glyph")
    set -l stashed (__bobthefish_git_stashed)
    set -l ahead (__bobthefish_git_ahead)

    set -l new ''
    if [ "$theme_display_git_untracked" != 'no' ]
        set -l show_untracked (command git config --bool bash.showUntrackedFiles 2>/dev/null)
        if [ "$show_untracked" != 'false' ]
            set new (command git ls-files --other --exclude-standard --directory --no-empty-directory 2>/dev/null)
            if [ "$new" ]
                set new "$git_untracked_glyph"
            end
        end
    end

    set -l flags "$dirty$staged$stashed$ahead$new"

    [ "$flags" ]
    and set flags " $flags"

    set -l flag_colors $color_repo
    if [ "$dirty" ]
        set flag_colors $color_repo_dirty
    else if [ "$staged" ]
        set flag_colors $color_repo_staged
    end

    __bobthefish_path_segment $git_root_dir

    __bobthefish_start_segment $flag_colors
    echo -ns (__bobthefish_git_branch) $flags ' '
    set_color normal

    if [ "$theme_git_worktree_support" != 'yes' ]
        set -l project_pwd (__bobthefish_project_pwd $git_root_dir $real_pwd)
        if [ "$project_pwd" ]
            if [ -w "$real_pwd" ]
                __bobthefish_start_segment $color_path
            else
                __bobthefish_start_segment $color_path_nowrite
            end

            echo -ns $project_pwd ' '
        end
        return
    end

    set -l project_pwd (command git rev-parse --show-prefix 2>/dev/null | string trim --right --chars=/)
    set -l work_dir (command git rev-parse --show-toplevel 2>/dev/null)

    # only show work dir if it's a parent…
    if [ "$work_dir" ]
        switch $real_pwd/
            case $work_dir/\*
                string match "$git_root_dir*" $work_dir >/dev/null
                and set work_dir (string sub -s (math 1 + (string length $git_root_dir)) $work_dir)
            case \*
                set -e work_dir
        end
    end

    if [ "$project_pwd" -o "$work_dir" ]
        set -l colors $color_path
        if not [ -w "$real_pwd" ]
            set colors $color_path_nowrite
        end

        __bobthefish_start_segment $colors

        # handle work_dir != project dir
        if [ "$work_dir" ]
            set -l work_parent (__bobthefish_dirname $work_dir)
            if [ "$work_parent" ]
                echo -n "$work_parent/"
            end

            set_color normal
            set_color -b $color_repo_work_tree
            echo -n (__bobthefish_basename $work_dir)

            set_color normal
            set_color -b $colors
            [ "$project_pwd" ]
            and echo -n '/'
        end

        echo -ns $project_pwd ' '
    else
        set project_pwd $real_pwd

        string match "$git_root_dir*" $project_pwd >/dev/null
        and set project_pwd (string sub -s (math 1 + (string length $git_root_dir)) $project_pwd)

        set project_pwd (string trim --left --chars=/ -- $project_pwd)

        if [ "$project_pwd" ]
            set -l colors $color_path
            if not [ -w "$real_pwd" ]
                set colors $color_path_nowrite
            end

            __bobthefish_start_segment $colors

            echo -ns $project_pwd ' '
        end
    end
end

function __bobthefish_prompt_dir -S -a real_pwd -d 'Display a shortened form of the current directory'
    __bobthefish_path_segment "$real_pwd"
end


# ==============================
# Apply theme
# ==============================

function fish_prompt -d 'bobthefish, a fish theme optimized for awesome'
    # Save the last status for later (do this before anything else)
    set -l last_status $status

    # Use a simple prompt on dumb terminals.
    if [ "$TERM" = "dumb" ]
        echo "> "
        return
    end

    __bobthefish_glyphs
    __bobthefish_colors $theme_color_scheme

    type -q bobthefish_colors
    and bobthefish_colors

    # Start each line with a blank slate
    set -l __bobthefish_current_bg

    # Status flags and input mode
    __bobthefish_prompt_status $last_status
    __bobthefish_prompt_vi

    # Containers and VMs
    __bobthefish_prompt_vagrant
    __bobthefish_prompt_docker
    __bobthefish_prompt_k8s_context

    # User / hostname info
    __bobthefish_prompt_user

    # Virtual environments
    __bobthefish_prompt_desk
    __bobthefish_prompt_rubies
    __bobthefish_prompt_virtualfish
    __bobthefish_prompt_virtualgo
    __bobthefish_prompt_nvm

    set -l real_pwd (__bobthefish_pwd)

    # VCS
    set -l git_root_dir (__bobthefish_git_project_dir $real_pwd)
    set -l hg_root_dir (__bobthefish_hg_project_dir $real_pwd)

    if [ "$git_root_dir" -a "$hg_root_dir" ]
        # only show the closest parent
        switch $git_root_dir
            case $hg_root_dir\*
                __bobthefish_prompt_git $git_root_dir $real_pwd
            case \*
                __bobthefish_prompt_hg $hg_root_dir $real_pwd
        end
    else if [ "$git_root_dir" ]
        __bobthefish_prompt_git $git_root_dir $real_pwd
    else if [ "$hg_root_dir" ]
        __bobthefish_prompt_hg $hg_root_dir $real_pwd
    else
        __bobthefish_prompt_dir $real_pwd
    end

    __bobthefish_finish_segments
end
