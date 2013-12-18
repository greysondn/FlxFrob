FlxFrob
=======

Aimlessly finetune and benchmark your Flixel-based projects!

v0.00  
17 December 2013
Init repository, write README

Purpose
-------

The purpose comes from the word "frobnicate" - to twiddle or adjust aimlessly - in the Jargon File. In here I'll push my tools for adjusting, tweaking, profiling, and so forth code written in AS3 using Flixel.

I don't promise it to be good or particularly useful. It just seems like it solves the "need to tweak this at runtime" problem. Make sure to check the button bindings; better alternative solutions are on the way but these things take time and this can be useful now.

Other Notes
-----------

None, really. It's quite a freshman effort, but I wanted to see if I couldn't give something back other than my aimless desire to help and code that gets broken by updates. The flixel-community has been nothing but kind to me - well, the maintainers, anyway.

Backstory
-------

So, while working on a game, I was the only programmer, and had a single partner (generally) who was a writer that couldn't wrap his head around code well. AS3 is notoriously a pain for the compilation step and - most importantly - having testing broken up by a compiler meant we couldn't just "feel" the correct settings for physics and health and such out. We had to repeatedly guess and check. (To those who advocate the more scientific approaches to such things - isn't it more in the spirit of gaming to make a debug method?)

Later on, I needed a simple profiling solution and none was forthcoming. I also needed to see how the stack was working itself down through function calls in only my own code. So a few new tricks got added to my profiler, as it was. Those, as of this writing, are not functional. And I probably want to add some flags in and such. I have a todo list miles long and frankly it's a small miracle that this much even got done.

This was also - in part - inspired by a quote: "Creators need an immediate connection to what they create" (Bret Victor, as part of "Inventing On Principle" http://worrydream.com/#!/InventingOnPrinciple ). I remember the first time I saw that talk, I was sort of struck by how insanely right his narrative and point felt for any sort of creative computing - anything that came anywhere remotely close to Computational Media (and his work shows a feel for Computational Media, even if it isn't his chosen forte).
