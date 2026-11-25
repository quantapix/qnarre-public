
















import Proving.ADA.Predicates

namespace Proving.ADA





structure Title1Coverage
    (plaintiff : Person) (defendant : CoveredEntity)
    (a : Action) (c : ComplaintText) : Prop where
  disability        : HasDisability plaintiff c
  employer          : IsCoveredEmployer defendant c
  qualified         : IsQualifiedIndividualForEmployment plaintiff c
  employmentContext : OccursInEmploymentContext a c



structure Title1DisparateTreatmentClaim
    (plaintiff : Person) (defendant : CoveredEntity)
    (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop where
  coverage : Title1Coverage plaintiff defendant a c
  onBasis  : DiscriminatedAgainstOnBasisOfDisability a g c
  adverse  : AdverseEmploymentAction a plaintiff c



structure Title1FailureToAccommodateClaim
    (plaintiff : Person) (defendant : CoveredEntity)
    (a : Action) (c : ComplaintText) : Prop where
  coverage   : Title1Coverage plaintiff defendant a c
  needed     : NeededReasonableAccommodation a plaintiff c
  reasonable : AccommodationReasonableNotUndueHardship a c
  failed     : EmployerFailedToAccommodate a plaintiff c






structure Title2Coverage
    (plaintiff : Person) (defendant : CoveredEntity)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  disability      : HasDisability plaintiff c
  publicEntity    : IsPublicEntity defendant c
  qualified       : IsQualifiedIndividualForPublicService plaintiff c
  serviceOfEntity : IsServiceOfPublicEntity pr defendant c
  underService    : OccursUnderService a pr c




structure Title2Claim
    (plaintiff : Person) (defendant : CoveredEntity)
    (pr : Program) (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop where
  coverage : Title2Coverage plaintiff defendant pr a c
  byReason : ExcludedOrDeniedByReasonOfDisability a g c







structure Title3Coverage
    (plaintiff : Person) (defendant : CoveredEntity)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  disability                 : HasDisability plaintiff c
  placeOfPublicAccommodation : IsPlaceOfPublicAccommodation pr c
  ownsOperates               : OwnsLeasesOrOperates defendant pr c
  enjoymentContext           : ConcernsEnjoymentOfGoodsServices a c




structure Title3DisparateTreatmentClaim
    (plaintiff : Person) (defendant : CoveredEntity)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  coverage : Title3Coverage plaintiff defendant pr a c
  onBasis  : DiscriminatedOnBasisOfDisabilityInEnjoyment a plaintiff c





structure Title3FailureToModifyClaim
    (plaintiff : Person) (defendant : CoveredEntity)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  coverage      : Title3Coverage plaintiff defendant pr a c
  needed        : NeededReasonableModification a plaintiff c
  notFundamental : ModificationNotFundamentalAlteration a c
  failed        : FailedToMakeModification a plaintiff c








structure RetaliationClaim
    (plaintiff : Person) (defendant : CoveredEntity)
    (a : Action) (c : ComplaintText) : Prop where
  protectedAct : EngagedInProtectedActivity plaintiff c
  adverse      : AdverseActionBy defendant a plaintiff c
  causal       : RetaliatoryCausation a plaintiff c







inductive ValidADAComplaint
    (plaintiff : Person) (defendant : CoveredEntity) (c : ComplaintText) : Prop where
  | viaTitle1DisparateTreatment
      (a : Action) (g : ProtectedGround)
      (h : Title1DisparateTreatmentClaim plaintiff defendant a g c) :
      ValidADAComplaint plaintiff defendant c
  | viaTitle1FailureToAccommodate
      (a : Action)
      (h : Title1FailureToAccommodateClaim plaintiff defendant a c) :
      ValidADAComplaint plaintiff defendant c
  | viaTitle2
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : Title2Claim plaintiff defendant pr a g c) :
      ValidADAComplaint plaintiff defendant c
  | viaTitle3DisparateTreatment
      (pr : Program) (a : Action)
      (h : Title3DisparateTreatmentClaim plaintiff defendant pr a c) :
      ValidADAComplaint plaintiff defendant c
  | viaTitle3FailureToModify
      (pr : Program) (a : Action)
      (h : Title3FailureToModifyClaim plaintiff defendant pr a c) :
      ValidADAComplaint plaintiff defendant c
  | viaRetaliation
      (a : Action)
      (h : RetaliationClaim plaintiff defendant a c) :
      ValidADAComplaint plaintiff defendant c

end Proving.ADA
