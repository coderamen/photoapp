# README

This README documents the steps to get the application up and running.

## Getting started

1. Install the dependencies by running `bundle install`.
2. Set up the database by running `rails db:setup`.
3. Start the application server using `rails server`.

## Offline installation

If your environment does not allow outbound internet traffic, you can rely on a
pre-bundled cache of gems:

1. On a machine with internet access, run `bundle package --all` to populate a
   `vendor/cache` directory containing the required `.gem` files.
2. Copy that `vendor/cache` directory into this project (overwriting the empty
   one if present).
3. Run `bin/offline-bundle` to install the gems locally from the cache. The
   command installs into `vendor/bundle` and avoids any network requests.

# photoapp
