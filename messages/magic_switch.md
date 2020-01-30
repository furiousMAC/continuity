<h1>Magic Switch Message</h1>

<p> 
The Magic Switch Message is an Apple Watch-specific message sent when a user is
wearing an Apple Watch that has lost its connection to its paired iPhone while
its screen is on. 
</p> 

<p>
This message type was first mentioned in 
<a
href="https://petsymposium.org/2019/files/papers/issue4/popets-2019-0057.pdf">Handoff
All Your Privacy &mdash; A Review of Apple's Bluetooth Low Energy Continuity
Protocol</a> by Martin <i>et al.</i>, but
more thoroughly described by Guillaume Celosia and Mathieu Cunche in 
<a
href="https://petsymposium.org/2020/files/papers/issue1/popets-2020-0003.pdf">Discontinued
Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity
Protocols</a>.
</p>

<div align="center">
<img src="/figs/magic_switch_format.png">
</div>

<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x0B -- indicates an Magic Switch message
</li>
<li>
Length: 1 byte, 0x03 -- number of bytes in the message payload
</li>
<li>
Data: 2 bytes
</li>
<li>
Confidence: 1 byte
</li>
</ul>
