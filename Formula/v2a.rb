# typed: false
# frozen_string_literal: true

class V2a < Formula
  desc "Extract and compress audio from media files"
  homepage "https://github.com/MaxSiominDev/v2a"
  version "0.1.1"
  license "MIT"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on arch: :arm64
  depends_on macos: :tahoe

  url "https://github.com/MaxSiominDev/v2a/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "69f4201e655bcd2806bc393f442f53cd3da94817a0a7d5eb90b4988c365c4689"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/MaxSiominDev/v2a/internal/buildinfo.Version=#{version}"), "./cmd/v2a"
  end

  test do
    system "#{bin}/v2a", "version"
  end
end
