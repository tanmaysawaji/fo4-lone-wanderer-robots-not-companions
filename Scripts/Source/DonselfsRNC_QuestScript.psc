Scriptname DonselfsRNC_QuestScript extends Quest

GlobalVariable Property PlayerHasActiveCompanion Auto
FormList Property RobotRaces Auto
ReferenceAlias Property CompanionAlias Auto

int TIMER_ID = 1 const
string MOD_NAME = "Donself's Lone Wanderer - Robots Not Companions" const
bool lastCompanionState = false

Event OnInit()
    RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
    Utility.Wait(3.0)
    Debug.Notification(MOD_NAME + " active.")
    StartTimer(2.0, TIMER_ID)
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    lastCompanionState = false
    Utility.Wait(3.0)
    Debug.Notification(MOD_NAME + " active.")
    StartTimer(2.0, TIMER_ID)
EndEvent

Event OnTimer(int aiTimerID)
    If aiTimerID == TIMER_ID
        bool companionActive = PlayerHasActiveCompanion.GetValue() == 1.0
        If !companionActive
            lastCompanionState = false
        ElseIf !lastCompanionState
            Actor companion = CompanionAlias.GetActorRef()
            If companion != None
                lastCompanionState = true
                If companion.IsPlayerTeammate()
                    Race companionRace = companion.GetRace()
                    If RobotRaces != None && RobotRaces.HasForm(companionRace)
                        PlayerHasActiveCompanion.SetValue(0.0)
                        Debug.Notification(MOD_NAME + ": Lone Wanderer active (" + companionRace + ").")
                    EndIf
                EndIf
            EndIf
        EndIf
        StartTimer(2.0, TIMER_ID)
    EndIf
EndEvent
