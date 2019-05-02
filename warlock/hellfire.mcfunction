
# Activation
execute as @a[team=warlock,scores={hell=0},nbt={SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}},SelectedItemSlot:4}] run scoreboard players set @s hell 1
execute as @a[team=warlock,scores={hell=1,hell=1,hellTimer=0}] run scoreboard players set @s hellTimer 1
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}}}]

# ability
execute as @a[scores={hellTimer=2..100}] at @s if block ~-1 ~ ~2 air run summon minecraft:area_effect_cloud ~-1 ~ ~2 {Duration:40,Tags:["firemarker","firemarker1"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~0 ~ ~2 air run summon minecraft:area_effect_cloud ~0 ~ ~2 {Duration:40,Tags:["firemarker","firemarker2"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~1 ~ ~2 air run summon minecraft:area_effect_cloud ~1 ~ ~2 {Duration:40,Tags:["firemarker","firemarker3"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~-1 ~ ~1 air run summon minecraft:area_effect_cloud ~-1 ~ ~1 {Duration:40,Tags:["firemarker","firemarker4"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~-1 ~ ~1 air run summon minecraft:area_effect_cloud ~-1 ~ ~1 {Duration:40,Tags:["firemarker","firemarker5"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~0 ~ ~1 air run summon minecraft:area_effect_cloud ~0 ~ ~1 {Duration:40,Tags:["firemarker","firemarker6"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~1 ~ ~1 air run summon minecraft:area_effect_cloud ~1 ~ ~1 {Duration:40,Tags:["firemarker","firemarker7"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~2 ~ ~1 air run summon minecraft:area_effect_cloud ~2 ~ ~1 {Duration:40,Tags:["firemarker","firemarker8"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~-2 ~ ~0 air run summon minecraft:area_effect_cloud ~-2 ~ ~0 {Duration:40,Tags:["firemarker","firemarker9"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~-1 ~ ~0 air run summon minecraft:area_effect_cloud ~-1 ~ ~0 {Duration:40,Tags:["firemarker","firemarker10"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~1 ~ ~0 air run summon minecraft:area_effect_cloud ~1 ~ ~0 {Duration:40,Tags:["firemarker","firemarker11"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~2 ~ ~0 air run summon minecraft:area_effect_cloud ~2 ~ ~0 {Duration:40,Tags:["firemarker","firemarker12"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~-2 ~ ~-1 air run summon minecraft:area_effect_cloud ~-2 ~ ~-1 {Duration:40,Tags:["firemarker","firemarker13"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~-1 ~ ~-1 air run summon minecraft:area_effect_cloud ~-1 ~ ~-1 {Duration:40,Tags:["firemarker","firemarker14"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~0 ~ ~-1 air run summon minecraft:area_effect_cloud ~0 ~ ~-1 {Duration:40,Tags:["firemarker","firemarker15"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~1 ~ ~-1 air run summon minecraft:area_effect_cloud ~1 ~ ~-1 {Duration:40,Tags:["firemarker","firemarker16"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~2 ~ ~-1 air run summon minecraft:area_effect_cloud ~2 ~ ~-1 {Duration:40,Tags:["firemarker","firemarker17"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~-1 ~ ~-2 air run summon minecraft:area_effect_cloud ~-1 ~ ~-2 {Duration:40,Tags:["firemarker","firemarker18"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~0 ~ ~-2 air run summon minecraft:area_effect_cloud ~0 ~ ~-2 {Duration:40,Tags:["firemarker","firemarker19"]}
execute as @a[scores={hellTimer=2..100}] at @s if block ~1 ~ ~-2 air run summon minecraft:area_effect_cloud ~1 ~ ~-2 {Duration:40,Tags:["firemarker","firemarker20"]}

execute as @e[tag=firemarker] at @s run scoreboard players add @s fireAge 1
execute as @e[scores={fireAge=1}] at @s run fill ~ ~ ~ ~ ~ ~ fire replace air

execute as @e[tag=firemarker1] at @s positioned ~1 ~ ~-2 as @p[scores={hellTimer=2..100},distance=1..] positioned ~-1 ~ ~2 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker2] at @s positioned ~0 ~ ~-2 as @p[scores={hellTimer=2..100},distance=1..] positioned ~0 ~ ~2 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker3] at @s positioned ~-1 ~ ~-2 as @p[scores={hellTimer=2..100},distance=1..] positioned ~1 ~ ~2 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker4] at @s positioned ~2 ~ ~-1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~-2 ~ ~1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker5] at @s positioned ~1 ~ ~-1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~-1 ~ ~1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker6] at @s positioned ~0 ~ ~-1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~0 ~ ~1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker7] at @s positioned ~-1 ~ ~-1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~1 ~ ~1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker8] at @s positioned ~-2 ~ ~-1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~2 ~ ~1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker9] at @s positioned ~2 ~ ~-0 as @p[scores={hellTimer=2..100},distance=1..] positioned ~-2 ~ ~0 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker10] at @s positioned ~1 ~ ~-0 as @p[scores={hellTimer=2..100},distance=1..] positioned ~-1 ~ ~0 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker11] at @s positioned ~-1 ~ ~-0 as @p[scores={hellTimer=2..100},distance=1..] positioned ~1 ~ ~0 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker12] at @s positioned ~-2 ~ ~-0 as @p[scores={hellTimer=2..100},distance=1..] positioned ~2 ~ ~0 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker13] at @s positioned ~2 ~ ~1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~-2 ~ ~-1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker14] at @s positioned ~1 ~ ~1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~-1 ~ ~-1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker15] at @s positioned ~0 ~ ~1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~0 ~ ~-1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker16] at @s positioned ~-1 ~ ~1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~1 ~ ~-1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker17] at @s positioned ~-2 ~ ~1 as @p[scores={hellTimer=2..100},distance=1..] positioned ~2 ~ ~-1 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker18] at @s positioned ~1 ~ ~2 as @p[scores={hellTimer=2..100},distance=1..] positioned ~-1 ~ ~-2 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker19] at @s positioned ~0 ~ ~2 as @p[scores={hellTimer=2..100},distance=1..] positioned ~0 ~ ~-2 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire
execute as @e[tag=firemarker20] at @s positioned ~-1 ~ ~2 as @p[scores={hellTimer=2..100},distance=1..] positioned ~1 ~ ~-2 run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire

execute as @e[tag=firemarker,scores={fireAge=40}] at @s run fill ~ ~ ~ ~ ~ ~ air replace minecraft:fire

execute as @e[tag=firemarker] at @s positioned ~1 ~ ~-2 as @p[scores={hellTimer=2..100},distance=2..] positioned ~-1 ~ ~2 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~0 ~ ~-2 as @p[scores={hellTimer=2..100},distance=2..] positioned ~0 ~ ~2 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~-1 ~ ~-2 as @p[scores={hellTimer=2..100},distance=2..] positioned ~1 ~ ~2 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~2 ~ ~-1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~-2 ~ ~1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~1 ~ ~-1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~-1 ~ ~1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~0 ~ ~-1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~0 ~ ~1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~-1 ~ ~-1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~1 ~ ~1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~-2 ~ ~-1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~2 ~ ~1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~2 ~ ~-0 as @p[scores={hellTimer=2..100},distance=2..] positioned ~-2 ~ ~0 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~1 ~ ~-0 as @p[scores={hellTimer=2..100},distance=2..] positioned ~-1 ~ ~0 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~-1 ~ ~-0 as @p[scores={hellTimer=2..100},distance=2..] positioned ~1 ~ ~0 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~-2 ~ ~-0 as @p[scores={hellTimer=2..100},distance=2..] positioned ~2 ~ ~0 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~2 ~ ~1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~-2 ~ ~-1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~1 ~ ~1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~-1 ~ ~-1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~0 ~ ~1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~0 ~ ~-1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~-1 ~ ~1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~1 ~ ~-1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~-2 ~ ~1 as @p[scores={hellTimer=2..100},distance=2..] positioned ~2 ~ ~-1 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~1 ~ ~2 as @p[scores={hellTimer=2..100},distance=2..] positioned ~-1 ~ ~-2 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~0 ~ ~2 as @p[scores={hellTimer=2..100},distance=2..] positioned ~0 ~ ~-2 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s
execute as @e[tag=firemarker] at @s positioned ~-1 ~ ~2 as @p[scores={hellTimer=2..100},distance=2..] positioned ~1 ~ ~-2 as @e[distance=..1,tag=firemarker,sort=nearest,scores={fireAge=1..}] run kill @s

#start timer
execute as @a[scores={hellTimer=0,hellCycle=1..}] run scoreboard players set @s hellCycle 0
scoreboard players add @a[scores={hellTimer=1..}] hellTimer 1

scoreboard players set @a[scores={hellTimer=2}] hellCdUI 60
execute as @a[scores={hellTimer=2}] run scoreboard players operation @s hellTimerEnd = @s hellCdUI
execute as @a[scores={hellTimer=2}] run scoreboard players operation @s hellTimerEnd *= @s perSec

#start cycle
execute as @a[scores={hellTimer=1..}] at @s run title @s[nbt={SelectedItemSlot:4}] actionbar [{"text":"Cooldown: ","color":"white","bold":"false"},{"score":{"name":"@p","objective":"hellCdUI"},"color":"aqua","bold":"true"}]

execute as @a[scores={hellTimer=1..}] run scoreboard players add @s hellCycle 1
execute as @a[scores={hellCycle=20}] run scoreboard players remove @s hellCdUI 1
execute as @a[scores={hellCycle=20}] run scoreboard players set @s hellCycle 0

# End
execute as @a[team=warlock,scores={hell=1},nbt=!{SelectedItem:{id:"minecraft:light_blue_dye",Count:1b,tag:{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}}},SelectedItemSlot:4}] run scoreboard players set @s hell 0
execute as @a[scores={hellTimer=2..}] if score @s hellTimer = @s hellTimerEnd run replaceitem entity @s hotbar.4 minecraft:light_blue_dye{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:["Equip to slot 5. Drop to activate"]}} 1
scoreboard players set @a[team=warlock,scores={hell=1..}] hell 0
execute as @a[scores={hellTimer=2..}] if score @s hellTimer = @s hellTimerEnd run scoreboard players set @s hellTimer 0