<h1>Nearby Info Message</h1>

<p> 
Nearby Info messages broadcast the usage state of an iOS device to other nearby
devices. Nearby Info messages are broadcast continuously in modern iOS versions
regardless of user activity, and can be used to determine general usage states
(phone locked, active user, driving a vehicle) passively. 
</p>


<div align="center">
<img src="/figs/nearby_info_format.png">
</div>

## Nearby Info Message (btcommon.apple.type == 0x10)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                              |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:----------------------------------:|
| btcommon.apple.nearbyinfo.statusflags       | Nearby Info Status Flags     | 0x03                       | 1    | UINT8 |                                    |
| btcommon.apple.nearbyinfo.unk.flag          | Unknown Flag                 | Off (0x0)                  | 1    | BOOL  | Not sure about this flagg          |
| btcommon.apple.nearbyinfo.primary_device    | Primary Device Flag          | No (0x0)                   | 1    | BOOL  |                                    |
| btcommon.apple.nearbyinfo.unk.flag2         | Unknown Flag                 | Off (0x0)                  | 1    | BOOL  | Seen with iOS 11                   |
| btcommon.apple.nearbyinfo.airdrop_status    | AirDrop Receiving Status Flag| Off (0x0)                  | 1    | BOOL  |                                    |
| btcommon.apple.nearbyinfo.action_code       | Action Code                  | Locked Phone (3)           | 1    | UINT8 |                                    |
| btcommon.apple.nearbyinfo.dataflags         | Data Flags                   | 0x1c                       | 1    | UINT8 |                                    | 
| btcommon.apple.nearbyinfo.authtag_present   | Auth Tag Present Flag        | Yes (0x1)                  | 1    | BOOL  |                                    | 
| btcommon.apple.nearbyinfo.watch_locked      | Watch Locked Flag            | No (0x0)                   | 1    | BOOL  | Not sure about this flag           |
| btcommon.apple.nearbyinfo.autounlock_watch  | Auto Unlock Watch Flag       | No (0x0)                   | 1    | BOOL  | Not sure about this flag           |
| btcommon.apple.nearbyinfo.autounlock_enabled| Auto Unlock Flag             | No (0x0)                   | 1    | BOOL  | Not sure about this flag           |
| btcommon.apple.nearbyinfo.unk.flag3         | Unknown Flag                 | On (0x1)                   | 1    | BOOL  | Not sure about this flag           | 
| btcommon.apple.nearbyinfo.wifi_status       | WiFi Status                  | On (0x1)                   | 1    | BOOL  |                                    |
| btcommon.apple.nearbyinfo.authtag.fourbyte  | 4 Byte Auth Tag              | No (0x0)                   | 1    | BOOL  |                                    | 
| btcommon.apple.nearbyinfo.airpod.connection | AirPods Connection Status    | No (0x0)                   | 1    | BOOL  | This needs more teseting           | 
| btcommon.apple.nearbyinfo.os                | iOS Version                  | iOS 12.x                   | 1    | String|                                    |
| btcommon.apple.nearbyinfo.auth              | Auth Tag                     | 839096                     | 3    | Bytes |                                    | 
| btcommon.apple.nearbyinfo.postauth          | Post Auth Tag Data           | 80                         | 1    | Bytes | Seen in newer iPhones (X, Xs, 11)  |

<!-- Leave this line -->
<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x10 -- indicates a Nearby Info message
</li>
<li>
Length: 1 byte, 0x05 -- number of bytes in message payload
</li>
<li>
Status Flags: 4 bits -- Used as a bitmask, more than one may be enabled at any
time
<ul>
<li>
0x01 -- Indicates if this is the primary iCloud account device
</li>
<li>
0x02 -- Unknown
</li>
<li>
0x04 -- Indicates whether AirDrop Receiving is enabled
</li>
<li>
0x08 -- Unknown
</li>
</ul>
</li>
<li>
Action Code: 4 bits  -- indicates the action state of the device
</li>
<ul>
<li>
0x00 -- Activity Level Unknown
</li>
<li>
0x01 -- Activity Reporting Disabled
</li>
<li>
0x03 -- Idle User
</li>
<li>
0x05 -- Audio playing while screen locked
</li>
<li>
0x07 -- Active user (screen on)
</li>
<li>
0x09 -- Screen on with video playing
</li>
<li>
0x0A -- Watch on wrist and unlocked
</li>
<li>
0x0B -- Recent user interaction
</li>
<li>
0x0D -- User is driving a vehicle
</li>
<li>
0x0E -- Phone or Facetime Call
</li>
</ul>
<li>
Status Flags: 8 bits -- Used as a bitmask, more than one may be enabled at any
time
<ul>
<li>
0x01 -- Indicates if AirPods are connected and the screen is on
</li>
<li>
0x02 -- Indicates if the Authentication Tag is 4 bytes 
</li>
<li>
0x04 -- Indicates whether WiFi is on or off
</li>
<li>
0x08 --Unknown
</li>
<li>
0x10 -- Indicates whether the Authentication Tag is present or not
</li>
<li>
0x20 -- Indicates whether the Apple Watch is locked or not
</li>
<li>
0x40 --  Indicates whether Auto Unlock on the Apple Watch is enabled or not
</li>
<li>
0x80 -- Indicates whether Auto Unlock is enabled or not  
</li>
</ul>
</li>
<li>
Authentication Tag: 3 bytes
</li>
</ul>
