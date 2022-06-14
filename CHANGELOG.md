# Change Log

## [2.0.0] - 2022-10-06
  
Redesign of the Fastlane build and certificate handling.

### Breaking

  - This version uses `Match` so you cannot use base64 version of the certificates, instead you need to have a GitHub repo that match will use to store the certificates and an Apple app key. Follow the README to see the new parameters list.
