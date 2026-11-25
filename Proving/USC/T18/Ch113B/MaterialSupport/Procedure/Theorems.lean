





import Proving.USC.T18.Ch113B.MaterialSupport.Procedure.Types
import Proving.USC.T18.Ch113B.MaterialSupport.Procedure.Predicates
import Proving.USC.T18.Ch113B.MaterialSupport.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Procedure

open Proving.USC.Common




theorem transitionTaken_intro {t : Transition} (h : t.guard) : TransitionTaken t :=
  ⟨h⟩




theorem section2339VenueProper_intro
    {o : Offense} {pr : Proceeding} {d : District} {c : ComplaintText}
    (hBrought : ProsecutionBroughtInDistrict pr d c)
    (hBasis : UnderlyingOffenseCommittedInDistrict o d c ∨ DistrictProperAsProvidedByLaw pr d c) :
    Section2339VenueProper o pr d c :=
  ⟨hBrought, hBasis⟩


theorem section2339AVenueProper_intro
    {o : Offense} {pr : Proceeding} {d : District} {c : ComplaintText}
    (hBrought : ProsecutionBroughtInDistrict pr d c)
    (hBasis : UnderlyingOffenseCommittedInDistrict o d c ∨ DistrictProperAsProvidedByLaw pr d c) :
    Section2339AVenueProper o pr d c :=
  ⟨hBrought, hBasis⟩




theorem section2339BJurisdictionEstablished_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenderIsUnitedStatesNationalOrLawfulPermanentResident p c ∨
         OffenderIsStatelessPersonHabituallyResidentInUnitedStates p c ∨
         OffenderBroughtIntoOrFoundInUnitedStates p o c ∨
         OffenseOccursInWholeOrPartWithinUnitedStates o c ∨
         OffenseOccursInOrAffectsInterstateOrForeignCommerce o c ∨
         OffenderAidsAbetsOrConspiresWithPersonSubjectToJurisdiction p o c) :
    Section2339BJurisdictionEstablished p o c := h


theorem section2339BJurisdictionEstablished_of_nationalOrLpr
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenderIsUnitedStatesNationalOrLawfulPermanentResident p c) :
    Section2339BJurisdictionEstablished p o c := Or.inl h


theorem section2339BJurisdictionEstablished_of_statelessResident
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenderIsStatelessPersonHabituallyResidentInUnitedStates p c) :
    Section2339BJurisdictionEstablished p o c := Or.inr (Or.inl h)


theorem section2339BJurisdictionEstablished_of_foundInUnitedStates
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenderBroughtIntoOrFoundInUnitedStates p o c) :
    Section2339BJurisdictionEstablished p o c := Or.inr (Or.inr (Or.inl h))


theorem section2339BJurisdictionEstablished_of_occursWithinUnitedStates
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenseOccursInWholeOrPartWithinUnitedStates o c) :
    Section2339BJurisdictionEstablished p o c := Or.inr (Or.inr (Or.inr (Or.inl h)))


theorem section2339BJurisdictionEstablished_of_commerce
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenseOccursInOrAffectsInterstateOrForeignCommerce o c) :
    Section2339BJurisdictionEstablished p o c :=
  Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))


theorem section2339BJurisdictionEstablished_of_aidsAbetsOrConspires
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenderAidsAbetsOrConspiresWithPersonSubjectToJurisdiction p o c) :
    Section2339BJurisdictionEstablished p o c :=
  Or.inr (Or.inr (Or.inr (Or.inr (Or.inr h))))


theorem section2339DJurisdictionEstablished_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenderIsUnitedStatesNationalOrLawfulPermanentResident p c ∨
         OffenderIsStatelessPersonHabituallyResidentInUnitedStates p c ∨
         OffenderBroughtIntoOrFoundInUnitedStates p o c ∨
         OffenseOccursInWholeOrPartWithinUnitedStates o c ∨
         OffenseOccursInOrAffectsInterstateOrForeignCommerce o c ∨
         OffenderAidsAbetsOrConspiresWithPersonSubjectToJurisdiction p o c) :
    Section2339DJurisdictionEstablished p o c := h



theorem section2339DJurisdictionEstablished_of_section2339B
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : Section2339BJurisdictionEstablished p o c) :
    Section2339DJurisdictionEstablished p o c := h


theorem section2339BExtraterritorialJurisdiction_intro :
    Section2339BExtraterritorialJurisdiction := trivial


theorem section2339DExtraterritorialJurisdiction_intro :
    Section2339DExtraterritorialJurisdiction := trivial


theorem section2339CJurisdictionEstablished_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : (OffenseTakesPlaceInUnitedStates o c ∧
            (PerpetratorIsNationalOfAnotherStateOrStateless p c ∨
             OffenseCommittedOnBoardForeignFlagVesselOrRegisteredAircraft o c ∨
             OffenseCommittedOnBoardAircraftOperatedByAnotherState o c ∨
             PerpetratorFoundOutsideUnitedStates p c ∨
             PredicateActDirectedAtNationalOrFacilityOfAnotherState o c ∨
             PredicateActDirectedToCompelAnotherStateOrIntergovernmentalOrganization o c ∨
             PredicateActOutsideUnitedStatesOrAffectingCommerce o c)) ∨
         (¬ OffenseTakesPlaceInUnitedStates o c ∧
            (PerpetratorIsUnitedStatesNationalOrStatelessResident p c ∨
             PerpetratorFoundInUnitedStates p c ∨
             PredicateActDirectedAtUnitedStatesPersonPropertyOrEntity o c)) ∨
         OffenseCommittedOnBoardUnitedStatesFlagVesselOrRegisteredAircraft o c ∨
         OffenseCommittedOnBoardAircraftOperatedByUnitedStates o c ∨
         PredicateActDirectedToCompelUnitedStates o c) :
    Section2339CJurisdictionEstablished p o c := h



theorem section2339CJurisdictionEstablished_of_unitedStatesFlagVessel
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : OffenseCommittedOnBoardUnitedStatesFlagVesselOrRegisteredAircraft o c) :
    Section2339CJurisdictionEstablished p o c := Or.inr (Or.inr (Or.inl h))


theorem section2339CActualUseOfFundsNotRequired_intro :
    Section2339CActualUseOfFundsNotRequired := trivial




theorem section2339BFundsDutyDischarged_intro
    {fi : FinancialInstitution} {f : Funds} {c : ComplaintText}
    (h : SecretaryAuthorizedException fi f c ∨
         (FinancialInstitutionRetainedPossessionOrControl fi f c ∧
          FinancialInstitutionReportedFundsToSecretary fi f c)) :
    Section2339BFundsDutyDischarged fi f c := h


theorem section2339BFundsDutyDischarged_of_retainAndReport
    {fi : FinancialInstitution} {f : Funds} {c : ComplaintText}
    (hRetain : FinancialInstitutionRetainedPossessionOrControl fi f c)
    (hReport : FinancialInstitutionReportedFundsToSecretary fi f c) :
    Section2339BFundsDutyDischarged fi f c := Or.inr ⟨hRetain, hReport⟩


theorem section2339BCivilPenaltyTrigger_intro
    {fi : FinancialInstitution} {f : Funds} {c : ComplaintText}
    (hAware : FinancialInstitutionAwareOfPossessionOrControlOfFunds fi f c)
    (hInterest : ForeignTerroristOrganizationOrAgentHasInterestInFunds f c)
    (hNotAuthorized : ¬ SecretaryAuthorizedException fi f c)
    (hKnowing : FinancialInstitutionKnowinglyFailedToComply fi f c) :
    Section2339BCivilPenaltyTrigger fi f c :=
  ⟨hAware, hInterest, hNotAuthorized, hKnowing⟩


theorem section2339BCivilPenaltyDollars_ge_perViolation
    (fi : FinancialInstitution) (c : ComplaintText) :
    50000 * violationCount fi c ≤ section2339BCivilPenaltyDollars fi c :=
  Nat.le_max_left _ _



theorem section2339BCivilPenaltyDollars_ge_twiceRetained
    (fi : FinancialInstitution) (c : ComplaintText) :
    2 * dollarsRequiredToBeRetained fi c ≤ section2339BCivilPenaltyDollars fi c :=
  Nat.le_max_right _ _


theorem section2339BCivilPenaltyProperlyAssessed_intro
    {fi : FinancialInstitution} {c : ComplaintText}
    (h : civilPenaltyAssessedDollars fi c = section2339BCivilPenaltyDollars fi c) :
    Section2339BCivilPenaltyProperlyAssessed fi c := h




theorem section2339BInjunctiveActionProper_intro
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hAppearance : AppearsToSecretaryOrAttorneyGeneralThatViolationIsOccurringOrImminent p c)
    (hInitiated : AttorneyGeneralInitiatedCivilInjunctiveAction p pr c)
    (hCourt : ActionBroughtInDistrictCourtOfTheUnitedStates pr c) :
    Section2339BInjunctiveActionProper p pr c :=
  ⟨hAppearance, hInitiated, hCourt⟩




theorem section2339BInvestigationDutyDischarged_intro
    {inv : Investigation} {c : ComplaintText}
    (hInvestigated : AttorneyGeneralConductedInvestigation inv c)
    (hCoordinated : AttorneyGeneralCoordinatedWithSecretary inv c) :
    Section2339BInvestigationDutyDischarged inv c :=
  ⟨hInvestigated, hCoordinated⟩


theorem section2339BReferralDutyDischarged_intro
    {inv : Investigation} {r : Referral} {c : ComplaintText}
    (hArose : EvidenceOfCriminalViolationAroseInInvestigation inv c)
    (hReferred : EvidenceReferredImmediatelyToAttorneyGeneral r c)
    (hNotified : AttorneyGeneralTimelyNotifiedSecretaryOfActionTaken r c) :
    Section2339BReferralDutyDischarged inv r c :=
  ⟨hArose, hReferred, hNotified⟩




theorem section2339BProtectiveOrderGranted_intro
    {pr : Proceeding} {c : ComplaintText}
    (hRequest : UnitedStatesMadeExParteWrittenRequest pr c)
    (hShowing : CourtMadeSufficientShowingFinding pr c)
    (hAuthorized : CourtAuthorizedRedactionSubstitutionOrStatement pr c)
    (hSealed : ClassifiedDocumentsSealedAndPreserved pr c) :
    Section2339BProtectiveOrderGranted pr c :=
  ⟨hRequest, hShowing, hAuthorized, hSealed⟩


theorem section2339BSubstitutionMandatory_intro
    {pr : Proceeding} {c : ComplaintText}
    (hPetition : UnitedStatesMadeExParteWrittenRequest pr c)
    (hSufficient : SubstituteSufficientToAllowDefendantToPrepareDefense pr c) :
    Section2339BSubstitutionMandatory pr c :=
  ⟨hPetition, hSufficient⟩


theorem section2339BQualifyingInterlocutoryOrder_intro
    {pr : Proceeding} {c : ComplaintText}
    (h : OrderAuthorizedDisclosureOfClassifiedInformation pr c ∨
         OrderImposedSanctionsForNondisclosure pr c ∨
         OrderRefusedProtectiveOrderSoughtByUnitedStates pr c) :
    Section2339BQualifyingInterlocutoryOrder pr c := h



theorem section2339BPretrialAppealWithinFourteenDays_intro
    {pr : Proceeding} {c : ComplaintText}
    (h : daysFromOrderToInterlocutoryAppeal pr c ≤ 14) :
    Section2339BPretrialAppealWithinFourteenDays pr c := h


theorem section2339BMidTrialArgumentWithinFourDays_intro
    {pr : Proceeding} {c : ComplaintText}
    (h : countableDaysFromAdjournmentToAppellateArgument pr c ≤ 4) :
    Section2339BMidTrialArgumentWithinFourDays pr c := h


theorem section2339BMidTrialDecisionWithinFourDays_intro
    {pr : Proceeding} {c : ComplaintText}
    (h : countableDaysFromArgumentToAppellateDecision pr c ≤ 4) :
    Section2339BMidTrialDecisionWithinFourDays pr c := h


theorem section2339BTimelyPretrialInterlocutoryAppeal_intro
    {pr : Proceeding} {c : ComplaintText}
    (hTaken : InterlocutoryAppealTakenByUnitedStates pr c)
    (hOrder : Section2339BQualifyingInterlocutoryOrder pr c)
    (hBefore : AppealTakenBeforeTrial pr c)
    (hWindow : Section2339BPretrialAppealWithinFourteenDays pr c)
    (hTrialHeld : TrialNotCommencedUntilAppealResolved pr c) :
    Section2339BTimelyPretrialInterlocutoryAppeal pr c :=
  ⟨hTaken, hOrder, hBefore, hWindow, hTrialHeld⟩


theorem section2339BTimelyMidTrialInterlocutoryAppeal_intro
    {pr : Proceeding} {c : ComplaintText}
    (hTaken : InterlocutoryAppealTakenByUnitedStates pr c)
    (hOrder : Section2339BQualifyingInterlocutoryOrder pr c)
    (hDuring : AppealTakenDuringTrial pr c)
    (hAdjourned : TrialAdjournedUntilAppealResolved pr c)
    (hArgument : Section2339BMidTrialArgumentWithinFourDays pr c)
    (hDecision : Section2339BMidTrialDecisionWithinFourDays pr c) :
    Section2339BTimelyMidTrialInterlocutoryAppeal pr c :=
  ⟨hTaken, hOrder, hDuring, hAdjourned, hArgument, hDecision⟩




theorem section2339BPersonnelProsecutionBar_intro
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hTheory : ProsecutionRestsOnPersonnelTheory p pr c)
    (hNoDirection : ¬ PersonnelProvidedToWorkUnderDirectionOrControl p c) :
    Section2339BPersonnelProsecutionBar p pr c :=
  ⟨hTheory, hNoDirection⟩


theorem section2339BApprovedProvisionProsecutionBar_intro
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hTheory : ProsecutionRestsOnPersonnelTrainingOrExpertAdviceTheory p pr c)
    (hApproved : SecretaryOfStateApprovedWithAttorneyGeneralConcurrence p c) :
    Section2339BApprovedProvisionProsecutionBar p pr c :=
  ⟨hTheory, hApproved⟩


theorem section2339BProsecutionBarred_intro
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (h : Section2339BPersonnelProsecutionBar p pr c ∨
         Section2339BApprovedProvisionProsecutionBar p pr c ∨
         ApplicationWouldAbridgeFirstAmendmentRights p pr c) :
    Section2339BProsecutionBarred p pr c := h



theorem section2339BProsecutionBarred_of_firstAmendment
    {p : Person} {pr : Proceeding} {c : ComplaintText}
    (h : ApplicationWouldAbridgeFirstAmendmentRights p pr c) :
    Section2339BProsecutionBarred p pr c := Or.inr (Or.inr h)




theorem section2339SentenceWithinMaximum_intro
    {s : Sentence} {c : ComplaintText} (h : imprisonmentTermMonths s c ≤ 120) :
    Section2339SentenceWithinMaximum s c := h


theorem section2339ASentenceWithinMaximum_intro
    {o : Offense} {s : Sentence} {c : ComplaintText}
    (h : DeathOfPersonResultedFromOffense o c ∨ imprisonmentTermMonths s c ≤ 180) :
    Section2339ASentenceWithinMaximum o s c := h


theorem section2339ASentenceWithinMaximum_of_term
    {o : Offense} {s : Sentence} {c : ComplaintText}
    (h : imprisonmentTermMonths s c ≤ 180) :
    Section2339ASentenceWithinMaximum o s c := Or.inr h


theorem section2339BSentenceWithinMaximum_intro
    {o : Offense} {s : Sentence} {c : ComplaintText}
    (h : DeathOfPersonResultedFromOffense o c ∨ imprisonmentTermMonths s c ≤ 240) :
    Section2339BSentenceWithinMaximum o s c := h


theorem section2339BSentenceWithinMaximum_of_term
    {o : Offense} {s : Sentence} {c : ComplaintText}
    (h : imprisonmentTermMonths s c ≤ 240) :
    Section2339BSentenceWithinMaximum o s c := Or.inr h


theorem section2339CFinancingSentenceWithinMaximum_intro
    {s : Sentence} {c : ComplaintText} (h : imprisonmentTermMonths s c ≤ 240) :
    Section2339CFinancingSentenceWithinMaximum s c := h


theorem section2339CConcealmentSentenceWithinMaximum_intro
    {s : Sentence} {c : ComplaintText} (h : imprisonmentTermMonths s c ≤ 120) :
    Section2339CConcealmentSentenceWithinMaximum s c := h


theorem section2339DSentenceWithinStatutoryTerm_intro
    {s : Sentence} {c : ComplaintText} (h : imprisonmentTermMonths s c ≤ 120) :
    Section2339DSentenceWithinStatutoryTerm s c := h




theorem section2339CEntityLiability_intro
    {e : LegalEntity} {o : Offense} {c : ComplaintText}
    (hNexus : LegalEntityLocatedInOrOrganizedUnderUnitedStatesLaw e c)
    (hResponsible : PersonResponsibleForManagementOrControlCommittedOffense e o c)
    (hFloor : 10000 ≤ entityLiabilityAssessedDollars e c) :
    Section2339CEntityLiability e o c :=
  ⟨hNexus, hResponsible, hFloor⟩




theorem section2339DDesignationContemporaneousWithTraining_intro
    {p : Person} {org : Organization} {c : ComplaintText}
    (hTraining : TrainingReceivedFromOrOnBehalfOfOrganization p org c)
    (hDesignated : OrganizationDesignatedAtTimeOfTraining org c) :
    Section2339DDesignationContemporaneousWithTraining p org c :=
  ⟨hTraining, hDesignated⟩






theorem section2339BEnforcementReachable_intro
    {p : Person} {o : Offense} {pr : Proceeding} {inv : Investigation} {c : ComplaintText}
    {s : Sentence}
    (hConduct : ChargedConductOccurred p o c)
    (hJurisdiction : Section2339BJurisdictionEstablished p o c)
    (hInvestigation : AttorneyGeneralConductedInvestigation inv c)
    (hCommenced : ProsecutionCommenced p pr c)
    (hUnbarred : ¬ Section2339BProsecutionBarred p pr c)
    (hAdjudicated : ProceedingAdjudicated pr c)
    (hSentence : Section2339BSentenceWithinMaximum o s c) :
    Section2339BEnforcementReachable p o pr inv c Stage.PenaltyImposed :=
  .penalty
    (.adjudicated
      (.commenced
        (.investigation
          (.jurisdiction (.conduct hConduct) hJurisdiction)
          hInvestigation)
        hCommenced hUnbarred)
      hAdjudicated)
    s hSentence

end Proving.USC.T18.Ch113B.MaterialSupport.Procedure
