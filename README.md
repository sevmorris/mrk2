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

> **Note:** CLI tools (formulae) are installed automatically without prompts. Casks and Mac App Store apps are presented in an interactive multi-column selection form where you can choose which items to install.

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

**Interactive Selection Form:** Casks and Mac App Store apps are displayed in a multi-column selection interface (4 columns × 20 rows, showing 80 items at once). Use the following controls:

- **↑/↓ Arrow Keys** — Navigate up/down within the current column
- **←/→ Arrow Keys** — Navigate left/right between columns (same row)
- **Space** — Toggle selection for the current item
- **Enter** — Finish selection and proceed with installation
- **a** — Select all items
- **n** — Deselect all items
- **q** — Quit (deselects all and exits)

Items show `[ ]` when unselected and `[√]` when selected. Items already installed are marked with "(installed)" and will be skipped during installation even if selected.

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

