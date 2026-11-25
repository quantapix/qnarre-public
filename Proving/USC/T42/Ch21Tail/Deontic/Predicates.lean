






import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Tail.Deontic.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21Tail.Deontic

open Proving.USC.Common









axiom AddresseeInClass1997d (p : Person) (c : ComplaintText) : Prop





axiom ProtectedReportMade (r : Person) (c : ComplaintText) : Prop





axiom ConditionsMayConstituteSubchapterViolation (c : ComplaintText) : Prop




axiom RetaliationOccurred (p : Person) (r : Person) (c : ComplaintText) : Prop




axiom RetaliationForSoReporting (p : Person) (r : Person) (c : ComplaintText) : Prop






axiom AddresseeInClass1997g (a : Entity) (c : ComplaintText) : Prop





axiom InstitutionCoveredBySubchapter (i : Institution) (c : ComplaintText) : Prop





axiom DeplorableConditionsDepriveRights (i : Institution) (c : ComplaintText) : Prop





axiom VoluntaryGoodFaithCorrectionUndertaken
    (a : Entity) (i : Institution) (c : ComplaintText) : Prop




axiom FederalFundsAvailableForImprovement (i : Institution) (c : ComplaintText) : Prop




axiom PriorityGivenToConditionCorrection
    (a : Entity) (i : Institution) (c : ComplaintText) : Prop





axiom DeclinesFundRedirection (a : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Tail.Deontic
