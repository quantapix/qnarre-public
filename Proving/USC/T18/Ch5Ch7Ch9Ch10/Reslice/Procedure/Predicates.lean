







import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure

open Proving.USC.Common






axiom ConductOccurredOutsideUnitedStates (c : ComplaintText) : Prop




axiom WithinUnitedStates (c : ComplaintText) : Prop





axiom WithinSpecialMaritimeAndTerritorialJurisdiction (c : ComplaintText) : Prop



axiom WithinIndianCountry (c : ComplaintText) : Prop




axiom VictimIsInternationallyProtectedPersonAbroad (c : ComplaintText) : Prop




axiom VictimIsUnitedStatesRepresentative (c : ComplaintText) : Prop




axiom OffenderIsNationalOfUnitedStates (c : ComplaintText) : Prop



axiom OffenderFoundInUnitedStates (c : ComplaintText) : Prop




axiom VictimIsNationalOfUnitedStates (c : ComplaintText) : Prop




axiom EnforcementOfSection112Underway (c : ComplaintText) : Prop




axiom AttorneyGeneralRequestedAgencyAssistance (c : ComplaintText) : Prop




axiom ApplicationWouldAbridgeFirstAmendmentRights (c : ComplaintText) : Prop




axiom SecretServiceProtectiveAuthorityUnimpaired (c : ComplaintText) : Prop




axiom ProtectiveFunctionAuthorized (c : ComplaintText) : Prop





axiom CoveredPersonAdjudicativeRole (p : Person) (c : ComplaintText) : Prop





axiom MedicalNecessityExceptionApplies (c : ComplaintText) : Prop




axiom ReligiousCustomJustificationAsserted (c : ComplaintText) : Prop




axiom TraveledInInterstateOrForeignCommerce (c : ComplaintText) : Prop




axiom UsedInstrumentalityOfInterstateCommerce (c : ComplaintText) : Prop




axiom PaymentMadeThroughInterstateCommerce (c : ComplaintText) : Prop




axiom TransmittedCommunicationInInterstateCommerce (c : ComplaintText) : Prop




axiom ObjectTraveledInInterstateCommerce (c : ComplaintText) : Prop




axiom ConductAffectedInterstateOrForeignCommerce (c : ComplaintText) : Prop





axiom PriorQualifyingConvictionOccasions (p : Person) (c : ComplaintText) : Nat




axiom PriorConvictionsAreFinal (p : Person) (c : ComplaintText) : Prop




axiom PriorConvictionsPrecedeInstantOffense (p : Person) (c : ComplaintText) : Prop






axiom PetitionFiledUnderTitle11 (pr : Proceeding) : Prop



axiom PetitionConcernsPerson (p : Person) (pr : Proceeding) : Prop





axiom PetitionFilingDay (pr : Proceeding) : Nat




axiom ConductDay (c : ComplaintText) : Nat





axiom CourtOfficerChargedWithCustody (p : Person) (pr : Proceeding) : Prop



axiom CourtDirectedInspection (pr : Proceeding) : Prop




axiom InspectionOpportunityAfforded (p : Person) (pr : Proceeding) : Prop




axiom UnitedStatesTrusteeSoughtInspection (pr : Proceeding) : Prop




axiom CaseOrReceivershipPending (pr : Proceeding) : Prop




axiom PartyInInterest (p : Person) (pr : Proceeding) : Prop





axiom BankruptcyPetitionPreparer (p : Person) (c : ComplaintText) : Prop





axiom DocumentForFilingPrepared (p : Person) (c : ComplaintText) : Prop




axiom CaseOrRelatedProceedingDismissed (pr : Proceeding) : Prop





axiom DismissalCausedByPreparerDisregard (p : Person) (pr : Proceeding) : Prop




axiom PetitionFiledByRespondent (p : Person) (pr : Proceeding) : Prop




axiom DocumentFiledInProceeding (p : Person) (pr : Proceeding) : Prop




axiom RepresentationMadeConcerningProceeding (p : Person) (pr : Proceeding) : Prop




axiom ProceedingFalselyAssertedPending (pr : Proceeding) : Prop




axiom AttorneyGeneralDesignationMade (c : ComplaintText) : Prop




axiom UnitedStatesAttorneyDesignated (c : ComplaintText) : Prop




axiom FbiAgentDesignated (c : ComplaintText) : Prop





axiom Section3057ResponsibilityAssigned (c : ComplaintText) : Prop





axiom ReferralProceduresEstablished (c : ComplaintText) : Prop




axiom CaseReferredUnderSection158 (pr : Proceeding) : Prop






axiom EmergencyInvolvingBiologicalWeapon (c : ComplaintText) : Prop




axiom AttorneyGeneralRequestedMilitaryAssistance (c : ComplaintText) : Prop





axiom RequestMadeByDelegatedJusticeOfficial (c : ComplaintText) : Prop




axiom RequestSupportsSection175Enforcement (c : ComplaintText) : Prop




axiom DulyAuthorizedGovernmentActivity (c : ComplaintText) : Prop





axiom MaximumAuthorizedImprisonmentMonths (p : Person) (c : ComplaintText) : Nat



axiom UnderIndictment (p : Person) (c : ComplaintText) : Prop




axiom ConvictedInAnyCourt (p : Person) (c : ComplaintText) : Prop



axiom FugitiveFromJustice (p : Person) (c : ComplaintText) : Prop




axiom AdjudicatedMentalDefectiveOrCommitted (p : Person) (c : ComplaintText) : Prop




axiom DishonorablyDischarged (p : Person) (c : ComplaintText) : Prop




axiom RequiredRegistrationObtained (p : Person) (c : ComplaintText) : Prop




axiom TransfereeRegisteredAsRequired (p : Person) (c : ComplaintText) : Prop




axiom ConductUnderHealthSecretaryAuthority (c : ComplaintText) : Prop




axiom OffenseAgainstUnitedStatesProperty (c : ComplaintText) : Prop




axiom AidedOrConspiredWithPersonUnderJurisdiction (c : ComplaintText) : Prop




axiom ImposedImprisonmentYears (p : Person) (c : ComplaintText) : Nat




axiom ImposedFineDollars (p : Person) (c : ComplaintText) : Nat




axiom ItemPertainsToProhibitedConduct (s : Seizure) : Prop





axiom ItemLacksApparentPeacefulJustification (s : Seizure) : Prop




axiom SeizureWarrantIssued (s : Seizure) : Prop



axiom ExigentCircumstancesExisted (s : Seizure) : Prop



axiom ProbableCauseExisted (s : Seizure) : Prop




axiom NoticeToPotentialClaimantsGiven (s : Seizure) : Prop




axiom OpportunityForHearingAfforded (s : Seizure) : Prop




axiom GovernmentCarriedBurdenByPreponderance (s : Seizure) : Prop




axiom CustomsForfeitureProceduresFollowed (s : Seizure) : Prop




axiom AttorneyGeneralOrderedDisposition (s : Seizure) : Prop




axiom PeacefulPurposeShown (s : Seizure) : Prop




axiom TypeAndQuantityReasonable (s : Seizure) : Prop



axiom SeizureDay (s : Seizure) : Nat




axiom NoticeDay (s : Seizure) : Nat




axiom HearingDay (s : Seizure) : Nat




axiom ForfeitureDay (s : Seizure) : Nat




axiom UnitedStatesCommencedCivilAction (c : ComplaintText) : Prop



axiom ConductProhibitedUnderSection175Shown (c : ComplaintText) : Prop




axiom InchoateSection175ConductShown (c : ComplaintText) : Prop






axiom UnjustifiedTypeOrQuantityShown (c : ComplaintText) : Prop




axiom EnjoinedConductPeacefulPurpose (c : ComplaintText) : Prop




axiom EnjoinedItemTypeAndQuantityReasonable (c : ComplaintText) : Prop

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure
