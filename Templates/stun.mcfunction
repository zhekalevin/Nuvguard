# this is a function for when a player is STUNned. To activate STUN, simply ADD (not set) x to score of scoreboard 'stunned' to victim (x is the number of ticks you want stun to last)
# will not prevent player from levitating if he is in the air already
# Im currently working to stop players from using their abilities while stunned and adding an UNSTOPPABLE tag which will prevent STUNNED from being applied.

effect give @a[scores={stunned=1..}] minecraft:blindness 1 0 true
effect give @a[scores={stunned=1..}] minecraft:nausea 1 127 true
effect give @a[scores={stunned=1..}] minecraft:slowness 1 127 true
effect give @a[scores={stunned=1..}] minecraft:jump_boost 2 128 true
execute as @a[scores={stunned=1..}] at @s run particle minecraft:angry_villager ~ ~2 ~ 0.15 0.1 0.15 0 1
effect clear @a[scores={stunned=1}] minecraft:blindness
effect clear @a[scores={stunned=1}] minecraft:nausea
effect clear @a[scores={stunned=1}] minecraft:jump_boost
effect clear @a[scores={stunned=1}] minecraft:slowness
scoreboard players remove @a[scores={stunned=1..}] stunned 1