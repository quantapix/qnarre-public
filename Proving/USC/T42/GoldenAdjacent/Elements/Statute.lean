








import Proving.USC.Common.Predicates
import Proving.USC.T42.GoldenAdjacent.Elements.Predicates

namespace Proving.USC.T42.GoldenAdjacent.Elements

open Proving.USC.Common




structure Section1982
    (p : Person) (r : PropertyRight) (c : ComplaintText) : Prop where
  citizen      : IsUnitedStatesCitizen p c
  covered      : CoversProtectedPropertyRight r c
  interference : InterferesWithPropertyRight p r c
  racial       : OnBasisOfRace p r c
  causation    : ProximateCause p c




structure Section1988b
    (p : Person) (a : EnforcementAction) (c : ComplaintText) : Prop where
  enforces     : EnforcesEnumeratedCivilRightsStatute a c
  prevailing   : IsPrevailingParty p a c
  notUS        : NotTheUnitedStates p c
  notBarred    : ¬ JudicialOfficerFeeBar p a c



structure Section1988c
    (p : Person) (a : EnforcementAction) (c : ComplaintText) : Prop where
  feeEntitled  : Section1988b p a c
  section1981  : EnforcesSection1981OrA a c



inductive ValidFeeAward
    (p : Person) (a : EnforcementAction) (c : ComplaintText) : Prop where
  | attorneyFee : Section1988b p a c → ValidFeeAward p a c
  | expertFee   : Section1988c p a c → ValidFeeAward p a c

end Proving.USC.T42.GoldenAdjacent.Elements
