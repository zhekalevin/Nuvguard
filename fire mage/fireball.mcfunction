execute as @a[scores={shoot1=1},nbt={SelectedItem:{tag:{FireWand:1b}}}] at @s run summon armor_stand ^ ^ ^1 {CustomNameVisible:0b,NoGravity:1b,Invulnerable:1b,Marker:0b,Invisible:1b,NoBasePlate:1b,Tags:["Spell","FireBall"],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"45d64054-5a26-4c70-b752-82f95dea7be8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzBhNDRkNTFlY2M3OWY2OTRjZmQ2MDIyOGM4ODQyODg0OGNhNjE4ZTM2YTY1OWE0MTZlOTI0NmQ4NDFhZWM4In19fQ=="}]}}}}],DisabledSlots:4144959}
#NEXT CONDITIONAL
execute at @a[scores={shoot1=1},nbt={SelectedItem:{tag:{FireWand:1b}}}] at @e[tag=FireBall,limit=1,sort=nearest] run tp @e[tag=FireBall,limit=1,sort=nearest] ~ ~ ~ facing entity @p
#NORMAL FROM NOW ON
execute as @a[scores={shoot1=1}] at @s run playsound entity.ghast.shoot master @s
scoreboard players set @a[scores={shoot1=1..}] shoot1 0
execute as @e[tag=FireBall] at @s positioned ~ ~1.7 ~ unless block ^0.3 ^ ^ air run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ~ ~1.7 ~ unless block ^-0.3 ^ ^ air run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ~ ~1.7 ~ unless block ^ ^0.31 ^ air run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ~ ~1.7 ~ unless block ^ ^-0.3 ^ air run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ~ ~1.7 ~ unless block ^-0.1 ^ ^0.45 air run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ~ ~1.7 ~ unless block ^0.1 ^ ^0.45 air run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ~ ~1.5 ~ unless block ^ ^ ^0.5 air run tag @s add fireballexplosion
execute at @e[tag=FireBall] run tp @e[tag=FireBall,limit=1,sort=nearest] ^ ^ ^-1.2
execute as @e[tag=FireBall] at @s positioned ~ ~ ~ at @e[distance=..0.6,tag=!FireBall] run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ^0.35 ^-0.45 ^0.35 at @e[distance=..0.2,tag=!FireBall] run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ^-0.35 ^-0.45 ^0.35 at @e[distance=..0.2,tag=!FireBall] run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ^-0.35 ^-0.45 ^-0.35 at @e[distance=..0.2,tag=!FireBall] run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ^0.35 ^-0.45 ^-0.35 at @e[distance=..0.2,tag=!FireBall] run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ^ ^0.7 ^ at @e[distance=..0.75,tag=!FireBall] run tag @s add fireballexplosion
execute as @e[tag=FireBall] at @s positioned ^ ^1.3 ^ at @e[distance=..0.6,tag=!FireBall] run tag @s add fireballexplosion
scoreboard players add @e[tag=FireBall] fireballage 1
tag @e[scores={fireballage=125..}] add fireballexplosion
execute at @e[tag=FireBall] positioned ~ ~1.7 ~ run particle flame ^ ^ ^2.4 0.2 0.2 0.2 0 50 force
execute at @e[tag=FireBall] positioned ~ ~1.7 ~ run particle smoke ^ ^ ^2.4 0.1 0.1 0.1 0.05 20 force
execute as @e[tag=fireballexplosion] at @s run particle minecraft:explosion ~ ~1.7 ~ 0 0 0 0 1
execute as @e[tag=fireballexplosion] at @s positioned ~ ~ ~ positioned ^ ^ ^1.2 run tag @e[distance=..1.5,tag=!fireballexplosion] add fireballvictim
execute as @e[tag=fireballexplosion] at @s positioned ~ ~1.7 ~ positioned ^ ^ ^1.2 run tag @e[distance=..1.5,tag=!fireballexplosion] add fireballvictim
effect give @e[tag=fireballvictim] minecraft:health_boost 1 0 true
effect give @e[tag=fireballvictim] minecraft:instant_health 1 0 true
effect give @e[tag=fireballvictim] minecraft:instant_damage 1 0 true
tag @e[tag=fireballvictim] remove fireballvictim
execute as @e[tag=fireballexplosion] at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 4
execute as @e[tag=fireballexplosion] at @s positioned ~ ~1.7 ~ run particle minecraft:lava ^ ^ ^2 0.2 0.2 0.2 0 50 force
execute as @e[tag=fireballexplosion] at @s run kill @s