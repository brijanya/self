---
layout: default
permalink: /git/
---

## History of `git`

`git` is a version control system developed in 2005 by Linus Torvalds as an `open source` version control system to manage the `linux` kernal.

Here are some commands that are used in `git`. This is a developing resource as I am currently reading the book **Pro Git by Scott Chacon and Ben Straub**.

## `git` commands

Initializing a repository. Go to the folder you want to version and run:
```bash
git init
```

This will create a `.git` folder in the current directory. This folder contains all the information about the repository.

To clone a repo from a local or hosted git server run:
```bash
git clone <repository_url>
```

This will create a folder with the name of the repository and all the files in the repository will be copied to that folder. Git clone automatically sets the remote repo to the URL used to clone the repo. This is same as `git init` followed by `git remote add origin <repository_url>` and `git pull origin main`.

By default `git` provides a default branch called `master`. However, this is not a hard rule and can be changed. Github for example calls its default branch as `main`. This is important to know when you are pushing and pulling changes from remote and want the branches to correctly align with the local branches. To change the name of the branch to something of your liking for the current repository:

```bash
git config init.defaultBranch <branch_name>
```
However to make any sense of what it does you will have to delete the `.git` folder and start over.

To make this change global so that all future repos use the new default branch name:

```bash
git config --global init.defaultBranch <branch_name>
```

To set the username and email for you git locally:

```bash
git config user.name <user_name>
git config user.email <user_email>
```

To rename a branch locally:
```bash
git branch -m <old_branch_name> <new_branch_name>
```
The `<old_branch_name>` is not required if you are currently on the branch that you are trying to rename. In such cases you can directly run:

```bash
git branch -m <new_branch_name>
```
The `-m` flag in the commands above is for **move**.

To check the state of you repo at any point run:

```bash
git status
```

To start tracking a file (aka stage a file) run:

```bash
git add <file_name>
```

To stage all the files in the current directory run:

```bash
git add .
```