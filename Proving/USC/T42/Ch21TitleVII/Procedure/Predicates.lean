import Proving.USC.T42.Ch21TitleVII.Procedure.Types













set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Procedure

open Proving.USC.Common



axiom PracticeOccurrenceDay (c : ComplaintText) : Day



axiom ChargeFilingDay (c : ComplaintText) : Day



axiom ChargeServiceDay (c : ComplaintText) : Day



axiom StateProceedingCommencementDay (c : ComplaintText) : Day



axiom StateProceedingTerminationNoticeDay (c : ComplaintText) : Day



axiom PeriodOfReferenceExpiryDay (c : ComplaintText) : Day



axiom RightToSueNoticeDay (c : ComplaintText) : Day



axiom CommissionCivilActionFilingDay (c : ComplaintText) : Day



axiom CivilActionFilingDay (c : ComplaintText) : Day



axiom FinalAgencyActionNoticeDay (c : ComplaintText) : Day



axiom InitialAgencyComplaintFilingDay (c : ComplaintText) : Day



axiom GeraViolationDay (c : ComplaintText) : Day



axiom GeraComplaintFilingDay (c : ComplaintText) : Day



axiom BackPayClaimEarliestDay (c : ComplaintText) : Day



axiom ComplianceAgencyAcceptanceDay (c : ComplaintText) : Day



axiom OfccpDisapprovalDay (c : ComplaintText) : Day



axiom ContractActionDay (c : ComplaintText) : Day



axiom EmployerQualifyingWeeks (c : ComplaintText) : Nat



axiom ChargeInWritingUnderOath (c : ComplaintText) : Prop



axiom ChargeFiledByAggrievedOrCommissioner (p : Person) (c : ComplaintText) : Prop



axiom CommissionServedNoticeOfCharge (c : ComplaintText) : Prop



axiom CommissionInvestigatedCharge (c : ComplaintText) : Prop



axiom ReasonableCauseDetermined (c : ComplaintText) : Prop



axiom ChargeDismissedForNoReasonableCause (c : ComplaintText) : Prop



axiom ConciliationEndeavored (c : ComplaintText) : Prop



axiom ConciliationAgreementSecured (c : ComplaintText) : Prop



axiom CommissionAccessToEvidenceAfforded (c : ComplaintText) : Prop



axiom DeferralJurisdiction (c : ComplaintText) : Prop



axiom StateProceedingCommenced (c : ComplaintText) : Prop



axiom StateProceedingTerminated (c : ComplaintText) : Prop



axiom RightToSueNoticeGiven (c : ComplaintText) : Prop



axiom CivilActionAgainstNamedRespondent (c : ComplaintText) : Prop



axiom PlaintiffIsAggrievedOrChargingParty (p : Person) (c : ComplaintText) : Prop



axiom RespondentIsGovernmentEntity (r : Respondent) (c : ComplaintText) : Prop



axiom AttorneyGeneralReferralMade (c : ComplaintText) : Prop



axiom PromptJudicialActionNecessary (c : ComplaintText) : Prop



axiom PreliminaryReliefActionBrought (c : ComplaintText) : Prop



axiom PracticeCommittedInDistrict (d : JudicialDistrict) (c : ComplaintText) : Prop



axiom EmploymentRecordsMaintainedInDistrict (d : JudicialDistrict) (c : ComplaintText) : Prop



axiom AggrievedWouldHaveWorkedInDistrict (p : Person) (d : JudicialDistrict) (c : ComplaintText) : Prop



axiom RespondentPrincipalOfficeInDistrict (r : Respondent) (d : JudicialDistrict) (c : ComplaintText) : Prop



axiom RespondentNotFoundInStatutoryDistrict (r : Respondent) (c : ComplaintText) : Prop



axiom SenioritySystemAdoptedForDiscriminatoryPurpose (c : ComplaintText) : Prop



axiom DiscriminatoryCompensationPaymentAlleged (c : ComplaintText) : Prop



axiom RespondentFailedToComplyWithCourtOrder (c : ComplaintText) : Prop



axiom AppealTakenUnderTitle28 (c : ComplaintText) : Prop



axiom HearingConductedUnderNlraSection161 (c : ComplaintText) : Prop



axiom CommissionQuorumPresent (c : ComplaintText) : Prop



axiom CommissionInterventionPermitted (c : ComplaintText) : Prop



axiom AnnualReportToCongressMade (c : ComplaintText) : Prop



axiom AttorneyGeneralReasonableCauseBelief (c : ComplaintText) : Prop



axiom PatternOrPracticeComplaintSigned (c : ComplaintText) : Prop



axiom PatternOrPracticeFactsSetForth (c : ComplaintText) : Prop



axiom PatternOrPracticeReliefRequested (c : ComplaintText) : Prop



axiom ThreeJudgeCourtRequested (c : ComplaintText) : Prop



axiom GeneralPublicImportanceCertified (c : ComplaintText) : Prop



axiom PracticeImplementsConsentJudgment (j : Judgment) (c : ComplaintText) : Prop



axiom ActualNoticeOfProposedJudgment (p : Person) (j : Judgment) (c : ComplaintText) : Prop



axiom ReasonableOpportunityToObject (p : Person) (j : Judgment) (c : ComplaintText) : Prop



axiom InterestsAdequatelyRepresented (p : Person) (j : Judgment) (c : ComplaintText) : Prop



axiom InterveningChangeInLawOrFact (j : Judgment) (c : ComplaintText) : Prop



axiom PartyOrClassMemberInPriorAction (p : Person) (j : Judgment) (c : ComplaintText) : Prop



axiom ProceduralRegulationsIssuedUnderApa (c : ComplaintText) : Prop



axiom WrittenCommissionInterpretationRelied (c : ComplaintText) : Prop



axiom GoodFaithConformity (c : ComplaintText) : Prop



axiom PleadedAndProvedReliance (c : ComplaintText) : Prop



axiom RecordsMadeAndKept (c : ComplaintText) : Prop



axiom RecordsPreservedForPrescribedPeriod (c : ComplaintText) : Prop



axiom ReportsFurnishedAsPrescribed (c : ComplaintText) : Prop



axiom UndueHardshipExemptionGranted (c : ComplaintText) : Prop



axiom StatutoryNoticePosted (c : ComplaintText) : Prop



axiom WillfulPostingViolation (c : ComplaintText) : Prop



axiom CoveredFederalPersonnelAction (c : ComplaintText) : Prop



axiom AgencyEeoPlanSubmittedAndApproved (c : ComplaintText) : Prop



axiom FederalAgencyFinalActionTaken (c : ComplaintText) : Prop



axiom AggrievedByFinalDisposition (p : Person) (c : ComplaintText) : Prop



axiom AgencyHeadNamedAsDefendant (c : ComplaintText) : Prop



axiom GeraCoveredEmployee (p : Person) (c : ComplaintText) : Prop



axiom GeraViolationDetermined (c : ComplaintText) : Prop



axiom GeraComplaintFiledWithCommission (c : ComplaintText) : Prop



axiom GeraApaProceduresFollowed (c : ComplaintText) : Prop



axiom GeraFinalOrderIssued (c : ComplaintText) : Prop



axiom GeraPetitionForReviewFiled (c : ComplaintText) : Prop



axiom GeraOrderArbitraryOrCapricious (c : ComplaintText) : Prop



axiom GeraOrderProcedurallyDefective (c : ComplaintText) : Prop



axiom GeraOrderUnsupportedBySubstantialEvidence (c : ComplaintText) : Prop



axiom AffirmativeActionPlanAccepted (a : AffirmativeActionPlan) (k : GovernmentContract) (c : ComplaintText) : Prop



axiom OfccpDisapprovedPlan (a : AffirmativeActionPlan) (c : ComplaintText) : Prop



axiom SubstantialDeviationFromPlan (a : AffirmativeActionPlan) (c : ComplaintText) : Prop



axiom FullHearingAndAdjudicationAccorded (k : GovernmentContract) (c : ComplaintText) : Prop



axiom SubchapterExemptionApplies (r : Respondent) (c : ComplaintText) : Prop



axiom EmployerEngagedInIndustryAffectingCommerce (r : Respondent) (c : ComplaintText) : Prop



axiom ParticipatedInSubchapterProceeding (p : Person) (c : ComplaintText) : Prop



axiom AnnualCoordinationReportTransmitted (c : ComplaintText) : Prop



axiom PresidentialConferenceConvened (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21TitleVII.Procedure
