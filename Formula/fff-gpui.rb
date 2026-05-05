class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  license "MIT"
  version "0.1.5"
  depends_on :macos

  on_arm do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.5/fff-gpui-macos-arm64"
    sha256 "0278c284c9e99fe2caf1943e4fe6f77316776e6f52cbf4526d220157d74a9cd3"
  end

  on_intel do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.5/fff-gpui-macos-universal"
    sha256 "56ad85e9ac5215f772fe68dc248c1e3d1ee5e17d9e7c5ba818c201986eb9f86f"
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
