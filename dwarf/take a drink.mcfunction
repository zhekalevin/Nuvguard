#Scoreboards: 1) dummy: drink, drinkTimer, drinkCdUI, drinkTimerEnd, perSec, drinkCycle
#             2) used.minecraft:potion: drinkUsed
#Set scoreboard values: perSec 20, drink 0, drinkTimer 0

execute as @a[team=dwarf,scores={drink=0},nbt={SelectedItem:{id:"minecraft:potion",Count:1b,tag:{CustomPotionColor:13077586,display:{Name:"{\"text\":\"Take a drink!\",\"color\":\"green\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 4. Drink to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:3}] run scoreboard players set @s drink 1
execute as @a[team=dwarf,scores={drinkUsed=1,drink=1,drinkTimer=0}] run scoreboard players set @s drinkTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{CustomPotionColor:13077586,display:{Name:"{\"text\":\"Take a drink!\",\"color\":\"green\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 4. Drink to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}}}]

effect give @a[scores={drinkTimer=1}] minecraft:nausea 5 127 false
effect give @a[scores={drinkTimer=1}] minecraft:strength 5 0 false

#start timer
execute as @a[scores={drinkTimer=0,drinkCycle=1..}] run scoreboard players set @s drinkCycle 0
scoreboard players add @a[scores={drinkTimer=1..}] drinkTimer 1

scoreboard players set @a[scores={drinkTimer=2}] drinkCdUI 20
execute as @a[scores={drinkTimer=2}] run scoreboard players operation @s drinkTimerEnd = @s drinkCdUI
execute as @a[scores={drinkTimer=2}] run scoreboard players operation @s drinkTimerEnd *= @s perSec

#start cycle
execute as @a[scores={drinkTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:3}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"drinkCdUI"},"color":"green","bold":"true"}]

execute as @a[scores={drinkTimer=1..}] run scoreboard players add @s drinkCycle 1
execute as @a[scores={drinkCycle=20}] run scoreboard players remove @s drinkCdUI 1
execute as @a[scores={drinkCycle=20}] run scoreboard players set @s drinkCycle 0

execute as @a[team=dwarf,scores={drink=1},nbt=!{SelectedItem:{id:"minecraft:potion",Count:1b,tag:{CustomPotionColor:13077586,display:{Name:"{\"text\":\"Take a drink!\",\"color\":\"green\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 4. Drink to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:3}] run scoreboard players set @s drink 0
execute as @a[scores={drinkTimer=2..}] if score @s drinkTimer = @s drinkTimerEnd run replaceitem entity @s hotbar.3 minecraft:potion{CustomPotionColor:13077586,display:{Name:"{\"text\":\"Take a drink!\",\"color\":\"green\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 4. Drink to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}} 1
scoreboard players set @a[scores={drinkUsed=1..}] drinkUsed 0
execute as @a[scores={drinkTimer=2..}] if score @s drinkTimer = @s drinkTimerEnd run scoreboard players set @s drinkTimer 0