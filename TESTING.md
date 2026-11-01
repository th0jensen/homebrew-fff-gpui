# Testing channels

## Stable

```sh
brew install fff-gpui
brew services start fff-gpui
```

## Tip (latest master, built from source)

```sh
brew install --HEAD th0jensen/fff-gpui/fff-gpui-tip
brew services start fff-gpui-tip
```

Rebuild:

```sh
brew reinstall --HEAD th0jensen/fff-gpui/fff-gpui-tip
```

## Pull request (built from source)

```sh
HOMEBREW_FFF_GPUI_PR=123 brew install --HEAD th0jensen/fff-gpui/fff-gpui-pr
```

Rebuild a different PR:

```sh
HOMEBREW_FFF_GPUI_PR=456 brew reinstall --HEAD th0jensen/fff-gpui/fff-gpui-pr
```

Tip and PR binaries are named `fff-gpui-tip` / `fff-gpui-pr` and use separate
services/log paths, so they can run alongside the stable daemon. Stop the stable
daemon first if you want to avoid port or socket conflicts:

```sh
brew services stop fff-gpui
```
