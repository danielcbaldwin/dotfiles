###############################################################################
# imports
###############################################################################
tap 'homebrew/bundle'
tap 'homebrew/cask'
tap 'homebrew/core'
tap 'homebrew/command-not-found'
tap 'warrensbox/tap'
tap 'hashicorp/tap'

###############################################################################
# basics
###############################################################################
brew 'vim'
brew 'tmux'
brew 'git'

###############################################################################
# fonts
###############################################################################
tap 'homebrew/cask-fonts'
cask 'font-menlo-for-powerline'

###############################################################################
# dotfiles support
###############################################################################
brew 'stow'

###############################################################################
# hashicorp support
###############################################################################
%w[vault consul nomad terraform].each do |tool|
  brew "hashicorp/tap/#{tool}"
end
brew 'tfswitch'

###############################################################################
# golang support
###############################################################################
brew 'go'

###############################################################################
# python support
###############################################################################
brew 'python'
brew 'pyenv-virtualenv'
brew 'pyenv-virtualenvwrapper'

###############################################################################
# ruby support
###############################################################################
brew 'rbenv'
brew 'rbenv-gemset'
brew 'ruby-build'

###############################################################################
# nodejs support
###############################################################################
brew 'nodenv'
brew 'node-build'

###############################################################################
# aws support
###############################################################################
brew 'awscli'

###############################################################################
# docker support
###############################################################################
cask 'docker'

###############################################################################
# utilities
###############################################################################
brew 'tree'
brew 'wget'
brew 'cmake'
brew 'go'
brew 'shfmt'
brew 'nmap'
brew 'ripgrep'
brew 'inetutils'
brew 'jq'
brew 'mas'

###############################################################################
# apps
###############################################################################
cask '1password'
cask 'caffeine'
cask 'discord'
cask 'google-backup-and-sync'
cask 'google-chrome'
cask 'slack'
cask 'tableplus'
cask 'the-unarchiver'
cask 'transmit'
cask 'visual-studio-code'
cask 'vlc'
cask 'whatsapp'

###############################################################################
# tap tools
###############################################################################
cask 'tunnelblick'

# Raynor config
brew 'libmaxminddb'
brew 'geoipupdate'
brew 'postgresql'
brew 'v8@3.15'
#brew 'mysql'
brew 'mysql-client'
brew 'mcrypt'
brew 'pbzip2'
brew 'wget'
#brewset = ENV['BREWSET'] || 'minimal'
#cask 'virtualbox' unless brewset.to_sym.eql?(:minimal)
#cask 'virtualbox-extension-pack' unless brewset.to_sym.eql?(:minimal)
#cask 'vagrant' unless brewset.to_sym.eql?(:minimal)
#cask 'vagrant-manager' unless brewset.to_sym.eql?(:minimal)
#cask 'vagrant-vmware-utility' unless brewset.to_sym.eql?(:minimal)
#brew 'vagrant-completion' unless brewset.to_sym.eql?(:minimal)
