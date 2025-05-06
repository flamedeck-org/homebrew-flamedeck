# Formula/flamedeck.rb
class Flamedeck < Formula
    desc "CLI tool for uploading trace files to Flamedeck"
    homepage "https://github.com/flamedeck-org/flamedeck" 
    version "0.0.3-cli"
    #sha256 "" # We'll add architecture-specific sha256 below
  
    # Define URLs and checksums for different architectures
    on_intel do
        url "https://github.com/flamedeck-org/flamedeck/releases/download/v0.0.3-cli/flamedeck-upload-macos-x64"
        sha256 "6816e7143cda4bfc5aa16eeec7459e114e85a4c8f594ae000b8e9f18ea46a745"
    end
  
    on_arm do
        url "https://github.com/flamedeck-org/flamedeck/releases/download/v0.0.3-cli/flamedeck-upload-macos-arm64"
        sha256 "e5287cccfb001d13d8c88a895262eb39d3c89b94e8fb7bfb4923815e2d5f61ea"
    end
  
    def install
        # Since the download URL points directly to the binary based on architecture,
        # we just need to install it. The name `cli-rust` might be the actual filename
        # if that's how it's downloaded, adjust if needed.
        # The `bin.install` command moves the downloaded file into Homebrew's bin directory
        # and the `=> "flamedeck-upload"` part renames it to the desired command name.
  
        if Hardware::CPU.intel?
            bin.install "flamedeck-upload-macos-x64" => "flamedeck"
        elsif Hardware::CPU.arm?
            bin.install "flamedeck-upload-macos-arm64" => "flamedeck"
        end
    end
  
    test do
        # Simple test to check if the command runs and shows help or version
        system "#{bin}/flamedeck", "--version"
    end
end