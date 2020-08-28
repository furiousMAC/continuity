<h1>Airplay Target Message</h1>

<p> 
The Airplay Target messages are sent by Airplay compatible devices to advertise
their presence to Apple devices that are actively seeking to send media to them.
</p>


<div align="center">
<img src="/figs/airplay_target_format.png">
</div>

## AirPlay Target Message (btcommon.apple.type == 0x09)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                    |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:------------------------:|
| btcommon.apple.airplay.flags                | AirPlay Flags                |   03                       |   1  | Bytes | Needs more work          |
| btcommon.apple.airplay.seed                 | AirPlay Seed                 |   07                       |   1  | Bytes | Unknown what this is for |
| btcommon.apple.airplay.ip                   | AirPlay IPv4 Address         |   192.168.1.2              |   4  | IPv4  |                          |

<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x09 -- indicates an Airplay Target message
</li>
<li>
Length: 1 byte, 0x06 -- number of bytes in message payload
</li>
<li>
Flags: 1 byte 
</li>
<li>
Configuration Seed: 1 byte
</li>
<li>
IPv4 Address: 4 bytes -- IP address of the Airplay device
</li>
</ul>
