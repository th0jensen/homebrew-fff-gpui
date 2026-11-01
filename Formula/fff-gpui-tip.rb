class FffGpuiTip < Formula
  desc "System-wide file finder for macOS built on GPUI (tip channel, built from source)"
  homepage "https://github.com/th0jensen/fff-gpui"
  license "MIT"
  head "https://github.com/th0jensen/fff-gpui.git", branch: "master"
  depends_on "rust" => :build
  depends_on "zig@0.16" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
    mv bin/"fff-gpui", bin/"fff-gpui-tip"
  end

  service do
    run [opt_bin/"fff-gpui-tip"]
    keep_alive true
    run_at_load true
    log_path "#{Dir.home}/Library/Logs/fff-gpui-tip/fff-gpui-tip.log"
    error_log_path "#{Dir.home}/Library/Logs/fff-gpui-tip/fff-gpui-tip.log"
  end

  test do
    assert_path_exists bin/"fff-gpui-tip"
  end
end
