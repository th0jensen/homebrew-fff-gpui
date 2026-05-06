class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  license "MIT"
  version "0.1.6"
  depends_on :macos

  on_arm do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.6/fff-gpui-macos-arm64"
    sha256 "6be1fa2d7d2761eac369abbada9c8c1d6d2e31f5ce18b6c0d8c95556d128be4a"
  end

  on_intel do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.6/fff-gpui-macos-universal"
    sha256 "5eda310d7264054bc83ff3468880b1cf78a7ab932e5bf5e8b8d4dde2970a3e4d"
  end

  def install
    bin.install Dir["fff-gpui*"].first => "fff-gpui"
  end

  service do
    run [opt_bin/"fff-gpui"]
    keep_alive true
    run_at_load true
    log_path "#{ENV["HOME"]}/Library/Logs/fff-gpui/fff-gpui.log"
    error_log_path "#{ENV["HOME"]}/Library/Logs/fff-gpui/fff-gpui.log"
  end

  test do
    assert_predicate bin/"fff-gpui", :exist?
  end
end
