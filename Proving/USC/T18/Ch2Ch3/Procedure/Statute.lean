import Proving.USC.T18.Ch2Ch3.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false















namespace Proving.USC.T18.Ch2Ch3.Procedure

open Proving.USC.Common






def Section32Jurisdiction (p : Person) (c : ComplaintText) : Prop :=
  USNationalityNexus p c ∨ OffenderFoundInUS p c




def Section37Jurisdiction (p : Person) (c : ComplaintText) : Prop :=
  ConductWithinUS p c ∨ OffenderFoundInUS p c ∨ USNationalityNexus p c




def Section38ExtraterritorialReach (p : Person) (c : ComplaintText) : Prop :=
  USNationalityNexus p c ∨ ConductWithinUS p c






def LaborDisputeBar (p : Person) (c : ComplaintText) : Prop :=
  RelatedToLaborDispute p c ∧ ProhibitedAsStateFelony p c



structure Section37Prosecutable (p : Person) (c : ComplaintText) : Prop where
  conduct : OffenseConductAlleged p c
  jurisdiction : Section37Jurisdiction p c
  notBarred : ¬ LaborDisputeBar p c






structure InterimReliefAvailable (p : Person) (c : ComplaintText) : Prop where
  proceeding : EquitableEnforcementProceedingBrought p c
  pending : FinalDeterminationPending p c




structure CriminalToCivilEstoppel (p : Person) (c : ComplaintText) : Prop where
  criminalFinal : CriminalJudgmentForUSFinal p c
  civilBrought : SubsequentCivilProceedingByUS p c






structure ForfeitureAtSentencing (p : Person) (c : ComplaintText) : Prop where
  convicted : ConvictionEnteredUnderSection p c




structure RestitutionAtSentencing (p : Person) (c : ComplaintText) : Prop where
  violation : RestitutionPredicateViolation p c







def WithinRulemakingWindow (enactmentDay ruleDay : Nat) : Prop :=
  ruleDay ≤ enactmentDay + 180

instance (enactmentDay ruleDay : Nat) : Decidable (WithinRulemakingWindow enactmentDay ruleDay) := by
  unfold WithinRulemakingWindow; exact Nat.decLe ruleDay (enactmentDay + 180)





structure TimelyRulemaking (c : ComplaintText) (enactmentDay ruleDay : Nat) : Prop where
  pleaded : RulemakingDatesPleaded c enactmentDay ruleDay
  inWindow : WithinRulemakingWindow enactmentDay ruleDay







structure SuspensionPrimaFacie (p : Person) (c : ComplaintText) : Prop where
  proceeding : PermitSuspensionProceeding p c
  ratioShown : InhumaneConditionRatioShown p c






structure MandatoryDisposition (p : Person) (c : ComplaintText) : Prop where
  imported : ProhibitedSpeciesImported p c





structure DiscretionaryPermitIssuance (p : Person) (c : ComplaintText) : Prop where
  showing : ProperShowingOfResponsibility p c

end Proving.USC.T18.Ch2Ch3.Procedure
