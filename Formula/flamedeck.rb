# Formula/flamedeck.rb
class Flamedeck < Formula
    desc "CLI tool for uploading trace files to Flamedeck"
    homepage "https://github.com/flamedeck-org/flamedeck" 
    version "0.2.0-cli"
    #sha256 "" # We'll add architecture-specific sha256 below
  
    # Define URLs and checksums for different architectures
    on_intel do
        url "https://github.com/flamedeck-org/flamedeck/releases/download/v0.2.0-cli/flamedeck-macos-x64"
        sha256 "68257f5d9ad1da4376f1a85ef20a0b4d061367a814aef5971f9f1e6713274397"
    end
  
    on_arm do
        url "https://github.com/flamedeck-org/flamedeck/releases/download/v0.2.0-cli/flamedeck-macos-arm64"
        sha256 "a9f7be63e7715b542bd8ffdb08af767a9beccfbec56b2f5fc57e8c446fc10584"
    end
  
    def install
        # Since the download URL points directly to the binary based on architecture,
        # we just need to install it. The name `cli-rust` might be the actual filename
        # if that's how it's downloaded, adjust if needed.
        # The `bin.install` command moves the downloaded file into Homebrew's bin directory
        # and the `=> "flamedeck-` part renames it to the desired command name.
  
        if Hardware::CPU.intel?
            bin.install "flamedeck-macos-x64" => "flamedeck"
        elsif Hardware::CPU.arm?
            bin.install "flamedeck-macos-arm64" => "flamedeck"
        end
    end
  
    test do
        # Simple test to check if the command runs and shows help or version
        system "#{bin}/flamedeck", "--version"
    end
end