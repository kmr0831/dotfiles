#!/bin/bash

set -eufo pipefail

# Mouse
# defaults write -g com.apple.mouse.scaling 3

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write -g com.apple.mouse.tapBehavior -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write -g com.apple.trackpad.scaling 3

# defaults write -g InitialKeyRepeat -int 15
# defaults write -g KeyRepeat -int 2

# Finder
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
# defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
# defaults write com.apple.finder _FXSortFoldersFirst -bool true
# defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock mru-spaces -bool false

# Finder と Dock を再起動する
killall Finder
killall Dock

# Spotlight 検索を表示を無効化
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>49</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>"

# .DS_Store を作らない
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ScrollBar
# defaults write -g AppleShowScrollBars -string "Always"
# defaults write -g AppleScrollerPagingBehavior -bool true

defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g AppleSpacesSwitchOnActivate -bool false

# バッテリーを % 表示
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM H:mm:ss"
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# chflags nohidden ~/Library
# chflags nohidden /Volumes
