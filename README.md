# Secrets-Detection

## What is gitleaks
Gitleaks is a tool used to detect secrets before they are pushed to git. 
When run locally it will block any commit that contains a secret


## Setup secrets detection locally

### 1. Install Gitleaks locally
To install gitleaks you will need to clone git-leaks repo locally.  You will not need it later so we will clone in it /tmp directory.
1. Clone gitleaks repo
```bash
cd /tmp
git clone https://github.com/zricethezav/gitleaks.git
cd gitleaks
```
2. Install gitleaks
```bash
make build
```
Potential error could be that that in file `go.mod` second line should be `go 1.18` insted of `go 1.19`.
If you get an error that isn't resolved with this call infra :)
3. Make gitleaks executable
```bash
sudo cp gitleaks /usr/bin
```

4. Test if gitleaks works
```bash
gitleaks help
```

### 2. Create git hook template
Git hook template is used on every `git clone` or `git init` to add custom hooks to your local git repository. (Hooks are used to automatically run scripts on certain git events like commit, push...) 
We will create template for custom precommit hook that runs before every local commit and searches for secrets in it.

1. Clone this repo
```bash
cd /tmp
git clone https://github.com/mindsmiths/Secrets-Detection.git
cd Secrets-Detection
```
2. Run script that will create .git-templates directory and add secrets detection config file to your home directory
```bash
bash local-setup.sh
```
3. Test if hooks template installed correctly
```bash
cd /tmp
mkdir test-gitleaks-hooks
cd test-gitleaks-hooks
git init
echo "password = sifra123" > ovaj_file_ima_sifru.txt
git add -A 
git commit -m "commit koji ima sifru"
```
You should see that gitleaks was run and that it detected a secret. 
If you get any error during this process something went wrong. :(

## Usage
After everything is installed and setup correctly for current git repo gitleaks will automatically scan your every commit and make sure there are not secrets in it. 
If it detects any secrets it will cancel your commit and tell you where detected secret is located.

## Can I skip secret detection for a commit?
Generally you should never skip gitleaks check for any commit. 
If you are commiting anything for public github repo you are **NOT ALLOWED** to skip gitleaks check. 

For any pushes to Mindsmiths Gitlab you sould first consider if that secret should be in the code. But if it must be pushed you can skip secret detection for current commit like this:
```bash
SKIP=gitleaks git commit -m "your commit message"
```