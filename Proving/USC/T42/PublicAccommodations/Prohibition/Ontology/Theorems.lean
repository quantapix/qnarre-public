







import Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Ontology

open Proving.USC.Common


theorem groundedTreatment_intro {t g c}
    (hTreat : IsDiscriminatoryTreatment t c)
    (hGround : IsOnProtectedGround t g c)
    : GroundedTreatment t g c :=
  ⟨hTreat, hGround⟩



theorem section2000a1Membership_intro {x s t g c}
    (hEst : IsEstablishment x c)
    (hState : IsStateLawInstrument s c)
    (hGrounded : GroundedTreatment t g c)
    : Section2000a1Membership x s t g c :=
  ⟨hEst, hState, hGrounded⟩


theorem section2000a2Membership_intro {r a p c}
    (hRight : IsSecuredRight r c)
    (hInterfere : IsInterferingAct a r c)
    (hAffected : IsAffectedPerson p c)
    : Section2000a2Membership r a p c :=
  ⟨hRight, hInterfere, hAffected⟩

end Proving.USC.T42.PublicAccommodations.Prohibition.Ontology
