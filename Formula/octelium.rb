class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.39.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.39.0/octelium-darwin-amd64.tar.gz"
      sha256 "e7fa946ffda22936e821c886e8fbc47d70660dd5cbff207bfc8f36791f675de3"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.39.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "54beb9749e2f904f89ecfeee2f75951f0f6ba5feab5fb8ecf08fdcf50363f6a9"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.39.0/octops-darwin-amd64.tar.gz"
        sha256 "8fd03406fb40e2908671c7ccd98cb21865d22240e0ae9763de2f48bf1d0b140c"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.39.0/octelium-darwin-arm64.tar.gz"
      sha256 "a5a49d88a64aa833df7f085d676cbf4d3fc9fe53587e606819860aa95cc14f02"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.39.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "aa4940f17cf79b9c965dce1cd801c8a8bd81f830dc4f0f178cadc2016dc7b4f8"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.39.0/octops-darwin-arm64.tar.gz"
        sha256 "64e43aef38922a1e69bf7be078c68b60dfa092dae520f782fb3c4f827434a40c"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.39.0/octelium-linux-amd64.tar.gz"
      sha256 "1731db477f0ecbd3eeba0e5fb9df1fab1afc7fbf1aefafd06fd66a37dd5bbb4c"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.39.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "1a00ccc83598cd56056e053258a2a61d8b9ca9696632aa3e204a6f4bdb14b319"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.39.0/octops-linux-amd64.tar.gz"
        sha256 "efd1a1bd77d2d3d18404cbf3739ac978fdb817485b30c2ee44716b802f022734"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.39.0/octelium-linux-arm64.tar.gz"
      sha256 "565cd5df9cd1e14a8c1ad0c7849521c6dc8ba12cbe8b14cc6395be062a22fa4d"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.39.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "2704b4719d20a286b45ee42d0aa60e21dd47a84c58ab5f43090d5653a4a5870a"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.39.0/octops-linux-arm64.tar.gz"
        sha256 "3810b7ee4a84e5b14f861b1304c29f38f876147c2ad79b9e4dc64c2e45e544b8"
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