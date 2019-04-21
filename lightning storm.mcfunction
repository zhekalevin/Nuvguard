execute as @a[team=shaman,scores={storm=0},nbt={SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}},SelectedItemSlot:4}] run scoreboard players set @s storm 1
execute as @a[team=shaman,scores={lightbluedrop=1,storm=1,stormtimer=0}] run scoreboard players set @s stormtimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}}}]

#start timer
execute as @a[scores={stormtimer=0,stormcycle=1..}] run scoreboard players set @s stormcycle 0
scoreboard players add @a[scores={stormtimer=1..}] stormtimer 1
execute as @a[scores={stormtimer=2}] at @s run summon area_effect_cloud ~ ~ ~ {Duration:150,Tags:["stormmarker"]}

#start cycle
execute as @a[scores={stormtimer=1..}] run scoreboard players add @s stormcycle 1
execute as @a[scores={stormcycle=5}] at @s run spreadplayers ~ ~ 1 5 false @e[tag=stormmarker,limit=1,sort=nearest]
execute as @a[scores={stormcycle=5}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~ 
execute as @a[scores={stormcycle=5}] run scoreboard players set @s stormcycle 0

execute as @a[team=shaman,scores={storm=1},nbt=!{SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}},SelectedItemSlot:4}] run scoreboard players set @s storm 0
replaceitem entity @a[scores={stormtimer=150}] hotbar.4 minecraft:light_blue_dye{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}} 1
scoreboard players set @a[scores={lightbluedrop=1..}] lightbluedrop 0
scoreboard players set @a[scores={stormtimer=150..}] stormtimer 0