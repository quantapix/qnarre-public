





import Proving.USC.T18.Sec1961BPredicates.Ontology.Types
import Proving.USC.T18.Sec1961BPredicates.Ontology.Predicates
import Proving.USC.T18.Sec1961BPredicates.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Sec1961BPredicates.Ontology

open Proving.USC.Common



theorem illegalGamblingBusinessDef_intro {g c}
    (hState : ViolatesStateGamblingLaw g c)
    (hFive  : InvolvesFiveOrMorePersons g c)
    (hCont  : MeetsContinuityOrRevenueThreshold g c)
    (hMem   : IsIllegalGamblingBusiness g c)
    : IllegalGamblingBusinessDef g c :=
  ⟨hState, hFive, hCont, hMem⟩



theorem meansOfIdViaAccessDevice_intro {m a c}
    (hAccess : IsAccessDevice a c) (hMeans : IsMeansOfIdentification m c)
    : MeansOfIdViaAccessDevice m a c :=
  ⟨hAccess, hMeans⟩



theorem falseAuthFeatureDef_intro {f e c}
    (hAuthority : IsIssuingAuthority e c) (hFeature : IsFalseAuthenticationFeature f c)
    : FalseAuthFeatureDef f e c :=
  ⟨hAuthority, hFeature⟩



theorem personalIdCardDef_intro {p d c}
    (hDoc : IsIdentificationDocument d c) (hCard : IsPersonalIdentificationCard p c)
    : PersonalIdCardDef p d c :=
  ⟨hDoc, hCard⟩


theorem accessDeviceStatus_counterfeit_intro {a c}
    (h : IsCounterfeitAccessDevice a c) : AccessDeviceStatus a c :=
  .counterfeit h


theorem accessDeviceStatus_unauthorized_intro {a c}
    (h : IsUnauthorizedAccessDevice a c) : AccessDeviceStatus a c :=
  .unauthorized h

end Proving.USC.T18.Sec1961BPredicates.Ontology
