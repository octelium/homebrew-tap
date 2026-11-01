class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.49.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.49.0/octelium-darwin-amd64.tar.gz"
      sha256 "75fc25c96d99ed046cffdf9c96471c82df6b26641abf0cbad394d92e8c58066a"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.49.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "fc7a51172a56f5219e4ba130bdab640686b4546833318e97c56401ff66b3cb3b"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.49.0/octops-darwin-amd64.tar.gz"
        sha256 "9058eb58d8cbab4558a3067324ef68704a35eabf9a15289505601302d5c4a406"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.49.0/octelium-darwin-arm64.tar.gz"
      sha256 "deb6c424c850892831a4992708e978c4bfad4ef34a2cc2320e165c750364d642"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.49.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "e0ae999db8d15f15d6f9f5eaabdb7dcd91b44b3fbbc90b52bcd7b553a6a0fe65"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.49.0/octops-darwin-arm64.tar.gz"
        sha256 "94fdaf1abf232dd1fa0b9439a3b530b9ee666f0e5c3403f0e7f7efaf3154e363"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.49.0/octelium-linux-amd64.tar.gz"
      sha256 "76fe8f3781382031423a350befc7739cac079fca177a63d12a1e9a77ce15196d"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.49.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "3195afa78bb22e64bc7c842bf1dca416de13c6bf0578b24579baaf03c72d7725"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.49.0/octops-linux-amd64.tar.gz"
        sha256 "9f56792e6c00fa543a3ffd352584528ab4db997c4eeb5644486653d75d9467f5"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.49.0/octelium-linux-arm64.tar.gz"
      sha256 "2fbfd4ca963a5de07055bd5ac1f7c88bc634f295337385a474c766b066d7c0af"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.49.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "016385713564ca2bc81a2ef779040956ddb747c732c55621de7ee6df60a30460"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.49.0/octops-linux-arm64.tar.gz"
        sha256 "6cb7c3f2f9e002e0723fd41ff3463ffa960272ed99c8fdd67b37dda9820a7dba"
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