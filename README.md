# Ubuntu Initialization

These scripts help to build up my standard Ubuntu install

## Usage

```shell
sh init.sh start
```

## Steps

1. [Update & upgrade APT](steps/update.sh)
2. [General](steps/general.sh)
   1. Installing general utilities and APT package
3. [Java](steps/java.sh)
   1. Installing Java (Open JDK)
4. [Git](steps/git.sh)
   1. Installing Git
   2. Setting up user config
5. [Node.js](steps/node.sh)
   1. Installing NVM
   2. Installing Node.js DEV + global packages
   3. Installing Node.js LTS + global packages
6. [Python](steps/python.sh)
   1. Installing PyEnv
   2. Installing Python 3.8
   3. Installing Python 3.9
   4. Installing Python 3.10
   5. Installing Python 3.11
7. [Fonts](steps/font.sh)
   1. Installing Hack fonts
   2. Installing MS Core fonts
8. [Terminal](steps/terminal.sh)
   1. Installing Powerline
   2. Installing VIM
9.  [IDE](steps/ide.sh)
   3. Installing VSCode
10. [Chrome](steps/chrome.sh)
   4. Installing Google Chrome
11. [Docker](steps/docker.sh)
    1. Installing Docker
12. [Jenkins](steps/jenkins.sh)
    1. Installing Jenkins
13. [AWS](steps/aws.sh)
    1. Installing AWS CLI
    2. Installing AWS SAM CLI
14. [update & upgrade APT](steps/update.sh)
15. [Autoremove & autoclean APT](steps/clean.sh)
