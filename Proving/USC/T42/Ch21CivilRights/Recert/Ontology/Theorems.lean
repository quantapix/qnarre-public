











import Proving.USC.Common.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Ontology.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Ontology.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Ontology

open Proving.USC.Common




theorem isProtectedGround_intro {g : Ground} {c : ComplaintText}
    (h : IsRaceGround g c) : IsProtectedGround g c := .race h


theorem isProtectedGround_intro_color {g : Ground} {c : ComplaintText}
    (h : IsColorGround g c) : IsProtectedGround g c := .color h


theorem isProtectedGround_intro_nationalOrigin {g : Ground} {c : ComplaintText}
    (h : IsNationalOriginGround g c) : IsProtectedGround g c := .nationalOrigin h


theorem isProhibitedTreatment_intro {t : Treatment} {c : ComplaintText}
    (h : IsExclusionFromParticipation t c) : IsProhibitedTreatment t c :=
  .exclusionFromParticipation h


theorem isProhibitedTreatment_intro_denialOfBenefits
    {t : Treatment} {c : ComplaintText}
    (h : IsDenialOfBenefits t c) : IsProhibitedTreatment t c := .denialOfBenefits h


theorem isProhibitedTreatment_intro_subjectionToDiscrimination
    {t : Treatment} {c : ComplaintText}
    (h : IsSubjectionToDiscrimination t c) : IsProhibitedTreatment t c :=
  .subjectionToDiscrimination h


theorem federallyAssistedProgram_intro
    {pa : ProgramOrActivity} {e : Entity} {f : FederalFinancialAssistance}
    {c : ComplaintText}
    (hProgram : ProgramOrActivityMembership pa e f c)
    (hAssistance : IsFederalFinancialAssistance f c)
    (hReceives : ReceivesFederalFinancialAssistance pa f c)
    : FederallyAssistedProgram pa e f c :=
  ⟨hProgram, hAssistance, hReceives⟩


theorem section2000dCoveredInjury_intro
    {p : Person} {g : Ground} {t : Treatment} {pa : ProgramOrActivity}
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (hSubject : IsPersonInUS p c)
    (hGround : IsProtectedGround g c)
    (hTreatment : IsProhibitedTreatment t c)
    (hProgram : FederallyAssistedProgram pa e f c)
    : Section2000dCoveredInjury p g t pa e f c :=
  ⟨hSubject, hGround, hTreatment, hProgram⟩




theorem coveredContractInstrument_intro
    {i : AssistanceInstrument} {c : ComplaintText}
    (hContract : IsContract i c)
    (hNot : ¬ IsContractOfInsuranceOrGuaranty i c)
    : CoveredContractInstrument i c :=
  ⟨hContract, hNot⟩


theorem isCoveredAssistanceMode_intro
    {i : AssistanceInstrument} {c : ComplaintText}
    (h : IsGrant i c) : IsCoveredAssistanceMode i c := .grant h


theorem isCoveredAssistanceMode_intro_loan
    {i : AssistanceInstrument} {c : ComplaintText}
    (h : IsLoan i c) : IsCoveredAssistanceMode i c := .loan h


theorem isCoveredAssistanceMode_intro_coveredContract
    {i : AssistanceInstrument} {c : ComplaintText}
    (h : CoveredContractInstrument i c) : IsCoveredAssistanceMode i c :=
  .coveredContract h


theorem effectiveAgencyIssuance_intro
    {x : AgencyIssuance} {c : ComplaintText}
    (hIssuance : IsRuleRegulationOrOrder x c)
    (hGeneral : IsOfGeneralApplicability x c)
    (hConsistent : IsConsistentWithStatutoryObjectives x c)
    (hApproved : IsApprovedByPresident x c)
    : EffectiveAgencyIssuance x c :=
  ⟨hIssuance, hGeneral, hConsistent, hApproved⟩


theorem terminationOrRefusalMeans_intro
    {act : ComplianceAction} {e : Entity} {h : Hearing} {c : ComplaintText}
    (hRecipient : IsRecipient e c)
    (hTermination : IsTerminationOrRefusalOfAssistance act c)
    (hFinding : HasExpressFindingOnRecord act e c)
    (hHearing : AffordedOpportunityForHearing h e c)
    : TerminationOrRefusalMeans act e h c :=
  ⟨hRecipient, hTermination, hFinding, hHearing⟩


theorem isComplianceEffectingMeans_intro
    {act : ComplianceAction} {e : Entity} {h : Hearing} {c : ComplaintText}
    (hm : TerminationOrRefusalMeans act e h c)
    : IsComplianceEffectingMeans act e h c := .terminationOrRefusal hm


theorem isComplianceEffectingMeans_intro_otherAuthorizedMeans
    {act : ComplianceAction} {e : Entity} {h : Hearing} {c : ComplaintText}
    (hm : IsMeansAuthorizedByLaw act c)
    : IsComplianceEffectingMeans act e h c := .otherAuthorizedMeans hm


theorem congressionalReportFiling_intro
    {r : WrittenReport} {act : ComplianceAction} {cm : CongressionalCommittee}
    {pa : ProgramOrActivity} {c : ComplaintText}
    (hReport : IsFullWrittenReport r act c)
    (hCommittee : IsCommitteeWithLegislativeJurisdiction cm pa c)
    : CongressionalReportFiling r act cm pa c :=
  ⟨hReport, hCommittee⟩




theorem isPrincipallyEngagedInCoveredBusiness_intro
    {e : Entity} {c : ComplaintText}
    (h : IsPrincipallyEngagedInEducation e c)
    : IsPrincipallyEngagedInCoveredBusiness e c := .education h


theorem isPrincipallyEngagedInCoveredBusiness_intro_healthCare
    {e : Entity} {c : ComplaintText}
    (h : IsPrincipallyEngagedInHealthCare e c)
    : IsPrincipallyEngagedInCoveredBusiness e c := .healthCare h


theorem isPrincipallyEngagedInCoveredBusiness_intro_housing
    {e : Entity} {c : ComplaintText}
    (h : IsPrincipallyEngagedInHousing e c)
    : IsPrincipallyEngagedInCoveredBusiness e c := .housing h


theorem isPrincipallyEngagedInCoveredBusiness_intro_socialServices
    {e : Entity} {c : ComplaintText}
    (h : IsPrincipallyEngagedInSocialServices e c)
    : IsPrincipallyEngagedInCoveredBusiness e c := .socialServices h


theorem isPrincipallyEngagedInCoveredBusiness_intro_parksAndRecreation
    {e : Entity} {c : ComplaintText}
    (h : IsPrincipallyEngagedInParksAndRecreation e c)
    : IsPrincipallyEngagedInCoveredBusiness e c := .parksAndRecreation h


theorem programOrActivityEntityCase_intro
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsStateOrLocalInstrumentality e c)
    : ProgramOrActivityEntityCase e f c := .stateOrLocalInstrumentality h


theorem programOrActivityEntityCase_intro_assistanceDistributingEntity
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsAssistanceDistributingGovernmentEntity e c)
    (hf : IsAssistanceToStateOrLocalGovernment f c)
    : ProgramOrActivityEntityCase e f c := .assistanceDistributingEntity h hf


theorem programOrActivityEntityCase_intro_governmentEntityReceivingAssistance
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsGovernmentEntityToWhichAssistanceExtended e c)
    (hf : IsAssistanceToStateOrLocalGovernment f c)
    : ProgramOrActivityEntityCase e f c := .governmentEntityReceivingAssistance h hf


theorem programOrActivityEntityCase_intro_postsecondaryInstitution
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsPostsecondaryInstitution e c)
    : ProgramOrActivityEntityCase e f c := .postsecondaryInstitution h


theorem programOrActivityEntityCase_intro_publicSystemOfHigherEducation
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsPublicSystemOfHigherEducation e c)
    : ProgramOrActivityEntityCase e f c := .publicSystemOfHigherEducation h


theorem programOrActivityEntityCase_intro_localEducationalAgency
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsLocalEducationalAgency e c)
    : ProgramOrActivityEntityCase e f c := .localEducationalAgency h


theorem programOrActivityEntityCase_intro_systemOfVocationalEducation
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsSystemOfVocationalEducation e c)
    : ProgramOrActivityEntityCase e f c := .systemOfVocationalEducation h


theorem programOrActivityEntityCase_intro_otherSchoolSystem
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsOtherSchoolSystem e c)
    : ProgramOrActivityEntityCase e f c := .otherSchoolSystem h


theorem programOrActivityEntityCase_intro_entirePrivateOrganizationAssistedAsWhole
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsEntirePrivateOrganization e c)
    (hw : AssistanceExtendedToOrganizationAsWhole e f c)
    : ProgramOrActivityEntityCase e f c :=
  .entirePrivateOrganizationAssistedAsWhole h hw



theorem programOrActivityEntityCase_intro_entirePrivateOrganizationPrincipallyEngaged
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsEntirePrivateOrganization e c)
    (hp : IsPrincipallyEngagedInCoveredBusiness e c)
    : ProgramOrActivityEntityCase e f c :=
  .entirePrivateOrganizationPrincipallyEngaged h hp


theorem programOrActivityEntityCase_intro_geographicallySeparateFacility
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsGeographicallySeparateFacility e f c)
    : ProgramOrActivityEntityCase e f c := .geographicallySeparateFacility h


theorem programOrActivityEntityCase_intro_jointlyEstablishedEntity
    {e : Entity} {f : FederalFinancialAssistance} {c : ComplaintText}
    (h : IsEntityEstablishedByTwoOrMoreCoveredEntities e c)
    : ProgramOrActivityEntityCase e f c := .jointlyEstablishedEntity h


theorem programOrActivityMembership_intro
    {pa : ProgramOrActivity} {e : Entity} {f : FederalFinancialAssistance}
    {c : ComplaintText}
    (hAll : ConsistsOfAllOperationsOf pa e c)
    (hCase : ProgramOrActivityEntityCase e f c)
    (hPart : AnyPartExtendedFederalFinancialAssistance e f c)
    : ProgramOrActivityMembership pa e f c :=
  ⟨hAll, hCase, hPart⟩



theorem isProgramOrActivity_intro
    {pa : ProgramOrActivity} {e : Entity} {f : FederalFinancialAssistance}
    {c : ComplaintText}
    (hAll : ConsistsOfAllOperationsOf pa e c)
    (hCase : ProgramOrActivityEntityCase e f c)
    (hPart : AnyPartExtendedFederalFinancialAssistance e f c)
    : IsProgramOrActivity pa e f c :=
  ⟨hAll, hCase, hPart⟩


theorem institutionWideCoverage_intro
    {op : Operation} {pa : ProgramOrActivity} {e : Entity}
    {f : FederalFinancialAssistance} {c : ComplaintText}
    (hOp : IsOperationOfEntity op e c)
    (hMembership : ProgramOrActivityMembership pa e f c)
    (hWithin : IsOperationWithinProgram op pa c)
    : InstitutionWideCoverage op pa e f c :=
  ⟨hOp, hMembership, hWithin⟩


theorem fundingAgencyRulemaking_intro
    {a : FederalAgency} {x : AgencyIssuance} {i : AssistanceInstrument}
    {c : ComplaintText}
    (hAgency : IsFederalFundingAgency a c)
    (hInstrument : IsCoveredAssistanceMode i c)
    (hIssuance : EffectiveAgencyIssuance x c)
    : FundingAgencyRulemaking a x i c :=
  ⟨hAgency, hInstrument, hIssuance⟩




theorem serviceInvestigation_intro
    {e : Entity} {inv : Investigation} {rc : ReferredComplaint}
    {c : ComplaintText}
    (hService : IsCommunityRelationsService e c)
    (hReferred : IsCourtReferredComplaint rc c)
    (hInv : IsFullInvestigation inv rc c)
    : ServiceInvestigation e inv rc c :=
  ⟨hService, hReferred, hInv⟩


theorem executiveSessionHearing_intro
    {h : Hearing} {rc : ReferredComplaint} {c : ComplaintText}
    (hOn : IsHearingOnReferredComplaint h rc c)
    (hExec : IsExecutiveSession h c)
    : ExecutiveSessionHearing h rc c :=
  ⟨hOn, hExec⟩


theorem permittedTestimonyRelease_intro
    {t : Testimony} {h : Hearing} {rc : ReferredComplaint} {c : ComplaintText}
    (hGiven : IsTestimonyGivenInHearing t h c)
    (hAgree : AllPartiesAgreedToRelease t rc c)
    (hCourt : CourtPermittedRelease t c)
    : PermittedTestimonyRelease t h rc c :=
  ⟨hGiven, hAgree, hCourt⟩


theorem voluntarySettlementEndeavor_intro
    {e : Entity} {s : Settlement} {rc : ReferredComplaint} {c : ComplaintText}
    (hService : IsCommunityRelationsService e c)
    (hReferred : IsCourtReferredComplaint rc c)
    (hSettlement : IsVoluntarySettlementBetweenParties s rc c)
    : VoluntarySettlementEndeavor e s rc c :=
  ⟨hService, hReferred, hSettlement⟩




theorem isSigningOfficer_intro {p : Person} {c : ComplaintText}
    (h : IsAttorneyGeneral p c) : IsSigningOfficer p c := .attorneyGeneral h


theorem isSigningOfficer_intro_actingAttorneyGeneral
    {p : Person} {c : ComplaintText}
    (h : IsActingAttorneyGeneral p c) : IsSigningOfficer p c :=
  .actingAttorneyGeneral h


theorem isPreventiveRelief_intro {r : Relief} {c : ComplaintText}
    (h : IsPermanentInjunction r c) : IsPreventiveRelief r c := .permanentInjunction h


theorem isPreventiveRelief_intro_temporaryInjunction
    {r : Relief} {c : ComplaintText}
    (h : IsTemporaryInjunction r c) : IsPreventiveRelief r c := .temporaryInjunction h


theorem isPreventiveRelief_intro_restrainingOrder
    {r : Relief} {c : ComplaintText}
    (h : IsRestrainingOrder r c) : IsPreventiveRelief r c := .restrainingOrder h


theorem isPreventiveRelief_intro_otherOrder
    {r : Relief} {c : ComplaintText}
    (h : IsOtherPreventiveOrder r c) : IsPreventiveRelief r c := .otherOrder h


theorem patternOrPracticeOfResistance_intro
    {pp : PatternOrPractice} {c : ComplaintText}
    (hPP : IsPatternOrPractice pp c)
    (hResist : IsResistanceToSubchapterRights pp c)
    (hIntent : IsIntendedToDenyFullExercise pp c)
    : PatternOrPracticeOfResistance pp c :=
  ⟨hPP, hResist, hIntent⟩


theorem attorneyGeneralComplaintMembership_intro
    {cp : AttorneyGeneralComplaint} {p : Person} {pp : PatternOrPractice}
    {r : Relief} {ct : Court} {c : ComplaintText}
    (hForum : IsAppropriateDistrictCourt ct c)
    (hCause : HasReasonableCauseToBelieve p pp c)
    (hResistance : PatternOrPracticeOfResistance pp c)
    (hSigned : IsSignedByOfficer cp p c)
    (hOfficer : IsSigningOfficer p c)
    (hFacts : SetsForthPatternOrPracticeFacts cp pp c)
    (hRequests : RequestsRelief cp r c)
    (hRelief : IsPreventiveRelief r c)
    : AttorneyGeneralComplaintMembership cp p pp r ct c :=
  ⟨hForum, hCause, hResistance, hSigned, hOfficer, hFacts, hRequests, hRelief⟩


theorem threeJudgeRequest_intro
    {cert : Certificate} {p : Person} {c : ComplaintText}
    (hOfficer : IsSigningOfficer p c)
    (hCert : IsCertificateOfGeneralPublicImportance cert c)
    : ThreeJudgeRequest cert p c :=
  ⟨hOfficer, hCert⟩


theorem threeJudgeCourtMembership_intro
    {j₁ j₂ j₃ : Judge} {ct : Court} {c : ComplaintText}
    (hCircuit : IsCircuitJudge j₁ c)
    (hDistrict : IsDistrictJudgeOfInstitutingCourt j₂ ct c)
    (hThird : IsJudgeOfCircuit j₃ c)
    (hD₁ : IsDesignatedByChiefJudgeOfCircuit j₁ c)
    (hD₂ : IsDesignatedByChiefJudgeOfCircuit j₂ c)
    (hD₃ : IsDesignatedByChiefJudgeOfCircuit j₃ c)
    : ThreeJudgeCourtMembership j₁ j₂ j₃ ct c :=
  ⟨hCircuit, hDistrict, hThird, hD₁, hD₂, hD₃⟩




theorem isCoveredDiscriminationStatute_intro
    {s : FederalStatute} {c : ComplaintText}
    (h : IsRehabilitationActSection504 s c)
    : IsCoveredDiscriminationStatute s c := .rehabilitationAct504 h


theorem isCoveredDiscriminationStatute_intro_titleIX
    {s : FederalStatute} {c : ComplaintText}
    (h : IsTitleIXEducationAmendments1972 s c)
    : IsCoveredDiscriminationStatute s c := .titleIXEducationAmendments1972 h


theorem isCoveredDiscriminationStatute_intro_ageDiscriminationAct
    {s : FederalStatute} {c : ComplaintText}
    (h : IsAgeDiscriminationAct1975 s c)
    : IsCoveredDiscriminationStatute s c := .ageDiscriminationAct1975 h


theorem isCoveredDiscriminationStatute_intro_titleVI
    {s : FederalStatute} {c : ComplaintText}
    (h : IsTitleVICivilRightsAct1964 s c)
    : IsCoveredDiscriminationStatute s c := .titleVICivilRightsAct1964 h


theorem isCoveredDiscriminationStatute_intro_otherStatute
    {s : FederalStatute} {c : ComplaintText}
    (h : IsOtherFederalStatuteProhibitingRecipientDiscrimination s c)
    : IsCoveredDiscriminationStatute s c := .otherRecipientDiscriminationStatute h


theorem isCoveredRemedy_intro {rem : Remedy} {c : ComplaintText}
    (h : IsRemedyAtLaw rem c) : IsCoveredRemedy rem c := .atLaw h


theorem isCoveredRemedy_intro_inEquity {rem : Remedy} {c : ComplaintText}
    (h : IsRemedyInEquity rem c) : IsCoveredRemedy rem c := .inEquity h


theorem equalizationCoveredViolation_intro
    {v : Violation} {s : FederalStatute} {e : Entity} {c : ComplaintText}
    (hState : IsState e c)
    (hStatute : IsCoveredDiscriminationStatute s c)
    (hViolation : IsViolationOfStatute v s e c)
    (hTiming : OccursInWholeOrPartAfterEffectiveDate v c)
    : EqualizationCoveredViolation v s e c :=
  ⟨hState, hStatute, hViolation, hTiming⟩


theorem remedialEquivalence_intro
    {rem : Remedy} {v : Violation} {s : FederalStatute} {e : Entity}
    {c : ComplaintText}
    (hCovered : EqualizationCoveredViolation v s e c)
    (hRemedy : IsCoveredRemedy rem c)
    (hComparator : IsRemedyAvailableAgainstNonStateEntity rem s c)
    : RemedialEquivalence rem v s e c :=
  ⟨hCovered, hRemedy, hComparator⟩

end Proving.USC.T42.Ch21CivilRights.Recert.Ontology
