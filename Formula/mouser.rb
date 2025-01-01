# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Mouser < Formula
  desc "Automate actions via mouse gestures."
  homepage "https://github.com/echocrow/Mouser"
  version "1.5.0"
  license "LGPL-3.0-or-later"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/echocrow/Mouser/releases/download/v1.5.0/mouser_1.5.0_darwin_amd64.tar.gz"
    sha256 "88380449bdb6663cfa164a33e58f04c24821c538bbbd496d8bec6c4871aa2e4d"

    def install
      bin.install "mouser"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/echocrow/Mouser/releases/download/v1.5.0/mouser_1.5.0_darwin_arm64.tar.gz"
    sha256 "f3e1228cdd6e6d5acc9d6ca6aa307df46556382a55b1ff27dcd083f67d647031"

    def install
      bin.install "mouser"
    end
  end

  def caveats
    <<~EOS
      To configure and run mouser, create and edit the config file:
        mkdir -p "$(dirname "$(./mouser --config '?')")" && touch "$(./mouser --config '?')" && echo $_

      For examples on how to configure mouser, refer to the homepage:
        #{homepage}

      Note: The first time you run mouser you may need to provide additional
      permissions to the app:
        System Perferences > Security & Privacy > Privacy > Accessibility > mouser
      Once granted, restart mouser.
    EOS
  end

  service do
    run opt_bin/"mouser"
    run_at_load true
    keep_alive successful_exit: false
  end

  test do
    system "#{bin}/mouser --version"
  end
end
