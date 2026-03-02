class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.27.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.27.0/octelium-darwin-amd64.tar.gz"
      sha256 "2ecbcff84b7694b07009ecdfbdb928460e41489d14d5d5107c6305c3e880f141"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.27.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "6f502b8bb06ea0b5ba62eb029f7b32c3b0df86aa697289f715ee6a79e33d27f0"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.27.0/octops-darwin-amd64.tar.gz"
        sha256 "4e396e9ff43b7c30cb872b111725ce1b5371c600521ed9c5f361755d2ae6a444"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.27.0/octelium-darwin-arm64.tar.gz"
      sha256 "9670372ff5b2c29ff071a94d5ef64c7e5342655bab752d23e131f3656b75a583"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.27.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "39b177a0d3aeeda893269bcbe4c56a0f4368b00a934ac38440c2dcbf22e77413"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.27.0/octops-darwin-arm64.tar.gz"
        sha256 "357ec5140b51023e11d0d902fff4ce0c3fb7d7f409a56971c1937c85fc89b3c5"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.27.0/octelium-linux-amd64.tar.gz"
      sha256 "8f6565d8c3abc15cd54db8847b2f0e6fa617651336f073afcb40282fe73c2570"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.27.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "7824760cceaa584fc28a25019db83d41b2d69eb5f3655d88c19ff9a5572f585d"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.27.0/octops-linux-amd64.tar.gz"
        sha256 "cc74101622e388e9e13c6cb87074dca6d209f0d0265d8d4c470bc3a4affde9d3"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.27.0/octelium-linux-arm64.tar.gz"
      sha256 "21a25caeb2f8c6e769a138eb0fd4dbbdb28f3de93eed94547920b78002c9f34e"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.27.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "c7f0c941e4695ad34f53721322d7ab9335f8784bd884305fc1d7e5bf07eb8a5b"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.27.0/octops-linux-arm64.tar.gz"
        sha256 "9c32ba0efce371e1e71068616c7082eb10cbd30d0ff9ec4c385db00c20c8f012"
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