#Scoreboards: 1) dummy: storm, stormTimer, stormCycle
#             2) dropped.minecraft.light_blue_dye: stormDrop
#Set scoreboard values: storm 0, stormTimer 0

execute as @a[team=shaman,scores={storm=0},nbt={SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:4}] run scoreboard players set @s storm 1
execute as @a[team=shaman,scores={stormDrop=1,storm=1,stormTimer=0}] run scoreboard players set @s stormTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}}}]

#start timer
execute as @a[scores={stormTimer=0,stormCycle=1..}] run scoreboard players set @s stormCycle 0
scoreboard players add @a[scores={stormTimer=1..}] stormTimer 1
execute as @a[scores={stormTimer=2}] at @s run summon area_effect_cloud ~ ~ ~ {Duration:150,Tags:["stormMarker"]}

#start cycle
execute as @a[scores={stormTimer=1..}] run scoreboard players add @s stormCycle 1
execute as @a[scores={stormCycle=5}] at @s run spreadplayers ~ ~ 1 5 false @e[tag=stormMarker,limit=1,sort=nearest]
execute as @a[scores={stormCycle=5}] at @s at @e[tag=stormMarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~ 
execute as @a[scores={stormCycle=5}] run scoreboard players set @s stormCycle 0

execute as @a[team=shaman,scores={storm=1},nbt=!{SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:4}] run scoreboard players set @s storm 0
replaceitem entity @a[scores={stormTimer=150}] hotbar.4 minecraft:light_blue_dye{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}} 1
scoreboard players set @a[scores={stormDrop=1..}] stormDrop 0
scoreboard players set @a[scores={stormTimer=150..}] stormTimer 0



playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 10 0 1