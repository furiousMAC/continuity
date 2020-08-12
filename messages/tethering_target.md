<h1>Tethering Target Message</h1>

<p> The Tethering Target Continuity message is broadcast in order to elicit a
response from a device to be used as a hotspot, which will reply with a
Tethering Source message. In a typical usage example, a user clicks on the menu
button that displays the list of available WiFi networks on a MacBook. This
action generates a stream of Tethering Target messages that continue for the
duration of the period in which the available networks tab is opened. In
response, a hotspot-capable device linked to the same iCloud account (an iPhone
or iPad with cellular connection) responds with Tethering Source messages to
advertise its presence and connection capabilities, including battery status,
type of cellular connection, and strength of cellular signal.
</p>

<div align="center">
<img src="/figs/tethering_target_format.png">
</div>


<p>The message fields, observed values and their meaning:</p>

## Tethering Target (Wi-Fi Settings Page) Message (btcommon.apple.type == 0x0d)
| Field Name                                  | Info                         | Example                   |Length| Type  | Notes      |
| :-------------------------------------------| :----------------------------|:--------------------------|:----:|:-----:|:----------:|
| btcommon.apple.tethtgt.icloudid               | iCloud ID                    |  67f36d01                 |  4   | Bytes | Derived from user's iCloud DSID. Rotates every 24 hours. Constant across all devices on same iCloud Account|

