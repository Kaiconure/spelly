# Spelly

### Introduction

Spelly is an addon that lets you track known and learnable spells based on your current job/sub and level. The most obvious scenario here is checking if you've got a certain set of spells before heading out to meet a party. This is *also* very handy when viewing a long list of trust ciphers from an event NPC, where you want to be sure you don't get something you've already learned.

### Usage

Spelly has some very simple commands for you to run:

- `check <pattern>` - Identifies unknown (but currently learnable) spells matching the specified pattern. For example, run `//spelly check fire` to show any fire spells you can still learn.
- `known <pattern>` - Identifies known and usable spells matching the specified pattern. For example, run `//spelly known fire` to show all fire spells you already know and can use.

Spelly patterns are "starts with" sequences, so any matching spell that starts with your pattern will be shown. If you do *not* specify a pattern, all matching spells will be shown regardless of name.

Spelly outputs spells in alphabetical order.

### Sample Output

| ![spelly check k](C:\Users\leile\Dropbox\My Documents\Windower4\addons\spelly\content\spelly_check.png) | ![spelly known k](C:\Users\leile\Dropbox\My Documents\Windower4\addons\spelly\content\spelly_known.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Sample output from: `//spelly check k`                       | Sample output from: `//spelly known k`                       |



