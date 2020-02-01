# Adding Continuity Dissector to Wireshark

## Linux/macOS Instructions

1. Download the <a href="https://www.wireshark.org/download.html">Wireshark
   source code</a> for your desired version 
1. Download the dissector that corresponds to the desired Wireshark base version (<i>eg</i>
   `3.2.1/packet-bthci_cmd.c` for Wireshark base version 3.2.1) 
1. Replace `epan/dissectors/packet-bthci_cmd.c` in the downloaded Wireshark
   source with our version
1. Follow the <a href="https://www.wireshark.org/docs/wsug_html_chunked/ChBuildInstallUnixBuild.html">
Wireshark build instructions</a> to build

## Windows 

Building things from source is really terrible on Windows. 

1. Use one of our 64-bit Windows installers that we built with the dissector
   built in under the version subdirectories. Installers are named `Wireshark-win64-[version].exe`.

Or, if you're brave,

<strike> 1. Install Gentoo </strike>

1. Download the <a href="https://www.wireshark.org/download.html">Wireshark
   source code</a> for your desired version 
1. Download the dissector that corresponds to the desired Wireshark base version (<i>eg</i>
   `3.2.1/packet-bthci_cmd.c` for Wireshark base version 3.2.1) 
1. Replace `epan/dissectors/packet-bthci_cmd.c` in the downloaded Wireshark
   source with our version
1. Follow the <a href="https://www.wireshark.org/docs/wsdg_html_chunked/ChSetupWin32.html">Windows build instructions</a> from Wireshark.

