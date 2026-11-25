import Proving.USC.T18.Ch2Ch3.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false














namespace Proving.USC.T18.Ch2Ch3.Procedure

open Proving.USC.Common






axiom OffenseConductAlleged (p : Person) (c : ComplaintText) : Prop





axiom ConductWithinUS (p : Person) (c : ComplaintText) : Prop




axiom OffenderFoundInUS (p : Person) (c : ComplaintText) : Prop





axiom USNationalityNexus (p : Person) (c : ComplaintText) : Prop




axiom RelatedToLaborDispute (p : Person) (c : ComplaintText) : Prop




axiom ProhibitedAsStateFelony (p : Person) (c : ComplaintText) : Prop





axiom CriminalJudgmentForUSFinal (p : Person) (c : ComplaintText) : Prop




axiom SubsequentCivilProceedingByUS (p : Person) (c : ComplaintText) : Prop




axiom EquitableEnforcementProceedingBrought (p : Person) (c : ComplaintText) : Prop




axiom FinalDeterminationPending (p : Person) (c : ComplaintText) : Prop





axiom ConvictionEnteredUnderSection (p : Person) (c : ComplaintText) : Prop




axiom RestitutionPredicateViolation (p : Person) (c : ComplaintText) : Prop






axiom RulemakingDatesPleaded (c : ComplaintText) (enactmentDay ruleDay : Nat) : Prop




axiom PermitSuspensionProceeding (p : Person) (c : ComplaintText) : Prop





axiom InhumaneConditionRatioShown (p : Person) (c : ComplaintText) : Prop




axiom ProhibitedSpeciesImported (p : Person) (c : ComplaintText) : Prop





axiom ProperShowingOfResponsibility (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch2Ch3.Procedure
