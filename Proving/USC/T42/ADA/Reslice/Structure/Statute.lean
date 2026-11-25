











import Proving.USC.T42.ADA.Reslice.Structure.Types
import Proving.USC.T42.ADA.Reslice.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Structure

open Proving.USC.Common





structure Definitions12112Resolve (c : ComplaintText) : Prop where
  disabilityDefined :
    TermDefinedInReferencedSection termDisability edgeIncorporates12102 c
  coveredEntityDefined :
    TermDefinedInReferencedSection termCoveredEntity edgeIncorporates12111 c
  qualifiedIndividualDefined :
    TermDefinedInReferencedSection termQualifiedIndividual edgeIncorporates12111 c
  reasonableAccommodationDefined :
    TermDefinedInReferencedSection termReasonableAccommodation
      edgeIncorporates12111Accommodation c
  undueHardshipDefined :
    TermDefinedInReferencedSection termUndueHardship
      edgeIncorporates12111Accommodation c
  disabilityIncorporationHonored :
    IncorporationHonored edgeIncorporates12102 c
  employmentTermsIncorporationHonored :
    IncorporationHonored edgeIncorporates12111 c
  accommodationIncorporationHonored :
    IncorporationHonored edgeIncorporates12111Accommodation c
  definitionalSubsectionRef :
    InternalCrossReferenceResolves edgeInternalBtoA c







structure MedicalInquiryRegime12112Coherent (c : ComplaintText) : Prop where
  prohibitionScopeRef :
    InternalCrossReferenceResolves edgeInternalD1toA c
  postOfferExaminationCarveExists :
    ReferencedSectionExists edgeExceptD2AtoD3 c
  preOfferAbilityInquiryCarveExists :
    ReferencedSectionExists edgeExceptD2AtoD2B c
  voluntaryHealthProgramCarveExists :
    ReferencedSectionExists edgeExceptD4AtoD4B c
  confidentialityConstraintSatisfied :
    SubjectToConstraintSatisfied edgeSubjectToD4CtoD3B c
  useRestrictionConstraintSatisfied :
    SubjectToConstraintSatisfied edgeSubjectToD4CtoD3C c
  investigatorDisclosureScope :
    EnclosingScopeReferenceResolves edgeChapterScopeD3Biii c
  examinationResultsUseScope :
    EnclosingScopeReferenceResolves edgeSubchapterScopeD3C c






structure Coherent12112 (c : ComplaintText) : Prop where
  definitions : Definitions12112Resolve c
  medicalRegime : MedicalInquiryRegime12112Coherent c
  foreignLawConflictCarveExists : ReferencedSectionExists edgeExceptAtoC1 c
  foreignPersonCarveExists : ReferencedSectionExists edgeExceptAtoC2B c
  employerControlTestRef : InternalCrossReferenceResolves edgeInternalC2CtoC2 c
  subchapterProhibitionScope :
    EnclosingScopeReferenceResolves edgeSubchapterScopeB2 c






inductive Section12112ExceptionPath (c : ComplaintText) : Prop


  | foreignLawConflict (h : ExceptionApplies edgeExceptAtoC1 c) :
      Section12112ExceptionPath c


  | foreignPersonNotControlled (h : ExceptionApplies edgeExceptAtoC2B c) :
      Section12112ExceptionPath c


  | postOfferExamination (h : ExceptionApplies edgeExceptD2AtoD3 c) :
      Section12112ExceptionPath c


  | preOfferAbilityInquiry (h : ExceptionApplies edgeExceptD2AtoD2B c) :
      Section12112ExceptionPath c


  | voluntaryHealthProgram (h : ExceptionApplies edgeExceptD4AtoD4B c) :
      Section12112ExceptionPath c

end Proving.USC.T42.ADA.Reslice.Structure
