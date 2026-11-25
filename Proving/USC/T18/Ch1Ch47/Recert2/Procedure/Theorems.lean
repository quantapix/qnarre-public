import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Procedure.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Procedure.Predicates
import Proving.USC.T18.Ch1Ch47.Recert2.Procedure.Statute

set_option autoImplicit false













namespace Proving.USC.T18.Ch1Ch47.Recert2.Procedure

open Proving.USC.Common



theorem section7Para6InFlight_intro
    {l : OffenseLocus} {c : ComplaintText}
    (onRegistry : VehicleLocusOnUnitedStatesSpaceRegistry l c)
    (afterDoorsClosed : spaceVehicleDoorsClosedMinute l c ≤ allegedConductMinute l c)
    (beforeDoorsOpened : allegedConductMinute l c ≤ spaceVehicleDoorsOpenedMinute l c) :
    Section7Para6InFlight l c :=
  Section7Para6InFlight.normalDisembarkation onRegistry afterDoorsClosed beforeDoorsOpened



theorem section7Para6InFlight_of_measurements
    {l : OffenseLocus} {c : ComplaintText} (tClosed tConduct tOpened : Nat)
    (onRegistry : VehicleLocusOnUnitedStatesSpaceRegistry l c)
    (hClosed : spaceVehicleDoorsClosedMinute l c = tClosed)
    (hConduct : allegedConductMinute l c = tConduct)
    (hOpened : spaceVehicleDoorsOpenedMinute l c = tOpened)
    (hOrder : tClosed ≤ tConduct ∧ tConduct ≤ tOpened) :
    Section7Para6InFlight l c := by
  refine Section7Para6InFlight.normalDisembarkation onRegistry ?_ ?_ <;> omega

theorem section7SmtjLocus_intro
    {l : OffenseLocus} {o : Offense} {c : ComplaintText}
    (h : LocusHighSeasOrUnitedStatesVessel l c) : Section7SmtjLocus l o c :=
  Section7SmtjLocus.highSeasOrUnitedStatesVessel h


theorem section7SmtjLocus_intro_missionAbroad
    {l : OffenseLocus} {o : Offense} {c : ComplaintText}
    (h : LocusUnitedStatesMissionPremisesOrResidenceAbroad l c)
    (hNational : OffenseByOrAgainstNationalOfTheUnitedStates o c)
    (hNotMejaOffender : ¬ OffenderIsPersonDescribedInSection3261a o c)
    (hNoConflictingTreaty : ¬ ConflictingTreatyOrInternationalAgreementGoverns o c) :
    Section7SmtjLocus l o c :=
  Section7SmtjLocus.unitedStatesMissionAbroad h hNational hNotMejaOffender hNoConflictingTreaty


theorem section7SmtjLocus_intro_spaceVehicle
    {l : OffenseLocus} {o : Offense} {c : ComplaintText}
    (h : Section7Para6InFlight l c) : Section7SmtjLocus l o c :=
  Section7SmtjLocus.unitedStatesSpaceVehicleInFlight h



theorem section21OfficialRepresentation_intro
    {r : OfficialRepresentation} {c : ComplaintText}
    (h : RepresentationMadeByFederalLawEnforcementOfficer r c) :
    Section21OfficialRepresentation r c :=
  Section21OfficialRepresentation.byFederalOfficer h

theorem section21BeliefLinkedToRepresentation_intro
    {r : OfficialRepresentation} {d : Person} {c : ComplaintText}
    (h : officialRepresentationDay r c ≤ defendantBeliefDay d c) :
    Section21BeliefLinkedToRepresentation r d c :=
  Section21BeliefLinkedToRepresentation.temporallyAfter h



theorem section21BeliefLinkedToRepresentation_of_dates
    {r : OfficialRepresentation} {d : Person} {c : ComplaintText} (tRep tBelief : Nat)
    (hRep : officialRepresentationDay r c = tRep)
    (hBelief : defendantBeliefDay d c = tBelief)
    (hOrder : tRep ≤ tBelief) :
    Section21BeliefLinkedToRepresentation r d c := by
  refine Section21BeliefLinkedToRepresentation.temporallyAfter ?_
  omega

theorem section21AlternativeProofOfCharacter_intro
    {d : Person} {pr : Property} {r : OfficialRepresentation}
    {o : Offense} {c : ComplaintText}
    (elementAtIssue : ChargedElementRequiresProscribedCharacterAndKnowledge o c)
    (official : Section21OfficialRepresentation r c)
    (asToProperty : RepresentationConcernedNatureOfProperty r pr c)
    (believed : DefendantBelievedPropertyOfProscribedCharacter d pr c)
    (linked : Section21BeliefLinkedToRepresentation r d c) :
    Section21AlternativeProofOfCharacter d pr r o c :=
  ⟨elementAtIssue, official, asToProperty, believed, linked⟩



theorem section23CourtBasis_intro
    {ct : Court} {c : ComplaintText}
    (h : TribunalIsTerritorialDistrictCourtNamedInSection23 ct c) :
    Section23CourtBasis ct c :=
  Section23CourtBasis.territorialDistrictCourt h

theorem courtOfTheUnitedStates_intro
    {ct : Court} {c : ComplaintText}
    (basis : Section23CourtBasis ct c)
    (notDisplaced : ¬ ExpressProvisionDisplacesSection23Inclusion ct c) :
    CourtOfTheUnitedStates ct c :=
  ⟨basis, notDisplaced⟩



theorem section24ChargeForm_intro
    {o : Offense} {c : ComplaintText}
    (h : ChargedAsViolationOfObjectStatute o c) : Section24ChargeForm o c :=
  Section24ChargeForm.substantiveViolation h

theorem federalHealthCareOffense_intro
    {o : Offense} {c : ComplaintText}
    (form : Section24ChargeForm o c)
    (h : ObjectStatuteEnumeratedInSection24a1 o c) :
    FederalHealthCareOffense o c :=
  FederalHealthCareOffense.coreEnumerated form h


theorem federalHealthCareOffense_intro_general
    {o : Offense} {c : ComplaintText}
    (form : Section24ChargeForm o c)
    (h : ObjectStatuteEnumeratedInSection24a2 o c)
    (hRelated : ViolationOrConspiracyRelatesToHealthCareBenefitProgram o c) :
    FederalHealthCareOffense o c :=
  FederalHealthCareOffense.generalEnumeratedAndRelated form h hRelated



theorem section1028Circumstance_intro
    {o : Offense} {c : ComplaintText}
    (h : IdentificationItemAppearsIssuedByUnitedStatesOrSpecialEventSponsor o c) :
    Section1028Circumstance o c :=
  Section1028Circumstance.unitedStatesOrSponsorIssued h

theorem section1028Exemption_intro
    {o : Offense} {c : ComplaintText}
    (h : LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity o c) :
    Section1028Exemption o c :=
  Section1028Exemption.lawEnforcementActivity h

theorem section1028ProsecutionGate_intro
    {o : Offense} {c : ComplaintText}
    (charged : ChargedUnderSection1028a o c)
    (circumstance : Section1028Circumstance o c)
    (notExempt : ¬ Section1028Exemption o c) :
    Section1028ProsecutionGate o c :=
  ⟨charged, circumstance, notExempt⟩

theorem section1028InchoateTrack_intro
    {o : Offense} {c : ComplaintText}
    (h : AttemptedOffenseUnderSection1028 o c) : Section1028InchoateTrack o c :=
  Section1028InchoateTrack.attempt h

theorem section1028b1dValueThreshold_intro
    {o : Offense} {c : ComplaintText}
    (charged : ChargedUnderSection1028aParagraph o 7 c)
    (amount : 100000 ≤ valueObtainedFromSection1028a7OffenseCents o c)
    (window : section1028AggregationPeriodEndDay o c
                - section1028AggregationPeriodStartDay o c ≤ 365) :
    Section1028b1dValueThreshold o c :=
  ⟨charged, amount, window⟩



theorem section1028b1dValueThreshold_of_measurements
    {o : Offense} {c : ComplaintText} (v : Nat) (tStart tEnd : Nat)
    (charged : ChargedUnderSection1028aParagraph o 7 c)
    (hValue : valueObtainedFromSection1028a7OffenseCents o c = v)
    (hStart : section1028AggregationPeriodStartDay o c = tStart)
    (hEnd : section1028AggregationPeriodEndDay o c = tEnd)
    (hAmount : 100000 ≤ v)
    (hWindow : tEnd ≤ tStart + 365) :
    Section1028b1dValueThreshold o c := by
  refine ⟨charged, ?_, ?_⟩ <;> omega

theorem section1028RecidivistSequencing_intro
    {d : Person} {o : Offense} {c : ComplaintText}
    (prior : PriorConvictionUnderSection1028 d c)
    (ordered : priorSection1028ConvictionFinalDay d c < section1028OffenseCommissionDay o c) :
    Section1028RecidivistSequencing d o c :=
  ⟨prior, ordered⟩



theorem section1028RecidivistSequencing_of_dates
    {d : Person} {o : Offense} {c : ComplaintText} (tFinal tOffense : Nat)
    (prior : PriorConvictionUnderSection1028 d c)
    (hFinal : priorSection1028ConvictionFinalDay d c = tFinal)
    (hOffense : section1028OffenseCommissionDay o c = tOffense)
    (hOrder : tFinal < tOffense) :
    Section1028RecidivistSequencing d o c := by
  refine ⟨prior, ?_⟩
  omega

theorem section1028a3PossessionCountThreshold_intro
    {o : Offense} {c : ComplaintText}
    (charged : ChargedUnderSection1028aParagraph o 3 c)
    (count : 5 ≤ countOfIdentificationItemsPossessed o c) :
    Section1028a3PossessionCountThreshold o c :=
  ⟨charged, count⟩

theorem section1028a3PossessionCountThreshold_of_measurements
    {o : Offense} {c : ComplaintText} (k : Nat)
    (charged : ChargedUnderSection1028aParagraph o 3 c)
    (hCount : countOfIdentificationItemsPossessed o c = k)
    (hFive : 5 ≤ k) :
    Section1028a3PossessionCountThreshold o c := by
  refine ⟨charged, ?_⟩
  omega

theorem section1028b1bProductionCountThreshold_intro
    {o : Offense} {c : ComplaintText}
    (count : 5 < countOfIdentificationItemsProducedOrTransferred o c) :
    Section1028b1bProductionCountThreshold o c :=
  ⟨count⟩

theorem section1028b1bProductionCountThreshold_of_measurements
    {o : Offense} {c : ComplaintText} (k : Nat)
    (hCount : countOfIdentificationItemsProducedOrTransferred o c = k)
    (hMoreThanFive : 6 ≤ k) :
    Section1028b1bProductionCountThreshold o c := by
  refine ⟨?_⟩
  omega


theorem section1028a7MeansOfIdentificationCount_of_measurements
    {o : Offense} {c : ComplaintText} (standalone documents : Nat)
    (hStandalone : countOfStandaloneMeansOfIdentification o c = standalone)
    (hDocuments : countOfIdentificationDocumentsContainingMeansOfIdentification o c = documents) :
    section1028a7MeansOfIdentificationCount o c = standalone + documents := by
  unfold section1028a7MeansOfIdentificationCount
  omega

theorem section1028hDispositionOrderRequired_intro
    {d : Person} {o : Offense} {c : ComplaintText}
    (convicted : ConvictedOfViolationOfSection1028a d o c) :
    Section1028hDispositionOrderRequired d o c :=
  ⟨convicted⟩

theorem section1028hDispositionOrderMade_intro
    {ct : Court} {d : Person} {o : Offense} {c : ComplaintText}
    (required : Section1028hDispositionOrderRequired d o c)
    (ordered : CourtOrderedForfeitureAndDispositionOfIllicitItems ct o c) :
    Section1028hDispositionOrderMade ct d o c :=
  ⟨required, ordered⟩

theorem section1028hDispositionOrderOmitted_intro
    {ct : Court} {d : Person} {o : Offense} {c : ComplaintText}
    (required : Section1028hDispositionOrderRequired d o c)
    (notOrdered : ¬ CourtOrderedForfeitureAndDispositionOfIllicitItems ct o c) :
    Section1028hDispositionOrderOmitted ct d o c :=
  ⟨required, notOrdered⟩

theorem section1028ForfeitureProcedureConforming_intro
    {o : Offense} {c : ComplaintText}
    (gate : Section1028ProsecutionGate o c)
    (conformed : ForfeitureProceedingConformedToCsaSection413ExcludingSubsectionD o c) :
    Section1028ForfeitureProcedureConforming o c :=
  ⟨gate, conformed⟩



theorem section1029Exemption_intro
    {o : Offense} {c : ComplaintText}
    (h : LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity o c) :
    Section1029Exemption o c :=
  Section1029Exemption.lawEnforcementActivity h

theorem section1029ProsecutionGate_intro
    {o : Offense} {c : ComplaintText}
    (charged : ChargedUnderSection1029a o c)
    (commerce : AffectsInterstateOrForeignCommerce o c)
    (notExempt : ¬ Section1029Exemption o c) :
    Section1029ProsecutionGate o c :=
  ⟨charged, commerce, notExempt⟩

theorem section1029g1CarrierException_intro
    {d : Person} {o : Offense} {c : ComplaintText}
    (chargedParagraph9 : ChargedUnderSection1029aParagraph o 9 c)
    (affiliated : ActorIsAffiliatedWithFacilitiesBasedCarrier d c)
    (notTrafficking : ¬ ConductWasTrafficking o c)
    (protectivePurpose : ConductForPurposeOfProtectingCarrierPropertyOrLegalRights o c)
    (notServicePoaching :
      ¬ ConductForPurposeOfObtainingAnotherCarriersServiceWithoutAuthorization o c) :
    Section1029g1CarrierException d o c :=
  ⟨chargedParagraph9, affiliated, notTrafficking, protectivePurpose, notServicePoaching⟩

theorem section1029g2AffirmativeDefense_intro
    {d : Person} {o : Offense} {c : ComplaintText}
    (chargedParagraph9 : ChargedUnderSection1029aParagraph o 9 c)
    (notProducingOrTrafficking : ¬ ConductWasProducingOrTrafficking o c)
    (researchOrDevelopment : ConductForResearchOrDevelopmentInConnectionWithLawfulPurpose o c)
    (carriedPreponderance : DefendantEstablishedDefenseByPreponderanceOfTheEvidence d o c) :
    Section1029g2AffirmativeDefense d o c :=
  ⟨chargedParagraph9, notProducingOrTrafficking, researchOrDevelopment, carriedPreponderance⟩

theorem section1029Punishable_intro
    {d : Person} {o : Offense} {c : ComplaintText}
    (gate : Section1029ProsecutionGate o c)
    (noCarrierException : ¬ Section1029g1CarrierException d o c)
    (noEstablishedDefense : ¬ Section1029g2AffirmativeDefense d o c) :
    Section1029Punishable d o c :=
  ⟨gate, noCarrierException, noEstablishedDefense⟩

theorem section1029InchoateTrack_intro
    {o : Offense} {c : ComplaintText}
    (h : AttemptedOffenseUnderSection1029 o c) : Section1029InchoateTrack o c :=
  Section1029InchoateTrack.attempt h


theorem section1029InchoateTrack_intro_conspiracy
    {o : Offense} {c : ComplaintText}
    (h : PartyToConspiracyOfTwoOrMoreToCommitSection1029Offense o c)
    (overtAct : PartyEngagedInConductInFurtheranceOfConspiracy o c) :
    Section1029InchoateTrack o c :=
  Section1029InchoateTrack.conspiracy h overtAct



theorem section1029ConspiracyMaxImprisonmentMonths_of_measurements
    {o : Offense} (m : Nat)
    (hMax : maxImprisonmentMonthsForSection1029ObjectOffense o = m) :
    section1029ConspiracyMaxImprisonmentMonths o = m / 2 := by
  unfold section1029ConspiracyMaxImprisonmentMonths
  omega

theorem section1029RecidivistSequencing_intro
    {d : Person} {o : Offense} {c : ComplaintText}
    (prior : PriorConvictionForAnotherSection1029Offense d c)
    (ordered : priorSection1029ConvictionDay d c < section1029OffenseCommissionDay o c) :
    Section1029RecidivistSequencing d o c :=
  ⟨prior, ordered⟩

theorem section1029RecidivistSequencing_of_dates
    {d : Person} {o : Offense} {c : ComplaintText} (tPrior tOffense : Nat)
    (prior : PriorConvictionForAnotherSection1029Offense d c)
    (hPrior : priorSection1029ConvictionDay d c = tPrior)
    (hOffense : section1029OffenseCommissionDay o c = tOffense)
    (hOrder : tPrior < tOffense) :
    Section1029RecidivistSequencing d o c := by
  refine ⟨prior, ?_⟩
  omega

theorem section1029AggregationThreshold_intro
    {o : Offense} {c : ComplaintText} (n : Nat)
    (charged : ChargedUnderSection1029aParagraph o n c)
    (amount : 100000 ≤ section1029AggregateValueCents o n c)
    (window : section1029AggregationPeriodEndDay o n c
                - section1029AggregationPeriodStartDay o n c ≤ 365) :
    Section1029AggregationThreshold o n c :=
  ⟨charged, amount, window⟩


theorem section1029AggregationThreshold_of_measurements
    {o : Offense} {c : ComplaintText} (n : Nat) (v : Nat) (tStart tEnd : Nat)
    (charged : ChargedUnderSection1029aParagraph o n c)
    (hValue : section1029AggregateValueCents o n c = v)
    (hStart : section1029AggregationPeriodStartDay o n c = tStart)
    (hEnd : section1029AggregationPeriodEndDay o n c = tEnd)
    (hAmount : 100000 ≤ v)
    (hWindow : tEnd ≤ tStart + 365) :
    Section1029AggregationThreshold o n c := by
  refine ⟨charged, ?_, ?_⟩ <;> omega

theorem section1029a3DeviceCountThreshold_intro
    {o : Offense} {c : ComplaintText}
    (charged : ChargedUnderSection1029aParagraph o 3 c)
    (count : 15 ≤ countOfCounterfeitOrUnauthorizedAccessDevicesPossessed o c) :
    Section1029a3DeviceCountThreshold o c :=
  ⟨charged, count⟩

theorem section1029a3DeviceCountThreshold_of_measurements
    {o : Offense} {c : ComplaintText} (k : Nat)
    (charged : ChargedUnderSection1029aParagraph o 3 c)
    (hCount : countOfCounterfeitOrUnauthorizedAccessDevicesPossessed o c = k)
    (hFifteen : 15 ≤ k) :
    Section1029a3DeviceCountThreshold o c := by
  refine ⟨charged, ?_⟩
  omega

theorem section1029dSecretServiceInvestigation_intro
    {ag : Agency} {ia : InteragencyAgreement} {o : Offense} {c : ComplaintText}
    (isSecretService : AgencyIsUnitedStatesSecretService ag c)
    (exercised : AgencyExercisedInvestigativeAuthorityOverOffense ag o c)
    (agreementInEffect : TreasuryAttorneyGeneralInvestigativeAgreementInEffect ia c)
    (conformed : InvestigationConductedInAccordanceWithInteragencyAgreement ag ia o c) :
    Section1029dSecretServiceInvestigation ag ia o c :=
  ⟨isSecretService, exercised, agreementInEffect, conformed⟩

theorem section1029OtherAgencyInvestigation_intro
    {ag : Agency} {o : Offense} {c : ComplaintText}
    (otherAuthority : AgencyHasInvestigativeAuthorityApartFromSection1029d ag o c)
    (exercised : AgencyExercisedInvestigativeAuthorityOverOffense ag o c) :
    Section1029OtherAgencyInvestigation ag o c :=
  ⟨otherAuthority, exercised⟩

theorem section1029AuthorizedInvestigation_intro
    {ag : Agency} {ia : InteragencyAgreement} {o : Offense} {c : ComplaintText}
    (h : Section1029dSecretServiceInvestigation ag ia o c) :
    Section1029AuthorizedInvestigation ag ia o c :=
  Section1029AuthorizedInvestigation.secretService h

theorem section1029hCoveredEntity_intro
    {en : Entity} {c : ComplaintText}
    (h : EntityIsFinancialInstitution en c) : Section1029hCoveredEntity en c :=
  Section1029hCoveredEntity.financialInstitution h

theorem section1029hExtraterritorialReach_intro
    {ad : AccessDevice} {en : Entity} {o : Offense} {c : ComplaintText}
    (outsideJurisdiction : ActOccurredOutsideJurisdictionOfTheUnitedStates o c)
    (wouldBeOffense : ActWouldConstituteSection1029OffenseIfCommittedWithinUnitedStates o c)
    (coveredEntity : Section1029hCoveredEntity en c)
    (deviceNexus : AccessDeviceIssuedOwnedManagedOrControlledByEntity ad en c) :
    Section1029hExtraterritorialReach ad en o c :=
  ⟨outsideJurisdiction, wouldBeOffense, coveredEntity, deviceNexus⟩

theorem section1029ForfeitureProcedureConforming_intro
    {o : Offense} {c : ComplaintText}
    (gate : Section1029ProsecutionGate o c)
    (conformed : ForfeitureProceedingConformedToCsaSection413ExcludingSubsectionD o c) :
    Section1029ForfeitureProcedureConforming o c :=
  ⟨gate, conformed⟩



theorem reachesStage_intro
    {l : OffenseLocus} {ct : Court} {d : Person} {o : Offense} {c : ComplaintText} :
    ReachesStage l ct d o c ProceedingStage.conductOccurred :=
  ReachesStage.start


theorem reachesStage_dispositionOrdered_intro
    {l : OffenseLocus} {ct : Court} {d : Person} {o : Offense} {c : ComplaintText}
    (hJurisdiction : Section7SmtjLocus l o c)
    (hGate : Section1028ProsecutionGate o c)
    (hForum : CourtOfTheUnitedStates ct c)
    (hConvicted : ConvictedOfViolationOfSection1028a d o c)
    (hOrder : Section1028hDispositionOrderMade ct d o c) :
    ReachesStage l ct d o c ProceedingStage.dispositionOrdered :=
  ReachesStage.disposition
    (ReachesStage.convict
      (ReachesStage.charge1028
        (ReachesStage.jurisdiction ReachesStage.start hJurisdiction) hGate)
      hForum hConvicted)
    hOrder

end Proving.USC.T18.Ch1Ch47.Recert2.Procedure
