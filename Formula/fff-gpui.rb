class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.2/fff-gpui"
  sha256 "e6ad118faf416d3288d36009a8d9441fe2de1867a96ad39c74316ea0644aa5c8"
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
