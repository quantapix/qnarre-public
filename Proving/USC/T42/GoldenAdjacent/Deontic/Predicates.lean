







import Proving.USC.T42.GoldenAdjacent.Deontic.Types

namespace Proving.USC.T42.GoldenAdjacent.Deontic

open Proving.USC.Common














axiom IsCitizenWithPropertyRight (p : Person) (c : ComplaintText) : Prop





axiom PropertyRightDenied (p : Person) (c : ComplaintText) : Prop




axiom DenialOnRacialBasis (p : Person) (c : ComplaintText) : Prop










axiom ActionEnforcesListedProvision (c : ComplaintText) : Prop




axiom IsPrevailingParty (p : Person) (c : ComplaintText) : Prop




axiom FeeAllowed (ct : Court) (p : Person) (c : ComplaintText) : Prop






axiom JudicialOfficerExceptionClears (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.GoldenAdjacent.Deontic
