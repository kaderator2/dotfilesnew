function gwd --wraps='cd $(xclip -o)' --description 'alias gwd=cd $(xclip -o)'
  cd $(xclip -o) $argv
        
end
