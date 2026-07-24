# rgit — https://github.com/ExaptationGmbH/rgit
#
# Installs the prebuilt binary attached to each rgit GitHub Release.
# The version and all four sha256s are maintained automatically by
# .github/workflows/bump.yml when a new rgit release is published.
# Seeded at 0.0.0 so the first bump (to the first real release) fires.
class Rgit < Formula
  desc "Run a git command across every repo beneath the current directory"
  homepage "https://github.com/ExaptationGmbH/rgit"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-darwin-arm64"
      sha256 "92767770b43ce847d86f7aff5bfb97a4099be1b092b87c2c41c506ea24245aac"
    end
    on_intel do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-darwin-amd64"
      sha256 "dafbf223aaada88cdde34163b27ae6053ea3c1b7f83e7977a2c1022e9788c7be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-linux-arm64"
      sha256 "a56d10a1c4f3d4fb282516ad24984654c34a8bf9a5324637623627f08dadea04"
    end
    on_intel do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-linux-amd64"
      sha256 "fe349ed1efc63001d41e8b9c3c420ba43dabac2223a654d287bdb6c4f3efe8ea"
    end
  end

  def install
    bin.install Dir["rgit-*"].first => "rgit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rgit version")
  end
end
