# FK Share

High-speed offline peer-to-peer file sharing for Android over Wi-Fi Direct/local Wi-Fi.

## GitHub-ready

This project is already arranged as a normal Android/Gradle repository. **Do not upload the ZIP file itself as the repository source.**
Upload/push the contents of this folder so that `build.gradle.kts`, `settings.gradle.kts`, `app/`, and `gradle/` are at the repository root.

Recommended:
1. Create an empty GitHub repository.
2. Open this folder in GitHub Desktop, Android Studio, or a terminal.
3. Commit all files.
4. Push to GitHub.

The included GitHub Actions workflow also runs a debug build on pushes and pull requests.

## Build locally

**Prerequisites:** Android Studio and Android SDK Platform 36.

```bash
./gradlew :app:assembleDebug
```

On Windows:

```bat
gradlew.bat :app:assembleDebug
```

The Gradle bootstrap scripts download Gradle 9.3.1 automatically if Gradle is not already installed.

## Signing

Debug builds use the standard Android Studio/Gradle debug signing configuration.
Release builds are intentionally unsigned; configure your own private upload/release keystore for publishing.

## Secrets

`.env` is ignored by Git. If you need it, copy `.env.example` to `.env` and add your local secret values.
Never commit real API keys or keystores.

## AI Studio

Original AI Studio app:
https://ai.studio/apps/c2c4d3bb-8480-44d0-bf5f-637e04cf923f
