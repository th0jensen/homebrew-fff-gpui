class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.0/fff-gpui"
  sha256 "c2b34367a9788ed136b619289414bd33e20912d23d5810760414e54a71c60813"
  license "MIT"
  version "0.1.0"

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
