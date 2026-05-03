class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.2/fff-gpui"
  sha256 "d4952e56cefb4e0b9760cb3e89be12d65f8db78f574a487b25ec6024752524b6"
  license "MIT"
  version "0.1.2"

  depends_on :macos

  def install
    bin.install "fff-gpui"
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
