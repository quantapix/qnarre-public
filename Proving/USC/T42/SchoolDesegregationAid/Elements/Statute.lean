













import Proving.USC.T42.SchoolDesegregationAid.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.SchoolDesegregationAid.Elements

open Proving.USC.Common






structure TechnicalAssistanceClaim
    (u : PublicEducationalUnit) (pl : DesegregationPlan) (c : ComplaintText) : Prop where
  coveredUnit   : IsPublicEducationalUnit u c
  responsible   : LegallyResponsibleForPublicSchool u c
  applied       : ApplicationSubmitted u c
  seeksAid      : SeeksDesegregationTechnicalAssistance u pl c
  desegregation : PlanEffectsDesegregation pl c
  notImbalance  : ¬ SeeksToOvercomeRacialImbalance pl c



structure TrainingInstituteClaim
    (tp : TrainingProgram) (c : ComplaintText) : Prop where
  institute : IsDesegregationTrainingInstitute tp c





structure InserviceTrainingGrantClaim
    (u : PublicEducationalUnit) (tp : TrainingProgram) (c : ComplaintText) : Prop where
  schoolBoard : IsSchoolBoard u c
  applied     : ApplicationSubmitted u c
  purpose     : GrantPurposeIsDesegregationTraining tp c



structure UnitedStatesCostLiability (c : ComplaintText) : Prop where
  underSubchapter : IsActionUnderSubchapter c




inductive ValidDesegregationAssistanceClaim
    (u : PublicEducationalUnit) (pl : DesegregationPlan) (tp : TrainingProgram)
    (c : ComplaintText) : Prop where
  | technicalAssistance (h : TechnicalAssistanceClaim u pl c)
  | trainingInstitute   (h : TrainingInstituteClaim tp c)
  | inserviceGrant      (h : InserviceTrainingGrantClaim u tp c)

end Proving.USC.T42.SchoolDesegregationAid.Elements
