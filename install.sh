# file taken originally from https://raw.githubusercontent.com/chcokr/osx-init/master/install.sh
# install Xcode Command Line Tools
# https://github.com/timsutton/osx-vm-templates/blob/ce8df8a7468faa7c5312444ece1b977c1b2f77a4/scripts/xcode-cli-tools.sh
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" --verbose;

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
#sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'
export PATH=$PATH:/usr/local/git/bin:/usr/local/bin

#fix sudo: no tty present and no askpass program specified
sudo su
echo 'user ALL=(ALL)  NOPASSWD: ALL' >>/etc/sudoers
exit

brew install \
  git \
  nmap \
  openssl \
  python \
  redis \
  zsh \
  zsh-completions \
  ssh-copy-id \
  gcc \
  npm \
  ffmpeg \
  imagemagick \
  giflossy \
;
brew tap homebrew/cask;
brew cask install \
  dropbox \
  firefox \
  google-chrome \
  java \
  vlc \
  sequel-pro \
  wire \
  microsoft-office \
  gpg-suite \
  visual-studio-code \
  whatsapp \
  signal \
  google-drive-file-stream \
  google-backup-and-sync \
  tunnelblick \
  textmate \
  adobe-creative-cloud \
  tresorit \
  freedome \
  outline-manager \
  wireshark \
  teamviewer \
  the-unarchiver \
  spotify \
  nextcloud \
  tor-browser \
  charles \
  clipgrab \
  slack \
  postman \
  veracrypt \
  keka \ 
  kekadefaultapp \
  wickrme \
  iterm2 \
  vmware-fusion \
  keepassx \ 
  quickbooks-online \
;

brew tap insyria/CaskApps;
brew cask install \
  eset-endpoint-security \
;

curl https://raw.githubusercontent.com/insyria/osx-init/master/macos.sh | sh
