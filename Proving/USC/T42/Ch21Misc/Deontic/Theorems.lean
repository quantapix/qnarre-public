import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Misc.Deontic.Types
import Proving.USC.T42.Ch21Misc.Deontic.Predicates
import Proving.USC.T42.Ch21Misc.Deontic.Statute






namespace Proving.USC.T42.Ch21Misc.Deontic

open Proving.USC.Common



theorem permissionExercised2000e1a_intro {e p c}
    (hAddr : IsExemptEmploymentEntity2000e1a e c)
    (hCond : ExemptionConditionMet2000e1a e p c)
    (hAct : TookCoveredEmploymentAction2000e1a e p c) :
    PermissionExercised2000e1a e p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem permissionExercised2000e1b_intro {e p c}
    (hAddr : IsCoveredEmploymentActor2000e1b e c)
    (hCond : ComplianceWouldViolateForeignLaw2000e1b e p c)
    (hAct : TookOtherwiseProhibitedAction2000e1b e p c) :
    PermissionExercised2000e1b e p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem permissionExercised2000e1c2_intro {e c}
    (hAddr : IsForeignPersonEmployer2000e1c2 e c)
    (hCond : NotControlledByAmericanEmployer2000e1c2 e c)
    (hAct : PracticeInForeignOperations2000e1c2 e c) :
    PermissionExercised2000e1c2 e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibitionViolated2000e7_intro {p l c}
    (hAddr : SubjectToStateLawDuty2000e7 p l c)
    (hCond : StateLawNotRequiringUnlawfulPractice2000e7 l c)
    (hAct : DeemedExemptFromStateLaw2000e7 p l c) :
    ProhibitionViolated2000e7 p l c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligationBreached2000e10a_intro {e c}
    (hAddr : IsCoveredPostingEntity2000e10 e c)
    (hNoAct : ¬ PostedAndKeptPostedNotice2000e10 e c) :
    ObligationBreached2000e10a e c :=
  ⟨⟨hAddr⟩, hNoAct⟩


theorem willfulOffense2000e10b_intro {e c}
    (hBreach : ObligationBreached2000e10a e c)
    (hWillful : ViolationWasWillful2000e10b e c) :
    WillfulOffense2000e10b e c :=
  ⟨hBreach, hWillful⟩



theorem prohibitionViolated2000e11_intro {l c}
    (hCond : LawCreatesVeteransPreference2000e11 l c)
    (hAct : ConstruedToRepealVeteransPreference2000e11 l c) :
    ProhibitionViolated2000e11 l c :=
  ⟨⟨hCond⟩, hAct⟩



theorem prohibitionViolated2000e13_intro {p v c}
    (hCond : VictimEngagedInOfficialFunctions2000e13 v c)
    (hAct : KilledPersonPerformingOfficialFunctions2000e13 p v c) :
    ProhibitionViolated2000e13 p v c :=
  ⟨⟨hCond⟩, hAct⟩



theorem obligationBreached2000e14Coord_intro {e c}
    (hAddr : IsEEOC2000e14 e c)
    (hNoAct : ¬ DevelopedCoordinationAgreements2000e14 e c) :
    ObligationBreached2000e14Coord e c :=
  ⟨⟨hAddr⟩, hNoAct⟩



theorem obligationBreached2000e14Report_intro {e c}
    (hAddr : IsEEOC2000e14 e c)
    (hNoAct : ¬ TransmittedAnnualReportByOctober1_2000e14 e c) :
    ObligationBreached2000e14Report e c :=
  ⟨⟨hAddr⟩, hNoAct⟩



theorem obligationBreached2000e15Convene_intro {p c}
    (hAddr : IsPresident2000e15 p c)
    (hNoAct : ¬ ConvenedLeadershipConferences2000e15 p c) :
    ObligationBreached2000e15Convene p c :=
  ⟨⟨hAddr⟩, hNoAct⟩



theorem obligationBreached2000e15Invite_intro {p c}
    (hAddr : IsPresident2000e15 p c)
    (hNoAct : ¬ InvitedRequiredParticipants2000e15 p c) :
    ObligationBreached2000e15Invite p c :=
  ⟨⟨hAddr⟩, hNoAct⟩




theorem prohibitionViolated2000e17_intro {e k c}
    (hAddr : IsFederalContractingAgency2000e17 e c)
    (hPlan : HasAcceptedAAPlanWithin12Months2000e17 k c)
    (hDev : EmployerNotSubstantiallyDeviated2000e17 k c)
    (hAct : DeniedContractWithoutHearing2000e17 e k c) :
    ProhibitionViolated2000e17 e k c :=
  ⟨⟨hAddr, hPlan, hDev⟩, hAct⟩

end Proving.USC.T42.Ch21Misc.Deontic
