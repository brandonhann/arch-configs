function __user_host
  set -l user_color
  if [ (id -u) = "0" ];
    set user_color red # for root
  else
    set user_color green # for non-root users
  end

  echo -n (set_color normal)$USER

  echo -n (set_color --bold white)"::"(set_color normal)

  echo -n (hostname|cut -d . -f 1) (set_color normal)
end

function __current_path
  echo -n (set_color --bold white)(prompt_pwd)(set_color normal)
end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function __git_status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info '<'$git_branch"*"'>'
    else
      set git_info '<'$git_branch'>'
    end

    echo -n (set_color yellow) $git_info (set_color normal) 
  end
end

function __ruby_version
  if type "rvm-prompt" > /dev/null 2>&1
    set ruby_version (rvm-prompt i v g)
  else if type "rbenv" > /dev/null 2>&1
    set ruby_version (rbenv version-name)
  # else
    # set ruby_version "system"
  end

  if set -q ruby_version
    echo -n (set_color red) ‹$ruby_version› (set_color normal)
  end
end

function fish_prompt
  # Set the initial parts with normal coloring
  echo -n (set_color normal)"┏╼╼╡ "
  __user_host
  __current_path
  __ruby_version
  __git_status
  echo -e ''
  echo -n (set_color normal)"┗╼["

  # Ensure "ins" is set to bold white for visibility
  echo -n (set_color --bold white)"ins"

  # Continue with the rest of the prompt in normal color
  echo -n (set_color normal)"]╼╼► "
  echo (set_color normal)
end


function fish_right_prompt
  set -l st $status

  if [ $st != 0 ];
    echo (set_color red) ↵ $st(set_color normal)
  end
end
