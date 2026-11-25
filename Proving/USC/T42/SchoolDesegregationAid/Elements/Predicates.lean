

















import Proving.USC.T42.SchoolDesegregationAid.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.SchoolDesegregationAid.Elements

open Proving.USC.Common








axiom IsPublicEducationalUnit (u : PublicEducationalUnit) (c : ComplaintText) : Prop






axiom IsSchoolBoard (u : PublicEducationalUnit) (c : ComplaintText) : Prop






axiom PlanEffectsDesegregation (pl : DesegregationPlan) (c : ComplaintText) : Prop








axiom SeeksToOvercomeRacialImbalance (pl : DesegregationPlan) (c : ComplaintText) : Prop








axiom LegallyResponsibleForPublicSchool (u : PublicEducationalUnit) (c : ComplaintText) : Prop





axiom ApplicationSubmitted (u : PublicEducationalUnit) (c : ComplaintText) : Prop





axiom SeeksDesegregationTechnicalAssistance (u : PublicEducationalUnit) (pl : DesegregationPlan) (c : ComplaintText) : Prop






axiom IsDesegregationTrainingInstitute (tp : TrainingProgram) (c : ComplaintText) : Prop





axiom GrantPurposeIsDesegregationTraining (tp : TrainingProgram) (c : ComplaintText) : Prop








axiom IsActionUnderSubchapter (c : ComplaintText) : Prop










axiom ClassificationForNonProtectedReason (u : PublicEducationalUnit) (c : ComplaintText) : Prop

end Proving.USC.T42.SchoolDesegregationAid.Elements
