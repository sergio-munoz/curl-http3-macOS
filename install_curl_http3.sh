#!/bin/bash

# Fork with the patch applied
git clone https://github.com/cujof/homebrew-cloudflare
cd homebrew-cloudflare
brew install --HEAD -s curl.rb

# Use homebrew curl instead of the default one:
echo 'export PATH="/opt/homebrew/opt/curl/bin:$PATH"' >> ~/.zshrc

# Export flags for compilers
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

# Manually patch the curl.rb file
#curl https://patch-diff.githubusercontent.com/raw/cloudflare/homebrew-cloudflare/pull/51.patch > curl.rb.patch
#patch curl.rb -i curl.rb.patch
