This is a **README** file for our shell environment task:  
Contributors:  
-*Guy Ghislain*  
-*Legadheu Christian*  
-*Nyengka Prosper*  

---

# Custom Shell Environment

This task provides a customizable shell environment for Linux users, designed to make users love scripting. It includes a set of **aliases**, **functions**, **prompt customizations**, and **shell enhancements** for both **Bash** and **Zsh**. It also comes with a Docker container setup to easily test the effectiveness of the customized shell environment.

---

## Features

### 1. **Shell Configuration (.bashrc / .zshrc)**
- **Enhanced Prompt (PS1)**: Displays system information like the username, hostname, current directory, and Git branch (if inside a Git repository).
- **Aliases for commonly used commands**: Useful shortcuts for commands like `ls`, `git init`, and directory navigation.
- **Custom Functions**: Includes functions like `mkcd` (make and change to a directory), `ca` (enter a directory and list all its contents.), and more.
- **Autocomplete & History Enhancements**: Includes autocomplete, history size management, and the ability to ignore duplicate commands in history.
- **Git Integration**: Easily check and manage Git repositories with custom Git shortcuts (`gs`, `gd`, `gl`, etc.).

### 2. **Startup Script (.bash_profile)**
- **Welcome Message**: A friendly greeting when you start a new shell session.
- **Environment Variables**: Set custom environment variables for your favorite tools (`nano` as default editor).
- **Shell Sourcing**: Sources the `.bashrc` or `.zshrc` configuration file when the shell starts.

### 3. **Docker Container Setup**
- **Dockerfile**: Pre-configured Dockerfile to build and test the shell environment in a container.
- **Automatic Setup**: Install necessary packages (`bash`, `zsh`, `git`, etc.) and configure the shell environment on the container startup.

---

## Installation and Setup

### Step 1: Clone the Repository

To get started, clone the repository to your local machine:

```bash
git clone https://github.com/Prosper-ador/shell_customization.git
cd custom-shell-env
```

### Step 2: Customize Configuration Files

You can adjust the configuration files based on your preferences.

1. **Bash Configuration (.bashrc)**:
   - Modify `.bashrc` to add custom aliases, functions, and change the prompt.
   - The prompt will display the username, hostname, current working directory, and Git branch.

2. **Zsh Configuration (.zshrc)**:
   - Use `.zshrc` if you prefer Zsh instead of Bash.
   - Includes advanced features like auto-suggestions and syntax highlighting (via external plugins like `zsh-autosuggestions`).

3. **Startup Configuration (.bash_profile / .zprofile)**:
   - Customize the shell startup behavior, such as setting environment variables and displaying a welcome message.

### Step 3: Docker Setup (Optional)

To test the shell environment in a Docker container, follow these steps:

1. **Build the Docker Image**:

    ```bash
    docker build -t custom_shell .
    ```

2. **Run the Docker Container**:

    ```bash
    docker run -it custom_shell
    ```

This will start the container, and you'll be dropped into the shell environment with all your customizations in place.

---
## Usage

Once the configuration files are in place, simply open a new terminal window, and the shell environment will be ready. You’ll notice:

- **Git branch names** appear directly in your prompt if you’re working within a Git repository.
- **Shortcuts** for Git and system navigation will speed up your workflow.
- **Enhanced autocomplete** will make command completion faster.

---

## Contribution

Feel free to fork the repository and submit pull requests for new features, bug fixes, or enhancements. Contributions are always welcome!

To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to your branch (`git push origin feature-name`).
5. Create a pull request.

---

## Acknowledgements

- **Zsh Plugins**: This project uses `zsh-autosuggestions` and `zsh-syntax-highlighting` for Zsh users to enhance the command-line experience.
- **Git Completion**: Git's completion scripts are used to provide autocompletion for Git commands and branches.

---

## NB
Enjoy your new shell environment!
---

This **README** will guide users through the installation, customization, and usage of your shell environment,  potential contributors.

## Conclusion
To conclude, all form of positive contributions to improve on the effectiveness of this script will be hihghly welcomed.
