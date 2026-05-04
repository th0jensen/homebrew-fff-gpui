class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.3/fff-gpui"
  sha256 "aec6b19a08b2a12f206fd63014ffba868af5b28ebf8ab2a1ed5b05cb984c2fc1"
  license "MIT"
  version "0.1.3"

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
