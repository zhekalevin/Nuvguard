#Replace: templateTeam, templateAbility, templateDrop, templateSlot-1, templateSlot, templateInventoryName, templateColor, templateItem
#         REPLACE EACH ONE, REPLACING JUST "template" WILL NOT WORK!
# Activation
execute as @a[team=templateTeam,scores={templateAbility=0},nbt={SelectedItem:{id:"minecraft:templateItem",Count:1b,tag:{display:{Name:"{\"text\":\"templateInventoryName\",\"color\":\"templateColor\",\"bold\":\"true\"}",Lore:["Equip to slot templateSlot. Drop to activate"]}}},SelectedItemSlot:templateSlot-1}] run scoreboard players set @s templateAbility 1
execute as @a[team=templateTeam,scores={templateDrop=1,templateAbility=1,templateAbilityTimer=0}] run scoreboard players set @s templateAbilityTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:templateItem",Count:1b,tag:{display:{Name:"{\"text\":\"templateInventoryName\",\"color\":\"templateColor\",\"bold\":\"true\"}",Lore:["Equip to slot templateSlot. Drop to activate"]}}}}]

#Here needs to be something with templateAbilityTimerEnd

# End
execute as @a[team=templateTeam,scores={templateAbility=1},nbt=!{SelectedItem:{id:"minecraft:templateItem",Count:1b,tag:{display:{Name:"{\"text\":\"templateInventoryName\",\"color\":\"templateColor\",\"bold\":\"true\"}",Lore:["Equip to slot templateSlot. Drop to activate"]}}},SelectedItemSlot:templateSlot-1}] run scoreboard players set @s templateAbility 0
execute as @a[scores={templateAbilityTimer=2..}] if score @s templateAbilityTimer = @s templateAbilityTimerEnd run replaceitem entity @s hotbar.templateSlot-1 minecraft:templateItem{display:{Name:"{\"text\":\"templateInventoryName\",\"color\":\"templateColor\",\"bold\":\"true\"}",Lore:["Equip to slot templateSlot. Drop to activate"]}} 1
scoreboard players set @a[scores={templateDrop=1..}] templateDrop 0
execute as @a[scores={templateAbilityTimer=2..}] if score @s templateAbilityTimer = @s templateAbilityTimerEnd run scoreboard players set @s templateAbilityTimer 0