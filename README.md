# Secrets-Detection


## Setup secrets detection locally

### 1. Install Git Leaks locally
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