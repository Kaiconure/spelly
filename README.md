# Spelly

### Introduction

Spelly is an addon that lets you track known and learnable spells based on your current job/sub and level. 

The most obvious scenario here is checking if you've got a certain set of spells before heading out to meet a party. This is *also* very handy when viewing a long list of trust ciphers from an event NPC, where you want to be sure you don't get something you've already learned.

You can get the latest release from the [Spelly GitHub](https://github.com/Kaiconure/Spelly) page.

### Usage

Spelly has some very simple commands for you to run:

- `check [-type <type>] <pattern>` - Identifies unknown (but currently learnable) spells matching the specified pattern. For example, run `//spelly check fire` to show any fire spells you can still learn.
- `known [-type <type>] <pattern>` - Identifies known and usable spells matching the specified pattern. For example, run `//spelly known fire` to show all fire spells you already know and can use.

The optional *type* argument (specified with either `-type` or `-t` for short)  can be used to filter the list to only spells of a specific type. Valid types can be found in the *spells.json* file under Windower resources, but I've listed them out here for convenience:

- BardSong
- BlackMagic
- BlueMagic
- Geomancy
- **Mount** *(see the note under Demos below)*
- Ninjutsu
- SummonerPact
- Trust
- WhiteMagic

Spelly patterns are "starts with" sequences, so any matching spell that starts with your pattern will be shown. If you do *not* specify a pattern, all matching spells will be shown regardless of name.

Spelly outputs spells in alphabetical order.

### Demo

#### Checking for missing spells

Running `//spelly check boost` to see which "boost" spells my WHM still needs to learn:

![](content/spelly_check.png)

Spelly *only* looks at spells that are learnable by your current main/sub job.

#### Checking for known spells

Running `//spelly known boost` to see which "boost" spells my WHM already knows:

![](content/spelly_known.png)

Spelly *only* looks at spells that are usable by your current main/sub job.

#### Counting known trust spells

You can run `//spelly known -t trust` to see how many trusts you've already learned. Similarly, you can run `//spelly check -t trust` to see how many trusts you have yet to acquire.

#### Mounts

By popular demand, I've made Spelly aware of mounts. While not technically spells, they share a very similar use case with checking and learning trust ciphers.

Spelly will *only* look at mounts when you specify a "mount" type. All other commands will work the same (check, known, etc).

You can run `//spelly check -t mount cra` to check if you still need to unlock mounts like *Crawler* or *Crab*. You can run `//spelly known -t mount` to check all the mounts you already know.
