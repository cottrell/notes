#!/bin/bash

# Exit on any error
set -e

# Step 1: Ensure Ruby and dependencies are installed
echo "Updating package list and checking Ruby..."
sudo apt update
sudo apt install -y ruby ruby-dev build-essential

# Step 2: Verify Ruby version
echo "Ruby version:"
ruby --version

# Step 3: Set up GEM_HOME to ~/gems and update PATH
echo "Configuring GEM_HOME to ~/gems..."
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$GEM_HOME/bin:$PATH"' >> ~/.bashrc

# Apply changes to current session
echo "Sourcing ~/.bashrc to apply GEM_HOME and PATH..."
source ~/.bashrc

# Step 4: Verify GEM_HOME is set
echo "Verifying GEM_HOME:"
echo $GEM_HOME

# Step 5: Install Bundler
echo "Installing Bundler..."
gem install bundler

# Step 6: Verify Bundler installation
echo "Bundler version:"
bundle --version

# Step 7: Install gems from Gemfile
echo "Installing gems using Bundler..."
bundle install

# Step 8: Verify Jekyll installation
echo "Jekyll version:"
bundle exec jekyll --version

echo "Installation complete! Bundler and Jekyll are ready to use."
