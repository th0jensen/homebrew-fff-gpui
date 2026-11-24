# Testing channels

## Stable

```sh
brew install fff-gpui
fff-gpui daemon install
```

## Tip (latest master, built from source)

```sh
brew install --HEAD th0jensen/fff-gpui/fff-gpui-tip
fff-gpui-tip daemon install
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

Tip and PR binaries are named `fff-gpui-tip` / `fff-gpui-pr`, but every channel
uses the same socket and LaunchAgent, so only one daemon can run at a time.
`daemon install` from one channel replaces the LaunchAgent of another. To go back
to stable:

```sh
fff-gpui daemon install
```
