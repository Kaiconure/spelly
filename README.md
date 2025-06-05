# Spelly

### Introduction

Spelly is an addon that lets you track known and learnable spells based on your current job/sub and level. 

The most obvious scenario here is checking if you've got a certain set of spells before heading out to meet a party. This is *also* very handy when viewing a long list of trust ciphers from an event NPC, where you want to be sure you don't get something you've already learned.

### Usage

Spelly has some very simple commands for you to run:

- `check <pattern>` - Identifies unknown (but currently learnable) spells matching the specified pattern. For example, run `//spelly check fire` to show any fire spells you can still learn.
- `known <pattern>` - Identifies known and usable spells matching the specified pattern. For example, run `//spelly known fire` to show all fire spells you already know and can use.

Spelly patterns are "starts with" sequences, so any matching spell that starts with your pattern will be shown. If you do *not* specify a pattern, all matching spells will be shown regardless of name.

Spelly outputs spells in alphabetical order.

### Demo

#### Checking for missing spells

Running `//spelly check boost` to see which "boost" spells my WHM still needs to learn:

![](C:\Users\leile\Dropbox\My Documents\Windower4\addons\spelly\content\spelly_check.png)

Spelly *only* looks at spells that are learnable by your current main/sub job.

#### Checking for known spells

Running `//spelly known boost` to see which "boost" spells my WHM already knows:

![](C:\Users\leile\Dropbox\My Documents\Windower4\addons\spelly\content\spelly_known.png)

Spelly *only* looks at spells that are usable by your current main/sub job.
