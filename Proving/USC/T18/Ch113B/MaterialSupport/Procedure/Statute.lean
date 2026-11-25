










import Proving.USC.T18.Ch113B.MaterialSupport.Procedure.Types
import Proving.USC.T18.Ch113B.MaterialSupport.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Procedure

open Proving.USC.Common





structure Transition where
  source : Stage
  target : Stage
  guard  : Prop


structure TransitionTaken (t : Transition) : Prop where
  guardSatisfied : t.guard






def Section2339VenueProper (o : Offense) (pr : Proceeding) (d : District) (c : ComplaintText) : Prop :=
  ProsecutionBroughtInDistrict pr d c ∧
    (UnderlyingOffenseCommittedInDistrict o d c ∨ DistrictProperAsProvidedByLaw pr d c)


def Section2339AVenueProper (o : Offense) (pr : Proceeding) (d : District) (c : ComplaintText) : Prop :=
  ProsecutionBroughtInDistrict pr d c ∧
    (UnderlyingOffenseCommittedInDistrict o d c ∨ DistrictProperAsProvidedByLaw pr d c)





def Section2339BJurisdictionEstablished (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  OffenderIsUnitedStatesNationalOrLawfulPermanentResident p c ∨
  OffenderIsStatelessPersonHabituallyResidentInUnitedStates p c ∨
  OffenderBroughtIntoOrFoundInUnitedStates p o c ∨
  OffenseOccursInWholeOrPartWithinUnitedStates o c ∨
  OffenseOccursInOrAffectsInterstateOrForeignCommerce o c ∨
  OffenderAidsAbetsOrConspiresWithPersonSubjectToJurisdiction p o c


def Section2339DJurisdictionEstablished (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  OffenderIsUnitedStatesNationalOrLawfulPermanentResident p c ∨
  OffenderIsStatelessPersonHabituallyResidentInUnitedStates p c ∨
  OffenderBroughtIntoOrFoundInUnitedStates p o c ∨
  OffenseOccursInWholeOrPartWithinUnitedStates o c ∨
  OffenseOccursInOrAffectsInterstateOrForeignCommerce o c ∨
  OffenderAidsAbetsOrConspiresWithPersonSubjectToJurisdiction p o c





def Section2339BExtraterritorialJurisdiction : Prop := True


def Section2339DExtraterritorialJurisdiction : Prop := True




def Section2339CJurisdictionEstablished (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  (OffenseTakesPlaceInUnitedStates o c ∧
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
  PredicateActDirectedToCompelUnitedStates o c



def Section2339CActualUseOfFundsNotRequired : Prop := True







def Section2339BFundsDutyDischarged
    (fi : FinancialInstitution) (f : Funds) (c : ComplaintText) : Prop :=
  SecretaryAuthorizedException fi f c ∨
    (FinancialInstitutionRetainedPossessionOrControl fi f c ∧
     FinancialInstitutionReportedFundsToSecretary fi f c)




structure Section2339BCivilPenaltyTrigger
    (fi : FinancialInstitution) (f : Funds) (c : ComplaintText) : Prop where

  aware : FinancialInstitutionAwareOfPossessionOrControlOfFunds fi f c


  ftoInterest : ForeignTerroristOrganizationOrAgentHasInterestInFunds f c

  notAuthorized : ¬ SecretaryAuthorizedException fi f c

  knowingFailure : FinancialInstitutionKnowinglyFailedToComply fi f c





noncomputable def section2339BCivilPenaltyDollars
    (fi : FinancialInstitution) (c : ComplaintText) : Nat :=
  max (50000 * violationCount fi c) (2 * dollarsRequiredToBeRetained fi c)


def Section2339BCivilPenaltyProperlyAssessed
    (fi : FinancialInstitution) (c : ComplaintText) : Prop :=
  civilPenaltyAssessedDollars fi c = section2339BCivilPenaltyDollars fi c






structure Section2339BInjunctiveActionProper
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where

  appearance : AppearsToSecretaryOrAttorneyGeneralThatViolationIsOccurringOrImminent p c

  initiated : AttorneyGeneralInitiatedCivilInjunctiveAction p pr c

  inDistrictCourt : ActionBroughtInDistrictCourtOfTheUnitedStates pr c






structure Section2339BInvestigationDutyDischarged
    (inv : Investigation) (c : ComplaintText) : Prop where

  investigated : AttorneyGeneralConductedInvestigation inv c

  coordinated : AttorneyGeneralCoordinatedWithSecretary inv c




structure Section2339BReferralDutyDischarged
    (inv : Investigation) (r : Referral) (c : ComplaintText) : Prop where

  evidenceArose : EvidenceOfCriminalViolationAroseInInvestigation inv c

  referredImmediately : EvidenceReferredImmediatelyToAttorneyGeneral r c

  notifiedTimely : AttorneyGeneralTimelyNotifiedSecretaryOfActionTaken r c






structure Section2339BProtectiveOrderGranted (pr : Proceeding) (c : ComplaintText) : Prop where

  exParteWritten : UnitedStatesMadeExParteWrittenRequest pr c

  sufficientShowing : CourtMadeSufficientShowingFinding pr c

  authorized : CourtAuthorizedRedactionSubstitutionOrStatement pr c

  sealed : ClassifiedDocumentsSealedAndPreserved pr c




structure Section2339BSubstitutionMandatory (pr : Proceeding) (c : ComplaintText) : Prop where

  petitioned : UnitedStatesMadeExParteWrittenRequest pr c

  sufficientForDefense : SubstituteSufficientToAllowDefendantToPrepareDefense pr c



def Section2339BQualifyingInterlocutoryOrder (pr : Proceeding) (c : ComplaintText) : Prop :=
  OrderAuthorizedDisclosureOfClassifiedInformation pr c ∨
  OrderImposedSanctionsForNondisclosure pr c ∨
  OrderRefusedProtectiveOrderSoughtByUnitedStates pr c



def Section2339BPretrialAppealWithinFourteenDays (pr : Proceeding) (c : ComplaintText) : Prop :=
  daysFromOrderToInterlocutoryAppeal pr c ≤ 14




def Section2339BMidTrialArgumentWithinFourDays (pr : Proceeding) (c : ComplaintText) : Prop :=
  countableDaysFromAdjournmentToAppellateArgument pr c ≤ 4



def Section2339BMidTrialDecisionWithinFourDays (pr : Proceeding) (c : ComplaintText) : Prop :=
  countableDaysFromArgumentToAppellateDecision pr c ≤ 4


structure Section2339BTimelyPretrialInterlocutoryAppeal
    (pr : Proceeding) (c : ComplaintText) : Prop where

  taken : InterlocutoryAppealTakenByUnitedStates pr c

  qualifyingOrder : Section2339BQualifyingInterlocutoryOrder pr c

  beforeTrial : AppealTakenBeforeTrial pr c

  withinWindow : Section2339BPretrialAppealWithinFourteenDays pr c


  trialHeld : TrialNotCommencedUntilAppealResolved pr c



structure Section2339BTimelyMidTrialInterlocutoryAppeal
    (pr : Proceeding) (c : ComplaintText) : Prop where

  taken : InterlocutoryAppealTakenByUnitedStates pr c

  qualifyingOrder : Section2339BQualifyingInterlocutoryOrder pr c

  duringTrial : AppealTakenDuringTrial pr c

  adjourned : TrialAdjournedUntilAppealResolved pr c

  argumentInWindow : Section2339BMidTrialArgumentWithinFourDays pr c

  decisionInWindow : Section2339BMidTrialDecisionWithinFourDays pr c





def Section2339BPersonnelProsecutionBar
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop :=
  ProsecutionRestsOnPersonnelTheory p pr c ∧
    ¬ PersonnelProvidedToWorkUnderDirectionOrControl p c




def Section2339BApprovedProvisionProsecutionBar
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop :=
  ProsecutionRestsOnPersonnelTrainingOrExpertAdviceTheory p pr c ∧
    SecretaryOfStateApprovedWithAttorneyGeneralConcurrence p c




def Section2339BProsecutionBarred (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Section2339BPersonnelProsecutionBar p pr c ∨
  Section2339BApprovedProvisionProsecutionBar p pr c ∨
  ApplicationWouldAbridgeFirstAmendmentRights p pr c




def Section2339SentenceWithinMaximum (s : Sentence) (c : ComplaintText) : Prop :=
  imprisonmentTermMonths s c ≤ 120



def Section2339ASentenceWithinMaximum (o : Offense) (s : Sentence) (c : ComplaintText) : Prop :=
  DeathOfPersonResultedFromOffense o c ∨ imprisonmentTermMonths s c ≤ 180



def Section2339BSentenceWithinMaximum (o : Offense) (s : Sentence) (c : ComplaintText) : Prop :=
  DeathOfPersonResultedFromOffense o c ∨ imprisonmentTermMonths s c ≤ 240


def Section2339CFinancingSentenceWithinMaximum (s : Sentence) (c : ComplaintText) : Prop :=
  imprisonmentTermMonths s c ≤ 240


def Section2339CConcealmentSentenceWithinMaximum (s : Sentence) (c : ComplaintText) : Prop :=
  imprisonmentTermMonths s c ≤ 120




def Section2339DSentenceWithinStatutoryTerm (s : Sentence) (c : ComplaintText) : Prop :=
  imprisonmentTermMonths s c ≤ 120







structure Section2339CEntityLiability
    (e : LegalEntity) (o : Offense) (c : ComplaintText) : Prop where

  entityNexus : LegalEntityLocatedInOrOrganizedUnderUnitedStatesLaw e c

  responsiblePerson : PersonResponsibleForManagementOrControlCommittedOffense e o c

  atLeastTenThousand : 10000 ≤ entityLiabilityAssessedDollars e c





structure Section2339DDesignationContemporaneousWithTraining
    (p : Person) (org : Organization) (c : ComplaintText) : Prop where

  trainingReceived : TrainingReceivedFromOrOnBehalfOfOrganization p org c

  designatedAtThatTime : OrganizationDesignatedAtTimeOfTraining org c




def transitionConductToJurisdiction2339B (p : Person) (o : Offense) (c : ComplaintText) : Transition :=
  { source := Stage.ConductOccurred
    target := Stage.JurisdictionEstablished
    guard  := Section2339BJurisdictionEstablished p o c }


def transitionJurisdictionToInvestigation2339B (inv : Investigation) (c : ComplaintText) : Transition :=
  { source := Stage.JurisdictionEstablished
    target := Stage.InvestigationOpened
    guard  := AttorneyGeneralConductedInvestigation inv c }


def transitionInvestigationToReferral2339B (r : Referral) (c : ComplaintText) : Transition :=
  { source := Stage.InvestigationOpened
    target := Stage.ReferredToAttorneyGeneral
    guard  := EvidenceReferredImmediatelyToAttorneyGeneral r c }



def transitionInvestigationToAction2339B
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Transition :=
  { source := Stage.InvestigationOpened
    target := Stage.ActionCommenced
    guard  := ProsecutionCommenced p pr c ∧ ¬ Section2339BProsecutionBarred p pr c }


def transitionActionToBarred2339B
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Transition :=
  { source := Stage.ActionCommenced
    target := Stage.Barred
    guard  := Section2339BProsecutionBarred p pr c }


def transitionActionToInterlocutoryAppeal2339B (pr : Proceeding) (c : ComplaintText) : Transition :=
  { source := Stage.ActionCommenced
    target := Stage.InterlocutoryAppealPending
    guard  := InterlocutoryAppealTakenByUnitedStates pr c ∧
              Section2339BQualifyingInterlocutoryOrder pr c }


def transitionActionToAdjudicated2339B (pr : Proceeding) (c : ComplaintText) : Transition :=
  { source := Stage.ActionCommenced
    target := Stage.Adjudicated
    guard  := ProceedingAdjudicated pr c }








inductive Section2339BEnforcementReachable
    (p : Person) (o : Offense) (pr : Proceeding) (inv : Investigation) (c : ComplaintText) :
    Stage → Prop where

  | conduct (h : ChargedConductOccurred p o c) :
      Section2339BEnforcementReachable p o pr inv c Stage.ConductOccurred

  | jurisdiction
      (prev : Section2339BEnforcementReachable p o pr inv c Stage.ConductOccurred)
      (h : Section2339BJurisdictionEstablished p o c) :
      Section2339BEnforcementReachable p o pr inv c Stage.JurisdictionEstablished

  | investigation
      (prev : Section2339BEnforcementReachable p o pr inv c Stage.JurisdictionEstablished)
      (h : AttorneyGeneralConductedInvestigation inv c) :
      Section2339BEnforcementReachable p o pr inv c Stage.InvestigationOpened

  | commenced
      (prev : Section2339BEnforcementReachable p o pr inv c Stage.InvestigationOpened)
      (h : ProsecutionCommenced p pr c)
      (hUnbarred : ¬ Section2339BProsecutionBarred p pr c) :
      Section2339BEnforcementReachable p o pr inv c Stage.ActionCommenced

  | barred
      (prev : Section2339BEnforcementReachable p o pr inv c Stage.InvestigationOpened)
      (h : Section2339BProsecutionBarred p pr c) :
      Section2339BEnforcementReachable p o pr inv c Stage.Barred

  | adjudicated
      (prev : Section2339BEnforcementReachable p o pr inv c Stage.ActionCommenced)
      (h : ProceedingAdjudicated pr c) :
      Section2339BEnforcementReachable p o pr inv c Stage.Adjudicated

  | penalty
      (prev : Section2339BEnforcementReachable p o pr inv c Stage.Adjudicated)
      (s : Sentence)
      (h : Section2339BSentenceWithinMaximum o s c) :
      Section2339BEnforcementReachable p o pr inv c Stage.PenaltyImposed

end Proving.USC.T18.Ch113B.MaterialSupport.Procedure
