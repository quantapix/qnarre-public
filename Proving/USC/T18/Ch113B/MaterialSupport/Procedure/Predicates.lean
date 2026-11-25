












import Proving.USC.T18.Ch113B.MaterialSupport.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Procedure

open Proving.USC.Common







axiom daysFromOrderToInterlocutoryAppeal (pr : Proceeding) (c : ComplaintText) : Nat





axiom countableDaysFromAdjournmentToAppellateArgument (pr : Proceeding) (c : ComplaintText) : Nat





axiom countableDaysFromArgumentToAppellateDecision (pr : Proceeding) (c : ComplaintText) : Nat




axiom violationCount (fi : FinancialInstitution) (c : ComplaintText) : Nat





axiom dollarsRequiredToBeRetained (fi : FinancialInstitution) (c : ComplaintText) : Nat




axiom civilPenaltyAssessedDollars (fi : FinancialInstitution) (c : ComplaintText) : Nat





axiom imprisonmentTermMonths (s : Sentence) (c : ComplaintText) : Nat




axiom entityLiabilityAssessedDollars (e : LegalEntity) (c : ComplaintText) : Nat






axiom UnderlyingOffenseCommittedInDistrict (o : Offense) (d : District) (c : ComplaintText) : Prop




axiom ProsecutionBroughtInDistrict (pr : Proceeding) (d : District) (c : ComplaintText) : Prop





axiom DistrictProperAsProvidedByLaw (pr : Proceeding) (d : District) (c : ComplaintText) : Prop








axiom OffenderIsUnitedStatesNationalOrLawfulPermanentResident (p : Person) (c : ComplaintText) : Prop




axiom OffenderIsStatelessPersonHabituallyResidentInUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom OffenderBroughtIntoOrFoundInUnitedStates (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom OffenseOccursInWholeOrPartWithinUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom OffenseOccursInOrAffectsInterstateOrForeignCommerce (o : Offense) (c : ComplaintText) : Prop





axiom OffenderAidsAbetsOrConspiresWithPersonSubjectToJurisdiction
    (p : Person) (o : Offense) (c : ComplaintText) : Prop






axiom OffenseTakesPlaceInUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom PerpetratorIsNationalOfAnotherStateOrStateless (p : Person) (c : ComplaintText) : Prop





axiom OffenseCommittedOnBoardForeignFlagVesselOrRegisteredAircraft (o : Offense) (c : ComplaintText) : Prop




axiom OffenseCommittedOnBoardAircraftOperatedByAnotherState (o : Offense) (c : ComplaintText) : Prop




axiom PerpetratorFoundOutsideUnitedStates (p : Person) (c : ComplaintText) : Prop






axiom PredicateActDirectedAtNationalOrFacilityOfAnotherState (o : Offense) (c : ComplaintText) : Prop






axiom PredicateActDirectedToCompelAnotherStateOrIntergovernmentalOrganization
    (o : Offense) (c : ComplaintText) : Prop






axiom PredicateActOutsideUnitedStatesOrAffectingCommerce (o : Offense) (c : ComplaintText) : Prop





axiom PerpetratorIsUnitedStatesNationalOrStatelessResident (p : Person) (c : ComplaintText) : Prop



axiom PerpetratorFoundInUnitedStates (p : Person) (c : ComplaintText) : Prop






axiom PredicateActDirectedAtUnitedStatesPersonPropertyOrEntity (o : Offense) (c : ComplaintText) : Prop





axiom OffenseCommittedOnBoardUnitedStatesFlagVesselOrRegisteredAircraft (o : Offense) (c : ComplaintText) : Prop




axiom OffenseCommittedOnBoardAircraftOperatedByUnitedStates (o : Offense) (c : ComplaintText) : Prop





axiom PredicateActDirectedToCompelUnitedStates (o : Offense) (c : ComplaintText) : Prop






axiom FinancialInstitutionAwareOfPossessionOrControlOfFunds
    (fi : FinancialInstitution) (f : Funds) (c : ComplaintText) : Prop




axiom ForeignTerroristOrganizationOrAgentHasInterestInFunds (f : Funds) (c : ComplaintText) : Prop





axiom SecretaryAuthorizedException
    (fi : FinancialInstitution) (f : Funds) (c : ComplaintText) : Prop




axiom FinancialInstitutionRetainedPossessionOrControl
    (fi : FinancialInstitution) (f : Funds) (c : ComplaintText) : Prop





axiom FinancialInstitutionReportedFundsToSecretary
    (fi : FinancialInstitution) (f : Funds) (c : ComplaintText) : Prop




axiom FinancialInstitutionKnowinglyFailedToComply
    (fi : FinancialInstitution) (f : Funds) (c : ComplaintText) : Prop







axiom AppearsToSecretaryOrAttorneyGeneralThatViolationIsOccurringOrImminent
    (p : Person) (c : ComplaintText) : Prop




axiom AttorneyGeneralInitiatedCivilInjunctiveAction
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom ActionBroughtInDistrictCourtOfTheUnitedStates (pr : Proceeding) (c : ComplaintText) : Prop







axiom AttorneyGeneralConductedInvestigation (inv : Investigation) (c : ComplaintText) : Prop





axiom AttorneyGeneralCoordinatedWithSecretary (inv : Investigation) (c : ComplaintText) : Prop





axiom EvidenceOfCriminalViolationAroseInInvestigation (inv : Investigation) (c : ComplaintText) : Prop





axiom EvidenceReferredImmediatelyToAttorneyGeneral (r : Referral) (c : ComplaintText) : Prop





axiom AttorneyGeneralTimelyNotifiedSecretaryOfActionTaken (r : Referral) (c : ComplaintText) : Prop






axiom UnitedStatesMadeExParteWrittenRequest (pr : Proceeding) (c : ComplaintText) : Prop




axiom CourtMadeSufficientShowingFinding (pr : Proceeding) (c : ComplaintText) : Prop





axiom CourtAuthorizedRedactionSubstitutionOrStatement (pr : Proceeding) (c : ComplaintText) : Prop




axiom ClassifiedDocumentsSealedAndPreserved (pr : Proceeding) (c : ComplaintText) : Prop





axiom SubstituteSufficientToAllowDefendantToPrepareDefense (pr : Proceeding) (c : ComplaintText) : Prop





axiom DefendantEstablishedRelevanceAndMateriality (pr : Proceeding) (c : ComplaintText) : Prop




axiom OrderAuthorizedDisclosureOfClassifiedInformation (pr : Proceeding) (c : ComplaintText) : Prop




axiom OrderImposedSanctionsForNondisclosure (pr : Proceeding) (c : ComplaintText) : Prop




axiom OrderRefusedProtectiveOrderSoughtByUnitedStates (pr : Proceeding) (c : ComplaintText) : Prop




axiom InterlocutoryAppealTakenByUnitedStates (pr : Proceeding) (c : ComplaintText) : Prop




axiom AppealTakenBeforeTrial (pr : Proceeding) (c : ComplaintText) : Prop



axiom AppealTakenDuringTrial (pr : Proceeding) (c : ComplaintText) : Prop




axiom TrialNotCommencedUntilAppealResolved (pr : Proceeding) (c : ComplaintText) : Prop




axiom TrialAdjournedUntilAppealResolved (pr : Proceeding) (c : ComplaintText) : Prop






axiom ProsecutionRestsOnPersonnelTheory (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop







axiom PersonnelProvidedToWorkUnderDirectionOrControl (p : Person) (c : ComplaintText) : Prop





axiom ProsecutionRestsOnPersonnelTrainingOrExpertAdviceTheory
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom SecretaryOfStateApprovedWithAttorneyGeneralConcurrence (p : Person) (c : ComplaintText) : Prop




axiom ApplicationWouldAbridgeFirstAmendmentRights
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop






axiom ChargedConductOccurred (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom ProsecutionCommenced (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom ProceedingAdjudicated (pr : Proceeding) (c : ComplaintText) : Prop




axiom DeathOfPersonResultedFromOffense (o : Offense) (c : ComplaintText) : Prop







axiom LegalEntityLocatedInOrOrganizedUnderUnitedStatesLaw (e : LegalEntity) (c : ComplaintText) : Prop





axiom PersonResponsibleForManagementOrControlCommittedOffense
    (e : LegalEntity) (o : Offense) (c : ComplaintText) : Prop








axiom OrganizationDesignatedAtTimeOfTraining (org : Organization) (c : ComplaintText) : Prop





axiom TrainingReceivedFromOrOnBehalfOfOrganization
    (p : Person) (org : Organization) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.MaterialSupport.Procedure
