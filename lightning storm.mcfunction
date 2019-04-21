execute as @a[team=shaman,scores={storm=0},nbt={SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}},SelectedItemSlot:4}] run scoreboard players set @s storm 1
execute as @a[team=shaman,scores={lightbluedrop=1,storm=1,stormtimer=0}] run scoreboard players set @s stormtimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}}}]
scoreboard players add @a[scores={stormtimer=1..}] stormtimer 1

execute as @a[scores={stormtimer=5}] at @s run summon area_effect_cloud ~ ~ ~ {Duration:150,Tags:["stormmarker"]}

execute as @a[scores={stormtimer=5..}] at @s run spreadplayers ~ ~ 1 5 false @e[tag=stormmarker,limit=1,sort=nearest]

execute as @a[scores={stormtimer=5}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=10}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=15}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=20}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=25}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=30}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=35}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=40}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=45}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=50}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=55}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=60}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=65}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=70}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=75}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=80}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=85}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=90}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=95}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=100}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=105}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=110}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=115}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=120}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=125}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=130}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=135}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=140}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~
execute as @a[scores={stormtimer=145}] at @s at @e[tag=stormmarker,limit=1,sort=nearest] run summon lightning_bolt ~ ~ ~


execute as @a[team=shaman,scores={storm=1},nbt=!{SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}},SelectedItemSlot:4}] run scoreboard players set @s storm 0
replaceitem entity @a[scores={stormtimer=150}] hotbar.4 minecraft:light_blue_dye{display:{Name:"{\"text\":\"Lightning Storm\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}} 1
scoreboard players set @a[scores={lightbluedrop=1..}] lightbluedrop 0
scoreboard players set @a[scores={stormtimer=150..}] stormtimer 0