scoreboard players add @s raycasting 1

execute unless block ~ ~ ~ minecraft:air run tag @s add aim

tp @s ^ ^ ^0.3

execute if entity @s[scores={raycasting=..199}] at @s unless entity @s[tag=aim] run function give:shot/shot2
