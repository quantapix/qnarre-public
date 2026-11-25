








import Proving.USC.T42.SchoolDesegregationAid.Elements.Statute

namespace Proving.USC.T42.SchoolDesegregationAid.Elements

open Proving.USC.Common


theorem technicalAssistanceClaim_intro {u pl c}
    (hCovered : IsPublicEducationalUnit u c)
    (hResp : LegallyResponsibleForPublicSchool u c)
    (hApplied : ApplicationSubmitted u c)
    (hSeeks : SeeksDesegregationTechnicalAssistance u pl c)
    (hDeseg : PlanEffectsDesegregation pl c)
    (hNotImbalance : ¬ SeeksToOvercomeRacialImbalance pl c)
    : TechnicalAssistanceClaim u pl c :=
  ⟨hCovered, hResp, hApplied, hSeeks, hDeseg, hNotImbalance⟩


theorem trainingInstituteClaim_intro {tp c}
    (hInstitute : IsDesegregationTrainingInstitute tp c)
    : TrainingInstituteClaim tp c :=
  ⟨hInstitute⟩


theorem inserviceTrainingGrantClaim_intro {u tp c}
    (hBoard : IsSchoolBoard u c)
    (hApplied : ApplicationSubmitted u c)
    (hPurpose : GrantPurposeIsDesegregationTraining tp c)
    : InserviceTrainingGrantClaim u tp c :=
  ⟨hBoard, hApplied, hPurpose⟩


theorem unitedStatesCostLiability_intro {c}
    (hUnder : IsActionUnderSubchapter c)
    : UnitedStatesCostLiability c :=
  ⟨hUnder⟩


theorem validDesegregationAssistanceClaim_of_technical {u pl tp c}
    (h : TechnicalAssistanceClaim u pl c)
    : ValidDesegregationAssistanceClaim u pl tp c :=
  .technicalAssistance h

theorem validDesegregationAssistanceClaim_of_institute {u pl tp c}
    (h : TrainingInstituteClaim tp c)
    : ValidDesegregationAssistanceClaim u pl tp c :=
  .trainingInstitute h

theorem validDesegregationAssistanceClaim_of_grant {u pl tp c}
    (h : InserviceTrainingGrantClaim u tp c)
    : ValidDesegregationAssistanceClaim u pl tp c :=
  .inserviceGrant h

end Proving.USC.T42.SchoolDesegregationAid.Elements
