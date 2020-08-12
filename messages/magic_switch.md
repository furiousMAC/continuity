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

## Magic Switch Message (btcommon.apple.type == 0x0b)
| Field Name                                  | Info                         | Example                   |Length| Type  | Notes                 |
| :-------------------------------------------| :----------------------------|:--------------------------|:----:|:-----:|:---------------------:|
| btcommon.apple.magicswitch.data             | Data                         |    c4b5                   |  2   | Bytes | Not sure what this is |
| btcommon.apple.magicswitch.confidence       | Confidence on Wrist          |    On Wirst (0x3f)        |      | UINT8 |                       |
