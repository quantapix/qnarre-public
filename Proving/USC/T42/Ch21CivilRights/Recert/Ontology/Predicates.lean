











import Proving.USC.Common.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Ontology

open Proving.USC.Common





axiom IsPersonInUS (p : Person) (c : ComplaintText) : Prop



axiom IsRaceGround (g : Ground) (c : ComplaintText) : Prop



axiom IsColorGround (g : Ground) (c : ComplaintText) : Prop



axiom IsNationalOriginGround (g : Ground) (c : ComplaintText) : Prop



axiom IsExclusionFromParticipation (t : Treatment) (c : ComplaintText) : Prop



axiom IsDenialOfBenefits (t : Treatment) (c : ComplaintText) : Prop



axiom IsSubjectionToDiscrimination (t : Treatment) (c : ComplaintText) : Prop




axiom IsFederalFinancialAssistance
    (f : FederalFinancialAssistance) (c : ComplaintText) : Prop



axiom ReceivesFederalFinancialAssistance
    (pa : ProgramOrActivity) (f : FederalFinancialAssistance)
    (c : ComplaintText) : Prop






axiom IsFederalFundingAgency (a : FederalAgency) (c : ComplaintText) : Prop



axiom IsGrant (i : AssistanceInstrument) (c : ComplaintText) : Prop



axiom IsLoan (i : AssistanceInstrument) (c : ComplaintText) : Prop



axiom IsContract (i : AssistanceInstrument) (c : ComplaintText) : Prop



axiom IsContractOfInsuranceOrGuaranty
    (i : AssistanceInstrument) (c : ComplaintText) : Prop



axiom IsRuleRegulationOrOrder (x : AgencyIssuance) (c : ComplaintText) : Prop



axiom IsOfGeneralApplicability (x : AgencyIssuance) (c : ComplaintText) : Prop




axiom IsConsistentWithStatutoryObjectives
    (x : AgencyIssuance) (c : ComplaintText) : Prop




axiom IsApprovedByPresident (x : AgencyIssuance) (c : ComplaintText) : Prop



axiom IsRecipient (e : Entity) (c : ComplaintText) : Prop



axiom IsTerminationOrRefusalOfAssistance
    (act : ComplianceAction) (c : ComplaintText) : Prop




axiom HasExpressFindingOnRecord
    (act : ComplianceAction) (e : Entity) (c : ComplaintText) : Prop



axiom AffordedOpportunityForHearing
    (h : Hearing) (e : Entity) (c : ComplaintText) : Prop



axiom IsMeansAuthorizedByLaw (act : ComplianceAction) (c : ComplaintText) : Prop




axiom IsCommitteeWithLegislativeJurisdiction
    (cm : CongressionalCommittee) (pa : ProgramOrActivity)
    (c : ComplaintText) : Prop



axiom IsFullWrittenReport
    (r : WrittenReport) (act : ComplianceAction) (c : ComplaintText) : Prop






axiom ConsistsOfAllOperationsOf
    (pa : ProgramOrActivity) (e : Entity) (c : ComplaintText) : Prop



axiom IsOperationOfEntity (op : Operation) (e : Entity) (c : ComplaintText) : Prop



axiom IsOperationWithinProgram
    (op : Operation) (pa : ProgramOrActivity) (c : ComplaintText) : Prop




axiom IsStateOrLocalInstrumentality (e : Entity) (c : ComplaintText) : Prop




axiom IsAssistanceDistributingGovernmentEntity
    (e : Entity) (c : ComplaintText) : Prop




axiom IsGovernmentEntityToWhichAssistanceExtended
    (e : Entity) (c : ComplaintText) : Prop




axiom IsAssistanceToStateOrLocalGovernment
    (f : FederalFinancialAssistance) (c : ComplaintText) : Prop



axiom IsPostsecondaryInstitution (e : Entity) (c : ComplaintText) : Prop



axiom IsPublicSystemOfHigherEducation (e : Entity) (c : ComplaintText) : Prop




axiom IsLocalEducationalAgency (e : Entity) (c : ComplaintText) : Prop



axiom IsSystemOfVocationalEducation (e : Entity) (c : ComplaintText) : Prop



axiom IsOtherSchoolSystem (e : Entity) (c : ComplaintText) : Prop




axiom IsEntirePrivateOrganization (e : Entity) (c : ComplaintText) : Prop




axiom AssistanceExtendedToOrganizationAsWhole
    (e : Entity) (f : FederalFinancialAssistance) (c : ComplaintText) : Prop



axiom IsPrincipallyEngagedInEducation (e : Entity) (c : ComplaintText) : Prop



axiom IsPrincipallyEngagedInHealthCare (e : Entity) (c : ComplaintText) : Prop



axiom IsPrincipallyEngagedInHousing (e : Entity) (c : ComplaintText) : Prop



axiom IsPrincipallyEngagedInSocialServices (e : Entity) (c : ComplaintText) : Prop



axiom IsPrincipallyEngagedInParksAndRecreation
    (e : Entity) (c : ComplaintText) : Prop




axiom IsGeographicallySeparateFacility
    (e : Entity) (f : FederalFinancialAssistance) (c : ComplaintText) : Prop




axiom IsEntityEstablishedByTwoOrMoreCoveredEntities
    (e : Entity) (c : ComplaintText) : Prop




axiom AnyPartExtendedFederalFinancialAssistance
    (e : Entity) (f : FederalFinancialAssistance) (c : ComplaintText) : Prop






axiom IsCommunityRelationsService (e : Entity) (c : ComplaintText) : Prop




axiom IsCourtReferredComplaint (rc : ReferredComplaint) (c : ComplaintText) : Prop



axiom IsFullInvestigation
    (inv : Investigation) (rc : ReferredComplaint) (c : ComplaintText) : Prop



axiom IsHearingOnReferredComplaint
    (h : Hearing) (rc : ReferredComplaint) (c : ComplaintText) : Prop



axiom IsExecutiveSession (h : Hearing) (c : ComplaintText) : Prop



axiom IsTestimonyGivenInHearing
    (t : Testimony) (h : Hearing) (c : ComplaintText) : Prop



axiom AllPartiesAgreedToRelease
    (t : Testimony) (rc : ReferredComplaint) (c : ComplaintText) : Prop



axiom CourtPermittedRelease (t : Testimony) (c : ComplaintText) : Prop



axiom IsVoluntarySettlementBetweenParties
    (s : Settlement) (rc : ReferredComplaint) (c : ComplaintText) : Prop





axiom IsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop



axiom IsActingAttorneyGeneral (p : Person) (c : ComplaintText) : Prop



axiom HasReasonableCauseToBelieve
    (p : Person) (pp : PatternOrPractice) (c : ComplaintText) : Prop



axiom IsPatternOrPractice (pp : PatternOrPractice) (c : ComplaintText) : Prop




axiom IsResistanceToSubchapterRights
    (pp : PatternOrPractice) (c : ComplaintText) : Prop




axiom IsIntendedToDenyFullExercise
    (pp : PatternOrPractice) (c : ComplaintText) : Prop



axiom IsAppropriateDistrictCourt (ct : Court) (c : ComplaintText) : Prop



axiom IsSignedByOfficer
    (cp : AttorneyGeneralComplaint) (p : Person) (c : ComplaintText) : Prop



axiom SetsForthPatternOrPracticeFacts
    (cp : AttorneyGeneralComplaint) (pp : PatternOrPractice)
    (c : ComplaintText) : Prop



axiom RequestsRelief
    (cp : AttorneyGeneralComplaint) (r : Relief) (c : ComplaintText) : Prop



axiom IsPermanentInjunction (r : Relief) (c : ComplaintText) : Prop



axiom IsTemporaryInjunction (r : Relief) (c : ComplaintText) : Prop



axiom IsRestrainingOrder (r : Relief) (c : ComplaintText) : Prop



axiom IsOtherPreventiveOrder (r : Relief) (c : ComplaintText) : Prop




axiom IsCertificateOfGeneralPublicImportance
    (cert : Certificate) (c : ComplaintText) : Prop



axiom IsCircuitJudge (j : Judge) (c : ComplaintText) : Prop




axiom IsDistrictJudgeOfInstitutingCourt
    (j : Judge) (ct : Court) (c : ComplaintText) : Prop



axiom IsJudgeOfCircuit (j : Judge) (c : ComplaintText) : Prop




axiom IsDesignatedByChiefJudgeOfCircuit (j : Judge) (c : ComplaintText) : Prop





axiom IsState (e : Entity) (c : ComplaintText) : Prop



axiom IsRehabilitationActSection504 (s : FederalStatute) (c : ComplaintText) : Prop




axiom IsTitleIXEducationAmendments1972
    (s : FederalStatute) (c : ComplaintText) : Prop




axiom IsAgeDiscriminationAct1975 (s : FederalStatute) (c : ComplaintText) : Prop




axiom IsTitleVICivilRightsAct1964 (s : FederalStatute) (c : ComplaintText) : Prop





axiom IsOtherFederalStatuteProhibitingRecipientDiscrimination
    (s : FederalStatute) (c : ComplaintText) : Prop



axiom IsViolationOfStatute
    (v : Violation) (s : FederalStatute) (e : Entity) (c : ComplaintText) : Prop




axiom OccursInWholeOrPartAfterEffectiveDate
    (v : Violation) (c : ComplaintText) : Prop



axiom IsRemedyAtLaw (rem : Remedy) (c : ComplaintText) : Prop



axiom IsRemedyInEquity (rem : Remedy) (c : ComplaintText) : Prop




axiom IsRemedyAvailableAgainstNonStateEntity
    (rem : Remedy) (s : FederalStatute) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21CivilRights.Recert.Ontology
