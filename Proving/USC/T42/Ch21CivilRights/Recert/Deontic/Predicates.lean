import Proving.USC.Common.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Deontic.Types

set_option autoImplicit false











namespace Proving.USC.T42.Ch21CivilRights.Recert.Deontic

open Proving.USC.Common



axiom AddresseeIsCommunityRelationsService (a : Addressee) (c : ComplaintText) : Prop



axiom AddresseeIsAttorneyGeneral (a : Addressee) (c : ComplaintText) : Prop



axiom AddresseeIsClerkOfDistrictCourt (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom AddresseeIsChiefJudgeOfCircuit (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom AddresseeIsChiefJudgeOfDistrict (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom AddresseeIsDesignatedThreeJudgeCourt (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom AddresseeIsDesignatedSingleJudge (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom AddresseeIsFederalFundingAgency (a : Addressee) (c : ComplaintText) : Prop



axiom AddresseeIsHeadOfFederalFundingAgency (a : Addressee) (c : ComplaintText) : Prop



axiom AddresseeIsFederallyAssistedProgram (r : Recipient) (c : ComplaintText) : Prop



axiom AddresseeIsStateSuedInFederalCourt (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom AddresseeIsClaimantAgainstState (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActFullInvestigationOfReferredComplaint (a : Addressee) (c : ComplaintText) : Prop



axiom ActHeldHearingOnReferredComplaint (a : Addressee) (c : ComplaintText) : Prop



axiom ActConductedHearingInExecutiveSession (a : Addressee) (c : ComplaintText) : Prop



axiom ActReleasedHearingTestimony (a : Addressee) (c : ComplaintText) : Prop



axiom ActEndeavoredToBringAboutVoluntarySettlement (a : Addressee) (c : ComplaintText) : Prop



axiom ActBroughtPatternOrPracticeCivilAction (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActFiledThreeJudgeCourtRequest (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActRequestAccompaniedByPublicImportanceCertificate (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActFurnishedCertificateCopyToChiefJudge (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActDesignatedThreeJudgesImmediately (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActPanelIncludesCircuitAndInstitutingDistrictJudge (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActAssignedParticipatedAndExpeditedCase (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActDesignatedSingleJudgeImmediately (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActCertifiedJudgeUnavailabilityToCircuit (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActDesignatedJudgeAfterUnavailabilityCertification (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActAssignedAndExpeditedCase (a : Addressee) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActAppealedFinalJudgmentToSupremeCourt (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActExcludedDeniedBenefitsOrDiscriminated (r : Recipient) (p : Person) (c : ComplaintText) : Prop



axiom ActIssuedRuleEffectuatingSection2000d (a : Addressee) (ru : Rule) (c : ComplaintText) : Prop



axiom ActRuleConsistentWithStatutoryObjectives (ru : Rule) (c : ComplaintText) : Prop



axiom ActRuleTookEffect (ru : Rule) (c : ComplaintText) : Prop



axiom ActEffectedComplianceByTerminationOrRefusal (a : Addressee) (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom ActTerminationExtendedBeyondFinding (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom ActFiledFullWrittenReportWithCommittees (a : Addressee) (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom ActEnforcementActionTaken (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom ActEnforcementActionBecameEffective (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom ActMaintainedFederalSuitAgainstState (pr : Proceeding) (c : ComplaintText) : Prop



axiom ActSoughtRemedyAgainstState (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondComplaintReferredByCourtUnder2000a3d (c : ComplaintText) : Prop



axiom CondHearingNecessaryToInvestigation (c : ComplaintText) : Prop



axiom EscapeAllPartiesAgreedWithCourtPermission (c : ComplaintText) : Prop



axiom CondAttorneyGeneralHasReasonableCause (a : Addressee) (c : ComplaintText) : Prop



axiom CondPatternOrPracticeOfResistance (c : ComplaintText) : Prop



axiom CondPatternIntendedToDenyFullExercise (c : ComplaintText) : Prop



axiom CondComplaintSignedSetsForthFactsAndRequestsRelief (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondProceedingUnderSection2000a5 (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondThreeJudgeRequestFiled (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondAttorneyGeneralFailedToRequestThreeJudgeCourt (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondNoDistrictJudgeAvailable (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondUnavailabilityCertifiedToCircuit (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondFinalJudgmentEnteredByThreeJudgeCourt (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondPartyToProceeding (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop



axiom IsPersonInUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom OnGroundOfRaceColorOrNationalOrigin (p : Person) (r : Recipient) (c : ComplaintText) : Prop



axiom ReceivesFederalFinancialAssistance (r : Recipient) (c : ComplaintText) : Prop



axiom TermProgramOrActivityApplies (r : Recipient) (c : ComplaintText) : Prop



axiom CondAgencyEmpoweredToExtendFederalFinancialAssistance (a : Addressee) (c : ComplaintText) : Prop



axiom CondAssistanceByGrantLoanOrContractNotInsuranceOrGuaranty (r : Recipient) (c : ComplaintText) : Prop



axiom CondRuleIssuedUnderSection2000d1 (ru : Rule) (c : ComplaintText) : Prop



axiom CondRuleApprovedByPresident (ru : Rule) (c : ComplaintText) : Prop



axiom CondExpressFindingOnRecordAfterHearing (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom CondActionTakenPursuantToSection2000d1 (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom CondAgencyAdvisedOfFailureToComply (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom CondVoluntaryComplianceDeterminedUnattainable (ea : EnforcementAction) (c : ComplaintText) : Prop



axiom daysFromReportFilingToActionEffective (ea : EnforcementAction) (c : ComplaintText) : Nat



axiom CondSuitForViolationOfCoveredAntidiscriminationStatute (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondViolationOccursAfterOctober211986 (pr : Proceeding) (c : ComplaintText) : Prop



axiom CondRemedyAvailableAgainstNonStateEntity (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21CivilRights.Recert.Deontic
