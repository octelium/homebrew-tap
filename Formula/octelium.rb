class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.41.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.41.0/octelium-darwin-amd64.tar.gz"
      sha256 "969fa6d806efbe8ba46d6b2a449a4b293aea5c5db55ed30f72a305e0d36cd87a"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.41.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "b19a03aab8fb7bc0853d42bdd8a0a863b00e227c20d7085949016cbb7b289eb6"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.41.0/octops-darwin-amd64.tar.gz"
        sha256 "0f6b7e40aad5870d403652def361e7c2eb79642f2d58dc8f56c20f93b72489a5"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.41.0/octelium-darwin-arm64.tar.gz"
      sha256 "41f09d1cf01305ac050c0e78af7348bc374cd0b8d99ac71465da03b36fb4f80a"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.41.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "e586106b628a0d9917b22341e0081e239f445007f2e121983dd796c079ba4e83"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.41.0/octops-darwin-arm64.tar.gz"
        sha256 "85e5a500436263dcf10ed976de7413a0bf3ee5f90b7490bcd231390bc40f7105"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.41.0/octelium-linux-amd64.tar.gz"
      sha256 "6c79c73261deab5bec07715a3b6459de9fc1e0df6a0362624e87f87e2c3bbf55"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.41.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "ea4681c542e753d98efd1c5d92c39fbb258f24b49dbb09fcfdcdcf6c09fed2f7"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.41.0/octops-linux-amd64.tar.gz"
        sha256 "69f6a9c4e5c80b86e336514268ff78ed5ee67d6efcac11d5f95ecf89c74e1ef9"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.41.0/octelium-linux-arm64.tar.gz"
      sha256 "d6c6c358fc6b2d64975b7884aeec4a13689e37917b51fd90fc58df8df6521e75"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.41.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "80778bc2902e5b0e65af9e2eb37953aa454a44e20682d17a0f290801623cd89f"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.41.0/octops-linux-arm64.tar.gz"
        sha256 "54307f827c89a3320cf1a510479fdc6f00b42976da78dfc9bda7ba2cff3499b3"
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