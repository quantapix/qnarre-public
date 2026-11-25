











import Proving.USC.Common.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Ontology.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Ontology

open Proving.USC.Common





structure DefEdge where

  defined : String

  dependsOn : String

  citeDefine : String
deriving Repr



structure DanglingTerm where

  term : String

  usedIn : String

  note : String
deriving Repr



def defEdges : List DefEdge :=

  [ { defined := "program or activity", dependsOn := "operations of an entity",
      citeDefine := "42 USC § 2000d-4a" },
    { defined := "program or activity",
      dependsOn := "instrumentality of a State or local government",
      citeDefine := "42 USC § 2000d-4a(1)(A)" },
    { defined := "program or activity",
      dependsOn := "State or local entity distributing or receiving assistance",
      citeDefine := "42 USC § 2000d-4a(1)(B)" },
    { defined := "program or activity",
      dependsOn := "postsecondary institution or public system of higher education",
      citeDefine := "42 USC § 2000d-4a(2)(A)" },
    { defined := "program or activity",
      dependsOn := "local educational agency / vocational or other school system",
      citeDefine := "42 USC § 2000d-4a(2)(B)" },
    { defined := "program or activity",
      dependsOn := "entire private organization or sole proprietorship",
      citeDefine := "42 USC § 2000d-4a(3)(A)" },
    { defined := "program or activity",
      dependsOn := "geographically separate facility",
      citeDefine := "42 USC § 2000d-4a(3)(B)" },
    { defined := "program or activity",
      dependsOn := "entity established by two or more covered entities",
      citeDefine := "42 USC § 2000d-4a(4)" },
    { defined := "program or activity",
      dependsOn := "Federal financial assistance",
      citeDefine := "42 USC § 2000d-4a (flush clause)" },
    { defined := "entity established by two or more covered entities",
      dependsOn := "program or activity (paragraphs (1), (2), (3))",
      citeDefine := "42 USC § 2000d-4a(4)" },
    { defined := "local educational agency",
      dependsOn := "20 USC § 7801 definition",
      citeDefine := "42 USC § 2000d-4a(2)(B)" },

    { defined := "§ 2000d prohibition", dependsOn := "person in the United States",
      citeDefine := "42 USC § 2000d" },
    { defined := "§ 2000d prohibition", dependsOn := "race, color, or national origin",
      citeDefine := "42 USC § 2000d" },
    { defined := "§ 2000d prohibition", dependsOn := "program or activity",
      citeDefine := "42 USC § 2000d" },
    { defined := "§ 2000d prohibition", dependsOn := "Federal financial assistance",
      citeDefine := "42 USC § 2000d" },

    { defined := "covered assistance instrument",
      dependsOn := "grant, loan, or contract (not insurance or guaranty)",
      citeDefine := "42 USC § 2000d-1" },
    { defined := "effective agency issuance",
      dependsOn := "rule, regulation, or order of general applicability",
      citeDefine := "42 USC § 2000d-1" },
    { defined := "effective agency issuance", dependsOn := "approval by the President",
      citeDefine := "42 USC § 2000d-1" },
    { defined := "compliance-effecting means",
      dependsOn := "termination or refusal after express finding on the record",
      citeDefine := "42 USC § 2000d-1(1)" },
    { defined := "compliance-effecting means",
      dependsOn := "any other means authorized by law",
      citeDefine := "42 USC § 2000d-1(2)" },
    { defined := "compliance-effecting means", dependsOn := "recipient",
      citeDefine := "42 USC § 2000d-1" },
    { defined := "§ 2000d-1 authority", dependsOn := "§ 2000d prohibition",
      citeDefine := "42 USC § 2000d-1" },

    { defined := "Service investigation", dependsOn := "Community Relations Service",
      citeDefine := "42 USC § 2000a-4" },
    { defined := "Service investigation", dependsOn := "complaint referred under § 2000a-3(d)",
      citeDefine := "42 USC § 2000a-4" },
    { defined := "permitted testimony release", dependsOn := "executive-session hearing",
      citeDefine := "42 USC § 2000a-4" },
    { defined := "permitted testimony release",
      dependsOn := "agreement of all parties and permission of the court",
      citeDefine := "42 USC § 2000a-4" },

    { defined := "pattern or practice of resistance",
      dependsOn := "rights secured by subchapter II",
      citeDefine := "42 USC § 2000a-5(a)" },
    { defined := "Attorney General complaint", dependsOn := "signature of the Attorney General",
      citeDefine := "42 USC § 2000a-5(a)(1)" },
    { defined := "Attorney General complaint", dependsOn := "pattern or practice of resistance",
      citeDefine := "42 USC § 2000a-5(a)(2)" },
    { defined := "Attorney General complaint", dependsOn := "preventive relief",
      citeDefine := "42 USC § 2000a-5(a)(3)" },
    { defined := "three-judge court", dependsOn := "circuit judge and district judge",
      citeDefine := "42 USC § 2000a-5(b)" },
    { defined := "three-judge court request",
      dependsOn := "certificate of general public importance",
      citeDefine := "42 USC § 2000a-5(b)" },

    { defined := "covered discrimination statute",
      dependsOn := "Rehabilitation Act § 504 / title IX / Age Act / title VI",
      citeDefine := "42 USC § 2000d-7(a)(1)" },
    { defined := "covered discrimination statute",
      dependsOn := "any other Federal statute prohibiting recipient discrimination",
      citeDefine := "42 USC § 2000d-7(a)(1)" },
    { defined := "covered discrimination statute", dependsOn := "recipient",
      citeDefine := "42 USC § 2000d-7(a)(1)" },
    { defined := "equalized violation", dependsOn := "State",
      citeDefine := "42 USC § 2000d-7(a)(1)" },
    { defined := "equalized violation", dependsOn := "occurrence after October 21, 1986",
      citeDefine := "42 USC § 2000d-7(b)" },
    { defined := "equalized remedy", dependsOn := "remedies at law and in equity",
      citeDefine := "42 USC § 2000d-7(a)(2)" } ]


def danglingTerms : List DanglingTerm :=
  [ { term := "Federal financial assistance",
      usedIn := "42 USC §§ 2000d, 2000d-1, 2000d-4a, 2000d-7",
      note := "Never defined in the slice; § 2000d-1 delimits only the vehicles." },
    { term := "recipient", usedIn := "42 USC §§ 2000d-1, 2000d-7",
      note := "Used as a term of art; no definition in the slice." },
    { term := "local educational agency", usedIn := "42 USC § 2000d-4a(2)(B)",
      note := "Expressly defined by cross-reference to 20 USC § 7801 (outside slice)." },
    { term := "Community Relations Service ('the Service')",
      usedIn := "42 USC § 2000a-4",
      note := "Presupposed; established elsewhere in subchapter (outside slice)." },
    { term := "complaint referred by the court", usedIn := "42 USC § 2000a-4",
      note := "Defined by cross-reference to 42 USC § 2000a-3(d) (outside slice)." },
    { term := "rights secured by this subchapter", usedIn := "42 USC § 2000a-5(a)",
      note := "The secured rights are §§ 2000a et seq. (outside slice)." },
    { term := "State (Eleventh Amendment sense)", usedIn := "42 USC § 2000d-7(a)",
      note := "Used but not defined; constitutional term of art." },
    { term := "political entity", usedIn := "42 USC § 2000d-1",
      note := "Used in the scope-limiting proviso; not defined." },
    { term := "program or activity involved (committee jurisdiction)",
      usedIn := "42 USC § 2000d-1",
      note := "Leans on § 2000d-4a for 'program or activity'." } ]





inductive IsProtectedGround (g : Ground) (c : ComplaintText) : Prop where
  | race (h : IsRaceGround g c)
  | color (h : IsColorGround g c)
  | nationalOrigin (h : IsNationalOriginGround g c)



inductive IsProhibitedTreatment (t : Treatment) (c : ComplaintText) : Prop where
  | exclusionFromParticipation (h : IsExclusionFromParticipation t c)
  | denialOfBenefits (h : IsDenialOfBenefits t c)
  | subjectionToDiscrimination (h : IsSubjectionToDiscrimination t c)






structure CoveredContractInstrument
    (i : AssistanceInstrument) (c : ComplaintText) : Prop where

  contract : IsContract i c

  notInsuranceOrGuaranty : ¬ IsContractOfInsuranceOrGuaranty i c



inductive IsCoveredAssistanceMode
    (i : AssistanceInstrument) (c : ComplaintText) : Prop where
  | grant (h : IsGrant i c)
  | loan (h : IsLoan i c)
  | coveredContract (h : CoveredContractInstrument i c)




structure EffectiveAgencyIssuance
    (x : AgencyIssuance) (c : ComplaintText) : Prop where

  issuance : IsRuleRegulationOrOrder x c

  generalApplicability : IsOfGeneralApplicability x c

  consistency : IsConsistentWithStatutoryObjectives x c

  presidentialApproval : IsApprovedByPresident x c




structure TerminationOrRefusalMeans
    (act : ComplianceAction) (e : Entity) (h : Hearing)
    (c : ComplaintText) : Prop where

  recipient : IsRecipient e c

  termination : IsTerminationOrRefusalOfAssistance act c

  expressFinding : HasExpressFindingOnRecord act e c

  hearingOpportunity : AffordedOpportunityForHearing h e c


inductive IsComplianceEffectingMeans
    (act : ComplianceAction) (e : Entity) (h : Hearing)
    (c : ComplaintText) : Prop where
  | terminationOrRefusal (hm : TerminationOrRefusalMeans act e h c)
  | otherAuthorizedMeans (hm : IsMeansAuthorizedByLaw act c)



structure CongressionalReportFiling
    (r : WrittenReport) (act : ComplianceAction) (cm : CongressionalCommittee)
    (pa : ProgramOrActivity) (c : ComplaintText) : Prop where

  report : IsFullWrittenReport r act c


  committee : IsCommitteeWithLegislativeJurisdiction cm pa c





inductive IsPrincipallyEngagedInCoveredBusiness
    (e : Entity) (c : ComplaintText) : Prop where
  | education (h : IsPrincipallyEngagedInEducation e c)
  | healthCare (h : IsPrincipallyEngagedInHealthCare e c)
  | housing (h : IsPrincipallyEngagedInHousing e c)
  | socialServices (h : IsPrincipallyEngagedInSocialServices e c)
  | parksAndRecreation (h : IsPrincipallyEngagedInParksAndRecreation e c)



inductive ProgramOrActivityEntityCase
    (e : Entity) (f : FederalFinancialAssistance) (c : ComplaintText) : Prop where


  | stateOrLocalInstrumentality (h : IsStateOrLocalInstrumentality e c)

  | assistanceDistributingEntity
      (h : IsAssistanceDistributingGovernmentEntity e c)
      (hf : IsAssistanceToStateOrLocalGovernment f c)


  | governmentEntityReceivingAssistance
      (h : IsGovernmentEntityToWhichAssistanceExtended e c)
      (hf : IsAssistanceToStateOrLocalGovernment f c)

  | postsecondaryInstitution (h : IsPostsecondaryInstitution e c)

  | publicSystemOfHigherEducation (h : IsPublicSystemOfHigherEducation e c)

  | localEducationalAgency (h : IsLocalEducationalAgency e c)

  | systemOfVocationalEducation (h : IsSystemOfVocationalEducation e c)

  | otherSchoolSystem (h : IsOtherSchoolSystem e c)

  | entirePrivateOrganizationAssistedAsWhole
      (h : IsEntirePrivateOrganization e c)
      (hw : AssistanceExtendedToOrganizationAsWhole e f c)


  | entirePrivateOrganizationPrincipallyEngaged
      (h : IsEntirePrivateOrganization e c)
      (hp : IsPrincipallyEngagedInCoveredBusiness e c)


  | geographicallySeparateFacility (h : IsGeographicallySeparateFacility e f c)

  | jointlyEstablishedEntity (h : IsEntityEstablishedByTwoOrMoreCoveredEntities e c)




structure ProgramOrActivityMembership
    (pa : ProgramOrActivity) (e : Entity) (f : FederalFinancialAssistance)
    (c : ComplaintText) : Prop where

  allOperations : ConsistsOfAllOperationsOf pa e c

  entityCase : ProgramOrActivityEntityCase e f c


  anyPartAssisted : AnyPartExtendedFederalFinancialAssistance e f c



abbrev IsProgramOrActivity
    (pa : ProgramOrActivity) (e : Entity) (f : FederalFinancialAssistance)
    (c : ComplaintText) : Prop :=
  ProgramOrActivityMembership pa e f c



structure InstitutionWideCoverage
    (op : Operation) (pa : ProgramOrActivity) (e : Entity)
    (f : FederalFinancialAssistance) (c : ComplaintText) : Prop where

  operationOfEntity : IsOperationOfEntity op e c

  membership : ProgramOrActivityMembership pa e f c

  within : IsOperationWithinProgram op pa c


structure FederallyAssistedProgram
    (pa : ProgramOrActivity) (e : Entity) (f : FederalFinancialAssistance)
    (c : ComplaintText) : Prop where

  program : ProgramOrActivityMembership pa e f c

  assistance : IsFederalFinancialAssistance f c

  receives : ReceivesFederalFinancialAssistance pa f c




structure Section2000dCoveredInjury
    (p : Person) (g : Ground) (t : Treatment) (pa : ProgramOrActivity)
    (e : Entity) (f : FederalFinancialAssistance) (c : ComplaintText) : Prop where

  subject : IsPersonInUS p c

  ground : IsProtectedGround g c


  treatment : IsProhibitedTreatment t c

  program : FederallyAssistedProgram pa e f c



structure FundingAgencyRulemaking
    (a : FederalAgency) (x : AgencyIssuance) (i : AssistanceInstrument)
    (c : ComplaintText) : Prop where


  agency : IsFederalFundingAgency a c


  instrument : IsCoveredAssistanceMode i c

  issuance : EffectiveAgencyIssuance x c




structure ServiceInvestigation
    (e : Entity) (inv : Investigation) (rc : ReferredComplaint)
    (c : ComplaintText) : Prop where

  service : IsCommunityRelationsService e c

  referred : IsCourtReferredComplaint rc c

  investigation : IsFullInvestigation inv rc c


structure ExecutiveSessionHearing
    (h : Hearing) (rc : ReferredComplaint) (c : ComplaintText) : Prop where

  onComplaint : IsHearingOnReferredComplaint h rc c

  executive : IsExecutiveSession h c



structure PermittedTestimonyRelease
    (t : Testimony) (h : Hearing) (rc : ReferredComplaint)
    (c : ComplaintText) : Prop where

  given : IsTestimonyGivenInHearing t h c

  agreement : AllPartiesAgreedToRelease t rc c

  courtPermission : CourtPermittedRelease t c



structure VoluntarySettlementEndeavor
    (e : Entity) (s : Settlement) (rc : ReferredComplaint)
    (c : ComplaintText) : Prop where

  service : IsCommunityRelationsService e c

  referred : IsCourtReferredComplaint rc c

  settlement : IsVoluntarySettlementBetweenParties s rc c





inductive IsSigningOfficer (p : Person) (c : ComplaintText) : Prop where
  | attorneyGeneral (h : IsAttorneyGeneral p c)
  | actingAttorneyGeneral (h : IsActingAttorneyGeneral p c)



inductive IsPreventiveRelief (r : Relief) (c : ComplaintText) : Prop where
  | permanentInjunction (h : IsPermanentInjunction r c)
  | temporaryInjunction (h : IsTemporaryInjunction r c)
  | restrainingOrder (h : IsRestrainingOrder r c)
  | otherOrder (h : IsOtherPreventiveOrder r c)




structure PatternOrPracticeOfResistance
    (pp : PatternOrPractice) (c : ComplaintText) : Prop where

  patternOrPractice : IsPatternOrPractice pp c


  resistance : IsResistanceToSubchapterRights pp c

  intent : IsIntendedToDenyFullExercise pp c



structure AttorneyGeneralComplaintMembership
    (cp : AttorneyGeneralComplaint) (p : Person) (pp : PatternOrPractice)
    (r : Relief) (ct : Court) (c : ComplaintText) : Prop where

  forum : IsAppropriateDistrictCourt ct c

  reasonableCause : HasReasonableCauseToBelieve p pp c

  resistance : PatternOrPracticeOfResistance pp c

  signed : IsSignedByOfficer cp p c

  officer : IsSigningOfficer p c

  facts : SetsForthPatternOrPracticeFacts cp pp c

  requests : RequestsRelief cp r c

  reliefKind : IsPreventiveRelief r c



structure ThreeJudgeRequest
    (cert : Certificate) (p : Person) (c : ComplaintText) : Prop where

  officer : IsSigningOfficer p c


  certificate : IsCertificateOfGeneralPublicImportance cert c




structure ThreeJudgeCourtMembership
    (j₁ j₂ j₃ : Judge) (ct : Court) (c : ComplaintText) : Prop where

  circuitJudge : IsCircuitJudge j₁ c


  districtJudge : IsDistrictJudgeOfInstitutingCourt j₂ ct c

  thirdInCircuit : IsJudgeOfCircuit j₃ c

  firstDesignated : IsDesignatedByChiefJudgeOfCircuit j₁ c

  secondDesignated : IsDesignatedByChiefJudgeOfCircuit j₂ c

  thirdDesignated : IsDesignatedByChiefJudgeOfCircuit j₃ c





inductive IsCoveredDiscriminationStatute
    (s : FederalStatute) (c : ComplaintText) : Prop where
  | rehabilitationAct504 (h : IsRehabilitationActSection504 s c)
  | titleIXEducationAmendments1972 (h : IsTitleIXEducationAmendments1972 s c)
  | ageDiscriminationAct1975 (h : IsAgeDiscriminationAct1975 s c)
  | titleVICivilRightsAct1964 (h : IsTitleVICivilRightsAct1964 s c)
  | otherRecipientDiscriminationStatute
      (h : IsOtherFederalStatuteProhibitingRecipientDiscrimination s c)


inductive IsCoveredRemedy (rem : Remedy) (c : ComplaintText) : Prop where
  | atLaw (h : IsRemedyAtLaw rem c)
  | inEquity (h : IsRemedyInEquity rem c)




structure EqualizationCoveredViolation
    (v : Violation) (s : FederalStatute) (e : Entity) (c : ComplaintText) : Prop where

  state : IsState e c

  statute : IsCoveredDiscriminationStatute s c

  violation : IsViolationOfStatute v s e c

  timing : OccursInWholeOrPartAfterEffectiveDate v c



structure RemedialEquivalence
    (rem : Remedy) (v : Violation) (s : FederalStatute) (e : Entity)
    (c : ComplaintText) : Prop where

  covered : EqualizationCoveredViolation v s e c

  remedy : IsCoveredRemedy rem c


  comparator : IsRemedyAvailableAgainstNonStateEntity rem s c

end Proving.USC.T42.Ch21CivilRights.Recert.Ontology
