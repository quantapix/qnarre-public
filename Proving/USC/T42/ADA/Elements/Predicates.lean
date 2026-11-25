

















import Proving.USC.T42.ADA.Elements.Types

namespace Proving.USC.T42.ADA.Elements

open Proving.USC.Common










axiom HasActualImpairmentLimitingMLA (p : Person) (c : ComplaintText) : Prop



axiom HasRecordOfImpairment (p : Person) (c : ComplaintText) : Prop





axiom IsRegardedAsImpaired (p : Person) (c : ComplaintText) : Prop







axiom IsCoveredEntity (ce : CoveredEntity) (c : ComplaintText) : Prop




axiom IsQualifiedIndividualEmployment (p : Person) (c : ComplaintText) : Prop




axiom AdverseEmploymentActionTaken (a : EmploymentAction) (c : ComplaintText) : Prop




axiom ActionOnBasisOfDisability (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop





axiom FailedToReasonablyAccommodate (ce : CoveredEntity) (p : Person) (c : ComplaintText) : Prop





axiom AccommodationImposesUndueHardship (ce : CoveredEntity) (c : ComplaintText) : Prop






axiom IsPublicEntity (pe : PublicEntity) (c : ComplaintText) : Prop





axiom IsQualifiedIndividualPublicService (p : Person) (c : ComplaintText) : Prop





axiom ExcludedFromPublicService (s : PublicService) (c : ComplaintText) : Prop




axiom ExclusionByReasonOfDisability (p : Person) (s : PublicService) (c : ComplaintText) : Prop






axiom OperatesPublicAccommodation (pa : PublicAccommodation) (c : ComplaintText) : Prop





axiom DeniedFullEqualEnjoyment (a : AccommodationAct) (c : ComplaintText) : Prop




axiom DenialOnBasisOfDisability (p : Person) (a : AccommodationAct) (c : ComplaintText) : Prop










axiom PosesDirectThreat (p : Person) (c : ComplaintText) : Prop








axiom EngagedInProtectedActivityADA (p : Person) (c : ComplaintText) : Prop




axiom RetaliatoryActOccurredADA (p : Person) (c : ComplaintText) : Prop




axiom RetaliationCausalNexus (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.ADA.Elements
