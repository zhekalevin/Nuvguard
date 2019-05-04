#Set scoreboard values: perSec 20, spear 0, spearTimer 0

execute as @a[team=fire_mage,scores={spear=0},nbt={SelectedItem:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Flame Spear\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 7. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:6}] run scoreboard players set @s spear 1
execute as @a[team=fire_mage,scores={spearDrop=1,spear=1,spearTimer=0}] run scoreboard players set @s spearTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Flame Spear\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 7. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}}}]

execute as @a[scores={spearTimer=1}] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["charge1"],Marker:1b,NoGravity:1b,Invisible:1b}
execute as @a[scores={spearTimer=1}] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["charge2"],Marker:1b,NoGravity:1b,Invisible:1b}
execute as @a[scores={spearTimer=1}] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["charge3"],Marker:1b,NoGravity:1b,Invisible:1b}
execute as @a[scores={spearTimer=1}] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["charge4"],Marker:1b,NoGravity:1b,Invisible:1b}

execute as @a[scores={spearTimer=1}] at @s run tp @e[tag=charge1,sort=nearest,limit=1] ~ ~1.62 ~ ~ ~
execute as @a[scores={spearTimer=1}] at @s run tp @e[tag=charge2,sort=nearest,limit=1] ~ ~1.62 ~ ~ ~
execute as @a[scores={spearTimer=1}] at @s run tp @e[tag=charge3,sort=nearest,limit=1] ~ ~1.62 ~ ~ ~
execute as @a[scores={spearTimer=1}] at @s run tp @e[tag=charge4,sort=nearest,limit=1] ~ ~1.62 ~ ~ ~

execute as @e[tag=charge1] at @s run function abilities:spear/charge
kill @e[tag=charge1]

scoreboard players add @e[tag=charge2] spearWait 1
execute as @e[tag=charge2,scores={spearWait=7}] at @s run function abilities:spear/charge
kill @e[tag=charge2,scores={spearWait=7}]
scoreboard players add @e[tag=charge3] spearWait 1
execute as @e[tag=charge3,scores={spearWait=14}] at @s run function abilities:spear/charge
kill @e[tag=charge3,scores={spearWait=14}]
scoreboard players add @e[tag=charge4] spearWait 1
execute as @e[tag=charge4,scores={spearWait=21}] at @s run function abilities:spear/charge
kill @e[tag=charge4,scores={spearWait=21}]

#start timer
execute as @a[scores={spearTimer=0,spearCycle=1..}] run scoreboard players set @s spearCycle 0
scoreboard players add @a[scores={spearTimer=1..}] spearTimer 1

scoreboard players set @a[scores={spearTimer=2}] spearCdUI 10
execute as @a[scores={spearTimer=2}] run scoreboard players operation @s spearTimerEnd = @s spearCdUI
execute as @a[scores={spearTimer=2}] run scoreboard players operation @s spearTimerEnd *= @s perSec

#start cycle
execute as @a[scores={spearTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:6}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"spearCdUI"},"color":"gold","bold":"true"}]

execute as @a[scores={spearTimer=1..}] run scoreboard players add @s spearCycle 1
execute as @a[scores={spearCycle=20}] run scoreboard players remove @s spearCdUI 1
execute as @a[scores={spearCycle=20}] run scoreboard players set @s spearCycle 0

execute as @a[team=fire_mage,scores={spear=1},nbt=!{SelectedItem:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Flame Spear\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 7. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:6}] run scoreboard players set @s spear 0
execute as @a[scores={spearTimer=2..}] if score @s spearTimer = @s spearTimerEnd run replaceitem entity @s hotbar.6 minecraft:nether_star{display:{Name:"{\"text\":\"Flame Spear\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 7. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}} 1
scoreboard players set @a[scores={spearDrop=1..}] spearDrop 0
execute as @a[scores={spearTimer=2..}] if score @s spearTimer = @s spearTimerEnd run scoreboard players set @s spearTimer 0