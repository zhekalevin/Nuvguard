
# Activation
execute as @a[team=warlock,scores={hellfire=0},nbt={SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}},SelectedItemSlot:4}] run scoreboard players set @s hellfire 1
execute as @a[team=warlock,scores={lightBlueDrop=1,hellfire=1,hellfireTimer=0}] run scoreboard players set @s hellfireTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}}}]

# ability
execute as @

#start timer
execute as @a[scores={hellfireTimer=0,hellfireCycle=1..}] run scoreboard players set @s hellfireCycle 0
scoreboard players add @a[scores={hellfireTimer=1..}] hellfireTimer 1

scoreboard players set @a[scores={hellfireTimer=2}] hellfireCdUI 60
execute as @a[scores={hellfireTimer=2}] run scoreboard players operation @s hellfireTimerEnd = @s hellfireCdUI
execute as @a[scores={hellfireTimer=2}] run scoreboard players operation @s hellfireTimerEnd *= @s perSec

#start cycle
execute as @a[scores={hellfireTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:4}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"hellfireCdUI"},"color":"aqua","bold":"true"}]

execute as @a[scores={hellfireTimer=1..}] run scoreboard players add @s hellfireCycle 1
execute as @a[scores={hellfireCycle=20}] run scoreboard players remove @s hellfireCdUI 1
execute as @a[scores={hellfireCycle=20}] run scoreboard players set @s hellfireCycle 0

# End
execute as @a[team=warlock,scores={hellfire=1},nbt=!{SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}},SelectedItemSlot:4}] run scoreboard players set @s hellfire 0
execute as @a[scores={hellfireTimer=2..}] if score @s hellfireTimer = @s hellfireTimerEnd run replaceitem entity @s hotbar.4 minecraft:light_blue_dye{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}} 1
scoreboard players set @a[scores={lightBlueDrop=1..}] lightBlueDrop 0
execute as @a[scores={hellfireTimer=2..}] if score @s hellfireTimer = @s hellfireTimerEnd run scoreboard players set @s hellfireTimer 0