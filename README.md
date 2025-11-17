# mrk2 — macOS application & package installation

**Phase 2** of macOS setup. Installs Homebrew packages, casks, and Mac App Store applications.

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
- **CLI tools** from the Brewfile (ripgrep, shellcheck, languages, etc.) — installed automatically
- **Applications** via Homebrew Casks (browsers, editors, utilities, etc.) — **interactive selection**
- **Mac App Store apps** via `mas` (Final Cut Pro, Logic Pro, etc.) — **interactive selection**

> **Note:** Casks and Mac App Store apps are presented interactively for selection. Press ENTER (defaults to "No") or type "n" to skip, or type "y" to install. CLI tools (formulae) are installed automatically without prompts.

---

## Prerequisites

- macOS (tested on macOS 14+)
- Xcode Command Line Tools (installed by mrk1)
- Internet connection for downloading packages

---

## Common make targets

```text
make fix-exec     # ensure scripts/* are executable
make install      # full installation (Homebrew → packages → apps)
make status       # check installation status
make update       # update all installed packages
make doctor       # run Homebrew doctor
```

### Installer Options

```bash
# Preview changes without applying
./scripts/install --dry-run

# Skip Mac App Store apps (no interactive prompts)
./scripts/install --no-mas

# Skip Homebrew casks (no interactive prompts)
./scripts/install --no-casks

# Only install Homebrew packages (no casks, no MAS, fully automated)
./scripts/install --only-formulae

# See all options
./scripts/install --help
```

**Interactive Mode:** By default, the installer will prompt you for each Cask and Mac App Store app. Press ENTER or type "n" to skip (default), or type "y" to install. CLI tools (formulae) are always installed automatically.

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
Brewfile          # Homebrew packages, casks, and MAS apps
scripts/
  install         # main installer
  status          # check installation status
Makefile
README.md
```

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

