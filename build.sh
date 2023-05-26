#!/bin/bash -e

script_path=$(cd $(dirname ${0}); pwd)
cp -r ${script_path}/fastlane ./
cp ${script_path}/Gemfile ./

bundle add fastlane --version ${FASTLANE_VERSION}

if [[ $BROWSERSTACK_UPLOAD = true || $BUILD_PODS = true ]]; then
  bundle add cocoapods
fi

bundle install

# If the variable FASTLANE_ENV is set then run fastlane with the --env equal to the variable.
if [ -n "${FASTLANE_ENV}" ]; then
    echo "Running fastlane with environment: ${FASTLANE_ENV}"
    fastlane --env ${FASTLANE_ENV} build
else
    echo "Running fastlane"
    fastlane build
fi
