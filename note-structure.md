# Filename conventions
- I think that directory and file names that describe an action I want to perform are more useful than names that specify the name of a command or package
- I can mix and match too. I could have a directory name that specifies an action I want to perform while also having filenames that are package or command names
- Perhaps the very topmost directory name should be an action and descendent directories and files can be packages/commands
- In fact there should be a transition point in the directory hierarchy names from "Task" -> "Tool"
  - Once this transition point is crossed, I should not go back to "Tool" -> "Task"
    - Or maybe I shoud. Which do I like better? (I actually like the first version better, which supports my original Task -> Tool assertion). Looks
      like I need to refactor my notes! I can even order the notes to indicate preference of tools!
      - bash/linux-administration/package-management/install/ubuntu/apt.sh
        - bash/linux-administration/package-management/view/ubuntu/1-aptitude.sh
          - bash/linux-administration/package-management/view/ubuntu/2-apt.sh
          - bash/linux-administration/package-management/view/ubuntu/apt-get.sh
      - bash/linux-administration/package-management/ubuntu/apt/install.sh
        - bash/linux-administration/package-management/ubuntu/apt/view.sh
          - bash/linux-administration/package-management/ubuntu/apt-get/view.sh
# Use of code blocks
- I should really reserve `code-blocks` for 1) actual code that I would paste into the terminal or 2) things that are code-related but it's not easy
  to tell that they are code related 
  - It's really tempting to format every single package name and command with `code` backticks, but ultimately that cheapens the value of the markup
    - On second thought, I should use code formatting generously
      - E.g. I can say APT when I'm referring to the Advanced Package Tool generally, but I should say `apt` when I'm talking about the command
# x
- It's useful to have two types of notes
  1) notes that are task-centered (i.e. the linux-administratin folder)
  2) notes that are tool-centered (i.e. the executables folder)
- I frequently have questions from both perspectives

New rule: write "\<topic>-introduction.md" instead of just "introduction.md"