execute as @a[team=dwarf,scores={haymaker=0},nbt={SelectedItem:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}},SelectedItemSlot:6}] run scoreboard players set @s haymaker 1
execute as @a[team=dwarf,scores={netherdrop=1,haymaker=1,haymakertimer=0}] run scoreboard players set @s haymakertimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}}}]

execute as @a[scores={haymakertimer=2}] run replaceitem entity @s hotbar.6 minecraft:iron_axe{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"white\",\"bold\":\"true\"}",Lore:["Good 'ole Putt"]},HideFlags:4,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:6}]} 1
execute as @a[scores={haymakertimer=2}] run effect give @s speed 1 3
execute as @a[scores={haymakertimer=22}] run replaceitem entity @s hotbar.6 air 

#start timer
execute as @a[scores={haymakertimer=0,haymakercycle=1..}] run scoreboard players set @s haymakercycle 0
scoreboard players add @a[scores={haymakertimer=1..}] haymakertimer 1

scoreboard players set @a[scores={haymakertimer=2}] haymakerCdUI 60
execute as @a[scores={haymakertimer=2}] run scoreboard players operation @s haymakertimerEnd = @s haymakerCdUI
scoreboard players set @a[scores={haymakertimer=2}] perSec 20
execute as @a[scores={haymakertimer=2}] run scoreboard players operation @s haymakertimerEnd *= @s perSec

#start cycle
execute as @a[scores={haymakertimer=1..}] at @s run title @s[nbt={SelectedItemSlot:6}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"haymakerCdUI"},"color":"gold","bold":"true"}]

execute as @a[scores={haymakertimer=1..}] run scoreboard players add @s haymakercycle 1
execute as @a[scores={haymakercycle=20}] run scoreboard players remove @s haymakerCdUI 1
execute as @a[scores={haymakercycle=20}] run scoreboard players set @s haymakercycle 0

execute as @a[team=dwarf,scores={haymaker=1},nbt=!{SelectedItem:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}},SelectedItemSlot:6}] run scoreboard players set @s haymaker 0
execute as @a[scores={haymakertimer=2..}] if score @s haymakertimer = @s haymakertimerEnd run replaceitem entity @s hotbar.6 minecraft:nether_star{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}} 1
scoreboard players set @a[scores={netherdrop=1..}] netherdrop 0
execute as @a[scores={haymakertimer=2..}] if score @s haymakertimer = @s haymakertimerEnd run scoreboard players set @s haymakertimer 0