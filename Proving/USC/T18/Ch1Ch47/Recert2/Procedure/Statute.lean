import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Procedure.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Procedure.Predicates

set_option autoImplicit false













namespace Proving.USC.T18.Ch1Ch47.Recert2.Procedure

open Proving.USC.Common








inductive Section7Para6InFlight (l : OffenseLocus) (c : ComplaintText) : Prop where
  | normalDisembarkation
      (onRegistry : VehicleLocusOnUnitedStatesSpaceRegistry l c)
      (afterDoorsClosed : spaceVehicleDoorsClosedMinute l c ≤ allegedConductMinute l c)
      (beforeDoorsOpened : allegedConductMinute l c ≤ spaceVehicleDoorsOpenedMinute l c)
  | forcedLanding
      (onRegistry : VehicleLocusOnUnitedStatesSpaceRegistry l c)
      (assumed : CompetentAuthoritiesAssumedResponsibilityForVehicle l c)
      (afterDoorsClosed : spaceVehicleDoorsClosedMinute l c ≤ allegedConductMinute l c)
      (beforeHandover : allegedConductMinute l c ≤ authoritiesAssumedResponsibilityMinute l c)








inductive Section7SmtjLocus (l : OffenseLocus) (o : Offense) (c : ComplaintText) : Prop where
  | highSeasOrUnitedStatesVessel (h : LocusHighSeasOrUnitedStatesVessel l c)
  | greatLakesVessel (h : LocusGreatLakesRegisteredVessel l c)
  | federalEnclave (h : LocusLandsReservedOrAcquiredForUnitedStates l c)
  | guanoIsland (h : LocusGuanoIsland l c)
  | unitedStatesAircraftInFlight (h : LocusUnitedStatesAircraftInFlight l c)
  | unitedStatesSpaceVehicleInFlight (h : Section7Para6InFlight l c)
  | outsideAnyNation
      (h : LocusOutsideJurisdictionOfAnyNation l c)
      (hNational : OffenseByOrAgainstNationalOfTheUnitedStates o c)
  | foreignVesselScheduledUnitedStatesVoyage
      (h : LocusForeignVesselOnScheduledUnitedStatesVoyage l c)
      (hNational : OffenseByOrAgainstNationalOfTheUnitedStates o c)
  | unitedStatesMissionAbroad
      (h : LocusUnitedStatesMissionPremisesOrResidenceAbroad l c)
      (hNational : OffenseByOrAgainstNationalOfTheUnitedStates o c)
      (hNotMejaOffender : ¬ OffenderIsPersonDescribedInSection3261a o c)
      (hNoConflictingTreaty : ¬ ConflictingTreatyOrInternationalAgreementGoverns o c)




inductive Section21OfficialRepresentation (r : OfficialRepresentation) (c : ComplaintText) : Prop where
  | byFederalOfficer (h : RepresentationMadeByFederalLawEnforcementOfficer r c)
  | atOfficerDirection (h : RepresentationMadeAtDirectionOrWithApprovalOfOfficer r c)




inductive Section21BeliefLinkedToRepresentation
    (r : OfficialRepresentation) (d : Person) (c : ComplaintText) : Prop where
  | temporallyAfter (h : officialRepresentationDay r c ≤ defendantBeliefDay d c)
  | causedByRepresentation (h : BeliefResultedFromOfficialRepresentation r d c)



structure Section21AlternativeProofOfCharacter
    (d : Person) (pr : Property) (r : OfficialRepresentation)
    (o : Offense) (c : ComplaintText) : Prop where
  elementAtIssue : ChargedElementRequiresProscribedCharacterAndKnowledge o c
  official       : Section21OfficialRepresentation r c
  asToProperty   : RepresentationConcernedNatureOfProperty r pr c
  believed       : DefendantBelievedPropertyOfProscribedCharacter d pr c
  linked         : Section21BeliefLinkedToRepresentation r d c






inductive Section23CourtBasis (ct : Court) (c : ComplaintText) : Prop where
  | territorialDistrictCourt (h : TribunalIsTerritorialDistrictCourtNamedInSection23 ct c)
  | otherwiseCourtOfTheUnitedStates (h : TribunalIsOtherwiseACourtOfTheUnitedStates ct c)





structure CourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop where
  basis        : Section23CourtBasis ct c
  notDisplaced : ¬ ExpressProvisionDisplacesSection23Inclusion ct c




inductive Section24ChargeForm (o : Offense) (c : ComplaintText) : Prop where
  | substantiveViolation (h : ChargedAsViolationOfObjectStatute o c)
  | criminalConspiracy (h : ChargedAsCriminalConspiracyToViolateObjectStatute o c)




inductive FederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop where
  | coreEnumerated
      (form : Section24ChargeForm o c)
      (h : ObjectStatuteEnumeratedInSection24a1 o c)
  | generalEnumeratedAndRelated
      (form : Section24ChargeForm o c)
      (h : ObjectStatuteEnumeratedInSection24a2 o c)
      (hRelated : ViolationOrConspiracyRelatesToHealthCareBenefitProgram o c)





inductive Section1028Circumstance (o : Offense) (c : ComplaintText) : Prop where
  | unitedStatesOrSponsorIssued
      (h : IdentificationItemAppearsIssuedByUnitedStatesOrSpecialEventSponsor o c)
  | subsectionA4Offense (h : ChargedUnderSection1028aParagraph o 4 c)
  | interstateOrForeignCommerce (h : AffectsInterstateOrForeignCommerce o c)
  | mailTransport (h : ItemTransportedInMailInCourseOfProhibitedConduct o c)


inductive Section1028Exemption (o : Offense) (c : ComplaintText) : Prop where
  | lawEnforcementActivity
      (h : LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity o c)
  | chapter224Activity (h : ActivityAuthorizedUnderChapter224 o c)




structure Section1028ProsecutionGate (o : Offense) (c : ComplaintText) : Prop where
  charged      : ChargedUnderSection1028a o c
  circumstance : Section1028Circumstance o c
  notExempt    : ¬ Section1028Exemption o c



inductive Section1028InchoateTrack (o : Offense) (c : ComplaintText) : Prop where
  | attempt (h : AttemptedOffenseUnderSection1028 o c)
  | conspiracy (h : ConspiredToCommitOffenseUnderSection1028 o c)



structure Section1028b1dValueThreshold (o : Offense) (c : ComplaintText) : Prop where
  charged : ChargedUnderSection1028aParagraph o 7 c
  amount  : 100000 ≤ valueObtainedFromSection1028a7OffenseCents o c
  window  : section1028AggregationPeriodEndDay o c - section1028AggregationPeriodStartDay o c ≤ 365



structure Section1028RecidivistSequencing (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  prior   : PriorConvictionUnderSection1028 d c
  ordered : priorSection1028ConvictionFinalDay d c < section1028OffenseCommissionDay o c


structure Section1028a3PossessionCountThreshold (o : Offense) (c : ComplaintText) : Prop where
  charged : ChargedUnderSection1028aParagraph o 3 c
  count   : 5 ≤ countOfIdentificationItemsPossessed o c


structure Section1028b1bProductionCountThreshold (o : Offense) (c : ComplaintText) : Prop where
  count : 5 < countOfIdentificationItemsProducedOrTransferred o c




noncomputable def section1028a7MeansOfIdentificationCount (o : Offense) (c : ComplaintText) : Nat :=
  countOfStandaloneMeansOfIdentification o c
    + countOfIdentificationDocumentsContainingMeansOfIdentification o c


structure Section1028hDispositionOrderRequired
    (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  convicted : ConvictedOfViolationOfSection1028a d o c


structure Section1028hDispositionOrderMade
    (ct : Court) (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  required : Section1028hDispositionOrderRequired d o c
  ordered  : CourtOrderedForfeitureAndDispositionOfIllicitItems ct o c



structure Section1028hDispositionOrderOmitted
    (ct : Court) (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  required   : Section1028hDispositionOrderRequired d o c
  notOrdered : ¬ CourtOrderedForfeitureAndDispositionOfIllicitItems ct o c



structure Section1028ForfeitureProcedureConforming (o : Offense) (c : ComplaintText) : Prop where
  gate      : Section1028ProsecutionGate o c
  conformed : ForfeitureProceedingConformedToCsaSection413ExcludingSubsectionD o c




inductive Section1029Exemption (o : Offense) (c : ComplaintText) : Prop where
  | lawEnforcementActivity
      (h : LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity o c)
  | chapter224Activity (h : ActivityAuthorizedUnderChapter224 o c)



structure Section1029ProsecutionGate (o : Offense) (c : ComplaintText) : Prop where
  charged   : ChargedUnderSection1029a o c
  commerce  : AffectsInterstateOrForeignCommerce o c
  notExempt : ¬ Section1029Exemption o c



structure Section1029g1CarrierException
    (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  chargedParagraph9 : ChargedUnderSection1029aParagraph o 9 c
  affiliated        : ActorIsAffiliatedWithFacilitiesBasedCarrier d c
  notTrafficking    : ¬ ConductWasTrafficking o c
  protectivePurpose : ConductForPurposeOfProtectingCarrierPropertyOrLegalRights o c
  notServicePoaching :
    ¬ ConductForPurposeOfObtainingAnotherCarriersServiceWithoutAuthorization o c



structure Section1029g2AffirmativeDefense
    (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  chargedParagraph9      : ChargedUnderSection1029aParagraph o 9 c
  notProducingOrTrafficking : ¬ ConductWasProducingOrTrafficking o c
  researchOrDevelopment  : ConductForResearchOrDevelopmentInConnectionWithLawfulPurpose o c
  carriedPreponderance   : DefendantEstablishedDefenseByPreponderanceOfTheEvidence d o c




structure Section1029Punishable (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  gate               : Section1029ProsecutionGate o c
  noCarrierException : ¬ Section1029g1CarrierException d o c
  noEstablishedDefense : ¬ Section1029g2AffirmativeDefense d o c



inductive Section1029InchoateTrack (o : Offense) (c : ComplaintText) : Prop where
  | attempt (h : AttemptedOffenseUnderSection1029 o c)
  | conspiracy
      (h : PartyToConspiracyOfTwoOrMoreToCommitSection1029Offense o c)
      (overtAct : PartyEngagedInConductInFurtheranceOfConspiracy o c)



noncomputable def section1029ConspiracyMaxImprisonmentMonths (o : Offense) : Nat :=
  maxImprisonmentMonthsForSection1029ObjectOffense o / 2



noncomputable def section1029ConspiracyMaxFineCents (o : Offense) : Nat :=
  maxFineCentsForSection1029ObjectOffense o



structure Section1029RecidivistSequencing (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  prior   : PriorConvictionForAnotherSection1029Offense d c
  ordered : priorSection1029ConvictionDay d c < section1029OffenseCommissionDay o c



structure Section1029AggregationThreshold (o : Offense) (n : Nat) (c : ComplaintText) : Prop where
  charged : ChargedUnderSection1029aParagraph o n c
  amount  : 100000 ≤ section1029AggregateValueCents o n c
  window  : section1029AggregationPeriodEndDay o n c - section1029AggregationPeriodStartDay o n c ≤ 365


structure Section1029a3DeviceCountThreshold (o : Offense) (c : ComplaintText) : Prop where
  charged : ChargedUnderSection1029aParagraph o 3 c
  count   : 15 ≤ countOfCounterfeitOrUnauthorizedAccessDevicesPossessed o c



structure Section1029dSecretServiceInvestigation
    (ag : Agency) (ia : InteragencyAgreement) (o : Offense) (c : ComplaintText) : Prop where
  isSecretService : AgencyIsUnitedStatesSecretService ag c
  exercised       : AgencyExercisedInvestigativeAuthorityOverOffense ag o c
  agreementInEffect : TreasuryAttorneyGeneralInvestigativeAgreementInEffect ia c
  conformed       : InvestigationConductedInAccordanceWithInteragencyAgreement ag ia o c


structure Section1029OtherAgencyInvestigation
    (ag : Agency) (o : Offense) (c : ComplaintText) : Prop where
  otherAuthority : AgencyHasInvestigativeAuthorityApartFromSection1029d ag o c
  exercised      : AgencyExercisedInvestigativeAuthorityOverOffense ag o c


inductive Section1029AuthorizedInvestigation
    (ag : Agency) (ia : InteragencyAgreement) (o : Offense) (c : ComplaintText) : Prop where
  | secretService (h : Section1029dSecretServiceInvestigation ag ia o c)
  | otherAgency (h : Section1029OtherAgencyInvestigation ag o c)



inductive Section1029hCoveredEntity (en : Entity) (c : ComplaintText) : Prop where
  | financialInstitution (h : EntityIsFinancialInstitution en c)
  | accountIssuer (h : EntityIsAccountIssuer en c)
  | creditCardSystemMember (h : EntityIsCreditCardSystemMember en c)
  | organizedUnderUnitedStatesLaw (h : EntityIsOrganizedUnderUnitedStatesStateOrTerritorialLaw en c)


structure Section1029hExtraterritorialReach
    (ad : AccessDevice) (en : Entity) (o : Offense) (c : ComplaintText) : Prop where
  outsideJurisdiction : ActOccurredOutsideJurisdictionOfTheUnitedStates o c
  wouldBeOffense      : ActWouldConstituteSection1029OffenseIfCommittedWithinUnitedStates o c
  coveredEntity       : Section1029hCoveredEntity en c
  deviceNexus         : AccessDeviceIssuedOwnedManagedOrControlledByEntity ad en c



structure Section1029ForfeitureProcedureConforming (o : Offense) (c : ComplaintText) : Prop where
  gate      : Section1029ProsecutionGate o c
  conformed : ForfeitureProceedingConformedToCsaSection413ExcludingSubsectionD o c




def transitionSmtjJurisdiction (l : OffenseLocus) (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := ProceedingStage.conductOccurred
    target := ProceedingStage.jurisdictionEstablished
    guard  := Section7SmtjLocus l o c }


def transitionSection1028Charge (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := ProceedingStage.jurisdictionEstablished
    target := ProceedingStage.charged
    guard  := Section1028ProsecutionGate o c }


def transitionSection1029Charge (d : Person) (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := ProceedingStage.jurisdictionEstablished
    target := ProceedingStage.charged
    guard  := Section1029Punishable d o c }


def transitionSection21ElementEstablished
    (d : Person) (pr : Property) (r : OfficialRepresentation)
    (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := ProceedingStage.charged
    target := ProceedingStage.elementEstablished
    guard  := Section21AlternativeProofOfCharacter d pr r o c }


def transitionSection1028hDisposition
    (ct : Court) (d : Person) (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := ProceedingStage.convicted
    target := ProceedingStage.dispositionOrdered
    guard  := Section1028hDispositionOrderMade ct d o c }


def transitionSection1028Exempt (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := ProceedingStage.conductOccurred
    target := ProceedingStage.exempted
    guard  := Section1028Exemption o c }


def transitionSection1029Exempt (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := ProceedingStage.conductOccurred
    target := ProceedingStage.exempted
    guard  := Section1029Exemption o c }




inductive ReachesStage
    (l : OffenseLocus) (ct : Court) (d : Person) (o : Offense) (c : ComplaintText) :
    ProceedingStage → Prop where
  | start : ReachesStage l ct d o c ProceedingStage.conductOccurred
  | jurisdiction
      (prev : ReachesStage l ct d o c ProceedingStage.conductOccurred)
      (h : Section7SmtjLocus l o c) :
      ReachesStage l ct d o c ProceedingStage.jurisdictionEstablished
  | charge1028
      (prev : ReachesStage l ct d o c ProceedingStage.jurisdictionEstablished)
      (h : Section1028ProsecutionGate o c) :
      ReachesStage l ct d o c ProceedingStage.charged
  | charge1029
      (prev : ReachesStage l ct d o c ProceedingStage.jurisdictionEstablished)
      (h : Section1029Punishable d o c) :
      ReachesStage l ct d o c ProceedingStage.charged
  | convict
      (prev : ReachesStage l ct d o c ProceedingStage.charged)
      (forum : CourtOfTheUnitedStates ct c)
      (h : ConvictedOfViolationOfSection1028a d o c) :
      ReachesStage l ct d o c ProceedingStage.convicted
  | disposition
      (prev : ReachesStage l ct d o c ProceedingStage.convicted)
      (h : Section1028hDispositionOrderMade ct d o c) :
      ReachesStage l ct d o c ProceedingStage.dispositionOrdered
  | exempt
      (prev : ReachesStage l ct d o c ProceedingStage.conductOccurred)
      (h : Section1028Exemption o c) :
      ReachesStage l ct d o c ProceedingStage.exempted

end Proving.USC.T18.Ch1Ch47.Recert2.Procedure
