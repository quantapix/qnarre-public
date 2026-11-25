








import Proving.USC.T18.Ch13.Procedure.Types
import Proving.USC.T18.Ch13.Procedure.Predicates

namespace Proving.USC.T18.Ch13.Procedure

open Proving.USC.Common





structure Transition where
  fromState : State
  toState   : State
  guard     : Prop









def sevenYearsInDays : Nat := 7 * 365




def WithinSevenYearLimitation (c : ComplaintText) : Prop :=
  chargeInstitutedDay c - offenseDay c ≤ sevenYearsInDays




def ElectionBeforeFinalJudgment (c : ComplaintText) : Prop :=
  electionDay c < finalJudgmentDay c





structure Section245ProsecutionAuthorized (p : Person) (c : ComplaintText) : Prop where
  certified : ProsecutionCertified p c







structure Section247TimelyProsecution (p : Person) (c : ComplaintText) : Prop where
  certified : ProsecutionCertified p c
  commerce  : AffectsInterstateCommerce p c
  timely    : IsNoncapitalOffense p c → WithinSevenYearLimitation c








structure Section249TimelyProsecution (p : Person) (c : ComplaintText) : Prop where
  certified  : ProsecutionCertified p c
  ground     : CertificationGroundEstablished p c
  guidelines : ProsecutionFollowsAGGuidelines p c
  timely     : ¬ DeathResulted p c → WithinSevenYearLimitation c





structure Section248PrivateCivilAction (p : Person) (c : ComplaintText) : Prop where
  aggrieved : PlaintiffIsAggrievedPerson p c
  commenced : CivilActionCommenced p c
  venue     : FiledInAppropriateDistrictCourt p c



structure Section248AGCivilAction (p : Person) (c : ComplaintText) : Prop where
  cause     : AGHasReasonableCause p c
  commenced : CivilActionCommenced p c
  venue     : FiledInAppropriateDistrictCourt p c



structure Section248StateAGCivilAction (p : Person) (c : ComplaintText) : Prop where
  parens    : StateAGParensPatriae p c
  commenced : CivilActionCommenced p c
  venue     : FiledInAppropriateDistrictCourt p c



structure Section248SubsequentOffense (p : Person) (c : ComplaintText) : Prop where
  prior : PriorConvictionUnderSection p c




inductive Section248CivilActionProper (p : Person) (c : ComplaintText) : Prop
  | privateAction : Section248PrivateCivilAction p c → Section248CivilActionProper p c
  | usAG          : Section248AGCivilAction p c → Section248CivilActionProper p c
  | stateAG       : Section248StateAGCivilAction p c → Section248CivilActionProper p c

end Proving.USC.T18.Ch13.Procedure
