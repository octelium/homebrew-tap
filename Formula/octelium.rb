class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.28.0/octelium-darwin-amd64.tar.gz"
      sha256 "d568b8960bbaa449155c9b756fea7780e9a43c0092651824f74892d0b8f9f76c"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.28.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "f26e09dd0226b025949e495c6449a03557b41669b0fbc6b47f47875133ff4341"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.28.0/octops-darwin-amd64.tar.gz"
        sha256 "5f8e9412bfb3036efa230dccf035636195fd60d900c40aaceb1c6d5ccccad5ad"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.28.0/octelium-darwin-arm64.tar.gz"
      sha256 "ef76c5c89c42730a4d82244c62d1a6201438fda5a1055a7651b00489cec7601d"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.28.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "95ce60d36cd9682d8acda79a43cd33187fd354ea25f2e22f76bc989c3d524895"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.28.0/octops-darwin-arm64.tar.gz"
        sha256 "a7dd70d23fba98989bdf63cf97c76f55cc6a78dcdf2a93280fa8e6e0b158f3be"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.28.0/octelium-linux-amd64.tar.gz"
      sha256 "f88223500acaa815a070e385021053bcbdfb83be2d8698db5628fc89d70ab8e6"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.28.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "37cb1b9ca9329b655393f3c05fd5521d1f69bf89ec3279b394004c04e9cf4fbe"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.28.0/octops-linux-amd64.tar.gz"
        sha256 "48d71185ff139eca60585065894390f93b52d4e4dceb1e255772fda7f26f0a0d"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.28.0/octelium-linux-arm64.tar.gz"
      sha256 "1039b0535635f50fee33a20e8568479efebc0b6dc3f00b57c1fbd6183de5ecf2"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.28.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "56f7d07269c8595a52ff9eca3cd03c06ba3d2f96b4c0c0d2c9df6180f073d7b7"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.28.0/octops-linux-arm64.tar.gz"
        sha256 "b616995a7a790da1158e3e38ae35a1614744d501156fa1976263a9b432d315cf"
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