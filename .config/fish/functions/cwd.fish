function cwd --wraps='pwd | xclip' --description 'alias cwd=pwd | xclip'
  pwd | xclip $argv
        
end
