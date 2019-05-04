
execute as @a[team=fire_mage,scores={meteor=0},nbt={SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Meteor\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:4}] run scoreboard players set @s meteor 1

execute as @a[team=fire_mage,scores={meteorDrop=1,meteor=1,meteorTimer=0}] run scoreboard players set @s meteorTimer 1

kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Meteor\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}}}]

execute as @a[scores={meteor=1}] run scoreboard players add @s meteorSelect 1

scoreboard players set @e[scores={meteorSelect=15}] meteorSelect 0

scoreboard players set @e[scores={meteor=0}] meteorSelect 0

execute as @a[scores={meteor=1}] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["target"],Marker:1b,NoGravity:1b,Invisible:1b}

execute as @a[scores={meteor=1}] at @s run tp @e[tag=target,sort=nearest,limit=1] @s

execute as @a[scores={meteor=1}] at @s run tp @e[tag=target,sort=nearest,limit=1] ~ ~1.62 ~

execute as @e[tag=target] at @s run function give:shot/shot2

scoreboard players reset @e[tag=target] raycasting

scoreboard players add @e[tag=aim] flameMarker 1

kill @e[scores={flameMarker=15}]

execute as @e[tag=aim,scores={flameMarker=1}] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["target1"],Marker:1b,NoGravity:1b,Invisible:1b}

execute as @a[scores={meteorSelect=1}] as @e[tag=target1] at @s run function give:shot/shot3

kill @e[tag=target1]

execute as @e[tag=aim] at @s rotated ~180 ~ facing entity @e[scores={meteorTimer=1}] feet run summon minecraft:armor_stand ~ ~ ~ {Tags:["target1"],Marker:1b,NoGravity:1b,Invisible:1b}

execute as @e[tag=target1] run function give:shot/shot4

kill @e[tag=target1]

execute as @e[tag=aim] at @s rotated ~180 ~ facing entity @e[scores={meteorTimer=1}] feet run summon minecraft:area_effect_cloud ~ ~40 ~ {Duration:50,Tags:["meteor"]}

scoreboard players add @e[tag=meteor] meteorAge 1

execute as @e[scores={meteorAge=25..30}] at @s run playsound minecraft:entity.ghast.shoot master @a ~ ~ ~ 3 0 1

execute as @e[scores={meteorAge=15..20}] at @s run playsound minecraft:entity.wither.shoot master @a ~ ~ ~ 3 0 1

execute as @e[scores={meteorAge=1..5}] at @s run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 4 0 1

execute as @e[tag=meteor] at @s if block ~ ~-1 ~ air run tp @s ~ ~-1 ~

execute as @e[tag=meteor] at @s if block ~ ~-1 ~ air run particle minecraft:smoke ~ ~ ~ 0.7 0.7 0.7 0 100 force

execute as @e[tag=meteor] at @s if block ~ ~-1 ~ air run particle minecraft:flame ~ ~ ~ 0.7 0.7 0.7 0 100 force

execute as @e[tag=meteor] at @s if block ~ ~-1 ~ air run particle minecraft:cloud ~ ~ ~ 0.7 0.7 0.7 0 10 force

execute as @e[tag=meteor] at @s unless block ~ ~-1 ~ air run particle minecraft:lava ~ ~ ~ 1.5 0.5 1.5 0 100 force

execute as @e[tag=meteor] at @s unless block ~ ~-1 ~ air run particle minecraft:explosion ~ ~ ~ 1.5 0.5 1.5 0 5 force

execute as @e[tag=meteor] at @s unless block ~ ~-1 ~ air run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 100 0 1

execute as @e[tag=meteor] at @s unless block ~ ~-1 ~ air run effect give @e[distance=..3] instant_damage 1 1 true

execute as @e[tag=meteor] at @s unless block ~ ~-1 ~ air run kill @s

kill @e[tag=aim]

#start timer
execute as @a[scores={meteorTimer=0,meteorCycle=1..}] run scoreboard players set @s meteorCycle 0

scoreboard players add @a[scores={meteorTimer=1..}] meteorTimer 1

scoreboard players set @a[scores={meteorTimer=2}] meteorCdUI 30

execute as @a[scores={meteorTimer=2}] run scoreboard players operation @s meteorTimerEnd = @s meteorCdUI

execute as @a[scores={meteorTimer=2}] run scoreboard players operation @s meteorTimerEnd *= @s perSec

#start cycle
execute as @a[scores={meteorTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:4}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"meteorCdUI"},"color":"aqua","bold":"true"}]

execute as @a[scores={meteorTimer=1..}] run scoreboard players add @s meteorCycle 1

execute as @a[scores={meteorCycle=20}] run scoreboard players remove @s meteorCdUI 1

execute as @a[scores={meteorCycle=20}] run scoreboard players set @s meteorCycle 0

execute as @a[team=fire_mage,scores={meteor=1},nbt=!{SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Meteor\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:4}] run scoreboard players set @s meteor 0

execute as @a[scores={meteorTimer=2..}] if score @s meteorTimer = @s meteorTimerEnd run replaceitem entity @s hotbar.4 minecraft:light_blue_dye{display:{Name:"{\"text\":\"Meteor\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}} 1

scoreboard players set @a[scores={meteorDrop=1..}] meteorDrop 0

execute as @a[scores={meteorTimer=2..}] if score @s meteorTimer = @s meteorTimerEnd run scoreboard players set @s meteorTimer 0