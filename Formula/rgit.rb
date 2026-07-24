# Homebrew formula for rgit — https://github.com/ExaptationGmbH/rgit
#
# This is currently a HEAD-only formula: install with
#   brew install --HEAD ExaptationGmbH/tap/rgit
# because rgit has not cut a tagged release yet. Once release-please publishes
# v0.1.0, this file is replaced by the pinned, versioned formula (url + sha256)
# from the rgit repo's Formula/rgit.rb, and plain `brew install` will work.
class Rgit < Formula
  desc "Run a git command across every repo beneath the current directory"
  homepage "https://github.com/ExaptationGmbH/rgit"
  license "MIT"
  head "https://github.com/ExaptationGmbH/rgit.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    # In an empty dir there are no repos; rgit should say so and exit non-zero.
    assert_match "no git repositories found",
                 shell_output("#{bin}/rgit status 2>&1", 1)
    assert_match "rgit", shell_output("#{bin}/rgit --version")
  end
end
