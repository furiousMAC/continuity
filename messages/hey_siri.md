<h1>"Hey Siri" Message</h1>

<p> 
"Hey Siri" messages are emitted by a device when the voice assistant Siri is
used. Of note, a perceptual hash of the voice command is included in the packet. 
This message format, as well as a dictionary attack on the perceptual hash value
was first described Guillaume Celosia and Mathieu Cunche in 
<a
href="https://petsymposium.org/2020/files/papers/issue1/popets-2020-0003.pdf">Discontinued
Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity
Protocols</a>.

</p>

<div align="center">
![hey siri format](/figs/hey_siri.png)
</div>

<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x08 -- indicates a "Hey Siri" message
</li>
<li>
Length: 1 byte, 0x07 -- number of bytes in message payload
</li>
<li>
Perceptual Hash: 2 bytes -- perceptual hash of the user's voice command
</li>
<li>
SNR: 1 byte
</li>
<li>
Confidence: 1 byte
</li>
<li>
Device Class: 2 bytes
</li>
<li>
Random Byte: 1 byte
</li>
</ul>
