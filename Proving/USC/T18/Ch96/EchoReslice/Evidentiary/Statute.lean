




import Proving.USC.Common.Types
import Proving.USC.T18.Ch96.EchoReslice.Evidentiary.Types
import Proving.USC.T18.Ch96.EchoReslice.Evidentiary.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Evidentiary

open Proving.USC.Common





def PresumptionSatisfied (pr : Presumption) (c : ComplaintText) : Prop :=
  pr ≠ Presumption.Rebuttable ∨ ¬ PresumptionRebutted pr c




inductive Section1967Proceeding (c : ComplaintText) : Prop where
  | civilAction (h : CivilActionInstitutedByUnitedStates c) : Section1967Proceeding c
  | ancillary   (h : ProceedingAncillaryToChapterAction c)  : Section1967Proceeding c





structure Proof1967Scope (c : ComplaintText) : Prop where
  within   : Section1967Proceeding c
  carried  : BurdenCarried Allocation1967Scope.1 Allocation1967Scope.2.1 c
  presump  : PresumptionSatisfied Allocation1967Scope.2.2 c







structure Section1967RulingAuthorized (r : AccessRuling) (c : ComplaintText) : Prop where
  scope      : Proof1967Scope c
  considered : CourtConsideredRightsOfAffectedPersons c
  byCourt    : AccessRulingMadeByCourt r c






structure Section1967ConsiderationOmitted (r : AccessRuling) (c : ComplaintText) : Prop where
  scope         : Proof1967Scope c
  byCourt       : AccessRulingMadeByCourt r c
  notConsidered : ¬ CourtConsideredRightsOfAffectedPersons c





structure Section1967ClosureGrounded (c : ComplaintText) : Prop where
  scope      : Proof1967Scope c
  affected   : ∃ p : Person, AffectedPersonRightsAtStake p c
  considered : CourtConsideredRightsOfAffectedPersons c
  closed     : AccessRulingMadeByCourt AccessRuling.Closed c

end Proving.USC.T18.Ch96.EchoReslice.Evidentiary
