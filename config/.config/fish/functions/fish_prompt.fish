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


end