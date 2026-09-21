class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.43.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.43.0/octelium-darwin-amd64.tar.gz"
      sha256 "e6e6eba3acea0d99c1061b164f72f26a7d4fd9e42bb7f587ffdb4150c74b3fb8"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.43.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "dad8cd8de37d84c99b345e0d687fd7a67ccce633a482a1a306857450a8c38927"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.43.0/octops-darwin-amd64.tar.gz"
        sha256 "a5288c4ad104399f7a5243a8a5e42adde1848defb165344d158df25681171776"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.43.0/octelium-darwin-arm64.tar.gz"
      sha256 "24598ffe9694190fc3207ee7fd41438eb6181520bb41f2107cb693d16270d205"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.43.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "8009ce69d2918975c351a70c70e41662857926eff78598c4283a6c912d4f4967"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.43.0/octops-darwin-arm64.tar.gz"
        sha256 "c86b306ce31c5403c73f945b8a9ddbd70cc75d106528f71ae59dcdda1429e994"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.43.0/octelium-linux-amd64.tar.gz"
      sha256 "c30d982817d116fe9382f530915669e523179230f801885e5285425694d5e745"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.43.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "8f5fa7b3a345efb8782c18d9b399fa2a0bb78081858ba1987c468e0792c7314c"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.43.0/octops-linux-amd64.tar.gz"
        sha256 "7a72121225e3aebf8d20ddb2431f6b838447700b143ad5759a963042817b8a2f"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.43.0/octelium-linux-arm64.tar.gz"
      sha256 "4b47c53317ecac98659a372bc1e68a20dd198c8fec4b9f5c037e5bf6f533c055"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.43.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "772beefb9fc98fd7f717ed788e0d77def0ea6e08738a55341255125e81b7f9c1"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.43.0/octops-linux-arm64.tar.gz"
        sha256 "7b93375f9ed636f845b64b286193dd7df2737e9e16cb4541133785adc0dfc6c9"
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