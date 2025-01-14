FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && 
    apt-get install -y 
    bash 
    zsh 
    git 
    unzip 
    && rm -rf /var/lib/apt/lists/*

# Set the default shell to zsh
RUN chsh -s $(which zsh)

# Copy the shell configuration files into the container
COPY shell_env.sh /root/shell_env.sh

# Set permissions and execute the setup script
RUN chmod +x /root/shell_env.sh && 
    /root/shell_env.sh

# Set the working directory
WORKDIR /root

# Start with zsh shell
CMD ["zsh"]
