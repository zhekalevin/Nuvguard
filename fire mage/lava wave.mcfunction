#Scoreboards: 1) dummy: lavawave, lavawaveTimer, lavawaveCdUI, lavawaveTimerEnd, perSec, lavawaveCycle, lavawaveAge
#             2) dropped.minecraft:purple_dye: lavawaveDrop
#Set scoreboard values: perSec 20, lavawave 0, lavawaveTimer 0

execute as @a[team=fire_mage,scores={lavawave=0},nbt={SelectedItem:{id:"minecraft:purple_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lava Wave\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 6. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:5}] run scoreboard players set @s lavawave 1
execute as @a[team=fire_mage,scores={lavawaveDrop=1,lavawave=1,lavawaveTimer=0}] run scoreboard players set @s lavawaveTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:purple_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lava Wave\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 6. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}}}]

tag @a[scores={lavawaveTimer=1}] add lavamage

execute as @a[scores={lavawaveTimer=1}] at @s run summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["wave"]}
execute as @a[scores={lavawaveTimer=1}] at @s run tp @e[tag=wave,sort=nearest,limit=1] ~ ~ ~ ~ 0
scoreboard players add @e[tag=wave] lavawaveAge 1
execute as @e[tag=wave,scores={lavawaveAge=1}] at @s run tp @s ^ ^ ^-5
execute as @e[tag=wave] at @s run tp @s ^ ^ ^0.05
execute as @e[tag=wave] at @s if block ~ ~-1 ~ air run tp @s ~ ~-0.2 ~
execute as @e[tag=wave] at @s run particle minecraft:squid_ink ^ ^0.4 ^ 2 0 2 0 10
execute as @e[tag=wave] at @s run particle minecraft:flame ^ ^0.3 ^ 2 0.2 2 0 50
execute as @e[tag=wave] at @s run particle minecraft:smoke ^ ^0.4 ^ 2 0 2 0 50
execute as @e[tag=wave] at @s run particle minecraft:lava ^ ^0.5 ^ 2 0 2 0 5
execute as @e[tag=wave] at @s run particle minecraft:dripping_lava ^ ^0.5 ^ 2 0.4 2 0 50
execute as @e[tag=wave] at @s run effect give @e[distance=..3,tag=!wave,tag=!lavamage] minecraft:instant_damage 1 0 true
kill @e[scores={lavawaveAge=300}]
tag @a[scores={lavawaveTimer=300}] remove lavamage


#start timer
execute as @a[scores={lavawaveTimer=0,lavawaveCycle=1..}] run scoreboard players set @s lavawaveCycle 0
scoreboard players add @a[scores={lavawaveTimer=1..}] lavawaveTimer 1

scoreboard players set @a[scores={lavawaveTimer=2}] lavawaveCdUI 20
execute as @a[scores={lavawaveTimer=2}] run scoreboard players operation @s lavawaveTimerEnd = @s lavawaveCdUI
execute as @a[scores={lavawaveTimer=2}] run scoreboard players operation @s lavawaveTimerEnd *= @s perSec

#start cycle
execute as @a[scores={lavawaveTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:5}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"lavawaveCdUI"},"color":"dark_purple","bold":"true"}]

execute as @a[scores={lavawaveTimer=1..}] run scoreboard players add @s lavawaveCycle 1
execute as @a[scores={lavawaveCycle=20}] run scoreboard players remove @s lavawaveCdUI 1
execute as @a[scores={lavawaveCycle=20}] run scoreboard players set @s lavawaveCycle 0

execute as @a[team=fire_mage,scores={lavawave=1},nbt=!{SelectedItem:{id:"minecraft:purple_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Lava Wave\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 6. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}}},SelectedItemSlot:5}] run scoreboard players set @s lavawave 0
execute as @a[scores={lavawaveTimer=2..}] if score @s lavawaveTimer = @s lavawaveTimerEnd run replaceitem entity @s hotbar.5 minecraft:purple_dye{display:{Name:"{\"text\":\"Lava Wave\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Lore:["{\"text\":\"Equip to slot 6. Drop to activate\",\"color\":\"white\",\"bold\":false,\"italic\":false}"]}} 1
scoreboard players set @a[scores={lavawaveDrop=1..}] lavawaveDrop 0
execute as @a[scores={lavawaveTimer=2..}] if score @s lavawaveTimer = @s lavawaveTimerEnd run scoreboard players set @s lavawaveTimer 0