# mrk2 — macOS application & package installation

**Phase 2** of macOS setup. Installs Homebrew packages and casks (GUI applications).

This project assumes you've already run [mrk1](https://github.com/sevmorris/mrk1) to set up your shell, dotfiles, and basic system defaults.

---

## Quick start

```bash
git clone https://github.com/sevmorris/mrk2.git ~/mrk2
cd ~/mrk2
make fix-exec && make install
```

> `make fix-exec` ensures all scripts are executable before install.  
> You can also run `./scripts/install` directly.

---

## What it installs

- **Homebrew** (if not already installed)
- **CLI tools** (formulae) from the Brewfile — **interactive prompts**
  - Shell utilities (bat, lsd, ripgrep, etc.)
  - Dev tools (git, gh, shellcheck, shfmt)
  - Languages/runtimes (Python 3.12, nvm, OpenJDK, pipx, pyenv)
  - Media tools (ffmpeg, chromaprint, whisper-cpp, yt-dlp)
- **Applications** via Homebrew Casks (browsers, editors, utilities, etc.) — **interactive prompts**
- **Post-install** configuration for installed apps:
  - Login items for menu bar utilities (Ice, Stats, Raycast, etc.)
  - Topgrade config symlinked to `~/.config/topgrade.toml`
  - Browser preferences: Safari/Helium defaults, Chrome/Brave managed policies, optional extension URL opening
  - Application preferences: Audio Hijack, Fission, AlDente, Rogue Amoeba update settings
  - Full plist imports for BetterSnapTool, Ice, and iTerm2 (only on first setup — won't overwrite existing prefs)

> **Note:** All packages (formulae and casks) are presented one at a time with simple yes/no prompts. Items already installed are automatically skipped (no prompt shown).

> **Auto-updating casks:** Casks that handle their own updates (browsers, Slack, Discord, etc.) are marked `greedy: true` in the Brewfile so `brew upgrade --greedy` will still check them for updates through Homebrew.

> **Mac App Store:** MAS app entries are present in the Brewfile but commented out. The `mas` CLI is unreliable and these apps are best installed manually from the App Store.

---

## Prerequisites

- macOS (tested on macOS 14+)
- Xcode Command Line Tools (installed by mrk1)
- Internet connection for downloading packages

---

## Common make targets

```text
make fix-exec     # ensure scripts/* are executable
make install      # full installation (Homebrew → packages → apps → post-install)
make post-install # re-run post-install only (login items, config linking)
make status       # check installation status
make update       # update all installed packages
make doctor       # run Homebrew doctor
```

### Installer Options

```bash
# Preview changes without applying
./scripts/install --dry-run

# Skip Homebrew casks (no interactive prompts)
./scripts/install --no-casks

# Skip Homebrew formulae (CLI tools, no prompts)
./scripts/install --no-formulae

# Only install Homebrew formulae (no casks, but still interactive)
./scripts/install --only-formulae

# See all options
./scripts/install --help
```

**Interactive Prompts:** Formulae (CLI tools) and casks (GUI apps) are presented one at a time with simple prompts. You'll see two separate sets of prompts, one for each type. For each item, you'll be asked:

```
Install <package-name>? [y/N]:
```

- **y** or **Y** — Install this item
- **n**, **N**, or **Enter** — Skip this item (default)
- Items already installed are automatically skipped (no prompt shown)

### Check Installation Status

```bash
# Check what's installed
./scripts/status
# or
make status
```

---

## Repo layout

```
assets/
  topgrade.toml           # topgrade configuration (linked by post-install)
  browsers/
    safari-defaults.sh    # Safari power-user defaults
    helium-defaults.sh    # Helium auto-update defaults
    chrome-policy.json    # Chrome managed policy
    brave-policy.json     # Brave managed policy
    *-extensions.txt.example  # extension URL list templates
  preferences/
    audio-hijack-defaults.sh  # Audio Hijack theme, editor, buffer
    fission-defaults.sh       # Fission custom format defaults
    rogue-amoeba-updates.sh   # Disable Sparkle auto-update for RA suite
    aldente-defaults.sh       # AlDente charge management settings
    BetterSnapTool.plist      # Full BetterSnapTool config (imported on first setup)
    Ice.plist                 # Full Ice menu bar config (imported on first setup)
    iTerm2.plist              # Full iTerm2 config (imported on first setup)
Brewfile                  # Homebrew packages and casks
scripts/
  install                 # main installer
  post-install            # login items, config linking, browser prefs
  status                  # check installation status
Makefile
README.md
```

> **Browser extensions:** To have post-install prompt you to open extension URLs, copy the `.example` template for your browser and remove the `.example` suffix (e.g., `cp assets/browsers/chrome-extensions.txt.example assets/browsers/chrome-extensions.txt`), then add your extension URLs. These files are gitignored since they're user-specific.

> **Managed policies:** Chrome and Brave policies will show a "Managed by your organization" indicator in browser settings. Delete `mrk2-policy.json` from the browser's `policies/managed/` directory and relaunch to remove it.

---

## Logging

Installer output goes to:

```
~/mrk2-install.log
```

---

## Contributing

- Keep scripts clear and well-commented.
- Group related packages in the Brewfile with comments.
- Test on a clean macOS installation when possible.

---

## Related Projects

- **[mrk1](https://github.com/sevmorris/mrk1)** — Phase 1: Shell, dotfiles, and system defaults

