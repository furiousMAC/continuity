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
0x02 -- Indicates if device is being used as a hotspot
</li>
<li>
0x04 -- Indicates whether AirDrop is enabled
</li>
<li>
0x08 -- Unused
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
iOS Dependent: 1 byte
<ul>
<li>
0x00 -- Observed in iOS 10; meaning unclear
</li>
<li>
0x10 -- Observed in iOS 11; meaning unclear
</li>
<li>
0x0C -- Observed in iOS 12 when joining WiFi network
</li>
<li>
0x18 -- Observed in iOS 12 when WiFi is off
</li>
<li>
0x01 -- Observed in iOS 12 when WiFi is on
</li>
</ul>
</li>
<li>
Authentication Tag: 3 bytes
</li>
</ul>
