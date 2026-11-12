# This file mirrors what GoReleaser writes on release, and it is still written OUTSIDE that run:
# `HOMEBREW_TAP_TOKEN` is unset on DawnBreather/tmux-hub, so a release takes its --skip=homebrew branch
# and cannot push here. Set that token and this file becomes generated again.
#
# v0.3.0 was published from the development tree rather than by the workflow, so its four checksums come
# from `sha256sum` over the very archives that were uploaded, matched to their URL by platform rather than
# by position — a hash pasted into the wrong one of four blocks fails as `checksum mismatch` and names
# none of them.
cask "tmux-hub" do
  version "0.5.18"

  on_macos do
    on_intel do
      sha256 "e6f5273fdccd720345437c6f6c2ba76338645c4cc6c6d1a707b5a89b09842631"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_amd64.tar.gz"
    end
    on_arm do
      sha256 "dc5d8b46492d740cd27fa97888b1151651323e009a85a7f3477cbfd2e5186515"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "6fc72220cb8436a43ce2e3244764b60ec9a445b6a3c1774d08bf2c608ceec9e5"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "9c6782087d3b9926cf6bc6451239f691c909fb22ca549d79d709d14f16be08bd"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_linux_arm64.tar.gz"
    end
  end

  name "tmux-hub"
  desc "A control panel over local and remote tmux servers, built for many Claude Code sessions at once"
  homepage "https://github.com/DawnBreather/tmux-hub"

  livecheck do
    skip "Auto-generated on release."
  end
  depends_on formula: [
      "tmux",
    ]

  binary "tmux-hub"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/tmux-hub"]
    end
  end
end
