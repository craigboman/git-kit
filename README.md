## git-kit
A kit full of cli improvements to git.

# zsrch file
This file could be used by any unix/linux users, but is geared towards Mac users. Here are the steps in order to use the git-kit cli shortcuts.
1. Locally open your ~/.zshrc file (either CLI using vi/nano or GUI using VS Code)
2. Copy the raw contents of the attached zsrch file
3. Paste the contents into your local ~/.zshrc file and save it
4. Refresh your cli session by sourcing the file: 
  `source ~/.zshrc`
5. Now instead of doing multiple cli commands like `git add $file` and then `git commit -m '$commit message' you can use a short cut like:
  `addCommit $path/file '$commitMessage'` replacing the $file/path with your local file you'd like to add and $commitMessage in quotes with the commit message needed for the file.
