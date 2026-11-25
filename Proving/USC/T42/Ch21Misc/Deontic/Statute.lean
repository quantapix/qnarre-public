import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Misc.Deontic.Types
import Proving.USC.T42.Ch21Misc.Deontic.Predicates











namespace Proving.USC.T42.Ch21Misc.Deontic

open Proving.USC.Common





structure Permission2000e1a (e : Entity) (p : Person) (c : ComplaintText) : Prop where
  addressee : IsExemptEmploymentEntity2000e1a e c
  condition : ExemptionConditionMet2000e1a e p c



def PermissionExercised2000e1a (e : Entity) (p : Person) (c : ComplaintText) : Prop :=
  Permission2000e1a e p c ∧ TookCoveredEmploymentAction2000e1a e p c




structure Permission2000e1b (e : Entity) (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCoveredEmploymentActor2000e1b e c
  condition : ComplianceWouldViolateForeignLaw2000e1b e p c



def PermissionExercised2000e1b (e : Entity) (p : Person) (c : ComplaintText) : Prop :=
  Permission2000e1b e p c ∧ TookOtherwiseProhibitedAction2000e1b e p c





structure Permission2000e1c2 (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsForeignPersonEmployer2000e1c2 e c
  condition : NotControlledByAmericanEmployer2000e1c2 e c



def PermissionExercised2000e1c2 (e : Entity) (c : ComplaintText) : Prop :=
  Permission2000e1c2 e c ∧ PracticeInForeignOperations2000e1c2 e c






structure Prohibition2000e7 (p : Person) (l : Law) (c : ComplaintText) : Prop where
  addressee : SubjectToStateLawDuty2000e7 p l c
  condition : StateLawNotRequiringUnlawfulPractice2000e7 l c



def ProhibitionViolated2000e7 (p : Person) (l : Law) (c : ComplaintText) : Prop :=
  Prohibition2000e7 p l c ∧ DeemedExemptFromStateLaw2000e7 p l c





structure Obligation2000e10a (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsCoveredPostingEntity2000e10 e c



def ObligationBreached2000e10a (e : Entity) (c : ComplaintText) : Prop :=
  Obligation2000e10a e c ∧ ¬ PostedAndKeptPostedNotice2000e10 e c



def WillfulOffense2000e10b (e : Entity) (c : ComplaintText) : Prop :=
  ObligationBreached2000e10a e c ∧ ViolationWasWillful2000e10b e c






structure Prohibition2000e11 (l : Law) (c : ComplaintText) : Prop where
  condition : LawCreatesVeteransPreference2000e11 l c



def ProhibitionViolated2000e11 (l : Law) (c : ComplaintText) : Prop :=
  Prohibition2000e11 l c ∧ ConstruedToRepealVeteransPreference2000e11 l c






structure Prohibition2000e13 (v : Person) (c : ComplaintText) : Prop where
  condition : VictimEngagedInOfficialFunctions2000e13 v c



def ProhibitionViolated2000e13 (p v : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e13 v c ∧ KilledPersonPerformingOfficialFunctions2000e13 p v c





structure Obligation2000e14Coord (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsEEOC2000e14 e c



def ObligationBreached2000e14Coord (e : Entity) (c : ComplaintText) : Prop :=
  Obligation2000e14Coord e c ∧ ¬ DevelopedCoordinationAgreements2000e14 e c


structure Obligation2000e14Report (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsEEOC2000e14 e c



def ObligationBreached2000e14Report (e : Entity) (c : ComplaintText) : Prop :=
  Obligation2000e14Report e c ∧ ¬ TransmittedAnnualReportByOctober1_2000e14 e c




structure Obligation2000e15 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPresident2000e15 p c



def ObligationBreached2000e15Convene (p : Person) (c : ComplaintText) : Prop :=
  Obligation2000e15 p c ∧ ¬ ConvenedLeadershipConferences2000e15 p c



def ObligationBreached2000e15Invite (p : Person) (c : ComplaintText) : Prop :=
  Obligation2000e15 p c ∧ ¬ InvitedRequiredParticipants2000e15 p c







structure Prohibition2000e17 (e : Entity) (k : GovContract) (c : ComplaintText) : Prop where
  addressee    : IsFederalContractingAgency2000e17 e c
  planAccepted : HasAcceptedAAPlanWithin12Months2000e17 k c
  noDeviation  : EmployerNotSubstantiallyDeviated2000e17 k c




def ProhibitionViolated2000e17 (e : Entity) (k : GovContract) (c : ComplaintText) : Prop :=
  Prohibition2000e17 e k c ∧ DeniedContractWithoutHearing2000e17 e k c

end Proving.USC.T42.Ch21Misc.Deontic
