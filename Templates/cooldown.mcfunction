#Reset and stop cycle after completion
execute as @a[scores={templateTimer=0,templateCycle=1..}] run scoreboard players set @s templateCycle 0

#Start timer
scoreboard players add @a[scores={templateTimer=1..}] templateTimer 1

#Set cooldown duration in seconds — CdUI (Cooldown UI)
scoreboard players set @a[scores={templateTimer=2}] templateCdUI 60

#Calculate and set timer ending time, based on cooldown
execute as @a[scores={templateTimer=2..}] run scoreboard players operation @s templateTimerEnd = @s templateCdUI
scoreboard players set @a[scores={templateTimer=2}] perSec 20
execute as @a[scores={templateTimer=2..}] run scoreboard players operation @s templateTimerEnd *= @s perSec

#Choose one: replace "scoreboard players set @s doSomething 0" with real command
#Do something every tick of each second
execute as @a[scores={templateTimer=1..}] at @s run scoreboard players set @s doSomething 0

#Do something at the beginning of each second
execute as @a[scores={templateTimer=1..,templateCycle=0}] at @s run scoreboard players set @s doSomething 0

#Do something at the end of each second
execute as @a[scores={templateTimer=1..,templateCycle=20}] at @s run scoreboard players set @s doSomething 0
###########################################################################################

#Start cycle / iterate next tick
execute as @a[scores={templateTimer=1..}] run scoreboard players add @s templateCycle 1

#Substract one second
execute as @a[scores={templateCycle=20}] run scoreboard players remove @s templateCdUI 1

#Reset cycle before next iteration
execute as @a[scores={templateCycle=20}] run scoreboard players set @s templateCycle 0

#When time ends, stop timer and reset its time 
execute as @a[scores={templateTimer=2..}] if score @s templateTimer = @s templateTimerEnd run scoreboard players set @s templateTimer 0