#Scoreboards: 1) dummy: clap, clapTimer, clapCdUI, clapTimerEnd, perSec, clapCycle
#             2) dropped.minecraft:light_blue_dye: clapDrop
#Set scoreboard values: perSec 20, clap 0, clapTimer 0

execute as @a[team=dwarf,scores={clap=0},nbt={SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Ground Clap\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:4}] run scoreboard players set @s clap 1
execute as @a[team=dwarf,scores={clapDrop=1,clap=1,clapTimer=0}] run scoreboard players set @s clapTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Ground Clap\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}}}]


execute as @a[scores={clapTimer=1}] run tag @s add clapper 
execute as @a[tag=clapper] at @s run particle minecraft:smoke ~ ~0.2 ~ 1.5 0 1.5 0.05 200
execute as @a[tag=clapper] at @s run particle minecraft:cloud ~ ~0.2 ~ 1.5 0 1.5 0.05 50
execute as @a[tag=clapper] at @s run particle minecraft:block cobblestone ~ ~0.2 ~ 1.5 0 1.5 0 100
execute as @a[tag=clapper] at @s run particle minecraft:crit ~ ~0.2 ~ 1.5 0 1.5 0.05 50
execute as @a[tag=clapper] at @s run particle minecraft:item diamond_axe ~ ~0.2 ~ 1.5 0 1.5 0.1 100

#optional execute as @a[tag=clapper] at @s run playsound minecraft:item.trident.thunder master @a ~ ~ ~ 0.4 0.7 1
# optional execute as @a[tag=clapper] at @s run playsound minecraft:block.anvil.land master @a ~ ~ ~ 4 0 1
execute as @a[tag=clapper] at @s run playsound minecraft:item.shield.block master @a ~ ~ ~ 4 0 1
execute as @a[tag=clapper] at @s run playsound minecraft:entity.iron_golem.hurt master @a ~ ~ ~ 4 0 1
execute as @a[tag=clapper] at @s run playsound minecraft:entity.ravager.step master @a ~ ~ ~ 4 0 1
execute as @a[tag=clapper] at @s run playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 0 1
execute as @a[tag=clapper] at @s run playsound minecraft:entity.lightning_bolt.impact master @a ~ ~ ~ 1 0 1

execute as @a[tag=clapper] at @s run effect give @a[distance=..3,tag=!clapper] minecraft:instant_damage 1 0 true
tag @a[tag=clapper] remove clapper

#start timer
execute as @a[scores={clapTimer=0,clapCycle=1..}] run scoreboard players set @s clapCycle 0
scoreboard players add @a[scores={clapTimer=1..}] clapTimer 1

scoreboard players set @a[scores={clapTimer=2}] clapCdUI 30
execute as @a[scores={clapTimer=2}] run scoreboard players operation @s clapTimerEnd = @s clapCdUI
execute as @a[scores={clapTimer=2}] run scoreboard players operation @s clapTimerEnd *= @s perSec

#start cycle
execute as @a[scores={clapTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:4}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"clapCdUI"},"color":"aqua","bold":"true"}]

execute as @a[scores={clapTimer=1..}] run scoreboard players add @s clapCycle 1
execute as @a[scores={clapCycle=20}] run scoreboard players remove @s clapCdUI 1
execute as @a[scores={clapCycle=20}] run scoreboard players set @s clapCycle 0

execute as @a[team=dwarf,scores={clap=1},nbt=!{SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Ground Clap\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:4}] run scoreboard players set @s clap 0
execute as @a[scores={clapTimer=2..}] if score @s clapTimer = @s clapTimerEnd run replaceitem entity @s hotbar.4 minecraft:light_blue_dye{display:{Name:"{\"text\":\"Ground Clap\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 5. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}} 1
scoreboard players set @a[scores={clapDrop=1..}] clapDrop 0
execute as @a[scores={clapTimer=2..}] if score @s clapTimer = @s clapTimerEnd run scoreboard players set @s clapTimer 0