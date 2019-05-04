scoreboard players add @s spearAge 1

tp @s ^ ^ ^0.3

execute as @s[tag=charge1] at @s run particle minecraft:dust 1.05 0 0 1 ~ ~ ~ 0 0 0 0 1 force

execute as @s[tag=charge2] at @s run particle minecraft:dust 1.05 0 0 1.5 ~ ~ ~ 0 0 0 0 1 force

execute as @s[tag=charge3] at @s run particle minecraft:dust 1.05 0 0 2 ~ ~ ~ 0 0 0 0 1 force

execute as @s[tag=charge4] at @s run particle minecraft:flame ~ ~ ~ 0.25 0.25 0.25 0 20 force

execute as @s[tag=charge4] at @s run particle minecraft:smoke ~ ~ ~ 0.25 0.25 0.25 0 2 force

execute as @s[tag=charge4] at @s run particle minecraft:dust 2 0 0 2 ~ ~ ~ 0.5 0.5 0.5 0 5 force

execute as @s[tag=charge4,scores={spearAge=4..}] at @s run effect give @e[distance=..1.5] minecraft:instant_damage 1 2 true

execute if entity @s[scores={spearAge=..333}] at @s run function abilities:spear/charge
