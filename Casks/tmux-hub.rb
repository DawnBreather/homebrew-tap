# This file mirrors what GoReleaser writes on release, and it is still written OUTSIDE that run:
# `HOMEBREW_TAP_TOKEN` is unset on DawnBreather/tmux-hub, so a release takes its --skip=homebrew branch
# and cannot push here. Set that token and this file becomes generated again.
#
# v0.3.0 was published from the development tree rather than by the workflow, so its four checksums come
# from `sha256sum` over the very archives that were uploaded, matched to their URL by platform rather than
# by position — a hash pasted into the wrong one of four blocks fails as `checksum mismatch` and names
# none of them.
cask "tmux-hub" do
  version "0.5.9"

  on_macos do
    on_intel do
      sha256 "e855f955a702221eff98730c8449b0b28865cb2d45f8bd337a79cfea071138ae"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_amd64.tar.gz"
    end
    on_arm do
      sha256 "eb3531c7b4ed137c98f9f4c7083fd353f275a458849b77a338363a08f5740ccf"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "96eb6d740bc0a7dd32e17793d110819c38c9ca744f94aa7025de8db7cf2edab4"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "9d2fafa6ca8300c9af8bf58d4d8877fbc6365f2726078f458089049f4bf9d7a1"
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
