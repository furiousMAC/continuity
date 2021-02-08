# Apple BLE Continuity Protocol Wirehsark Dissector Fields

## General Message Fields
| Field Name                | Info                                             | Example             | Length  | Type    |
| :-------------------------| :------------------------------------------------|:-------------------:|:-------:|:-------:|
| btcommon.apple.type       | The type of message (ie. 0x16: Nearby Info)      | Handoff (12)        | 1       | UINT8   |
| btcommon.apple.length     | The total length of the Apple Continuity message | 14                  | 1       | UINT8   |  


## AirPrint Message (btcommon.apple.type == 0x03)
| Field Name                                  | Info                  | Example                               | Length   | Type    | Notes                      |
| :-------------------------------------------| :---------------------|:-------------------------------------:|:--------:|:-------:|:--------------------------:|
| btcommon.apple.airprint.addrtype            | Address Type          |   74                                  | 1 byte   | Bytes   | This may mean IPv4 vs IPv6 |
| btcommon.apple.airprint.resourcepathtype    | Resource Path Type    |   07                                  | 1 byte   | Bytes   | Not sure what this is      |
| btcommon.apple.airprint.securitytype        | Security Type         |   6f                                  | 1 byte   | Bytes   | Not sure what this is      |
| btcommon.apple.airprint.qidport             | QID or TCP Port       |   55990                               | 2 bytes  | Decimal |                            |
| btcommon.apple.airprint.ipaddr              | IPv4 or IPv6 Address  |e52f:eee5:be15:1347:399:3500:1063:6fc5|  16 bytes | IPv6    |                            |
| btcommon.apple.airprint.power               | Measured Power        |   6d                                  | 1 byte   | Bytes   | Is this dbm, db? Sometimes it's optional |

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

## AirPods Message (btcommon.apple.type == 0x07)

| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                    |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:------------------------:|
| btcommon.apple.airpods.prefix               | Prefix for AirPods messages  |01                          |   1  | Bytes |                          |
| btcommon.apple.airpods.devicemodel          | Device model                 |AirPods Pro (0x0e20)        |   2  | UINT16|                          |
| btcommon.apple.airpods.status               | Device Status                |Both AirPods in case (0x55) |   1  | UINT8 |                          |
| btcommon.apple.airpods.leftbattery          | Battery of Left Pod (x10%)   | 9                          |   1  | UINT8 | Have seen > 100%         |       
| btcommon.apple.airpods.rightbattery         | Battery of Right Pod (x10%)  | 9                          |   1  | UINT8 | Have seen > 100%         |
| btcommon.apple.airpods.casecharging         | Whether the case is charging | No (0x0)                   |   1  | BOOL  |                          |
| btcommon.apple.airpods.rightcharging        | Whether right pod is charging| Yes (0x1)                  |   1  | BOOL  |                          |
| btcommon.apple.airpods.leftcharging         | Whether left pod is charging | Yes (0x1)                  |   1  | BOOL  |                          |
| btcommon.apple.airpods.casebattery          | Battery of case (x10%)       | 7                          |   1  | UINT8 | Have seen > 100%         |
| btcommon.apple.airpods.opencount            | Counter for opening lid      | 57                         |   1  | UINT8 | Weird counter            |
| btcommon.apple.airpods.devicecolor          | Device Color                 | White (0x00)               |   1  | UINT8 | Changes for beats        |               
| btcommon.apple.airpods.suffix               | Suffix for AirPods messages  | 00                         |   1  | Bytes |                          |
| btcommon.apple.airpods.encdata              | Encrypted Data               |9672711ae6a965737c80d805039773d1|16| Bytes| Not sure what this is    |
| btcommon.apple.airpods.batterystatus        | AirPods L/R Battery Level Byte| 88                        |   1  | None  | This is a tree           | 
| btcommon.apple.airpods.charingstatus        | Charging Status Byte         | 8f                         |   1  | None  | This is a tree           |
| btcommon.apple.airpods.casebatterystatus    | Case Battery Level Byte      | 8f                         |   1  | None  | This is a tree           |
| btcommon.apple.airpods.batterychargingstatus| Battery and Charging Status Bytes|888f                    |   2  | None  | This is a tree           |

## Hey Siri Message (btcommon.apple.type == 0x08)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                       |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:---------------------------:|
| btcommon.apple.siri.perphash                | Perceptual Hash of Command   |   d6ec                     |   2  | Bytes | From Cunche Paper           |
| btcommon.apple.siri.snr                     | Signal-to-Noise Ration       |   43                       |   1  | Bytes | Not sure if dbm or db       |
| btcommon.apple.siri.confidence              | Confidence Level             |   00                       |   1  | Bytes | Not sure what scale is used |
| btcommon.apple.siri.deviceclass             | Device Class                 | Homepod (0x0007)           |   2  | UINT16|                             |
| btcommon.apple.siri.randbyte                | Random Byte                  |   ca                       |   1  | Bytes | Not sure the purpose of this|


## AirPlay Target Message (btcommon.apple.type == 0x09)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                    |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:------------------------:|
| btcommon.apple.airplay.flags                | AirPlay Flags                |   03                       |   1  | Bytes | Needs more work          |
| btcommon.apple.airplay.seed                 | AirPlay Seed                 |   07                       |   1  | Bytes | Unknown what this is for |
| btcommon.apple.airplay.ip                   | AirPlay IPv4 Address         |   192.168.1.2              |   4  | IPv4  |                          |

## AirPlay Source Message (btcommon.apple.type == 0x0a)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                    |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:------------------------:|
| btcommon.apple.airplay.data                 | Unknown AirPlay Source Data  | 00                         | 1    | Bytes | Only seen to be 0x00     |


## Magic Switch Message (btcommon.apple.type == 0x0b)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                 |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:---------------------:|
| btcommon.apple.magicswitch.data             | Data                         |    c4b5                    |  2   | Bytes | Not sure what this is |
| btcommon.apple.magicswitch.confidence       | Confidence on Wrist          |    On Wirst (0x3f)         |  1   | UINT8 |                       |

## Handoff Message (btcommon.apple.type == 0x0c)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                 |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:---------------------:|
| btcommon.apple.handoff.copy                 | Copy/Cut Performed           |  No (0x0)                  |  1   | BOOL  |                       |
| btcommon.apple.handoff.seqnum               | IV (Sequence Number)         |  23113                     |  2   | UINT16|                       |
| btcommon.apple.handoff.authtag              | AES-GCM Auth Tag             |  48                        |  1   | Bytes |                       |
| btcommon.apple.handoff.encdata              | Encrypted Handoff Data       | f28a1927bd62fd895b5a       |  10  | Bytes |                       |

## Tethering Target (Wi-Fi Settings Page) Message (btcommon.apple.type == 0x0d)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes      |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:----------:|
| btcommon.apple.tethtgt.icloudid               | iCloud ID                    |  67f36d01                |  4   | Bytes | Derived from user's iCloud DSID. Rotates every 24 hours. Constant across all devices on same iCloud Account|

## Tethering Source (Instant Hotspot) Message (btcommon.apple.type == 0x0e)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                            |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:--------------------------------:|
| btcommon.apple.tethsrc.version              | Version                      |     01                     |  1   | Bytes |Note sure what this pertains to   |
| btcommon.apple.tethsrc.flags                | Flags                        |     00                     |  1   | Bytes |Note sure what these flags mean   |
| btcommon.apple.tethsrc.battery              | Battery Life (%)             |     87                     |  1   | UINT8 |                                  |
| btcommon.apple.tethsrc.celltype             | Cellular Connection Type     |     LTE (7)                |  2   | UINT16|                                  |
| btcommon.apple.tethsrc.cellbars             | Cell Service Quality (Bars)  |     5                      |  1   | UINT8 |                                  |

## Nearby Action Message (btcommon.apple.type == 0x0f)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                            |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:--------------------------------:|
| btcommon.apple.nearbyaction.flags           | Nearby Action Flags          | 40                         | 1    | Bytes | Auth Tag bit. Not sure about others|   
| btcommon.apple.nearybaction.flags.authtag   | Auth Tag Flag                | Absent                     | 1    | Bool  |                                    |
| btcommon.apple.nearbyaction.type            | Nearby Action Type           | Wi-Fi Password (0x08)      | 1    | UINT8 |Not all types dissect properly      |
| btcommon.apple.nearbyaction.auth            | Auth Tag                     | 390087                     | 3    | Bytes | 390087                             |
| btcommon.apple.nearbyaction.wifijoin.ssid   |First 3 bytes SHA256(SSID)    |f9575b                      | 3    | Bytes |                                    |
| btcommon.apple.nearbyaction.wifijoin.appleid|First 3 bytes SHA256(Apple ID)| 3455e6                     | 3    | Bytes |                                    | 
| btcommon.apple.nearbyaction.wifijoin.phonenumber|First 3 bytes SHA256(Phone Number)|395504              | 3    | Bytes |                                    |
| btcommon.apple.nearbyaction.wifijoin.email  |First 3 bytes SHA256(Email)   | 09fc87                     | 3    | Bytes |                                    | 
| btcommon.apple.nearbyaction.setup.device_class| Device Class               | iPhone (0x2)               | 1    | UINT8 |                                    |
| btcommon.apple.nearbyaction.setup.device_model| Device Model               | D22 (X, Xs, XSMax) (0x1)   | 1    | UINT8 |                                    |
| btcommon.apple.nearbyaction.setup.device_color| Device Color               | Black (0x1)                | 1    | UINT8 |                                    |
| btcommon.apple.nearbyaction.setup.msg_ver     | Message Version            | 10                         | 1    | UINT8 | Might be protocol version? Not sure|
| btcommon.apple.nearbyaction_data              | Unknown Data               |8bdab64875208f0c7280ae0599350000632fc5| Varies| Bytes| Used for unknown sub types|

## Nearby Info Message (btcommon.apple.type == 0x10)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                              |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:----------------------------------:|
| btcommon.apple.nearbyinfo.statusflags       | Nearby Info Status Flags     | 0x03                       | 1    | UINT8 |                                    |
| btcommon.apple.nearbyinfo.unk.flag          | Unknown Flag                 | Off (0x0)                  | 1    | BOOL  | Not sure about this flag           |
| btcommon.apple.nearbyinfo.primary_device    | Primary Device Flag          | No (0x0)                   | 1    | BOOL  |                                    |
| btcommon.apple.nearbyinfo.unk.flag2         | Unknown Flag                 | Off (0x0)                  | 1    | BOOL  | Seen with iPhone 11                |
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

## Find My Message (btcommon.apple.type == 0x12)
| Field Name                             | Info                             | Example                    |Length| Type  | Notes                                   |
| :--------------------------------------| :--------------------------------|:--------------------------:|:----:|:-----:|:---------------------------------------:|
| btcommon.apple.findmy.status           | Owner Connection & Battery Status| 00                         | 1    | UINT8 | Have only seen 0x00                     |
| btcommon.apple.findmy.publickey        | Bytes 6-27 of Public Key         | 57364dc7fb77866c40c91076603cb37c1f59f923ab3a|22|Bytes|                              |
| btcommon.apple.findmy.publickey.bits   | Bits 6-7 of Byte 0 of Public Key|  03                         | 1    | UINT8| Only bits 0-1 used; Bits 2-7 are reserved|
| btcommon.apple.findmy.hint             | Byte 5 of BT_ADDR of Primary key | 00                         | 1    | UINT8 |Have only seen 0x00                      |
| btcommon.apple.findmy.publickey.xcord  | 28-byte x-coord of Public Key    | b953267519a8ef5b0bdea8bc5bf80bd0ee47e7d68b2bb8319cbbee0|28|STRING|                  |

 
