












import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.GoldenAdjacent.Elements.Types

namespace Proving.USC.T42.GoldenAdjacent.Elements

open Proving.USC.Common






axiom IsUnitedStatesCitizen (p : Person) (c : ComplaintText) : Prop




axiom CoversProtectedPropertyRight (r : PropertyRight) (c : ComplaintText) : Prop




axiom InterferesWithPropertyRight (p : Person) (r : PropertyRight) (c : ComplaintText) : Prop





axiom OnBasisOfRace (p : Person) (r : PropertyRight) (c : ComplaintText) : Prop







axiom EnforcesEnumeratedCivilRightsStatute (a : EnforcementAction) (c : ComplaintText) : Prop



axiom IsPrevailingParty (p : Person) (a : EnforcementAction) (c : ComplaintText) : Prop




axiom NotTheUnitedStates (p : Person) (c : ComplaintText) : Prop







axiom JudicialOfficerFeeBar (p : Person) (a : EnforcementAction) (c : ComplaintText) : Prop




axiom EnforcesSection1981OrA (a : EnforcementAction) (c : ComplaintText) : Prop

end Proving.USC.T42.GoldenAdjacent.Elements
