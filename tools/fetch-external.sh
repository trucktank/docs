#!/bin/bash
# This script pulls in external documentation that should be edited in the corresponding upstream repo

# get latest CLI docs
cd pages/reference/ && {
  curl -O -L https://github.com/balena-io/balena-cli/raw/master/doc/cli.markdown
  mv cli.markdown balena-cli.md
  cd -
}

# get latest node SDK docs
cd pages/reference/sdk/ && {
  curl -O -L https://github.com/balena-io/balena-sdk/raw/master/DOCUMENTATION.md
  echo "# Balena Node.js SDK" >node-sdk.md
  tail -n +2 DOCUMENTATION.md >>node-sdk.md
  cd -
}

# get latest python SDK docs
cd pages/reference/sdk/ && {
  curl -O -L https://github.com/balena-io/balena-sdk-python/raw/master/DOCUMENTATION.md
  mv DOCUMENTATION.md python-sdk.md
  cd -
}

# get latest supervisor API docs
cd pages/reference/supervisor/ && {
  curl -O -L https://github.com/balena-io/balena-supervisor/raw/master/docs/API.md
  mv API.md supervisor-api.md
  cd -
}

# get latest diagnostics docs
cd pages/reference/ && {
  curl -O -L https://github.com/balena-io/device-diagnostics/raw/master/diagnostics.md
  cd -
}

# get latest supervisor update-lock docs
cd pages/learn/deploy/release-strategy/ && {
  curl -O -L https://github.com/balena-io/balena-supervisor/raw/master/docs/update-locking.md
  cd -
}

# Masterclasses
cd pages/learn/more/masterclasses/ && {
  curl -O -L https://raw.githubusercontent.com/balena-io-projects/balena-cli-masterclass/master/README.md
  mv README.md cli-masterclass.md
  curl -O -L https://raw.githubusercontent.com/balena-io-projects/balena-cli-advanced-masterclass/master/README.md
  mv README.md advanced-cli.md
  curl -O -L https://raw.githubusercontent.com/balena-io-projects/balenaos-masterclass/master/README.md
  mv README.md host-os-masterclass.md
  curl -O -L https://raw.githubusercontent.com/balena-io-projects/services-masterclass/master/README.md
  mv README.md services-masterclass.md
  curl -O -L https://raw.githubusercontent.com/balena-io-projects/balena-fleet-management-masterclass/format-for-external-docs/README.md
  mv README.md fleet-management-masterclass.md
  cd -
}
