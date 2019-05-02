#Scoreboards: 1) dummy: haymaker, haymakerTimer, haymakerCdUI, haymakerTimerEnd, perSec, haymakerCycle
#             2) dropped.minecraft.nether_star: haymakerDrop
#Set scoreboard values: perSec 20, haymaker 0, haymakerTimer 0

execute as @a[team=dwarf,scores={haymaker=0},nbt={SelectedItem:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}},SelectedItemSlot:6}] run scoreboard players set @s haymaker 1
execute as @a[team=dwarf,scores={haymakerDrop=1,haymaker=1,haymakerTimer=0}] run scoreboard players set @s haymakerTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}}}]

execute as @a[scores={haymakerTimer=2}] run replaceitem entity @s hotbar.6 minecraft:iron_axe{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"white\",\"bold\":\"true\"}",Lore:["Good 'ole Putt"]},HideFlags:4,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:6}]} 1
execute as @a[scores={haymakerTimer=2}] run effect give @s speed 1 3
execute as @a[scores={haymakerTimer=22}] run replaceitem entity @s hotbar.6 air 

#start timer
execute as @a[scores={haymakerTimer=0,haymakerCycle=1..}] run scoreboard players set @s haymakerCycle 0
scoreboard players add @a[scores={haymakerTimer=1..}] haymakerTimer 1

scoreboard players set @a[scores={haymakerTimer=2}] haymakerCdUI 60
execute as @a[scores={haymakerTimer=2}] run scoreboard players operation @s haymakerTimerEnd = @s haymakerCdUI
execute as @a[scores={haymakerTimer=2}] run scoreboard players operation @s haymakerTimerEnd *= @s perSec

#start cycle
execute as @a[scores={haymakerTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:6}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"haymakerCdUI"},"color":"gold","bold":"true"}]

execute as @a[scores={haymakerTimer=1..}] run scoreboard players add @s haymakerCycle 1
execute as @a[scores={haymakerCycle=20}] run scoreboard players remove @s haymakerCdUI 1
execute as @a[scores={haymakerCycle=20}] run scoreboard players set @s haymakerCycle 0

execute as @a[team=dwarf,scores={haymaker=1},nbt=!{SelectedItem:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}},SelectedItemSlot:6}] run scoreboard players set @s haymaker 0
execute as @a[scores={haymakerTimer=2..}] if score @s haymakerTimer = @s haymakerTimerEnd run replaceitem entity @s hotbar.6 minecraft:nether_star{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}} 1
scoreboard players set @a[scores={haymakerDrop=1..}] haymakerDrop 0
execute as @a[scores={haymakerTimer=2..}] if score @s haymakerTimer = @s haymakerTimerEnd run scoreboard players set @s haymakerTimer 0