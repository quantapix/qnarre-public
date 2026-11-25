







import Proving.USC.T18.Ch73.Reslice.Scienter.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)





axiom MentalStateProven (p : Person) (cl : Clause) (rung : MentalState)
    (c : ComplaintText) : Prop






axiom Corruptly (p : Person) (c : ComplaintText) : Prop






axiom MisleadingConductButForLackOfStateOfMind (p : Person) (c : ComplaintText) : Prop





axiom ActsWithImproperPurpose (p : Person) (c : ComplaintText) : Prop





axiom SoleIntentionToEncourageTruthfulTestimony (p : Person) (c : ComplaintText) : Prop






axiom ConductSolelyLawful (p : Person) (c : ComplaintText) : Prop







axiom LawfulBonaFideLegalRepresentation (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Reslice.Scienter
