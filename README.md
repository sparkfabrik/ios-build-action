# Build iOS App

This action builds your iOS project (`.xcodeproj`, `.xcworkspace`) and can export the resulting `.ipa` file as GitHub artifact, with optional automatic upload to BrowserStack AppLive, and optional signed production build with App Store upload.

Tested with Ionic, React Native and native ios projects.

## WARNING v2 has breaking changes and it will break your Actions!

To keep the old behavior please use the `v1` version.

`v2.0.0` uses Match to simplify and strengthen the certificates management, and can optionally upload the build to the App Store.

## Inputs

### `project-path`

**Required** .xcodeproj path.

### `workspace-path`

.xcworkspace path. Default `""`.

### `export-method`

Choose app-store, `"ad-hoc"`, `"package"` `"enterprise"`, `"development"`, or `"developer-id"`. Default `"app-store"`.

### `configuration`

For example, `"Debug"`, `"Release"`. Default `"Release"`.

### `scheme`

For example, `MyScheme`.

### `output-path`

Output path of ipa. Default `"output.ipa"`.

### `team-id`

**Required** Team id.

### `team-name`

**Required** Team name.

### `build-pods`

Run the `pod install` command during the build (boolean)

### `pods-path`

The path to the Podfile. Default `"Podfile"`

### `upload-to-testflight`

Upload the build to the App Store (boolean)

### `increment-build-number`

Automatically increment the latest build number from TestFlight by one (boolean)

### `apple-key-id`

The Apple Key ID

### `apple-key-issuer-id`

The Apple Key Issuer ID

### `apple-key-content`

The Apple Key content

### `match-git-url`

The GitHub repo URL for storing Match certificates.
See https://docs.fastlane.tools/actions/match/

### `match-git-basic-authorization`

base64 key to the repo.
Generate it with `echo -n your_github_username:your_personal_access_token | base64`

### `match-password`

The password to decrypt the certificates.

### `match-build-type`

The Match build type (eg. "development")

### `browserstack-upload`

Set this to true to upload the resulting .ipa file to Browserstack App Live right after the build (https://www.browserstack.com/docs/app-live/integrations/fastlane)

Defaut to false.

### `browserstack-username`

Browserstack username (**required if** browserstack-upload == true)

### `browserstack-access-key`

Browserstack access key (**required if** browserstack-upload == true)

### `fastlane-version`

Fastlane version to be used. Default `"2.213.0"`.

### `fastlane-env`

Name of the env file name to pass to `fastlane --env`

### `ios-app-id`

The iOS application identifier; useful to sync a specific provisioning profile

## Contributions Welcome!

If you have any other inputs you'd like to add, feel free to create PR.

**NOTE:** Remember to run `yarn install` and `yarn bundle` if you make changes to the `index.js`.

## Example usage with a production build uploaded to App Store

```yaml
- uses: sparkfabrik/ios-build-action@v2.3.0
  with:
    upload-to-testflight: true
    increment-build-number: true
    build-pods: true
    pods-path: "ios/Podfile"
    configuration: Release
    export-method: app-store
    workspace-path: ${{ secrets.WORKSPACE_PATH }}
    project-path: ${{ secrets.PROJECT_PATH }}
    scheme: MyScheme
    output-path: build-${{ github.sha }}.ipa
    apple-key-id: ${{ secrets.APPLE_KEY_ID }}
    apple-key-issuer-id: ${{ secrets.APPLE_KEY_ISSUER_ID }}
    apple-key-content: ${{ secrets.APPLE_KEY_CONTENT }}
    team-id: ${{ secrets.TEAM_ID }}
    team-name: ${{ secrets.TEAM_NAME }}
    match-password: ${{ secrets.MATCH_PASSWORD }}
    match-git-url: ${{ secrets.MATCH_GIT_URL }}
    match-git-basic-authorization: ${{ secrets.MATCH_GIT_BASIC_AUTHORIZATION }}
    match-build-type: "appstore"
    browserstack-upload: true
    browserstack-username: ${{ secrets.BROWSERSTACK_USERNAME }}
    browserstack-access-key: ${{ secrets.BROWSERSTACK_ACCESS_KEY }}
    fastlane-env: stage
    ios-app-id: com.identifier.my_app
```
