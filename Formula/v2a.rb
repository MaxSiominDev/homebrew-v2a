# typed: false
# frozen_string_literal: true

class V2a < Formula
  desc "Extract and compress audio from media files"
  homepage "https://github.com/MaxSiominDev/v2a"
  version "0.2.0"
  license "MIT"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on arch: :arm64
  depends_on macos: :tahoe

  url "https://github.com/MaxSiominDev/v2a/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ccf5bf704e17c877d9075e19676d4f3570179e5d8ee3261549caf36fe81b67d2"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/MaxSiominDev/v2a/internal/buildinfo.Version=#{version}"), "./cmd/v2a"
  end

  test do
    system "#{bin}/v2a", "version"
  end
end
