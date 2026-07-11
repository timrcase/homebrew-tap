class ClaudeCodeStatusline < Formula
  desc "Fast, config-driven statusline for Claude Code"
  homepage "https://github.com/timrcase/claude-code-statusline"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-arm64.tar.gz"
      sha256 "c479cc2cef568f395149e3473ad8f07a8e56c14d51458ab67b81b3efd54dadd0"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-amd64.tar.gz"
      sha256 "df63c9d5b63e34aeabc74507d0a578143b39c67deda3aadaf501449c7c3d53c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-arm64.tar.gz"
      sha256 "1051bd341780a7363c9452cab296ad22cdf797bfc521ee62d8ba6435bbb0d83e"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-amd64.tar.gz"
      sha256 "4be4ccccb70250c028bf3933efca20f80f6446ed3bb7ece2aef002c0c9f514e7"
    end
  end

  def install
    bin.install "claude-code-statusline"
  end

  def caveats
    <<~EOS
      To enable the statusline in Claude Code, add this to ~/.claude/settings.json:

          "statusLine": {
            "type": "command",
            "command": "#{HOMEBREW_PREFIX}/bin/claude-code-statusline"
          }

      Then restart Claude Code (or start a new session).
    EOS
  end

  test do
    # Empty stdin prints "Claude" (see main.go).
    assert_equal "Claude", shell_output("#{bin}/claude-code-statusline < /dev/null").strip
  end
end
