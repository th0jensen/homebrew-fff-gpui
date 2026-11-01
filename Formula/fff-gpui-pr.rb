class FffGpuiPr < Formula
  desc "System-wide file finder for macOS built on GPUI (PR channel, built from source)"
  homepage "https://github.com/th0jensen/fff-gpui"
  license "MIT"
  head "https://github.com/th0jensen/fff-gpui.git", branch: "master"
  depends_on "rust" => :build
  depends_on "zig@0.16" => :build
  depends_on :macos

  def install
    pr_number = ENV["FFF_GPUI_PR"] || ENV["HOMEBREW_FFF_GPUI_PR"]
    odie "Set HOMEBREW_FFF_GPUI_PR to a PR number, e.g. HOMEBREW_FFF_GPUI_PR=123" if pr_number.blank?

    system "git", "fetch", "origin", "refs/pull/#{pr_number}/head:pr-#{pr_number}"
    system "git", "checkout", "pr-#{pr_number}"
    system "cargo", "install", *std_cargo_args
    mv bin/"fff-gpui", bin/"fff-gpui-pr"
  end

  service do
    run [opt_bin/"fff-gpui-pr"]
    keep_alive true
    run_at_load true
    log_path "#{Dir.home}/Library/Logs/fff-gpui-pr/fff-gpui-pr.log"
    error_log_path "#{Dir.home}/Library/Logs/fff-gpui-pr/fff-gpui-pr.log"
  end

  test do
    assert_path_exists bin/"fff-gpui-pr"
  end
end
