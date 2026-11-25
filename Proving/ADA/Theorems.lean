













import Proving.ADA.Statute

namespace Proving.ADA



theorem title1Coverage_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {a : Action} {c : ComplaintText}
    (hDisability : HasDisability plaintiff c)
    (hEmployer   : IsCoveredEmployer defendant c)
    (hQualified  : IsQualifiedIndividualForEmployment plaintiff c)
    (hContext    : OccursInEmploymentContext a c)
    : Title1Coverage plaintiff defendant a c :=
  { disability := hDisability
    employer := hEmployer
    qualified := hQualified
    employmentContext := hContext }

theorem title1DisparateTreatmentClaim_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov     : Title1Coverage plaintiff defendant a c)
    (hOnBasis : DiscriminatedAgainstOnBasisOfDisability a g c)
    (hAdverse : AdverseEmploymentAction a plaintiff c)
    : Title1DisparateTreatmentClaim plaintiff defendant a g c :=
  { coverage := hCov
    onBasis := hOnBasis
    adverse := hAdverse }

theorem title1FailureToAccommodateClaim_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {a : Action} {c : ComplaintText}
    (hCov    : Title1Coverage plaintiff defendant a c)
    (hNeeded : NeededReasonableAccommodation a plaintiff c)
    (hReas   : AccommodationReasonableNotUndueHardship a c)
    (hFailed : EmployerFailedToAccommodate a plaintiff c)
    : Title1FailureToAccommodateClaim plaintiff defendant a c :=
  { coverage := hCov
    needed := hNeeded
    reasonable := hReas
    failed := hFailed }



theorem title2Coverage_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hDisability : HasDisability plaintiff c)
    (hEntity     : IsPublicEntity defendant c)
    (hQualified  : IsQualifiedIndividualForPublicService plaintiff c)
    (hService    : IsServiceOfPublicEntity pr defendant c)
    (hUnder      : OccursUnderService a pr c)
    : Title2Coverage plaintiff defendant pr a c :=
  { disability := hDisability
    publicEntity := hEntity
    qualified := hQualified
    serviceOfEntity := hService
    underService := hUnder }

theorem title2Claim_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (hCov      : Title2Coverage plaintiff defendant pr a c)
    (hByReason : ExcludedOrDeniedByReasonOfDisability a g c)
    : Title2Claim plaintiff defendant pr a g c :=
  { coverage := hCov
    byReason := hByReason }



theorem title3Coverage_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hDisability : HasDisability plaintiff c)
    (hPlace      : IsPlaceOfPublicAccommodation pr c)
    (hOwns       : OwnsLeasesOrOperates defendant pr c)
    (hEnjoyment  : ConcernsEnjoymentOfGoodsServices a c)
    : Title3Coverage plaintiff defendant pr a c :=
  { disability := hDisability
    placeOfPublicAccommodation := hPlace
    ownsOperates := hOwns
    enjoymentContext := hEnjoyment }

theorem title3DisparateTreatmentClaim_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hCov     : Title3Coverage plaintiff defendant pr a c)
    (hOnBasis : DiscriminatedOnBasisOfDisabilityInEnjoyment a plaintiff c)
    : Title3DisparateTreatmentClaim plaintiff defendant pr a c :=
  { coverage := hCov
    onBasis := hOnBasis }

theorem title3FailureToModifyClaim_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {pr : Program} {a : Action} {c : ComplaintText}
    (hCov         : Title3Coverage plaintiff defendant pr a c)
    (hNeeded      : NeededReasonableModification a plaintiff c)
    (hNotFundamental : ModificationNotFundamentalAlteration a c)
    (hFailed      : FailedToMakeModification a plaintiff c)
    : Title3FailureToModifyClaim plaintiff defendant pr a c :=
  { coverage := hCov
    needed := hNeeded
    notFundamental := hNotFundamental
    failed := hFailed }



theorem retaliationClaim_intro
    {plaintiff : Person} {defendant : CoveredEntity}
    {a : Action} {c : ComplaintText}
    (hProt : EngagedInProtectedActivity plaintiff c)
    (hAdv  : AdverseActionBy defendant a plaintiff c)
    (hCaus : RetaliatoryCausation a plaintiff c)
    : RetaliationClaim plaintiff defendant a c :=
  { protectedAct := hProt
    adverse := hAdv
    causal := hCaus }



theorem validADA_ofTitle1DisparateTreatment
    {plaintiff : Person} {defendant : CoveredEntity}
    {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : Title1DisparateTreatmentClaim plaintiff defendant a g c)
    : ValidADAComplaint plaintiff defendant c :=
  ValidADAComplaint.viaTitle1DisparateTreatment a g h

theorem validADA_ofTitle1FailureToAccommodate
    {plaintiff : Person} {defendant : CoveredEntity}
    {a : Action} {c : ComplaintText}
    (h : Title1FailureToAccommodateClaim plaintiff defendant a c)
    : ValidADAComplaint plaintiff defendant c :=
  ValidADAComplaint.viaTitle1FailureToAccommodate a h

theorem validADA_ofTitle2
    {plaintiff : Person} {defendant : CoveredEntity}
    {pr : Program} {a : Action} {g : ProtectedGround} {c : ComplaintText}
    (h : Title2Claim plaintiff defendant pr a g c)
    : ValidADAComplaint plaintiff defendant c :=
  ValidADAComplaint.viaTitle2 pr a g h

theorem validADA_ofTitle3DisparateTreatment
    {plaintiff : Person} {defendant : CoveredEntity}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : Title3DisparateTreatmentClaim plaintiff defendant pr a c)
    : ValidADAComplaint plaintiff defendant c :=
  ValidADAComplaint.viaTitle3DisparateTreatment pr a h

theorem validADA_ofTitle3FailureToModify
    {plaintiff : Person} {defendant : CoveredEntity}
    {pr : Program} {a : Action} {c : ComplaintText}
    (h : Title3FailureToModifyClaim plaintiff defendant pr a c)
    : ValidADAComplaint plaintiff defendant c :=
  ValidADAComplaint.viaTitle3FailureToModify pr a h

theorem validADA_ofRetaliation
    {plaintiff : Person} {defendant : CoveredEntity}
    {a : Action} {c : ComplaintText}
    (h : RetaliationClaim plaintiff defendant a c)
    : ValidADAComplaint plaintiff defendant c :=
  ValidADAComplaint.viaRetaliation a h

end Proving.ADA
