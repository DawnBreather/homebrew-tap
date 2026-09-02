# This file mirrors what GoReleaser writes on release, and it is still written OUTSIDE that run:
# `HOMEBREW_TAP_TOKEN` is unset on DawnBreather/tmux-hub, so a release takes its --skip=homebrew branch
# and cannot push here. Set that token and this file becomes generated again.
#
# v0.3.0 was published from the development tree rather than by the workflow, so its four checksums come
# from `sha256sum` over the very archives that were uploaded, matched to their URL by platform rather than
# by position — a hash pasted into the wrong one of four blocks fails as `checksum mismatch` and names
# none of them.
cask "tmux-hub" do
  version "0.3.1"

  on_macos do
    on_intel do
      sha256 "772258ad0f73e5832bfc1b94476332826433c66f71910cbc939fc930bd764701"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_amd64.tar.gz"
    end
    on_arm do
      sha256 "9e6da2ffd3f4de3cf7e131c582d67188676871c088a091d0ef849d177dbaf771"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "161a423a4d7841b382b1002760fa63e856c63fc0374544b89994635d69b755fc"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "3a06de801d100fba83534b2da13f178523d3ab25d97a14d9ebec11877536dcb4"
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
