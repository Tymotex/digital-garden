#!/bin/sh
#
# Pushing to production is a matter of copying over only the desired public
# wiki files, then pushing it to production. Deploying is taken care of by a
# GitHub Action to GitHub Pages.
# 
# You should get a Cron job to run this script weekly or similar.
# 
# We can't have the Git repo existing in the same directory as the actual
# source of truth wiki files because it's complicated:
# - I have private and public files in my wiki. I only want to deploy and make
#   accessible the files that I'm comfortable being public.

set -e

show_help() {
  echo "Usage: $0 <wiki_directory> <git_repo>"
  echo
  echo "This script processes a directory of wiki files and syncs them to a Git repository."
  echo
  echo "Arguments:"
  echo "  <wiki_directory>  Path to the directory containing the wiki files."
  echo "  <git_repo>        Path to the Git repository for the wiki."
  echo
  echo "Example:"
  echo "  $0 /home/tym/Wiki/content /home/tym/Projects/digital-garden/content"
}

# Check if arguments 1 and 2 are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Two directory paths must be provided."
  echo "Usage: $0 <directory1> <directory2>"
  show_help
  exit 1
fi

# Check if the arguments are valid directory paths
if [ ! -d "$1" ]; then
  echo "Error: '$1' is not a valid directory."
  show_help
  exit 1
fi

if [ ! -d "$2" ]; then
  echo "Error: '$2' is not a valid directory."
  show_help
  exit 1
fi

# Directory of the wiki files.
WIKI_DIR=$1

# Directory of the Git repo that should be pushed to.
DEPLOY_DIR=$2

# Copy over wiki files.
rsync -av --delete "${WIKI_DIR}/Knowledge" "${DEPLOY_DIR}"

# Copy over index file.
cp -r "${WIKI_DIR}/_index.md" "${DEPLOY_DIR}"

# Push to production.
cd "$DEPLOY_DIR"
git add .
git commit -m "Publish at $(date +"%Y-%m-%d %H:%M:%S")."
git push   # Then the GitHub Action at .github/workflows/deploy.yml will deploy to 
           # GitHub Pages.

