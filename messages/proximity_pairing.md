<h1>Proximity Pairing Message</h1>

<p> 
Proximity Pairing is an Apple technology that is used to pair airPods and iOS
devices.  These messages carry unencrypted information detailing the status,
model, and color of the audio device as well as the power and charging status.
</p> 

<p>
Proximity Pairing itself has been thoroughly reverse engineered by Guillaume
Celosia and Mathieu Cunche in  
<a
href="https://petsymposium.org/2020/files/papers/issue1/popets-2020-0003.pdf">Discontinued
Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity
Protocols</a>.
</p>

<div align="center">
<img src="/figs/proximity_pairing_format.png">
</div>


<p>The message fields, observed values and their meaning:</p>

## AirPods Message (btcommon.apple.type == 0x07)

| Field Name                                  | Info                         | Example                   |Length| Type  | Notes                    |
| :-------------------------------------------| :----------------------------|:--------------------------|:----:|:-----:|:------------------------:|
| btcommon.apple.airpods.prefix               | Prefix for AirPods messages  |01                         |   1  | Bytes |                          |
| btcommon.apple.airpods.devicemodel          | Device model                 |AirPods Pro (0x0e20)       |   2  | UINT16|                          |
| btcommon.apple.airpods.status               | Device Status                |Both AirPods in case (0x55)|   2  | UINT8 |                          |
| btcommon.apple.airpods.leftbattery          | Battery of Left Pod (x10%)   | 9                         |   1  | UINT8 | Have seen > 100%         |       
| btcommon.apple.airpods.rightbattery         | Battery of Right Pod (x10%)  | 9                         |   1  | UINT8 | Have seen > 100%         |
| btcommon.apple.airpods.casecharging         | Whether the case is charging | No (0x0)                  |   1  | UINT8 |                          |
| btcommon.apple.airpods.rightcharging        | Whether right pod is charging| Yes (0x1)                 |   1  | UINT8 |                          |
| btcommon.apple.airpods.leftcharging         | Whether left pod is charging | Yes (0x1)                 |   1  | UINT8 |                          |
| btcommon.apple.airpods.casebattery          | Battery of case (x10%)       | 7                         |   1  | UINT8 | Have seen < 100%         |
| btcommon.apple.airpods.opencount            | Counter for opening lid      | 57                        |   1  | UINT8 | Weird counter            |
| btcommon.apple.airpods.devicecolor          | Device Color                 | White (0x00)              |   1  | UINT8 | Changes for beats        |               
| btcommon.apple.airpods.suffix               | Suffix for AirPods messages  | 00                        |   1  | Bytes |                          |
| btcommon.apple.airpods.encdata              | Encrypted Data               |9672711ae6a965737c80d805039773d1|16| Bytes| Not sure what this is    |
| btcommon.apple.airpods.batterystatus        | AirPods L/R Battery Level Byte| 88                       |   1  | None  | This is a tree           | 
| btcommon.apple.airpods.charingstatus        | Charging Status Byte         | 8f                        |   1  | None  | This is a tree           |
| btcommon.apple.airpods.casebatterystatus    | Case Battery Level Byte      | 8f                        |   1  | None  | This is a tree           |
| btcommon.apple.airpods.batterychargingstatus| Battery and Charging Status Bytes|888f                   |   2  | None  | This is a tree           |
