# Donself's Lone Wanderer - Robots Not Companions

A Fallout 4 mod that keeps the **Lone Wanderer** perk active when a robot companion is following you.

## The Problem

Bethesda made a deliberate choice with Dogmeat: he can follow you without cancelling the Lone Wanderer perk. The idea being that a dog is not really a companion in the social sense. You are still out there on your own, surviving on your own terms. The perk was always about that spirit of independence.

So it always bothered me that robots do not get the same treatment. Think about it. Codsworth is a household appliance. Ada is a repurposed caravan bot. The custom robot you built in the Automatron workshop is literally just parts you welded together. None of them share your rations, give you advice, or make you feel any less alone in the wasteland. If a dog does not count as a companion for this perk, a robot absolutely should not either.

This mod fixes that. Travel with your robot and keep the Lone Wanderer bonuses, because honestly, you are still out there alone.

## What This Mod Does

When you hire a companion, the mod checks whether they are a robot by looking at their race. If the race matches one of the supported robot races, the perk stays active. This means it works with Codsworth, Ada, and any custom robot you build in the Automatron workshop, without needing to know anything specific about that particular robot.

The supported races are:

- Mr. Handy
- Eyebot
- Sentry Bot
- Assaultron
- Protectron
- Robobrain (Automatron DLC)
- Custom workshop robots (Automatron DLC)

## Requirements

- Fallout 4
- Automatron DLC

## Installation

Install with [Vortex](https://www.nexusmods.com/about/vortex/) or manually place files in your Fallout 4 `Data` folder.

## Notes

Nick Valentine and Curie in her synth form are not supported. Generation 3 synths use the same race as humans under the hood, which means there is no reliable way to detect them as robots without also accidentally catching actual human companions. So they are excluded. Besides, if the Institute went through all that trouble to make them indistinguishable from people, they are probably close enough to count.

## Source

Scripts written in Papyrus. Source available in `Scripts/Source/`.
