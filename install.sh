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
;
brew tap caskroom/cask;
brew cask install \
  dropbox \
  firefox \
  google-chrome \
  java \
  vlc \
;
