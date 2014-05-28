function fish_prompt

	printf (date "+[%H:%M:%S], ")
  set_color red -o
  if test $PWD = $HOME
    echo -n "⌘ "
  else
    echo -n (basename $PWD)
  end 
  set_color green -o
  echo -n ' ➜ '
  
end


  

function fish_right_prompt

  set_color blue -o
  printf '[%s] ' (hostname)


function _git_branch_name
    echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  end
  
  function _is_git_dirty
    echo (git status -s --ignore-submodules=dirty ^/dev/null)
  end
  

  set -l red (set_color -o red)
  set -l yellow (set_color -o yellow)
  set -l blue (set_color -o blue)

  if [ (_git_branch_name) ]
  set -l git_branch $red(_git_branch_name)
  set git_info "$blue branch:($git_branch$blue)"

  if [ (_is_git_dirty) ]
    set -l dirty "$yellow ✗"
    set git_info "$git_info$dirty"
  end
  end
  echo -n -s $arrow ' '$cwd $git_info $normal ' '
end

 
