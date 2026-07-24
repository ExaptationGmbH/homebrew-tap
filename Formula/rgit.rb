# rgit — https://github.com/ExaptationGmbH/rgit
#
# Installs the prebuilt binary attached to each rgit GitHub Release.
# The version and all four sha256s are maintained automatically by
# .github/workflows/bump.yml when a new rgit release is published.
# Seeded at 0.0.0 so the first bump (to the first real release) fires.
class Rgit < Formula
  desc "Run a git command across every repo beneath the current directory"
  homepage "https://github.com/ExaptationGmbH/rgit"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-darwin-arm64"
      sha256 "0dd3dd84f01afdace7d19f5244ba9171473d8564d9e6c970031e6245024ceb61"
    end
    on_intel do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-darwin-amd64"
      sha256 "3ca14b31369ad166ac59e2b6e1fc64a9a4f00777ebd31dd443e4783d51ade06f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-linux-arm64"
      sha256 "923497bcd0945f9731b8f272bc1c7f44beaac25513c14bf4f7c5e3679ef7779c"
    end
    on_intel do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-linux-amd64"
      sha256 "133319e2ec3c3d4f320d7507c2c6eec2ea5d8ea61650e61233352d7bc4f8308d"
    end
  end

  def install
    bin.install Dir["rgit-*"].first => "rgit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rgit version")
  end
end
