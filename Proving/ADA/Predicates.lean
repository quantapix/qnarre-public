














import Proving.ADA.Types

namespace Proving.ADA












axiom HasDisability (p : Person) (c : ComplaintText) : Prop








axiom IsCoveredEmployer (d : CoveredEntity) (c : ComplaintText) : Prop






axiom IsQualifiedIndividualForEmployment (p : Person) (c : ComplaintText) : Prop





axiom OccursInEmploymentContext (a : Action) (c : ComplaintText) : Prop






axiom DiscriminatedAgainstOnBasisOfDisability (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop




axiom AdverseEmploymentAction (a : Action) (p : Person) (c : ComplaintText) : Prop







axiom NeededReasonableAccommodation (a : Action) (p : Person) (c : ComplaintText) : Prop





axiom AccommodationReasonableNotUndueHardship (a : Action) (c : ComplaintText) : Prop




axiom EmployerFailedToAccommodate (a : Action) (p : Person) (c : ComplaintText) : Prop







axiom IsPublicEntity (d : CoveredEntity) (c : ComplaintText) : Prop






axiom IsQualifiedIndividualForPublicService (p : Person) (c : ComplaintText) : Prop



axiom IsServiceOfPublicEntity (pr : Program) (d : CoveredEntity) (c : ComplaintText) : Prop



axiom OccursUnderService (a : Action) (pr : Program) (c : ComplaintText) : Prop





axiom ExcludedOrDeniedByReasonOfDisability (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop







axiom IsPlaceOfPublicAccommodation (pr : Program) (c : ComplaintText) : Prop




axiom OwnsLeasesOrOperates (d : CoveredEntity) (pr : Program) (c : ComplaintText) : Prop




axiom ConcernsEnjoymentOfGoodsServices (a : Action) (c : ComplaintText) : Prop







axiom DiscriminatedOnBasisOfDisabilityInEnjoyment (a : Action) (p : Person) (c : ComplaintText) : Prop







axiom NeededReasonableModification (a : Action) (p : Person) (c : ComplaintText) : Prop




axiom ModificationNotFundamentalAlteration (a : Action) (c : ComplaintText) : Prop




axiom FailedToMakeModification (a : Action) (p : Person) (c : ComplaintText) : Prop








axiom EngagedInProtectedActivity (p : Person) (c : ComplaintText) : Prop


















axiom AdverseActionBy (defendant : CoveredEntity) (a : Action) (p : Person)
    (c : ComplaintText) : Prop





axiom RetaliatoryCausation (a : Action) (p : Person) (c : ComplaintText) : Prop

end Proving.ADA
