# homebrew-yaplot

A HomeBrew installer for the yaplot.

See https://github.com/vitroid/Yaplot for the command itself.

## Installation

### 1. Install the homebrew

See https://brew.sh .

### 2. Install Yaplot via homebrew

```shell
brew tap vitroid/yaplot
brew install yaplot
```

If it says "Update them from Software Update in System Settings", follow the instructions

```shell
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
```

and rerun the following command.

```shell
brew install --build-from-source yaplot
```
