







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch13.Reearn.Scienter.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Scienter

open Proving.USC.Common













axiom MentalStateProvenAt (p : Person) (l : ScienterLocus) (rung : MentalState)
    (c : ComplaintText) : Prop










axiom UnclassifiedDemandMet (p : Person) (l : ScienterLocus) (c : ComplaintText) : Prop










axiom LawEnforcementLawfulDutyExclusion (p : Person) (c : ComplaintText) : Prop








axiom ParentalGuardianExclusion (p : Person) (c : ComplaintText) : Prop










def requiredDemand : ScienterLocus → ScienterDemand

  | .s245b_forceConduct => .requires .Specific

  | .s245b1_motive => .requires .Specific

  | .s245b2_protectedClassMotive => .requires .Specific

  | .s245b2_activityMotive => .requires .Specific

  | .s245b3_targetSelection => .requires .StrictLiability

  | .s245b4_motive => .requires .Specific

  | .s245b5_motive => .requires .Specific

  | .s245b_resultEnhancement => .requires .StrictLiability

  | .s245a1_certification => .unspecified

  | .s247a1_conduct => .requires .Specific

  | .s247a1_religiousCharacterMotive => .requires .Specific

  | .s247a2_conduct => .requires .Specific

  | .s247b_commerceNexus => .requires .StrictLiability

  | .s247c_conduct => .requires .Specific

  | .s247c_protectedClassMotive => .requires .Specific

  | .s247d_resultEnhancement => .requires .StrictLiability

  | .s247e_certification => .unspecified

  | .s248a1_conduct => .requires .Specific

  | .s248a1_reproductiveServicesMotive => .requires .Specific

  | .s248a2_conduct => .requires .Specific

  | .s248a3_conduct => .requires .Specific


  | .s248a3_facilityMotive => .requires .Specific

  | .s248b_resultEnhancement => .requires .StrictLiability

  | .s248b_recidivism => .requires .StrictLiability

  | .s248c2_attorneyGeneralBelief => .requires .Negligence

  | .s248c3_stateAttorneyGeneralBelief => .requires .Negligence

end Proving.USC.T18.Ch13.Reearn.Scienter
