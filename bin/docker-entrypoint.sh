#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
echo "remove server.pid..."
rm -f /usr/src/app/tmp/pids/server.pid

# bundle install
echo "bundle install..."
bundle check || bundle install --jobs 4

# migrate database
echo "database migrating..."
bundle exec bin/rails db:migrate

# seed
echo "inserting seeds.rb..."
bundle exec bin/rails db:seed

# fin
echo "finished initializing. server starting..."

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
