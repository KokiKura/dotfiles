## Setup

### 1. Install chezmoi

**curl**

```sh
sh -c "$(curl -fsLS get.chezmoi.io)"
```

**Homebrew**

```sh
brew install chezmoi
```

### 2. Apply dotfiles

```sh
chezmoi init --apply <repository-url>
```
