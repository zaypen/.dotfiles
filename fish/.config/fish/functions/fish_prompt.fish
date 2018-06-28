function visual_length --description\
    "Return visual length of string, i.e. without terminal escape sequences"
    # TODO: Use "string replace" builtin in Fish 2.3.0
    printf $argv | perl -pe 's/\x1b.*?[mGKH]//g' | wc -m
end

function with_color --description\
    "Echo last arg with color specified by earlier args for set_color"
    set s $argv[-1]
    set -e argv[-1]
    set_color $argv
    echo -n $s
    set_color normal
    echo
end

function _append --no-scope-shadowing
    set $argv[1] "$$argv[1]""$argv[2]"
end

function fish_prompt
  set -l last_status $status
  set -l left_prompt
  set -l right_prompt
  set -l cwd

  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l dirty    "⨯"
  set -l none     "◦"

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
    if git_is_repo
      set root_folder (command git rev-parse --show-toplevel ^/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end
  else
    set cwd (prompt_pwd)
  end

  if sudo -nv >/dev/null 2>&1
    set prompt_char "#"
  else
    set prompt_char "\$"
  end

  _append left_prompt (with_color brown $cwd)

  if git_is_repo
    _append left_prompt " "
    _append left_prompt (with_color cyan (git config user.email))
    _append left_prompt " on "
    _append left_prompt (with_color green (git_branch_name))

    if git_is_touched
      _append left_prompt " "$dirty
    else
      _append left_prompt " "(git_ahead $ahead $behind $diverged $none)
    end
  end

  if test $last_status != 0
      _append right_prompt (with_color -o red $last_status)
  else
      _append right_prompt (with_color green $last_status)
  end
  _append right_prompt " "
  _append right_prompt (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')

  # spaces
  set -l left_length (visual_length $left_prompt)
  set -l right_length (visual_length $right_prompt)
  set -l spaces (math "$COLUMNS - $left_length - $right_length")

  echo -n $left_prompt
  printf "%-"$spaces"s" " "
  echo $right_prompt
  echo -n $prompt_char" "
end
