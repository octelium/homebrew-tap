class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.50.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.50.0/octelium-darwin-amd64.tar.gz"
      sha256 "25392c46287f082bbb4c6a0e2b2f1345e09b02e69e62fdd43886f39bcb336705"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.50.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "046c22980c6eabbac74d6fec766880182c792802c398a425943f876a6e33e8ec"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.50.0/octops-darwin-amd64.tar.gz"
        sha256 "f9707403aea1c968457984681e84b040fff99ef5292331a4e6843568c3e99ec9"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.50.0/octelium-darwin-arm64.tar.gz"
      sha256 "b0745f992833d134f44db2f1ac3a39d8d146948a17be3270efaea5de98751c89"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.50.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "c296cad951981b769254f88ab64e375055bbb10bbde3372d70876a25ff987d50"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.50.0/octops-darwin-arm64.tar.gz"
        sha256 "68e6ffe7a8f48ca722b2ef8b11efc46d5de6a2fc6081519f71429b16f4cf4126"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.50.0/octelium-linux-amd64.tar.gz"
      sha256 "74efcb0e4cf7487a180ba6ca719147476e99ee5e50c689f3e273a9b4f1397f46"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.50.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "f2279bf70c10b194ba388d6bd0e94f14f035375a15335e2db549f7bd5d8231b2"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.50.0/octops-linux-amd64.tar.gz"
        sha256 "96a71068768b387ad5d32d020e94b236ad0c0a34974e9ef23f0f622b30e8c9f2"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.50.0/octelium-linux-arm64.tar.gz"
      sha256 "73c384d22ff6b46d0ea14666e7b5d97c11e3b69d54b301e90c8321f0c583b983"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.50.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "f93203aa5d123bee6b6c3b794e1d556db38bdd1c010f9f428b9ab78a644afa67"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.50.0/octops-linux-arm64.tar.gz"
        sha256 "56f25125cc277b412c83ad13fb2b3ae96517d0092167be685048a33dcd004682"
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