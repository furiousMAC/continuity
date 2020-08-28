# Major Changes to Wireshark Dissector Since Shmoocon Public Releas

## General Dissector Changes
1. **Printing "Company ID: Apple" Twice**
    - Got rid of line of code that caused "Company ID: Apple, Inc" to be printed out twice in the GUI
2. **Changed MacOS Detection Byte**
    - MacOS does not relate back to the old "iOS dependent byte" anymore, but rather is just a string in the GUI.
    

## AirPrint Message (Type 3)
1. **Changed field types**)
    - ```btcommon.apple.airprint.qidport``` changed to FT_UINT16, BASE_DEC

## Airpods Message (Type 7) 
1. **Added a "Battery Levels & Charging Status" subtree, with 3 subtrees under it**
    - Airpods L/R Battery Level subtree
    - Airpods Charging Status subtree
    - Airpods Case Battery Level subtree
2. **Changed "utp" field to "status" field**
    - **Var Name:** ```hf_btcommon_apple_airpods_status``` **Field Name:** ```btcommon.apple.airpods.status```
3. **Changed ```airpods_utp_vals``` value_string to ```airpods_status_vals```**
4. **Added AirPods Pro Model Value**
    - Added Model value of 0x0e20 for AirPods Pro
## Nearby Action (WiFi Join) Message (Type 15) 
1. Fixed bug with a_length causing buffer to overrun when dissecting unknown subtypes.

## Handoff Message (Type 12)
1. Changed variable/field names for more clarity:
    - **Var Name:** ```hf_btcommon_apple_handoff_copy``` **Field Name:** ```btcommon.apple.handoff.copy```
    - **Var Name:** ```hf_btcommon_apple_handoff_seq``` **Field Name:** ```btcommon.apple.handoff.seqnum```
    - **Var Name:** ```hf_btcommon_apple_handoff_authtag``` **Field Name:** ```btcommon.apple.handoff.authtag```
    - **Var Name:** ```hf_btcommon_apple_handoff_encdata``` **Field Name:** ```btcommon.apple.handoff.encdata```

## Tethering Source (Type 13)
1. Changed variable/field name of icloudID for more clarity:
    - **Var Name:** ```hf_btcommon_apple_tethtgt_icloudid``` **Field Name:** ```btcommon.apple.tethtgt.icloudid```

## Tethering Source (Type 14)
1. Fixed dissection of battery life (now actually dissects as a percent value)
2. Changed value_string for 3gpp variable name from ```nearby_3gpp_vals``` to ```cellular_type_vals```
3. Changed variable/field name of 3gpp (cellular type) for more clarity:
    - **Var Name:** ```hf_btcommon_apple_tethsrc_celltype``` **Field Name:** ```btcommon.apple.tethsrc.celltype```


## Nearby Action Message (Type 15)
1. Added iPhone SE (2nd Gen) to iOS Setup Subtype (0x09)
    - Added "SE (2nd Gen)" to ```device_model_vals``` value_string for 0x0 (```btcommon.apple.nearbyaction.setup.device_model```)
    - Changed ```device_model_vals``` value_string for 0x20 from "SE" to "SE (1st Gen)" (```btcommon.apple.nearbyaction.setup.device_model```)
## Nearby Info Message (Type 16) 

1. **Changed Nearby Info Fields**
- Status Flags: 4 bits -- Used as a bitmask, more than one may be enabled at any time (```btcommon.apple.nearbyinfo.statusflags```)
    - 0x01 -- Indicates if this is the primary iCloud account device 
        - ```btcommon.apple.nearbyinfo.primary_device```
    - 0x02 -- Unknown 
        - ```btcommon.apple.nearbyinfo.unk.flag```
    - 0x04 -- Indicates whether AirDrop Receiving is enabled 
        - ```btcommon.apple.nearbyinfo.airdrop_status```
    - 0x08 -- Unused
- Action Code: 4 bits  -- indicates the action state of the device (```btcommon.apple.nearbyinfo.action_code```)
    - 0x00 -- Activity Level Unknown
    - 0x01 -- Activity Reporting Disabled
    - 0x03 -- Locked Phone
    - 0x05 -- Audio playing while screen locked
    - 0x07 -- Active user (screen on)
    - 0x09 -- Screen on with video playing
    - 0x0A -- Watch on wrist and unlocked
    - 0x0B -- Recent user interaction
    - 0x0D -- User is driving a vehicle
    - 0x0E -- Phone or Facetime Call
- Data Flags: 8 bits -- Used as a bitmask, more than one may be enabled at any time (```btcommon.apple.nearbyinfo.dataflags```)
    - 0x01 -- Indicates if AirPods are connected and the screen is on 
        - ```btcommon.apple.nearbyinfo.airpod.connection```
    - 0x02 -- Indicates if the Authentication Tag is 4 bytes or not
        - ```btcommon.apple.nearbyinfo.authtag.fourbyte```
    - 0x04 -- Indicates whether WiFi is on or off 
        - ```btcommon.apple.nearbyinfo.wifi_status```
    - 0x08 -- Unknown 
        - ```btcommon.apple.nearbyinfo.unk.flag2```
    - 0x10 -- Indicates whether the Authentication Tag is present or not 
        - ```btcommon.apple.nearbyinfo.authtag_present```
    - 0x20 -- Indicates whether the Apple Watch is locked or not 
        - ```btcommon.apple.nearbyinfo.watch_locked```
    - 0x40 -- Indicates whether Auto Unlock on the Apple Watch is enabled or not 
        - ```btcommon.apple.nearbyinfo.autounlock_watch```
    - 0x80 -- Indicates whether Auto Unlock is enabled or not 
        - ```btcommon.apple.nearbyinfo.autounlock_enabled```

- Authentication Tag: Variable (3-4 bytes) (```btcommon.apple.nearbyinfo.auth```)

2. **Changed OS detection logic**
    - no longer based off of "iOS dependent byte" (Since it's actually 8 unique 1-bit flags")

3. **Added new post-auth tag data field in Nearby Info message**
    - noticed 0x80 often after auth tag (clearly not part of auth tag)

4. **Added auth tag dissection based off of "4 byte auth tag" field**
    - Uses this 1 bit flag to decide whether the auth tag is 3 or 4 bytes


## Find My Message (Type 18) 

1. **Added New Message Type**





