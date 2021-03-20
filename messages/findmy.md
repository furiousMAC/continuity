<h1>Find My Message</h1>

<p>  At the 2019 Worldwide Developer Conference (WWDC19), Apple introduced Offline Finding, a
proprietary protocol and crowd-sourced sensor network comprised of millions of
iOS and macOS devices. This protocol was first reverse engineered by Heinrich et al. in [Who Can Find My Devices? Security and Privacy of Apple’s Crowd-Sourced Bluetooth Location Tracking System](https://arxiv.org/pdf/2103.02282.pdf). The Find My message is broadcast by apple devices that are marked as lost by the user or that do not have internet connectivity. 
This message includes the x-coordinate of the currently active elliptic curve public key for the disconnected device. Because BLE
advertisements are limited to 31 total bytes, some of which are used to encode the company identifier and other metadata, Apple encodes part of the key in the
BLE Advertising Address, with the remaining public key included in the advertisement payload. When a nearby internet-connected apple device sees this BLE message, it 
sends a location report using its own GPS to Apple Servers. This location report is encrypted with the advertised public key so that only the device owner can decrypt the location report. 
The owner of the lost device will then see the lost device's location appear on their Find My app.
</p>

<div align="center">
<img src="/figs/findmy.png">
</div>


## Find My Message (btcommon.apple.type == 0x12)
| Field Name                             | Info                             | Example                    |Length| Type  | Notes                                   |
| :--------------------------------------| :--------------------------------|:--------------------------:|:----:|:-----:|:---------------------------------------:|
| btcommon.apple.findmy.status           | Owner Connection & Battery Status| 00                         | 1    | UINT8 | Have only seen 0x00                     |
| btcommon.apple.findmy.publickey        | Bytes 6-27 of Public Key         | 57364dc7fb77866c40c91076603cb37c1f59f923ab3a|22|Bytes|                              |
| btcommon.apple.findmy.publickey.bits   | Bits 6-7 of Byte 0 of Public Key|  03                         | 1    | UINT8| Only bits 0-1 used; Bits 2-7 are reserved|
| btcommon.apple.findmy.hint             | Byte 5 of BT_ADDR of Primary key | 00                         | 1    | UINT8 |Have only seen 0x00                      |
| btcommon.apple.findmy.publickey.xcord  | 28-byte x-coord of Public Key    | b953267519a8ef5b0bdea8bc5bf80bd0ee47e7d68b2bb8319cbbee0|28|STRING|                  |

<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x12 -- indicates a Find My message
</li>
<li>
Length: 1 byte, 0x19-- number of bytes in the message payload
</li>
<li>
Status: 1 byte, 0x00-- Owner Connection & Battery Status. Maintained bit (bit 2) set if owner connected within current key rotationperiod (15 minutes). If Maintained bit set, then bits 6-7 shows full, medium, low, or critically low battery.
</li>
<li>
Public Key: 22 bytes, 0x57364dc7fb77866c40c91076603cb37c1f59f923ab3a-- Bytes 6-27 of the x-coordinate of the public key. 
</li>
<li>
Public Key Bits: 1 byte, 0x03-- Bits 6-7 of Byte 0 of the x-coordinate of the public key
</li>
<li>
Hint: 1 byte, 0x00-- Byte 5 of BT_ADDR of the primary key.
</li>
</ul>

