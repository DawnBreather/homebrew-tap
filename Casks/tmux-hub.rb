# This file mirrors what GoReleaser writes on release, and it is still written OUTSIDE that run:
# `HOMEBREW_TAP_TOKEN` is unset on DawnBreather/tmux-hub, so a release takes its --skip=homebrew branch
# and cannot push here. Set that token and this file becomes generated again.
#
# v0.3.0 was published from the development tree rather than by the workflow, so its four checksums come
# from `sha256sum` over the very archives that were uploaded, matched to their URL by platform rather than
# by position — a hash pasted into the wrong one of four blocks fails as `checksum mismatch` and names
# none of them.
cask "tmux-hub" do
  version "0.5.16"

  on_macos do
    on_intel do
      sha256 "09cd030d1e07a1bd3c0da4dc217c873f197c57e6aa77a51dde72acbb5a930ebf"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_amd64.tar.gz"
    end
    on_arm do
      sha256 "6db31df21ecc0f5dc4863dece8c040ac3e53e4e23688096bc34e9175ad340892"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "ab7a4eaf44a3ced4100922ab7810c06fe5e0e6ecad7cab7ac3c348a3028ae937"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "e319f57914d958d12c793c496a18dd32f83991b0c353048de200d130f5a1af18"
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
