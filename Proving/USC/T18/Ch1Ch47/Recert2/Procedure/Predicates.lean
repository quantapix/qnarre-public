import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Procedure.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch1Ch47.Recert2.Procedure

open Proving.USC.Common






axiom LocusHighSeasOrUnitedStatesVessel (l : OffenseLocus) (c : ComplaintText) : Prop




axiom LocusGreatLakesRegisteredVessel (l : OffenseLocus) (c : ComplaintText) : Prop




axiom LocusLandsReservedOrAcquiredForUnitedStates (l : OffenseLocus) (c : ComplaintText) : Prop




axiom LocusGuanoIsland (l : OffenseLocus) (c : ComplaintText) : Prop




axiom LocusUnitedStatesAircraftInFlight (l : OffenseLocus) (c : ComplaintText) : Prop





axiom VehicleLocusOnUnitedStatesSpaceRegistry (l : OffenseLocus) (c : ComplaintText) : Prop




axiom CompetentAuthoritiesAssumedResponsibilityForVehicle (l : OffenseLocus) (c : ComplaintText) : Prop



axiom LocusOutsideJurisdictionOfAnyNation (l : OffenseLocus) (c : ComplaintText) : Prop




axiom OffenseByOrAgainstNationalOfTheUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom LocusForeignVesselOnScheduledUnitedStatesVoyage (l : OffenseLocus) (c : ComplaintText) : Prop




axiom LocusUnitedStatesMissionPremisesOrResidenceAbroad (l : OffenseLocus) (c : ComplaintText) : Prop




axiom OffenderIsPersonDescribedInSection3261a (o : Offense) (c : ComplaintText) : Prop




axiom ConflictingTreatyOrInternationalAgreementGoverns (o : Offense) (c : ComplaintText) : Prop




axiom spaceVehicleDoorsClosedMinute (l : OffenseLocus) (c : ComplaintText) : Nat




axiom spaceVehicleDoorsOpenedMinute (l : OffenseLocus) (c : ComplaintText) : Nat




axiom authoritiesAssumedResponsibilityMinute (l : OffenseLocus) (c : ComplaintText) : Nat




axiom allegedConductMinute (l : OffenseLocus) (c : ComplaintText) : Nat






axiom EntityIsFinancialInstitution (en : Entity) (c : ComplaintText) : Prop






axiom ChargedElementRequiresProscribedCharacterAndKnowledge (o : Offense) (c : ComplaintText) : Prop




axiom RepresentationMadeByFederalLawEnforcementOfficer (r : OfficialRepresentation) (c : ComplaintText) : Prop




axiom RepresentationMadeAtDirectionOrWithApprovalOfOfficer (r : OfficialRepresentation) (c : ComplaintText) : Prop




axiom RepresentationConcernedNatureOfProperty (r : OfficialRepresentation) (pr : Property) (c : ComplaintText) : Prop





axiom DefendantBelievedPropertyOfProscribedCharacter (d : Person) (pr : Property) (c : ComplaintText) : Prop




axiom BeliefResultedFromOfficialRepresentation (r : OfficialRepresentation) (d : Person) (c : ComplaintText) : Prop



axiom officialRepresentationDay (r : OfficialRepresentation) (c : ComplaintText) : Nat



axiom defendantBeliefDay (d : Person) (c : ComplaintText) : Nat







axiom TribunalIsTerritorialDistrictCourtNamedInSection23 (ct : Court) (c : ComplaintText) : Prop




axiom TribunalIsOtherwiseACourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop




axiom ExpressProvisionDisplacesSection23Inclusion (ct : Court) (c : ComplaintText) : Prop






axiom ObjectStatuteEnumeratedInSection24a1 (o : Offense) (c : ComplaintText) : Prop





axiom ObjectStatuteEnumeratedInSection24a2 (o : Offense) (c : ComplaintText) : Prop




axiom ChargedAsViolationOfObjectStatute (o : Offense) (c : ComplaintText) : Prop




axiom ChargedAsCriminalConspiracyToViolateObjectStatute (o : Offense) (c : ComplaintText) : Prop




axiom ViolationOrConspiracyRelatesToHealthCareBenefitProgram (o : Offense) (c : ComplaintText) : Prop





axiom ChargedUnderSection1028a (o : Offense) (c : ComplaintText) : Prop




axiom ChargedUnderSection1028aParagraph (o : Offense) (n : Nat) (c : ComplaintText) : Prop






axiom IdentificationItemAppearsIssuedByUnitedStatesOrSpecialEventSponsor (o : Offense) (c : ComplaintText) : Prop





axiom ItemTransportedInMailInCourseOfProhibitedConduct (o : Offense) (c : ComplaintText) : Prop





axiom AffectsInterstateOrForeignCommerce (o : Offense) (c : ComplaintText) : Prop






axiom LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity (o : Offense) (c : ComplaintText) : Prop




axiom ActivityAuthorizedUnderChapter224 (o : Offense) (c : ComplaintText) : Prop



axiom AttemptedOffenseUnderSection1028 (o : Offense) (c : ComplaintText) : Prop



axiom ConspiredToCommitOffenseUnderSection1028 (o : Offense) (c : ComplaintText) : Prop







axiom ForfeitureProceedingConformedToCsaSection413ExcludingSubsectionD (o : Offense) (c : ComplaintText) : Prop




axiom ConvictedOfViolationOfSection1028a (d : Person) (o : Offense) (c : ComplaintText) : Prop






axiom CourtOrderedForfeitureAndDispositionOfIllicitItems (ct : Court) (o : Offense) (c : ComplaintText) : Prop




axiom PriorConvictionUnderSection1028 (d : Person) (c : ComplaintText) : Prop




axiom priorSection1028ConvictionFinalDay (d : Person) (c : ComplaintText) : Nat




axiom section1028OffenseCommissionDay (o : Offense) (c : ComplaintText) : Nat




axiom valueObtainedFromSection1028a7OffenseCents (o : Offense) (c : ComplaintText) : Nat




axiom section1028AggregationPeriodStartDay (o : Offense) (c : ComplaintText) : Nat




axiom section1028AggregationPeriodEndDay (o : Offense) (c : ComplaintText) : Nat





axiom countOfIdentificationItemsPossessed (o : Offense) (c : ComplaintText) : Nat





axiom countOfIdentificationItemsProducedOrTransferred (o : Offense) (c : ComplaintText) : Nat




axiom countOfStandaloneMeansOfIdentification (o : Offense) (c : ComplaintText) : Nat






axiom countOfIdentificationDocumentsContainingMeansOfIdentification (o : Offense) (c : ComplaintText) : Nat





axiom ChargedUnderSection1029a (o : Offense) (c : ComplaintText) : Prop




axiom ChargedUnderSection1029aParagraph (o : Offense) (n : Nat) (c : ComplaintText) : Prop



axiom AttemptedOffenseUnderSection1029 (o : Offense) (c : ComplaintText) : Prop




axiom PartyToConspiracyOfTwoOrMoreToCommitSection1029Offense (o : Offense) (c : ComplaintText) : Prop




axiom PartyEngagedInConductInFurtheranceOfConspiracy (o : Offense) (c : ComplaintText) : Prop





axiom PriorConvictionForAnotherSection1029Offense (d : Person) (c : ComplaintText) : Prop



axiom priorSection1029ConvictionDay (d : Person) (c : ComplaintText) : Nat




axiom section1029OffenseCommissionDay (o : Offense) (c : ComplaintText) : Nat





axiom maxImprisonmentMonthsForSection1029ObjectOffense (o : Offense) : Nat




axiom maxFineCentsForSection1029ObjectOffense (o : Offense) : Nat




axiom section1029AggregateValueCents (o : Offense) (n : Nat) (c : ComplaintText) : Nat




axiom section1029AggregationPeriodStartDay (o : Offense) (n : Nat) (c : ComplaintText) : Nat




axiom section1029AggregationPeriodEndDay (o : Offense) (n : Nat) (c : ComplaintText) : Nat




axiom countOfCounterfeitOrUnauthorizedAccessDevicesPossessed (o : Offense) (c : ComplaintText) : Nat



axiom AgencyIsUnitedStatesSecretService (ag : Agency) (c : ComplaintText) : Prop




axiom AgencyExercisedInvestigativeAuthorityOverOffense (ag : Agency) (o : Offense) (c : ComplaintText) : Prop





axiom AgencyHasInvestigativeAuthorityApartFromSection1029d (ag : Agency) (o : Offense) (c : ComplaintText) : Prop




axiom TreasuryAttorneyGeneralInvestigativeAgreementInEffect (ia : InteragencyAgreement) (c : ComplaintText) : Prop




axiom InvestigationConductedInAccordanceWithInteragencyAgreement (ag : Agency) (ia : InteragencyAgreement) (o : Offense) (c : ComplaintText) : Prop





axiom ActorIsAffiliatedWithFacilitiesBasedCarrier (d : Person) (c : ComplaintText) : Prop




axiom ConductWasTrafficking (o : Offense) (c : ComplaintText) : Prop




axiom ConductForPurposeOfProtectingCarrierPropertyOrLegalRights (o : Offense) (c : ComplaintText) : Prop





axiom ConductForPurposeOfObtainingAnotherCarriersServiceWithoutAuthorization (o : Offense) (c : ComplaintText) : Prop




axiom ConductWasProducingOrTrafficking (o : Offense) (c : ComplaintText) : Prop




axiom ConductForResearchOrDevelopmentInConnectionWithLawfulPurpose (o : Offense) (c : ComplaintText) : Prop




axiom DefendantEstablishedDefenseByPreponderanceOfTheEvidence (d : Person) (o : Offense) (c : ComplaintText) : Prop




axiom ActOccurredOutsideJurisdictionOfTheUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom ActWouldConstituteSection1029OffenseIfCommittedWithinUnitedStates (o : Offense) (c : ComplaintText) : Prop



axiom EntityIsAccountIssuer (en : Entity) (c : ComplaintText) : Prop




axiom EntityIsCreditCardSystemMember (en : Entity) (c : ComplaintText) : Prop





axiom EntityIsOrganizedUnderUnitedStatesStateOrTerritorialLaw (en : Entity) (c : ComplaintText) : Prop




axiom AccessDeviceIssuedOwnedManagedOrControlledByEntity (ad : AccessDevice) (en : Entity) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1Ch47.Recert2.Procedure
