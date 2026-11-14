class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.51.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.51.0/octelium-darwin-amd64.tar.gz"
      sha256 "337f864539f97b2d6f89868e6e9e41d266310a694f89da72964ae27d4b9621a8"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.51.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "0f1230bc49bc2a0b4c73d3aadf587d3567a07abb8c8b6a1d65475f7cb8f38ccd"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.51.0/octops-darwin-amd64.tar.gz"
        sha256 "d93fefd4ddbc2eeeab215a3bba9bc37818b6a82129cf3009300d8d05f4db6384"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.51.0/octelium-darwin-arm64.tar.gz"
      sha256 "2a1a476b596e51af05248b4cee8401f93abe0907da37e7b3f7bd3060b2c85c0c"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.51.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "191bdfe2cab9ab0ea4a2372e53d986cb814153361286e4a4858a1f5b66d3c447"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.51.0/octops-darwin-arm64.tar.gz"
        sha256 "23dbf82a0d81b4f81f76c3504049d0d018d8d700beb639a65e9d14c97cca640b"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.51.0/octelium-linux-amd64.tar.gz"
      sha256 "ed92147f3af25d2f5f5238bd20abd0414b771e887951ef628f95bd658fc8931d"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.51.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "169c499d6ee5478c1f3699c5405b15155aa0eb389063846c22b505eb20eba57e"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.51.0/octops-linux-amd64.tar.gz"
        sha256 "dc012821a00d8b18ddc1098178d98c259e41ad871b4701cb9a578479ae5edb5e"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.51.0/octelium-linux-arm64.tar.gz"
      sha256 "629c77d04c2a488f346ff5cffc9f93e1a67d126f6caf6faeffc569a991980d0f"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.51.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "6084b172dc51fce42175a19e51982439c494232ee5de877d5cb9e52df54e1e1f"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.51.0/octops-linux-arm64.tar.gz"
        sha256 "27d7f658261d6600fc5172ece90c2cbb484d7ee45c5955f9be6becfabebf611d"
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