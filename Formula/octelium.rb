class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.31.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.31.0/octelium-darwin-amd64.tar.gz"
      sha256 "c79bc8b2613b7f13d243f9976fa9b303577938afa82e07ef4b21fe5636b36085"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.31.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "3923e3c9971270fac0cfe6e116c489d7ea279fd526686808acd9f9823ec03663"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.31.0/octops-darwin-amd64.tar.gz"
        sha256 "4ea27c2b453085e940595c42ac92086f7a69f8d35dac17992dc5818487b14aaf"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.31.0/octelium-darwin-arm64.tar.gz"
      sha256 "f9a14aa5250466cd0e358b0dca98ef42471037633d26599603d38d145f96bfbd"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.31.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "dac0b4e5f65552e88e0d3e9b2200dab0cade49f99179ad51af4cf5f9966152d0"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.31.0/octops-darwin-arm64.tar.gz"
        sha256 "a08677342a10b03dbb8296eb2eecf354a45a98fa35614ada0c851521103ce759"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.31.0/octelium-linux-amd64.tar.gz"
      sha256 "1c526430a4ce4fba4a336a5f66f5e157cd83d8645e083a7b0722158b468a09ff"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.31.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "095a081a5e80512ee3b7c417e9446eff1b000a23ec2d0fea0c7be1d30094ff28"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.31.0/octops-linux-amd64.tar.gz"
        sha256 "09cfdf6db0b38e83c417c1d0aea05a9c2421f162c17a786634d45e5aadcf965e"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.31.0/octelium-linux-arm64.tar.gz"
      sha256 "dda510aab978c1d23280f1958ccaa8e5bff8072150ae4eac0cc8179cfc179cdf"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.31.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "687c7cac50c93ae18427a86e0e83f6ca4ee1ab3c3bee9b59d36ee268883dd970"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.31.0/octops-linux-arm64.tar.gz"
        sha256 "e1e9ded89bf006663c0f8c32d0b0cf8d35652d6af64d9ecf95c23c373da14ad9"
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