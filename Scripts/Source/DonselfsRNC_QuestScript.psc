Scriptname DonselfsRNC_QuestScript extends Quest

GlobalVariable Property PlayerHasActiveCompanion Auto
FormList Property RobotRaces Auto
ReferenceAlias Property CompanionAlias Auto
FollowersScript Followers

int TIMER_ID = 1 const
string MOD_NAME = "Donself's RNC" const
string VERSION = "1.1.1" const

Event OnInit()
    InitializeMod()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    InitializeMod()
EndEvent

Function InitializeMod()
    RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
    Followers = Game.GetForm(0x000289E4) as FollowersScript
    RegisterForCustomEvent(Followers, "CompanionChange")
    Debug.Notification(MOD_NAME + " active.")
    StartTimer(1.0, TIMER_ID)
EndFunction

Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] akArgs)
    Actor companion = akArgs[0] as Actor
    bool isAdded = akArgs[1] as bool
    RegisterForCustomEvent(Followers, "CompanionChange")

    If isAdded && companion != None
        StartTimer(1.0, TIMER_ID)
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    If aiTimerID == TIMER_ID
        Actor companion = CompanionAlias.GetActorRef()
        If companion != None && companion.IsPlayerTeammate()
            Race companionRace = companion.GetRace()
            If RobotRaces != None && RobotRaces.HasForm(companionRace)
                PlayerHasActiveCompanion.SetValue(0.0)
                Debug.Notification(MOD_NAME + ": Lone Wanderer active.")
            EndIf
        EndIf
    EndIf
EndEvent
