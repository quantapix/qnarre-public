








import Proving.USC.Common.Types
import Proving.USC.T42.ReligiousFreedom.Elements.Types
import Proving.USC.T42.ReligiousFreedom.Elements.Predicates
import Proving.USC.T42.ReligiousFreedom.Elements.Statute

namespace Proving.USC.T42.ReligiousFreedom.Elements

open Proving.USC.Common


theorem section1996_intro {p c}
    (hProt : IsProtectedNativePerson p c)
    (hEx : ExercisesTraditionalReligion p c) :
    Section1996 p c :=
  ⟨hProt, hEx⟩


theorem section1996a_intro {p a c}
    (hIndian : IsIndianTribeMember p c)
    (hPeyote : IsPeyoteUsePossessionTransport a c)
    (hCeremonial : IsBonaFideCeremonialPurpose a c)
    (hReligion : InConnectionWithTraditionalIndianReligion a c)
    (hAdverse : PenalizedOrDiscriminatedForPeyote p a c)
    (hNotCarved : ¬ WithinPeyoteRegulatoryCarveout a c) :
    Section1996a p a c :=
  ⟨hIndian, hPeyote, hCeremonial, hReligion, hAdverse, hNotCarved⟩


theorem section1996b_intro_deniedOpportunity {p d c}
    (hActor : IsAdoptionFosterPlacementActor p c)
    (hDenied : DeniedOpportunityToParent p d c)
    (hBasis : OnBasisOfRaceColorNationalOrigin p d c)
    (hNotICWA : ¬ WithinICWASavingsCarveout d c) :
    Section1996b p d c :=
  ⟨hActor, .deniedOpportunity hDenied, hBasis, hNotICWA⟩


theorem section1996b_intro_delayedOrDenied {p d c}
    (hActor : IsAdoptionFosterPlacementActor p c)
    (hDelayed : DelayedOrDeniedPlacement p d c)
    (hBasis : OnBasisOfRaceColorNationalOrigin p d c)
    (hNotICWA : ¬ WithinICWASavingsCarveout d c) :
    Section1996b p d c :=
  ⟨hActor, .delayedOrDenied hDelayed, hBasis, hNotICWA⟩

end Proving.USC.T42.ReligiousFreedom.Elements
