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
- **CLI tools** (formulae) from the Brewfile (ripgrep, shellcheck, languages, etc.) — **interactive prompts**
- **Applications** via Homebrew Casks (browsers, editors, utilities, etc.) — **interactive prompts**

> **Note:** All packages (formulae and casks) are presented one at a time with simple yes/no prompts. Items already installed are marked and will be skipped during installation even if selected.

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
- Items already installed are marked with "(already installed)" and will be skipped during installation even if you select them

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
Brewfile          # Homebrew packages and casks
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

