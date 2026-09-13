# Pencil Pages

Pencil Pages is a free, local-first notebook for iPad. The first milestone is an installation proof: create notebooks, write with Apple Pencil, add pages, and keep notes after closing and reopening the app. PDF annotation, study tools, search, and broader Goodnotes parity are later milestones.

There are no subscriptions, ads, usage limits, or online services in this project. Notes stay in the app's private local storage. Writes are atomic; unrecognized or damaged notebook files are preserved and reported instead of being overwritten. The prototype can export an editable notebook file through the iPad share sheet. Direct Files import and restore are planned for a later milestone.

## Build from Windows

The source is Swift and the iPad app is compiled by a GitHub-hosted macOS runner. On a free GitHub account, macOS builds are free for public repositories. Do not put personal notes or Apple account credentials in this repository.

1. Put this project in a public GitHub repository.
2. In GitHub, open **Actions** and run **Build iPad app**. Pushes and pull requests also run the simulator test and build; downloadable IPA artifacts are uploaded for pushes and manual runs, not pull requests.
3. Download the `PencilPages-unsigned-ipa` artifact from a successful run.
4. On Windows, install iTunes and iCloud from Apple's website (the Microsoft Store builds may not work with Sideloadly). Enable Developer Mode on the iPad, connect it by USB, trust the PC, then use Sideloadly to sign the IPA locally with your Apple account and install it. Never add Apple credentials to GitHub Actions or this repository. Keep the same Apple account and bundle identifier for updates.

Free personal signing expires after seven days and has limits on active apps and devices. Keep Sideloadly available on the Windows PC and enable its refresh option; refresh requires the iPad and PC to be reachable by paired Wi-Fi or USB. If automatic refresh does not work, connect the iPad to the PC and refresh/reinstall before the signing period expires. The app's local note data should persist across an update using the same app identity, but export important notebooks through the share sheet before updating this prototype.

## Local development

The GitHub Actions workflow installs XcodeGen, generates `PencilPages.xcodeproj` from `project.yml`, builds and tests on the available iPad simulator, then packages an unsigned device IPA. A Mac is not required on your PC.

## Data format

Each `.pencilpages` file is a versioned JSON notebook. Page ink is stored as PencilKit drawing data encoded by the OS. This format is for this project; it does not read Goodnotes' proprietary notebook format. PDFs exported from Goodnotes can be imported in a later milestone.

See [PARITY.md](PARITY.md) for what is implemented, still needs testing, or is deferred.

## License

The original source code is licensed under the MIT License. Apple frameworks and GitHub-hosted build infrastructure remain subject to their own terms.
