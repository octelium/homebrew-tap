class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.30.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.30.0/octelium-darwin-amd64.tar.gz"
      sha256 "ba1060928135210bf6d1f45c55eb4131195d9fc4daa5026b8d9e5e3e93a9508f"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.30.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "6b73e37504f843d50706ff5d15a81f0ae1e529c572075f7cd5e629cceaf7a038"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.30.0/octops-darwin-amd64.tar.gz"
        sha256 "d34311cc1d5e05b044f8bdcee735ab344da826314f77955c3236254515b79dd7"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.30.0/octelium-darwin-arm64.tar.gz"
      sha256 "a7b685333cb75ae5e5cfe61fdfd1c67fefe3b6e93f46c6c88fa00babb28e9c76"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.30.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "e09d47636d5299e7d1ec27ae27e717c85d62ec9d8a3736c8421f13fb10ec98bf"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.30.0/octops-darwin-arm64.tar.gz"
        sha256 "7d6256952753fb48d54b6adec7754e1ad5e99427fb5e00b9800d175c4c575c77"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.30.0/octelium-linux-amd64.tar.gz"
      sha256 "0d7014422fd3991fb770e2cbbc46439e3910b6c28852be8f340a69f03fed8075"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.30.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "179c8abf024967fa0c9ff95bed8b87565b4f83840e2115fe48f7eadcbeb773af"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.30.0/octops-linux-amd64.tar.gz"
        sha256 "37d6b0884f60f0a5ccce419ca73d630f0a9bba9cdb04d6cc80117f4b578e5b6d"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.30.0/octelium-linux-arm64.tar.gz"
      sha256 "f2f24731ca25abd12d16783b6b534aea7d4236af0b482a037ca3846800d3dc7a"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.30.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "70062ded9f9d0f66851b816a5b93062dcfab2fbbb68fa288cdc60a261e6ccbc5"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.30.0/octops-linux-arm64.tar.gz"
        sha256 "b584fc53a59827eaa1a01c4e518b86f105f7ad4f7fe3508b51f1ba812ad6c4a5"
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