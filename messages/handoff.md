<h1>Handoff Message</h1>

<p> 
Handoff Messages enable users to start tasks on one iOS or macOS device and
finish them on another. Handoff is supported with the Apple Calendar, Contacts,
Mail, Maps, Messages, Notes, Reminders, Safari, Pages, Numbers, Keynote
applications, as well as certain third-party applications that are designed to
support Handoff by their developers. 
</p> 

<p>
This message type was first described by Guillaume Celosia and Mathieu Cunche in 
<a
href="https://petsymposium.org/2020/files/papers/issue1/popets-2020-0003.pdf">Discontinued
Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity
Protocols</a>.
</p>

<div align="center">
<img src="/figs/handoff_format.png">
</div>


## Handoff Message (btcommon.apple.type == 0x0c)
| Field Name                                  | Info                         | Example                    |Length| Type  | Notes                 |
| :-------------------------------------------| :----------------------------|:--------------------------:|:----:|:-----:|:---------------------:|
| btcommon.apple.handoff.copy                 | Copy/Cut Performed           |  No (0x0)                  |  1   | UINT8 |                       |
| btcommon.apple.handoff.seqnum               | IV (Sequence Number)         |  23113                     |  2   | UINT16|                       |
| btcommon.apple.handoff.authtag              | AES-GCM Auth Tag             |  48                        |  1   | Bytes |                       |
| btcommon.apple.handoff.encdata              | Encrypted Handoff Data       | f28a1927bd62fd895b5a       |  10  | Bytes |                       |

<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x0C -- indicates a Handoff message
</li>
<li>
Length: 1 byte -- number of bytes in the message
</li>
<li>
Version: 1 byte
</li>
<li>
Initialization Vector: 2 bytes
</li>
<li>
AES-GCM Auth Tag: 1 byte
</li>
<li>
Encrypted Payload: 10 bytes
</li>
</ul>
