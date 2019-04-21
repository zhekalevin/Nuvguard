
execute as @a[team=dwarf,scores={haymaker=0},nbt={SelectedItem:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}},SelectedItemSlot:6}] run scoreboard players set @s haymaker 1
execute as @a[team=dwarf,scores={netherdrop=1,haymaker=1,haymakertimer=0}] run scoreboard players set @s haymakertimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}}}]
scoreboard players add @a[scores={haymakertimer=1..}] haymakertimer 1

execute as @a[scores={haymakertimer=2}] run replaceitem entity @s hotbar.6 minecraft:iron_axe{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"white\",\"bold\":\"true\"}",Lore:["Good 'ole Putt"]},HideFlags:4,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:6}]} 1
execute as @a[scores={haymakertimer=2}] run effect give @s speed 1 3
execute as @a[scores={haymakertimer=8}] run replaceitem entity @s hotbar.6 air 

#COOLDOWN TIMER
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=10}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"60","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=30}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"59","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=50}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"58","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=70}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"57","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=90}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"56","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=110}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"55","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=130}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"54","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=150}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"53","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=170}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"52","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=190}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"51","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=210}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"50","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=230}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"49","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=250}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"48","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=270}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"47","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=290}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"46","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=310}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"45","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=330}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"44","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=350}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"43","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=370}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"42","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=390}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"41","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=410}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"40","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=430}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"39","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=450}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"38","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=470}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"37","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=490}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"36","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=510}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"35","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=530}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"34","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=550}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"33","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=570}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"32","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=590}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"31","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=610}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"30","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=630}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"29","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=650}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"28","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=670}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"27","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=690}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"26","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=710}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"25","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=730}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"24","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=750}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"23","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=770}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"22","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=790}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"21","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=810}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"20","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=830}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"19","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=850}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"18","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=870}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"17","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=890}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"16","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=910}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"15","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=930}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"14","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=950}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"13","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=970}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"12","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=990}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"11","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1010}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"10","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1030}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"9","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1050}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"8","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1070}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"7","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1090}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"6","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1110}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"5","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1130}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"4","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1150}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"3","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1170}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"2","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1190}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"text":"1","color":"gold","bold":"true"}]
title @a[nbt={SelectedItemSlot:6},scores={haymakertimer=1209}] actionbar [{"text":""}]

execute as @a[team=dwarf,scores={haymaker=1},nbt=!{SelectedItem:{id:"minecraft:nether_star",Count:1b,tag:{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}}},SelectedItemSlot:6}] run scoreboard players set @s haymaker 0
replaceitem entity @a[scores={haymakertimer=1210}] hotbar.6 minecraft:nether_star{display:{Name:"{\"text\":\"Haymaker\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Equip to slot 7. Drop to activate"]}} 1
scoreboard players set @a[scores={netherdrop=1..}] netherdrop 0
scoreboard players set @a[scores={haymakertimer=1210..}] haymakertimer 0