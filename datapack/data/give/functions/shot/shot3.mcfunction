scoreboard players add @s particlePos 1

execute as @s[scores={particlePos=1..16}] at @s positioned ~ ~0.4 ~ run particle minecraft:dust 10 0.1 0.1 1.9 ^ ^ ^2 0 0 0 0 1 force

execute as @s[scores={particlePos=25..40}] at @s positioned ~ ~0.4 ~ run particle minecraft:dust 10 0.1 0.1 1.9 ^ ^ ^2 0 0 0 0 1 force

execute as @s[scores={particlePos=49..64}] at @s positioned ~ ~0.4 ~ run particle minecraft:dust 10 0.1 0.1 1.9 ^ ^ ^2 0 0 0 0 1 force

execute as @s[scores={particlePos=13..28}] at @s positioned ~ ~0.4 ~ run particle minecraft:dust 10 0.1 0.1 1 ^ ^ ^1.4 0 0 0 0 1 force

execute as @s[scores={particlePos=37..52}] at @s positioned ~ ~0.4 ~ run particle minecraft:dust 10 0.1 0.1 1 ^ ^ ^1.4 0 0 0 0 1 force

execute as @s[scores={particlePos=61..}] at @s positioned ~ ~0.4 ~ run particle minecraft:dust 10 0.1 0.1 1 ^ ^ ^1.4 0 0 0 0 1 force

execute as @s[scores={particlePos=..4}] at @s positioned ~ ~0.4 ~ run particle minecraft:dust 10 0.1 0.1 1 ^ ^ ^1.4 0 0 0 0 1 force

#execute as @s[scores={particlePos=1..}] at @s positioned ~ ~0.4 ~ run particle minecraft:flame ^ ^ ^2 0 0 0 0 1 force

execute as @s at @s run tp @s ~ ~ ~ ~5 ~

execute if entity @s[scores={particlePos=..72}] run function give:shot/shot3