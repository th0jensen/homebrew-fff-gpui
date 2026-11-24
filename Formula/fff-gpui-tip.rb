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

  def caveats
    <<~EOS
      To start fff-gpui at login and whenever something connects to its socket:
        fff-gpui-tip daemon install
    EOS
  end

  test do
    assert_path_exists bin/"fff-gpui-tip"
  end
end
