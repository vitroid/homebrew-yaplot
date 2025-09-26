# homebrew-yaplot

A HomeBrew installer for the yaplot.

See https://github.com/vitroid/Yaplot for the command itself.

## Installation

```shell
brew tap vitroid/yaplot
brew install --build-from-source yaplot
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
