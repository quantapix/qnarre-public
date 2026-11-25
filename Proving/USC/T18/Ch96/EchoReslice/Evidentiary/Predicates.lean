









import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch96.EchoReslice.Evidentiary.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Evidentiary

open Proving.USC.Common










def Allocation1967Scope : Allocation :=
  (Bearer.Government, Standard.Preponderance, Presumption.None)








def Allocation1967ClosureStatutory : Option Allocation := Option.none







axiom closureMovant (c : ComplaintText) : Bearer





noncomputable def Allocation1967ClosureResidual (c : ComplaintText) : Allocation :=
  (closureMovant c, Standard.Preponderance, Presumption.None)








axiom CivilActionInstitutedByUnitedStates (c : ComplaintText) : Prop





axiom ProceedingAncillaryToChapterAction (c : ComplaintText) : Prop





axiom AffectedPersonRightsAtStake (p : Person) (c : ComplaintText) : Prop






axiom CourtConsideredRightsOfAffectedPersons (c : ComplaintText) : Prop





axiom AccessRulingMadeByCourt (r : AccessRuling) (c : ComplaintText) : Prop





axiom BurdenCarried (b : Bearer) (s : Standard) (c : ComplaintText) : Prop






axiom PresumptionRebutted (pr : Presumption) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.EchoReslice.Evidentiary
