






import Proving.USC.T18.Ch75.Reslice.Ontology.Types
import Proving.USC.T18.Ch75.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch75.Reslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Ontology

open Proving.USC.Common




theorem passportApplicationStatementMembership_intro
    {s : Statement} {ap : PassportApplication} {c : ComplaintText}
    (hApplication : IsPassportApplication ap c)
    (hFalse : IsFalseStatementInApplication s ap c)
    : PassportApplicationStatementMembership s ap c :=
  ⟨hApplication, hFalse⟩


theorem fraudulentlySecuredPassportMembership_intro
    {pp : Passport} {c : ComplaintText}
    (hPassport : IsPassport pp c)
    (hSecured : IsPassportSecuredByFalseStatement pp c)
    : FraudulentlySecuredPassportMembership pp c :=
  ⟨hPassport, hSecured⟩




theorem purportedPassportMembership_intro {pp : Passport} {c : ComplaintText}
    (hPurports : IsInstrumentPurportingToBePassport pp c)
    (hNotGenuine : ¬ IsPassport pp c)
    : PurportedPassportMembership pp c :=
  ⟨hPurports, hNotGenuine⟩


theorem falsifiedPassportDocumentMembership_intro
    {pp : Passport} {c : ComplaintText}
    (hPassport : IsPassport pp c)
    (hFalsified : IsFalselyMadeOrAlteredPassport pp c)
    : FalsifiedPassportDocumentMembership pp c :=
  .genuinePassport hPassport hFalsified


theorem falsifiedPassportDocumentMembership_intro_purportedInstrument
    {pp : Passport} {c : ComplaintText}
    (hPurported : PurportedPassportMembership pp c)
    (hFalsified : IsFalselyMadeOrAlteredPassport pp c)
    : FalsifiedPassportDocumentMembership pp c :=
  .purportedInstrument hPurported hFalsified



theorem voidedPassportMembership_intro
    {pp : Passport} {t : Time} {c : ComplaintText}
    (hPassport : IsPassport pp c)
    (hValidlyIssued : IsValidlyIssuedPassport pp c)
    (hVoided : IsVoidedByPrescribedCondition pp t c)
    : VoidedPassportMembership pp t c :=
  ⟨hPassport, hValidlyIssued, hVoided⟩




theorem passportOfAnotherMembership_intro
    {pp : Passport} {bearer user : Person} {c : ComplaintText}
    (hPassport : IsPassport pp c)
    (hDesignated : IsPassportOfAnother pp bearer c)
    (hAnother : user ≠ bearer)
    : PassportOfAnotherMembership pp bearer user c :=
  ⟨hPassport, hDesignated, hAnother⟩



theorem passportUseNormMembership_intro
    {r : PassportRule} {pp : Passport} {c : ComplaintText}
    (h : IsConditionOrRestrictionInPassport r pp c)
    : PassportUseNormMembership r pp c :=
  .conditionInPassport h



theorem passportUseNormMembership_intro_prescribedRule
    {r : PassportRule} {pp : Passport} {c : ComplaintText}
    (h : IsPassportIssuanceRule r c)
    : PassportUseNormMembership r pp c :=
  .prescribedRule h




theorem entryDocumentMembership_intro {d : EntryDocument} {c : ComplaintText}
    (h : IsImmigrantOrNonimmigrantVisa d c) : EntryDocumentMembership d c :=
  .visa h


theorem entryDocumentMembership_intro_permit
    {d : EntryDocument} {c : ComplaintText}
    (h : IsPermit d c) : EntryDocumentMembership d c :=
  .permit h


theorem entryDocumentMembership_intro_borderCrossingCard
    {d : EntryDocument} {c : ComplaintText}
    (h : IsBorderCrossingCard d c) : EntryDocumentMembership d c :=
  .borderCrossingCard h


theorem entryDocumentMembership_intro_alienRegistrationReceiptCard
    {d : EntryDocument} {c : ComplaintText}
    (h : IsAlienRegistrationReceiptCard d c) : EntryDocumentMembership d c :=
  .alienRegistrationReceiptCard h



theorem entryDocumentMembership_intro_otherPrescribed
    {d : EntryDocument} {c : ComplaintText}
    (h : IsPrescribedEntryOrStayDocument d c) : EntryDocumentMembership d c :=
  .otherPrescribed h


theorem blankPermitMembership_intro {d : EntryDocument} {c : ComplaintText}
    (hPermit : IsPermit d c) (hBlank : IsBlankPermit d c)
    : BlankPermitMembership d c :=
  ⟨hPermit, hBlank⟩


theorem counterfeitingImplementMembership_intro
    {i : Implement} {c : ComplaintText}
    (h : IsPlateForPrintingPermits i c)
    : CounterfeitingImplementMembership i c :=
  .plate h



theorem counterfeitingImplementMembership_intro_likenessImpression
    {i : Implement} {c : ComplaintText}
    (h : IsLikenessImpressionOfEntryDocument i c)
    : CounterfeitingImplementMembership i c :=
  .likenessImpression h



theorem counterfeitingImplementMembership_intro_distinctivePaper
    {i : Implement} {c : ComplaintText}
    (h : IsDistinctivePaperAdoptedForPrinting i c)
    : CounterfeitingImplementMembership i c :=
  .distinctivePaper h


theorem properOfficerMembership_intro {p : Person} {c : ComplaintText}
    (h : IsAttorneyGeneral p c) : ProperOfficerMembership p c :=
  .attorneyGeneral h



theorem properOfficerMembership_intro_commissioner
    {p : Person} {c : ComplaintText}
    (h : IsCommissionerOfImmigrationAndNaturalization p c)
    : ProperOfficerMembership p c :=
  .commissioner h


theorem properOfficerMembership_intro_otherProperOfficer
    {p : Person} {c : ComplaintText}
    (h : IsOtherProperOfficer p c) : ProperOfficerMembership p c :=
  .otherProperOfficer h



theorem materialFalseStatementMembership_intro
    {s : Statement} {f : ImmigrationFiling} {c : ComplaintText}
    (hFiling : IsImmigrationFiling f c)
    (hMaterial : IsStatementOfMaterialFact s f c)
    : MaterialFalseStatementMembership s f c :=
  ⟨hFiling, hMaterial⟩





theorem employmentVerificationObjectMembership_intro {c : ComplaintText}
    (d : IdentificationDocument) (p : Person)
    (hDoc : IsIdentificationDocument d c)
    (hNotIssued : ¬ IsLawfullyIssuedForPossessor d p c)
    : EmploymentVerificationObjectMembership c :=
  .notLawfullyIssued d p hDoc hNotIssued


theorem employmentVerificationObjectMembership_intro_falseDocument
    {c : ComplaintText} (d : IdentificationDocument)
    (hDoc : IsIdentificationDocument d c)
    (hFalse : IsFalseIdentificationDocument d c)
    : EmploymentVerificationObjectMembership c :=
  .falseDocument d hDoc hFalse


theorem employmentVerificationObjectMembership_intro_falseAttestation
    {c : ComplaintText} (a : Attestation) (hFalse : IsFalseAttestation a c)
    : EmploymentVerificationObjectMembership c :=
  .falseAttestation a hFalse




theorem stateMembership_intro {j : Jurisdiction} {c : ComplaintText}
    (h : IsStateOfTheUnitedStates j c) : StateMembership j c :=
  .stateOfTheUnitedStates h


theorem stateMembership_intro_districtOfColumbia
    {j : Jurisdiction} {c : ComplaintText}
    (h : IsDistrictOfColumbia j c) : StateMembership j c :=
  .districtOfColumbia h



theorem stateMembership_intro_commonwealthTerritoryOrPossession
    {j : Jurisdiction} {c : ComplaintText}
    (h : IsCommonwealthTerritoryOrPossession j c) : StateMembership j c :=
  .commonwealthTerritoryOrPossession h


theorem exemptAgencyMembership_intro {e : Entity} {c : ComplaintText}
    (h : IsLawEnforcementAgencyOfUnitedStates e c)
    : ExemptAgencyMembership e c :=
  .federalLawEnforcement h



theorem exemptAgencyMembership_intro_stateLawEnforcement
    {e : Entity} {c : ComplaintText} (j : Jurisdiction)
    (hState : StateMembership j c) (h : IsLawEnforcementAgencyOfState e j c)
    : ExemptAgencyMembership e c :=
  .stateLawEnforcement j hState h


theorem exemptAgencyMembership_intro_subdivisionLawEnforcement
    {e : Entity} {c : ComplaintText} (sub : Jurisdiction) (st : Jurisdiction)
    (hState : StateMembership st c) (hSub : IsSubdivisionOfState sub st c)
    (h : IsLawEnforcementAgencyOfState e sub c)
    : ExemptAgencyMembership e c :=
  .subdivisionLawEnforcement sub st hState hSub h


theorem exemptAgencyMembership_intro_federalIntelligence
    {e : Entity} {c : ComplaintText}
    (h : IsIntelligenceAgencyOfUnitedStates e c) : ExemptAgencyMembership e c :=
  .federalIntelligence h


theorem authorizedActivityMembership_intro
    {a : Act} {e : Entity} {c : ComplaintText}
    (hAgency : ExemptAgencyMembership e c)
    (hAuthorized : IsLawfullyAuthorized a e c)
    (h : IsInvestigativeActivity a c)
    : AuthorizedActivityMembership a e c :=
  .investigative hAgency hAuthorized h


theorem authorizedActivityMembership_intro_protective
    {a : Act} {e : Entity} {c : ComplaintText}
    (hAgency : ExemptAgencyMembership e c)
    (hAuthorized : IsLawfullyAuthorized a e c)
    (h : IsProtectiveActivity a c)
    : AuthorizedActivityMembership a e c :=
  .protective hAgency hAuthorized h


theorem authorizedActivityMembership_intro_intelligence
    {a : Act} {e : Entity} {c : ComplaintText}
    (hAgency : ExemptAgencyMembership e c)
    (hAuthorized : IsLawfullyAuthorized a e c)
    (h : IsIntelligenceActivity a c)
    : AuthorizedActivityMembership a e c :=
  .intelligence hAgency hAuthorized h



theorem authorizedActivityMembership_intro_titleVOcca
    {a : Act} {e : Entity} {c : ComplaintText}
    (h : IsTitleVOccaActivity a c) : AuthorizedActivityMembership a e c :=
  .titleVOcca h




theorem facilitationObjectMembership_intro {a : Act} {c : ComplaintText}
    (h : IsActOfInternationalTerrorism a c)
    : FacilitationObjectMembership a c :=
  .internationalTerrorism h


theorem facilitationObjectMembership_intro_drugTraffickingCrime
    {a : Act} {c : ComplaintText}
    (h : IsDrugTraffickingCrime a c) : FacilitationObjectMembership a c :=
  .drugTraffickingCrime h

end Proving.USC.T18.Ch75.Reslice.Ontology
