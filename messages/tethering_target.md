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
![tethering target format](/figs/tethering_target_format.png)
</div>


<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x0D -- indicates a Tethering Target message
</li>
<li>
Length: 1 byte, 0x04-- number of bytes in the message payload
</li>
<li>
Identifier: 4 bytes, variable -- An identifier tied to a user's Destination
Signaling IDentifier (DSID) that rotates on a 24-hour cycle. This identifier can
be used to track a user despite the use of random BD_ADDR.
</li>
</ul>
