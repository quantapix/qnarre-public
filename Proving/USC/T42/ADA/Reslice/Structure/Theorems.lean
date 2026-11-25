





import Proving.USC.T42.ADA.Reslice.Structure.Types
import Proving.USC.T42.ADA.Reslice.Structure.Predicates
import Proving.USC.T42.ADA.Reslice.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Structure

open Proving.USC.Common


theorem definitions12112Resolve_intro {c : ComplaintText}
    (hDisability : TermDefinedInReferencedSection termDisability edgeIncorporates12102 c)
    (hCoveredEntity : TermDefinedInReferencedSection termCoveredEntity edgeIncorporates12111 c)
    (hQualified : TermDefinedInReferencedSection termQualifiedIndividual edgeIncorporates12111 c)
    (hAccommodation : TermDefinedInReferencedSection termReasonableAccommodation
      edgeIncorporates12111Accommodation c)
    (hUndueHardship : TermDefinedInReferencedSection termUndueHardship
      edgeIncorporates12111Accommodation c)
    (hDisabilityInc : IncorporationHonored edgeIncorporates12102 c)
    (hEmploymentInc : IncorporationHonored edgeIncorporates12111 c)
    (hAccommodationInc : IncorporationHonored edgeIncorporates12111Accommodation c)
    (hSubsectionRef : InternalCrossReferenceResolves edgeInternalBtoA c)
    : Definitions12112Resolve c :=
  { disabilityDefined := hDisability
  , coveredEntityDefined := hCoveredEntity
  , qualifiedIndividualDefined := hQualified
  , reasonableAccommodationDefined := hAccommodation
  , undueHardshipDefined := hUndueHardship
  , disabilityIncorporationHonored := hDisabilityInc
  , employmentTermsIncorporationHonored := hEmploymentInc
  , accommodationIncorporationHonored := hAccommodationInc
  , definitionalSubsectionRef := hSubsectionRef }


theorem medicalInquiryRegime12112Coherent_intro {c : ComplaintText}
    (hScopeRef : InternalCrossReferenceResolves edgeInternalD1toA c)
    (hPostOffer : ReferencedSectionExists edgeExceptD2AtoD3 c)
    (hPreOffer : ReferencedSectionExists edgeExceptD2AtoD2B c)
    (hVoluntary : ReferencedSectionExists edgeExceptD4AtoD4B c)
    (hConfidentiality : SubjectToConstraintSatisfied edgeSubjectToD4CtoD3B c)
    (hUseRestriction : SubjectToConstraintSatisfied edgeSubjectToD4CtoD3C c)
    (hInvestigatorScope : EnclosingScopeReferenceResolves edgeChapterScopeD3Biii c)
    (hResultsScope : EnclosingScopeReferenceResolves edgeSubchapterScopeD3C c)
    : MedicalInquiryRegime12112Coherent c :=
  { prohibitionScopeRef := hScopeRef
  , postOfferExaminationCarveExists := hPostOffer
  , preOfferAbilityInquiryCarveExists := hPreOffer
  , voluntaryHealthProgramCarveExists := hVoluntary
  , confidentialityConstraintSatisfied := hConfidentiality
  , useRestrictionConstraintSatisfied := hUseRestriction
  , investigatorDisclosureScope := hInvestigatorScope
  , examinationResultsUseScope := hResultsScope }


theorem coherent12112_intro {c : ComplaintText}
    (hDefs : Definitions12112Resolve c)
    (hMedical : MedicalInquiryRegime12112Coherent c)
    (hForeignLaw : ReferencedSectionExists edgeExceptAtoC1 c)
    (hForeignPerson : ReferencedSectionExists edgeExceptAtoC2B c)
    (hControlTest : InternalCrossReferenceResolves edgeInternalC2CtoC2 c)
    (hSubchapterScope : EnclosingScopeReferenceResolves edgeSubchapterScopeB2 c)
    : Coherent12112 c :=
  { definitions := hDefs
  , medicalRegime := hMedical
  , foreignLawConflictCarveExists := hForeignLaw
  , foreignPersonCarveExists := hForeignPerson
  , employerControlTestRef := hControlTest
  , subchapterProhibitionScope := hSubchapterScope }


theorem section12112ExceptionPath_foreignLawConflict_intro {c : ComplaintText}
    (h : ExceptionApplies edgeExceptAtoC1 c) : Section12112ExceptionPath c :=
  .foreignLawConflict h


theorem section12112ExceptionPath_foreignPersonNotControlled_intro {c : ComplaintText}
    (h : ExceptionApplies edgeExceptAtoC2B c) : Section12112ExceptionPath c :=
  .foreignPersonNotControlled h


theorem section12112ExceptionPath_postOfferExamination_intro {c : ComplaintText}
    (h : ExceptionApplies edgeExceptD2AtoD3 c) : Section12112ExceptionPath c :=
  .postOfferExamination h


theorem section12112ExceptionPath_preOfferAbilityInquiry_intro {c : ComplaintText}
    (h : ExceptionApplies edgeExceptD2AtoD2B c) : Section12112ExceptionPath c :=
  .preOfferAbilityInquiry h


theorem section12112ExceptionPath_voluntaryHealthProgram_intro {c : ComplaintText}
    (h : ExceptionApplies edgeExceptD4AtoD4B c) : Section12112ExceptionPath c :=
  .voluntaryHealthProgram h

end Proving.USC.T42.ADA.Reslice.Structure
