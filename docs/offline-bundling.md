# Offline bundling

Some environments block outbound HTTPS requests, which prevents `bundle install`
from fetching gems from rubygems.org. Use the cached workflow below to install
dependencies without network access.

## Preparing the cache on a machine with internet
1. Run `bundle package --all` to populate `vendor/cache` with the required `.gem`
   files.
2. Commit or copy the resulting `vendor/cache` directory into your target
   environment. The repository includes a `.keep` placeholder so the directory
   exists even when no cache has been added.

## Installing from the cache in a restricted environment
1. Ensure `vendor/cache` contains the `.gem` files produced above. If the
   directory only contains the `.keep` placeholder, fetch the cache from a
   machine with internet access first.
2. Run `bin/offline-bundle` from the project root. The script installs
   dependencies into `vendor/bundle` using the cached gems and will abort with
   a clear message if the cache is missing.

## Notes on Nokogiri and Ruby 3
Nokogiri 1.7.x does not build on Ruby 3.0 because of native extension
incompatibilities. The Gemfile pins Nokogiri to a Ruby-3-compatible version
(`~> 1.15`). If you have an older `Gemfile.lock` lying around, regenerate it
with the pinned version or run `bundle clean --force` before reinstalling.
