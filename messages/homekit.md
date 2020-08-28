<h1>HomeKit Message</h1>

<p> 
HomeKit is Apple's smart home framework, and HomeKit messages are broadcast
continuously by HomeKit compatible devices. This message type was first
described by Guillaume Celosia and Mathieu Cunche in 
<a
href="https://petsymposium.org/2020/files/papers/issue1/popets-2020-0003.pdf">Discontinued
Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity
Protocols</a>. Celosia <i>et al.</i> note that the Global State Number field
increments at each state change by a HomeKit device, which leaks information
about the device usage.
</p>


<div align="center">
<img src="/figs/homekit_format.png">
</div>

## HomeKit Message (btcommon.apple.type == 0x06)(This needs more work)

| Field Name                                  | Info                                        | Example           |Length| Type | Notes                      |
| :-------------------------------------------| :-------------------------------------------|:-----------------:|:----:|:----:|:--------------------------:|
| btcommon.apple.homekit.status               | Status Flags                                |01                 |   1  | Bytes| Not sure what th flags mean|
| btcommon.apple.homekit.deviceid             | Device ID                                   |222022f38f01       |   6  | Bytes|                            |
| btcommon.apple.homekit.category             | Category                                    |Range Extender (0x1000)|   2  | UINT16|                      |
| btcommon.apple.homekit.globalstatenum       | Global State Number                         | fa92              |   2  | Bytes| Don't know what this is    |
| btcommon.apple.homekit.date                 | Unkown Data (maybe encrypted)               | 02                |   12 | Bytes| Don't know what this is    |
| btcommon.apple.homekit.confignum            | Configuration Number                        | 02                |   1  | Bytes| Don't know what this is    |
| btcommon.apple.homekit.compver              | Compatible Version                          | c7                |   1  | Bytes| Don't know what this is    |

<!-- Leave this line -->
<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x06 -- indicates a HomeKit message
</li>
<li>
Length: 1 byte, 0x0d -- number of bytes in message payload
</li>
<li>
Status flags: 1 byte
</li>
<li>
Device ID: 6 bytes
</li>
<li>
Category: 2 bytes
</li>
<li>
Global State Number: 2 bytes
</li>
<li>
Configuration Number: 1 byte
</li>
<li>
Compatible Version: 1 byte
</li>
</ul>
