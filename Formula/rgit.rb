# rgit — https://github.com/ExaptationGmbH/rgit
#
# Installs the prebuilt binary attached to each rgit GitHub Release.
# The version and all four sha256s are maintained automatically by
# .github/workflows/bump.yml when a new rgit release is published.
# Seeded at 0.0.0 so the first bump (to the first real release) fires.
class Rgit < Formula
  desc "Run a git command across every repo beneath the current directory"
  homepage "https://github.com/ExaptationGmbH/rgit"
  version "0.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-darwin-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-darwin-amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-linux-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-linux-amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install Dir["rgit-*"].first => "rgit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rgit version")
  end
end
