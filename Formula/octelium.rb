class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.44.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.44.0/octelium-darwin-amd64.tar.gz"
      sha256 "f3931d7fb5fecaea69fb5ad58b59bcc98a82dc1f1b10efbe2d47af8e9b17ef62"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.44.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "17c0b7df155ce8e77c6582e378c2676790c1278559258e475e3aa8c3e34234fd"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.44.0/octops-darwin-amd64.tar.gz"
        sha256 "224b43f1ceb74ab39ed862a1ce7a340798ac066dbf672754630d469c8a14c623"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.44.0/octelium-darwin-arm64.tar.gz"
      sha256 "c3a5def72c0120aa2fd1c272a9e5793f025b1b320f01f09b71f7869bdee09abe"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.44.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "25c4d3e943e07e031093b3f482945bb8d4ecd89f0c2a6961b9110902f0730606"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.44.0/octops-darwin-arm64.tar.gz"
        sha256 "6e642d12f382a1b52cbc261ec79588bb21b94934c5153402bb8c8f4a85e08c04"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.44.0/octelium-linux-amd64.tar.gz"
      sha256 "19543a596a3fd5204357470152a4bc6b054fcab0243ae7048982de3925b1e13c"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.44.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "bdef31081be2f803de75632e94d491a26ae99d680d87d35674d1794eeae25ef1"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.44.0/octops-linux-amd64.tar.gz"
        sha256 "5575def73aa0e8e978eef7fe29c876d841104965f6ac332a79a2069e9d065a92"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.44.0/octelium-linux-arm64.tar.gz"
      sha256 "8a56d4ba68c3e10700766d162a2bf95fc0658d29a1bd34278a43d80416689e60"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.44.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "6c8f7afe080e947ded82b10b192bcb7e387074039bf2b59b4aa665b78809e4e3"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.44.0/octops-linux-arm64.tar.gz"
        sha256 "2c1c5d6e79186d48133ec587daaec608fa2cbe2c6e1f73e8ec93286adf7be158"
      end
    end
  end

  def install
    bin.install "octelium"
    resource("octeliumctl").stage { bin.install "octeliumctl" }
    resource("octops").stage { bin.install "octops" }

    generate_completions_from_executable(bin/"octelium", "completion")
    generate_completions_from_executable(bin/"octeliumctl", "completion")
    generate_completions_from_executable(bin/"octops", "completion")
  end

  test do
    system "#{bin}/octelium", "version"
    system "#{bin}/octeliumctl", "version"
    system "#{bin}/octops", "version"
  end
end