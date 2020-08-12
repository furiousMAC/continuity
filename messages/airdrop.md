<h1>AirDrop Message</h1>

<p> 
AirDrop is an Apple technology that allows users to share files with each other
via WiFi and Bluetooth, but without the need to both be connected to a WiFi network.
</p> 

<p>
AirDrop itself has been thoroughly reverse engineered by Milan Stute <i>et.
al</i> in their work  <a
href="https://www.usenix.org/system/files/sec19fall_stute_prepub.pdf"> A Billion
Open Interfaces for Eve and Mallory: MitM, DoS, and Tracking Attacks on iOS and
macOS Through Apple Wireless Direct Link </a>. The AirDrop Message was described
first by the <a href="https://hexway.io">Hexway</a> security research group, and 
by Guillaume Celosia and Mathieu Cunche in  
<a
href="https://petsymposium.org/2020/files/papers/issue1/popets-2020-0003.pdf">Discontinued
Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity
Protocols</a>.
</p>

<div align="center">
<img src="/figs/airdrop_format.png">
</div>



## AirDrop Message (btcommon.apple.type == 0x05)
| Field Name                                  | Info                                        | Example           |Length| Type | Notes                      |
| :-------------------------------------------| :-------------------------------------------|:-----------------:|:----:|:----:|:--------------------------:|
| btcommon.apple.airdrop.prefix               | Prefix for AirdDrop message                 |0000000000000000   |   8  | Bytes|                            |
| btcommon.apple.airdrop.version              | AirDrop Version                             | 01                |   1  | Bytes| Version of AirDrop?        |
| btcommon.apple.airdrop.appleid              | First 2 bytes SHA256(AppleID)               | 6e2e              |   2  | Bytes|                            |
| btcommon.apple.airdrop.phone                | First 2 bytes SHA256(Phone Number)          | f7ad              |   2  | Bytes|                            |
| btcommon.apple.airdrop.email                | First 2 bytes SHA256(Email)                 | 09b2              |   2  | Bytes|                            |
| btcommon.apple.airdrop.email2               | First 2 bytes SHA256(Email 2)               | 2080              |   2  | Bytes|                            |
| btcommon.apple.airdrop.suffix               | Sufffix of AirDrop message                  | 00                |   1  | Bytes|                            |

<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x05 -- indicates an AirDrop message
</li>
<li>
Length: 1 byte, 0x12 -- number of bytes in the message payload
</li>
<li>
Zeros: 8 bytes
</li>
<li>
Version: 1 byte
</li>
<li>
Truncated SHA256 Hash of AppleID: 2 bytes
</li>
<li>
Truncated SHA256 Hash of Phone Number: 2 bytes
</li>
<li>
Truncated SHA256 Hash of Email: 2 bytes
</li>
<li>
Truncated SHA256 Hash of Email2: 2 bytes
</li>
<li>
Zero: 1 byte
</li>
</ul>
