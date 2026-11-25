import Proving.USC.T42.Ch6ASchI.Part2.Ontology.Statute
import Proving.USC.Common.Types







namespace Proving.USC.T42.Ch6ASchI.Part2.Ontology
open Proving.USC.Common


theorem restrictedGrade_intro {g c}
    (h : IsPromotionRestrictingRegulationIssued g c) : RestrictedGrade g c :=
  ⟨h⟩


theorem promotionPermanent_intro {p c}
    (h : IsPermanentPromotion p c) : PromotionKind p c :=
  .permanent h


theorem promotionTemporary_intro {p c}
    (h : IsTemporaryPromotion p c) : PromotionKind p c :=
  .temporary h


theorem activeServiceUniformed_intro {s c}
    (h : IsUniformedServiceActiveService s c) : ActiveService s c :=
  .uniformedService h


theorem activeServicePHSComparable_intro {s c}
    (h : IsComparablePHSService s c) : ActiveService s c :=
  .comparablePHSService h


theorem activeServiceOtherCreditable_intro {s c}
    (h : IsOtherCreditableService s c) : ActiveService s c :=
  .otherCreditable h


theorem activeServiceSeniorBiomedical_intro {s c}
    (h : IsSeniorBiomedicalResearchService s c) : ActiveService s c :=
  .seniorBiomedical h



theorem activeMilitaryService_intro {s c}
    (hAct : ActiveService s c) (hDeem : IsActiveMilitaryServiceEquivalent s c)
    : ActiveMilitaryService s c :=
  ⟨hAct, hDeem⟩

end Proving.USC.T42.Ch6ASchI.Part2.Ontology
