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


- Type: 1 byte, 0x03 -- indicates an AirPrint message (```btcommon.apple.type == 0x03```)
- Length: 1 byte, 0x16 -- number of bytes in the message payload (```btcommon.apple.length```)
- Address Type: 1 byte (```btcommon.apple.airprint.addrtype```)
- Path Resource Type: 1 byte (```btcommon.apple.airprint.resourcepathtype```)
- Security Type: 1 byte (```btcommon.apple.airprint.securitytype```)
- QID or TCP Port: 2 bytes (```btcommon.apple.airprint.qidport```)
- IPv4/6 Address: 16 bytes (```btcommon.apple.airprint.ipaddr```)
- Measured Power: 1 byte (```btcommon.apple.airprint.power```)
