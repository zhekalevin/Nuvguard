#Replace template with the ability name. Replace exampleTeam, exampleDrop, exampleSlot-1, exampleSlot, exampleInventoryName, exampleColor, exampleItem with specific names.

# Activation
execute as @a[team=exampleTeam,scores={template=0},nbt={SelectedItem:{id:"minecraft:exampleDrop",Count:1b,tag:{display:{Name:"{\"text\":\"exampleInventoryName\",\"color\":\"exampleColor\",\"bold\":\"true\"}",Lore:["Equip to slot exampleSlot. Drop to activate"]}}},SelectedItemSlot:exampleSlot-1}] run scoreboard players set @s template 1
execute as @a[team=exampleTeam,scores={exampleDrop=1,template=1,templateTimer=0}] run scoreboard players set @s templateTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:exampleDrop",Count:1b,tag:{display:{Name:"{\"text\":\"exampleInventoryName\",\"color\":\"exampleColor\",\"bold\":\"true\"}",Lore:["Equip to slot exampleSlot. Drop to activate"]}}}}]

#Reset and stop cycle after completion
execute as @a[scores={templateTimer=0,templateCycle=1..}] run scoreboard players set @s templateCycle 0

#Start timer
scoreboard players add @a[scores={templateTimer=1..}] templateTimer 1

#Set cooldown duration in seconds — CdUI (Cooldown UI)
scoreboard players set @a[scores={templateTimer=2}] templateCdUI 60

#Calculate and set timer ending time, based on cooldown
execute as @a[scores={templateTimer=2..}] run scoreboard players operation @s templateTimerEnd = @s templateCdUI
scoreboard players set @a[scores={templateTimer=2}] perSec 20
execute as @a[scores={templateTimer=2..}] run scoreboard players operation @s templateTimerEnd *= @s perSec

#Choose one: replace "scoreboard players set @s doSomething 0" with real command
#Do something every tick of each second
execute as @a[scores={templateTimer=1..}] at @s run scoreboard players set @s doSomething 0

#Do something at the beginning of each second
execute as @a[scores={templateTimer=1..,templateCycle=0}] at @s run scoreboard players set @s doSomething 0

#Do something at the end of each second
execute as @a[scores={templateTimer=1..,templateCycle=20}] at @s run scoreboard players set @s doSomething 0
###########################################################################################

#Start cycle / iterate next tick
execute as @a[scores={templateTimer=1..}] run scoreboard players add @s templateCycle 1

#Substract one second
execute as @a[scores={templateCycle=20}] run scoreboard players remove @s templateCdUI 1

#Reset cycle before next iteration
execute as @a[scores={templateCycle=20}] run scoreboard players set @s templateCycle 0

# End
scoreboard players set @a[scores={exampleDrop=1..}] exampleDrop 0
execute as @a[team=exampleTeam,scores={template=1},nbt=!{SelectedItem:{id:"minecraft:exampleItem",Count:1b,tag:{display:{Name:"{\"text\":\"exampleInventoryName\",\"color\":\"exampleColor\",\"bold\":\"true\"}",Lore:["Equip to slot exampleSlot. Drop to activate"]}}},SelectedItemSlot:exampleSlot-1}] run scoreboard players set @s template 0
execute as @a[scores={templateTimer=2..}] if score @s templateTimer = @s templateTimerEnd run replaceitem entity @s hotbar.exampleSlot-1 minecraft:exampleItem{display:{Name:"{\"text\":\"exampleInventoryName\",\"color\":\"exampleColor\",\"bold\":\"true\"}",Lore:["Equip to slot exampleSlot. Drop to activate"]}} 1
execute as @a[scores={templateTimer=2..}] if score @s templateTimer = @s templateTimerEnd run scoreboard players set @s templateTimer 0