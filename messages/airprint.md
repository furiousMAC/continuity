<h1>AirPrint Message</h1>

<p> 
AirPrint is an Apple technology designed to enable printing from iOS and macOS
devices without needing to install additional software if the printer supports
AirPrint. 
</p> 

<p>
This message type was first described by Guillaume Celosia and Mathieu Cunche in 
<a
href="https://petsymposium.org/2020/files/papers/issue1/popets-2020-0003.pdf">Discontinued
Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity
Protocols</a>.
</p>

<div align="center">
<img src="/figs/airprint_format.png">
</div>


## AirPrint Message (btcommon.apple.type == 0x03)
| Field Name                                  | Info                  | Example                              | Length   | Type    | Notes                      |
| :-------------------------------------------| :---------------------|:-------------------------------------|:--------:|:-------:|:--------------------------:|
| btcommon.apple.airprint.addrtype            | Address Type          |   74                                 | 1 byte   | Bytes   | This may mean IPv4 vs IPv6 |
| btcommon.apple.airprint.resourcepathtype    | Resource Path Type    |   07                                 | 1 byte   | Bytes   | Not sure what this is      |
| btcommon.apple.airprint.securitytype        | Security Type         |   6f                                 | 1 byte   | Bytes   | Not sure what this is      |
| btcommon.apple.airprint.qidport             | QID or TCP Port       |   55990                              | 2 bytes  | Decimal |                            |
| btcommon.apple.airprint.ipaddr              | IPv4 or IPv6 Address  |e52f:eee5:be15:1347:399:3500:1063:6fc5| 16 bytes | IPv6    |                            |
| btcommon.apple.airprint.power               | Measured Power        |   6d                                 | 1 byte   | Bytes   | Is this dbm, db? Sometimes it's optional |

<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x03 -- indicates an AirPrint message
</li>
<li>
Length: 1 byte, 0x16 -- number of bytes in the message payload
</li>
<li>
Address Type: 1 byte
</li>
<li>
Path Resource Type: 1 byte
</li>
<li>
Security Type: 1 byte
</li>
<li>
QID or TCP Port: 2 bytes
</li>
<li>
IPv4/6 Address: 16 bytes
</li>
<li>
Measured Power: 1 byte
</li>
</ul>
