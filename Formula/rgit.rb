# rgit — https://github.com/ExaptationGmbH/rgit
#
# Installs the prebuilt binary attached to each rgit GitHub Release.
# The version and all four sha256s are maintained automatically by
# .github/workflows/bump.yml when a new rgit release is published.
# Seeded at 0.0.0 so the first bump (to the first real release) fires.
class Rgit < Formula
  desc "Run a git command across every repo beneath the current directory"
  homepage "https://github.com/ExaptationGmbH/rgit"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-darwin-arm64"
      sha256 "b3ce7f944839ee3e1956be973bf6df1a503aaa6ee06198eea6330ac813122619"
    end
    on_intel do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-darwin-amd64"
      sha256 "56c7481e60794d5f1ac677d90b94730115a2e48dd26683318b533a9e696b23b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-linux-arm64"
      sha256 "9452b5711024ed397b7a9cb01716d99d525e282c58e5fd2563c350fd877e7ba4"
    end
    on_intel do
      url "https://github.com/ExaptationGmbH/rgit/releases/download/v#{version}/rgit-v#{version}-linux-amd64"
      sha256 "ce5c665b9dd3171c76fcbf56cd7ff99a3bc42a83e4418085c79c55914006e9d6"
    end
  end

  def install
    bin.install Dir["rgit-*"].first => "rgit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rgit version")
  end
end
