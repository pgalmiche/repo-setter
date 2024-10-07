# Manual installation:

1 - Go inside your git repository in which you want to do the setup.
2 - Create the repo with:

```
git init --bare ./.repo_setter
```

Then, make sure the --git-dir is the same as the directory where you created the repo above with:

```
alias repo_setter="git --git-dir=$PWD/.repo_setter --work-tree=."
```

# Basic workflow

To configure the remote for this repo with ssh, you can use:

```
config remote add origin git@gitlab.com:pgalmiche/repo_setter.git
```

Then, you can add, commit and push with:

```
config add ~/.config/something/somefile
config commit -m "add somefile"
config push
```

Or pull what has been modified on another computer with:

```
config pull
```

You finally can remove the repo_setter repository as you already added the required files.
Use:

```
rm -r ./.repo_setter
```
