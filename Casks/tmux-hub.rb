# This file mirrors what GoReleaser writes on release, and it is still written OUTSIDE that run:
# `HOMEBREW_TAP_TOKEN` is unset on DawnBreather/tmux-hub, so a release takes its --skip=homebrew branch
# and cannot push here. Set that token and this file becomes generated again.
#
# v0.3.0 was published from the development tree rather than by the workflow, so its four checksums come
# from `sha256sum` over the very archives that were uploaded, matched to their URL by platform rather than
# by position — a hash pasted into the wrong one of four blocks fails as `checksum mismatch` and names
# none of them.
cask "tmux-hub" do
  version "0.5.7"

  on_macos do
    on_intel do
      sha256 "fbb531460840a192833d49156d08735c508add005a4f29328a51947702e27c17"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_amd64.tar.gz"
    end
    on_arm do
      sha256 "6ddd7c1e43703b965965e42eec28c9af7fc72f651ae1c2c8886ba363c9687270"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_macos_arm64.tar.gz"
    end
  end

  on_linux do
    on_intel do
      sha256 "5804f710820d851f4bdc586242132bc5c9dcdb6c7c2c0594222fc6b86d469845"
      url "https://github.com/DawnBreather/tmux-hub/releases/download/v#{version}/tmux-hub_#{version}_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "b9f58049bb4cf033e077af4ef254cec00b3491da8b50db3a30007723bbdb1dce"
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
