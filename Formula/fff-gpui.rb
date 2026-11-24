class FffGpui < Formula
  desc "System-wide file finder for macOS built on GPUI, with Zed integration"
  homepage "https://github.com/th0jensen/fff-gpui"
  license "MIT"
  version "0.2.0"
  depends_on :macos

  on_arm do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.2.0/fff-gpui-macos-arm64"
    sha256 "9b39ac3ef87f608397d5c6a3a2a0e3a80175bfb3bb3fecb7176fc39313c2311d"
  end

  on_intel do
    url "https://github.com/th0jensen/fff-gpui/releases/download/v0.2.0/fff-gpui-macos-universal"
    sha256 "0979c4976bdce60e086a4e1e817829d14f8915f5022adc078b24c611b7dee0e1"
  end

  def install
    bin.install Dir["fff-gpui*"].first => "fff-gpui"
  end

  def caveats
    <<~EOS
      To start fff-gpui at login and whenever something connects to its socket:
        fff-gpui daemon install
    EOS
  end

  test do
    assert_predicate bin/"fff-gpui", :exist?
  end
end
