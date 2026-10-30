class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  license "MIT"
  version "0.1.7"
  depends_on :macos

  on_arm do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.7/fff-gpui-macos-arm64"
    sha256 "dd083b4e7986e6745a6fd59ca5d98ddbc864de1ea2d30929c4f1fa3d56e7ec28"
  end

  on_intel do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.1.7/fff-gpui-macos-universal"
    sha256 "15f7395b41aec7541f1fd75dbe032ee1f033164a76815d0c6889261f5ec259ba"
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
