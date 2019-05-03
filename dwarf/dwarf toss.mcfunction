#Scoreboards: 1) dummy: dtoss, dtossTimer, dtossCdUI, dtossTimerEnd, perSec, dtossCycle
#             2) dropped.minecraft:purple_dye: dtossDrop
#Set scoreboard values: perSec 20, dtoss 0, dtossTimer 0



execute as @a[team=dwarf,nbt={SelectedItem:{id:"minecraft:purple_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Dwarf Toss\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Lore:["Equip to slot 6. Drop to activate"]}}},SelectedItemSlot:5},scores={dtoss=0}] run scoreboard players set @s dtoss 1
execute as @a[team=dwarf,scores={dtossDrop=1,dtoss=1,dtossTimer=0}] run scoreboard players set @s dtossTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:purple_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Dwarf Toss\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Lore:["Equip to slot 6. Drop to activate"]}}}}]
scoreboard players add @a[scores={dtossTimer=1..}] dtossTimer 1
execute as @a[scores={dtossTimer=2}] at @s run effect give @e[distance=..5] minecraft:resistance 1 255 true
execute as @a[scores={dtossTimer=2}] run replaceitem entity @s armor.feet minecraft:diamond_boots{Enchantments:[{id:"minecraft:feather_falling",lvl:100}]} 1
execute at @a[scores={dtossTimer=2}] run summon creeper ~ ~ ~ {CustomNameVisible:0b,ExplosionRadius:1b,Fuse:0,CustomName:"{\"text\":\"Dwarven Take-off\"}"}
execute at @a[scores={dtossTimer=5}] run particle minecraft:explosion ~ ~ ~ 2 0 2 0.05 500


execute as @a[tag=!notoss,tag=!notintheair,scores={dtossTimer=6..100}] at @s unless block ~ ~-0.1 ~ air run tag @s add notintheair
tag @a[tag=notintheair] add notoss
effect give @a[tag=notintheair] minecraft:resistance 1 127 true
#need to replace next command with replaceitem when all the classes are released
execute as @a[tag=notintheair] at @s run effect give @a[distance=..5] minecraft:resistance 1 2 true
execute as @a[tag=notintheair] at @s run tp @p ~ ~-0.5 ~
execute as @a[tag=notintheair,scores={dtossTimer=..24}] at @s run summon creeper ~ ~0.5 ~ {CustomNameVisible:0b,ExplosionRadius:1b,Fuse:0,CustomName:"{\"text\":\"Dwarven Flop\"}"}
execute as @a[tag=notintheair,scores={dtossTimer=25..34}] at @s run summon creeper ~ ~0.5 ~ {CustomNameVisible:0b,ExplosionRadius:2b,Fuse:0,CustomName:"{\"text\":\"Dwarven Landing\"}"}
execute as @a[tag=notintheair,scores={dtossTimer=35..44}] at @s run summon creeper ~ ~0.5 ~ {CustomNameVisible:0b,ExplosionRadius:3b,Fuse:0,CustomName:"{\"text\":\"Dwarven Plunge\"}"}
execute as @a[tag=notintheair,scores={dtossTimer=45..100}] at @s run summon creeper ~ ~0.5 ~ {CustomNameVisible:0b,ExplosionRadius:4b,Fuse:0,CustomName:"{\"text\":\"The Legendary Airborne Dwarf\"}"}
execute as @a[tag=notintheair,scores={dtossTimer=45..100}] at @s run scoreboard players add @a[tag=!notintheair,distance=..7] stunned 20
#need to replace next command with replaceitem when all the classes are released
execute as @a[tag=notintheair] at @s run effect clear @a[distance=..5] minecraft:resistance
tag @a[tag=notintheair] remove notintheair
tag @a[tag=notoss,scores={dtossTimer=0}] remove notoss



#start timer
execute as @a[scores={dtossTimer=0,dtossCycle=1..}] run scoreboard players set @s dtossCycle 0
scoreboard players add @a[scores={dtossTimer=1..}] dtossTimer 1

scoreboard players set @a[scores={dtossTimer=2}] dtossCdUI 40
execute as @a[scores={dtossTimer=2}] run scoreboard players operation @s dtossTimerEnd = @s dtossCdUI
execute as @a[scores={dtossTimer=2}] run scoreboard players operation @s dtossTimerEnd *= @s perSec

#start cycle
execute as @a[scores={dtossTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:5}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"dtossCdUI"},"color":"dark_purple","bold":"true"}]
execute as @a[scores={dtossTimer=1..}] run scoreboard players add @s dtossCycle 1
execute as @a[scores={dtossCycle=20}] run scoreboard players remove @s dtossCdUI 1
execute as @a[scores={dtossCycle=20}] run scoreboard players set @s dtossCycle 0

execute as @a[team=dwarf,scores={dtoss=1},nbt=!{SelectedItem:{id:"minecraft:purple_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Dwarf Toss\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Lore:["Equip to slot 6. Drop to activate"]}}},SelectedItemSlot:5}] run scoreboard players set @s dtoss 0
execute as @a[scores={dtossTimer=2..}] if score @s dtossTimer = @s dtossTimerEnd run replaceitem entity @s hotbar.5 minecraft:purple_dye{display:{Name:"{\"text\":\"Dwarf Toss\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Lore:["Equip to slot 6. Drop to activate"]}} 1
scoreboard players set @a[scores={dtossDrop=1..}] dtossDrop 0
execute as @a[scores={dtossTimer=2..}] if score @s dtossTimer = @s dtossTimerEnd run scoreboard players set @s dtossTimer 0