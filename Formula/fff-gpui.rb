class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  license "MIT"
  version "0.1.5"
  depends_on :macos

  on_arm do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.5/fff-gpui-macos-arm64"
    sha256 "e393e5367a1c771579a4f190979a39b341e68fb5adc194a301a57d6c0822a383"
  end

  on_intel do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.5/fff-gpui-macos-universal"
    sha256 "dd8094fbbf697e3d05bea6e29c1e23bd26aa03994ebddc8f17f78f026ce606b3"
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
