#!/bin/bash -e

script_path=$(cd $(dirname ${0}); pwd)
cp -r ${script_path}/fastlane ./

if [[ ! -z $P12_KEY_BASE64 && ! -z $P12_CER_BASE64 ]]; then
    echo $P12_KEY_BASE64 | base64 --decode > ios-build-key.p12
    echo $P12_CER_BASE64 | base64 --decode > ios-build-key.cer
    export CERTIFICATE_SPLIT=1
else
    echo $P12_BASE64 | base64 --decode > ios-build.p12
fi
echo $MOBILEPROVISION_BASE64 | base64 --decode > ios-build.mobileprovision
fastlane export_ipa
