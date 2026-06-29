Scriptname DonselfsRNC_QuestScript extends Quest

GlobalVariable Property PlayerHasActiveCompanion Auto
FormList Property RobotRaces Auto
ReferenceAlias Property CompanionAlias Auto
FollowersScript Followers

; th1nkEyebot optional compatibility
Race EyebotRaceComparison
Race EyebotRaceRagdoll
Race EyebotRaceSubmersible

int TIMER_ID = 1 const
string MOD_NAME = "Donself's RNC" const
string VERSION = "1.2.0" const

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
    LoadOptionalRaces()
    Debug.Notification(MOD_NAME + " active.")
    StartTimer(1.0, TIMER_ID)
EndFunction

Function LoadOptionalRaces()
    EyebotRaceComparison  = Game.GetFormFromFile(0x000833, "th1nkEyebot.esp") as Race
    EyebotRaceRagdoll     = Game.GetFormFromFile(0x00E1B3, "th1nkEyebot.esp") as Race
    EyebotRaceSubmersible = Game.GetFormFromFile(0x01EC55, "th1nkEyebot.esp") as Race
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
            bool isRobot = (RobotRaces != None && RobotRaces.HasForm(companionRace)) || \
                           (EyebotRaceComparison != None && companionRace == EyebotRaceComparison) || \
                           (EyebotRaceRagdoll != None && companionRace == EyebotRaceRagdoll) || \
                           (EyebotRaceSubmersible != None && companionRace == EyebotRaceSubmersible)
            If isRobot
                PlayerHasActiveCompanion.SetValue(0.0)
                Debug.Notification(MOD_NAME + ": Lone Wanderer active.")
            EndIf
        EndIf
    EndIf
EndEvent
