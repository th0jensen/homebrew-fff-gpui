class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.4/fff-gpui"
  sha256 "896e2b3f6b70b38edadb8019b70eb8209a410c016da5a68d6edf800a6aada8a0"
  license "MIT"
  version "0.1.4"

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
