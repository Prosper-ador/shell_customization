#!/bin/bash
#custom aliases
alias ll='ls -al'
alias ls='ls -l'
alias where='echo $PWD'
alias c=clear
alias s=source
alias e=exit
alias ..='cd ..'
alias ...='cd ../..'
alias rp=realpath
alias h=history
alias me=whoami
alias pd=passwd
alias l=less
alias install1='sudo apt update && sudo apt install'
alias install2='sudo apt update && sudo apt-get install'
alias install3='sudo apt update && sudo snap install'
alias ua=useradd
alias um=usermod
alias gi='git init'
alias gs='git status'
alias ga='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias fig='figlet'

#custom functions
ca() { cd "$1" && ls -al; }
mkcd () {
       mkdir -p "$1" && cd "$1"
     }
# Function to prompt before deleting a file or directory
del() {
  # Check if argument is passed (file or directory path)
  if [ -z "$1" ]; then
    echo "Error: No file or directory specified."
    return 1
  fi

  local target="$1"
  
  # Check if the target is a file or directory
  if [ -f "$target" ]; then
    # It's a file
    read -p "Are you sure you want to delete the file '$target'? (y/n) " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      rm "$target" && echo "File '$target' deleted."
    else
      echo "File '$target' not deleted."
    fi
  elif [ -d "$target" ]; then
    # It's a directory
    read -p "Are you sure you want to delete the directory '$target' and its contents? (y/n) " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      rm -r "$target" && echo "Directory '$target' deleted."
    else
      echo "Directory '$target' not deleted."
    fi
  else
    echo "Error: '$target' is not a valid file or directory."
    return 1
  fi
}
# Function to find files and directories in the current directory
finddir() {
  local type="$1"  # The type argument (file, dir, all)
  local name="$2"  # The pattern to match (optional)

  # Default to search in the current directory if no directory is specified
  local search_dir="."

  # If no type is specified, default to search for both files and directories
  if [ -z "$type" ]; then
    type="all"
  fi

  # Case for searching all files and directories
  if [ "$type" == "all" ]; then
    if [ -z "$name" ]; then
      # If no name is given, list everything in the current directory
      ls -alF "$search_dir"
    else
      # Search for files or directories matching the name pattern
      find "$search_dir" -name "$name"
    fi

  # Case for searching only directories
  elif [ "$type" == "dir" ]; then
    if [ -z "$name" ]; then
      # List all directories in the current directory
      find "$search_dir" -type d
    else
      # Search for directories matching the name pattern
      find "$search_dir" -type d -name "$name"
    fi

  # Case for searching only files
  elif [ "$type" == "file" ]; then
    if [ -z "$name" ]; then
      # List all files in the current directory
      find "$search_dir" -type f
    else
      # Search for files matching the name pattern
      find "$search_dir" -type f -name "$name"
    fi

  else
    echo "Usage: finddir [file|dir|all] [name_pattern]"
    echo "  file  - Search for files"
    echo "  dir   - Search for directories"
    echo "  all   - Search for both files and directories"
  fi
}
# Function to get the current Git branch
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set the PS1 prompt
export PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\[\e[31m\]\$(parse_git_branch)\[\e[0m\] \$ "
#\u: Displays the current username.
#\h: Displays the hostname up to the first period.
#\w: Displays the current working directory.
#parse_git_branch: A function that gets the current Git branch name.
#\$: Displays a $ if you are a regular user, or a # if you are the root user.
#\[\e[...m\]: ANSI escape codes to colorize the prompt.
#32m: Green for username and hostname.
#34m: Blue for the current directory.
#31m: Red for the Git branch name.
#0m: Resets the color to the default.
# Personalized PS1 prompt (bash)
if [[ $EUID -eq 0 ]]; then
  PS1='[\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;34m\]\h\[\033[00m\] \[\033[01;32m\]\w\[\033[00m\]]$ '
else
  PS1='[\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;34m\]\h\[\033[00m\] \[\033[01;32m\]\w\[\033[00m\]]$ '
fi

