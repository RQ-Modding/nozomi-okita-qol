# Testing Nozomi Okita QoL

For people and agents who test the mod in the game. Read it before you use anything the mod adds.

Needs Nozomi Okita (character 13) in the party. No controls.

1. With the Poison Mask (item 195) on her, start a battle. `rq.chara.get(iic).status` must be 0, and the battle log must not say she is poisoned.
2. Without the mask it must be 1.

## Test Lab

`agent-lab.ps1 run qol` checks the mask and the hidden log line.
