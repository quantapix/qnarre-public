







import Proving.USC.T42.PublicAccommodations.Entitlement.Deontic.Statute
import Proving.USC.T42.PublicAccommodations.Entitlement.Deontic.Predicates
import Proving.USC.T42.PublicAccommodations.Entitlement.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Deontic

open Proving.USC.Common



theorem prohibition2000a_intro {p est c}
    (hAddr : AddresseeOperatesEstablishment p est c)
    (hCond : EstablishmentIsCovered est c)
    (hNotExempt : ¬ IsPrivateClubExempt est c) :
    Prohibition2000a p est c :=
  ⟨hAddr, hCond, hNotExempt⟩



theorem prohibitionViolated2000a_intro {p est c}
    (hAddr : AddresseeOperatesEstablishment p est c)
    (hCond : EstablishmentIsCovered est c)
    (hNotExempt : ¬ IsPrivateClubExempt est c)
    (hAct : DiscriminationActOccurred p est c) :
    ProhibitionViolated2000a p est c :=
  ⟨⟨hAddr, hCond, hNotExempt⟩, hAct⟩



theorem permission2000a3_intro {p c}
    (hAddr : IsPersonAggrieved p c)
    (hCond : ProhibitedActEngagedOrImminent c) :
    Permission2000a3 p c :=
  ⟨hAddr, hCond⟩



theorem permissionExercised2000a3_intro {p c}
    (hAddr : IsPersonAggrieved p c)
    (hCond : ProhibitedActEngagedOrImminent c)
    (hAct : PreventiveReliefActionInstituted p c) :
    PermissionExercised2000a3 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem power2000a6_intro {c}
    (hCond : ProceedingInstitutedUnderSubchapter c) :
    Power2000a6 c :=
  ⟨hCond⟩

end Proving.USC.T42.PublicAccommodations.Entitlement.Deontic
