<h1>AirPrint Message</h1>

<p> 
AirPrint is an Apple technology designed to enable printing from iOS and macOS
devices without needing to install additional software if the printer supports
AirPrint. 
</p> 

<p>
This message type was first described by Guillaume Celosia and Mathieu Cunche in 
<a
href="https://petsymposium.org/2020/files/papers/issue1/popets-2020-0003.pdf">Discontinued
Privacy: Personal Data Leaks in Apple Bluetooth-Low-Energy Continuity
Protocols</a>.
</p>

<div align="center">
<img src="/figs/airprint_format.png">
</div>


<p>The message fields, observed values and their meaning:</p>

<ul>
<li>
Type: 1 byte, 0x03 -- indicates an AirPrint message
</li>
<li>
Length: 1 byte, 0x16 -- number of bytes in the message payload
</li>
<li>
Address Type: 1 byte
</li>
<li>
Path Resource Type: 1 byte
</li>
<li>
Security Type: 1 byte
</li>
<li>
QID or TCP Port: 2 bytes
</li>
<li>
IPv4/6 Address: 16 bytes
</li>
<li>
Measured Power: 1 byte
</li>
</ul>
