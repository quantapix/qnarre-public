







import Proving.USC.T18.Ch13.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch13.Reslice.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Procedure

open Proving.USC.Common










def sevenYearsInDays : Nat := 7 * 365


noncomputable def daysFromOffenseToChargingInstrument (o : Offense) (t : ComplaintText) : Nat :=
  chargingInstrumentDay o t - offenseCommittedDay o t




def WithinSevenYearLimitation (o : Offense) (t : ComplaintText) : Prop :=
  daysFromOffenseToChargingInstrument o t ≤ sevenYearsInDays

noncomputable instance instDecidableWithinSevenYearLimitation (o : Offense) (t : ComplaintText) :
    Decidable (WithinSevenYearLimitation o t) :=
  Nat.decLe _ _




def Section247LimitationBar (o : Offense) (t : ComplaintText) : Prop :=
  NoncapitalOffenseCharged o t ∧ ¬ WithinSevenYearLimitation o t


def propertyDamageThresholdDollars : Nat := 5000


def PropertyDamageExceedsStatutoryThreshold (o : Offense) (t : ComplaintText) : Prop :=
  propertyDamageThresholdDollars < propertyDamageAmountDollars o t

noncomputable instance instDecidablePropertyDamageExceedsStatutoryThreshold
    (o : Offense) (t : ComplaintText) :
    Decidable (PropertyDamageExceedsStatutoryThreshold o t) :=
  Nat.decLt _ _


def IsFirstOffenseUnderSection248 (o : Offense) (t : ComplaintText) : Prop :=
  priorConvictionsUnderSectionBeforeOffense o t = 0

noncomputable instance instDecidableIsFirstOffenseUnderSection248 (o : Offense) (t : ComplaintText) :
    Decidable (IsFirstOffenseUnderSection248 o t) :=
  Nat.decEq _ _



def IsSubsequentOffenseUnderSection248 (o : Offense) (t : ComplaintText) : Prop :=
  1 ≤ priorConvictionsUnderSectionBeforeOffense o t

noncomputable instance instDecidableIsSubsequentOffenseUnderSection248 (o : Offense) (t : ComplaintText) :
    Decidable (IsSubsequentOffenseUnderSection248 o t) :=
  Nat.decLe _ _


def statutoryDamagesPerViolationDollars : Nat := 5000



noncomputable def statutoryDamagesAwardDollars (a : CivilAction) (t : ComplaintText) : Nat :=
  statutoryDamagesPerViolationDollars * violationCount a t



def ElectionBeforeFinalJudgment (a : CivilAction) (t : ComplaintText) : Prop :=
  statutoryDamagesElectionDay a t < finalJudgmentRenderedDay a t

noncomputable instance instDecidableElectionBeforeFinalJudgment (a : CivilAction) (t : ComplaintText) :
    Decidable (ElectionBeforeFinalJudgment a t) :=
  Nat.decLt _ _








def section245PenaltyTier
    (deathOrKidnappingOrSexualAbuse bodilyInjuryOrInstrumentality : Bool) :
    Section245PenaltyTier :=
  if deathOrKidnappingOrSexualAbuse then
    .DeathOrKidnappingOrSexualAbuseOrAttemptToKill
  else if bodilyInjuryOrInstrumentality then
    .BodilyInjuryOrDangerousInstrumentality
  else
    .Base



def section245MaximumImprisonmentMonths : Section245PenaltyTier → Option Nat
  | .Base => some 12
  | .BodilyInjuryOrDangerousInstrumentality => some 120
  | .DeathOrKidnappingOrSexualAbuseOrAttemptToKill => none



def section245TierIsCapitalEligible : Section245PenaltyTier → Bool
  | .Base => false
  | .BodilyInjuryOrDangerousInstrumentality => false
  | .DeathOrKidnappingOrSexualAbuseOrAttemptToKill => true




def section247PenaltyTier
    (deathOrKidnappingOrSexualAbuse bodilyInjury byFireOrExplosive
      dangerousInstrumentality propertyDamageOverThreshold : Bool) :
    Section247PenaltyTier :=
  if deathOrKidnappingOrSexualAbuse then
    .DeathOrKidnappingOrSexualAbuseOrAttemptToKill
  else if bodilyInjury && byFireOrExplosive then
    .BodilyInjuryByFireOrExplosive
  else if bodilyInjury || dangerousInstrumentality then
    .BodilyInjuryOrDangerousInstrumentality
  else if propertyDamageOverThreshold then
    .PropertyDamageOverThreshold
  else
    .Residual




def section247MaximumImprisonmentMonths : Section247PenaltyTier → Option Nat
  | .DeathOrKidnappingOrSexualAbuseOrAttemptToKill => none
  | .BodilyInjuryByFireOrExplosive => some 480
  | .BodilyInjuryOrDangerousInstrumentality => some 240
  | .PropertyDamageOverThreshold => some 36
  | .Residual => some 12


def section248PenaltyTier
    (death bodilyInjury nonviolentObstruction subsequent : Bool) :
    Section248PenaltyTier :=
  if death then .Death
  else if bodilyInjury then .BodilyInjury
  else if nonviolentObstruction then
    (if subsequent then .NonviolentObstructionSubsequent else .NonviolentObstructionFirst)
  else
    (if subsequent then .Subsequent else .First)


def section248MaximumImprisonmentMonths : Section248PenaltyTier → Option Nat
  | .NonviolentObstructionFirst => some 6
  | .NonviolentObstructionSubsequent => some 18
  | .First => some 12
  | .Subsequent => some 36
  | .BodilyInjury => some 120
  | .Death => none





def section248FineCapDollars : Section248PenaltyTier → Option Nat
  | .NonviolentObstructionFirst => some 10000
  | .NonviolentObstructionSubsequent => some 25000
  | .First => none
  | .Subsequent => none
  | .BodilyInjury => none
  | .Death => none




def civilPenaltyCapDollars (nonviolentObstruction subsequentViolation : Bool) : Nat :=
  match nonviolentObstruction, subsequentViolation with
  | true,  false => 10000
  | false, false => 15000
  | true,  true  => 15000
  | false, true  => 25000





structure Section245CertificationPrerequisite
    (k : Certification) (o : Offense) (t : ComplaintText) : Prop where
  inWriting : CertificationInWritingExecuted k t
  byDesignatedOfficial : CertifierIsSection245DesignatedOfficial k t
  publicInterestJudgment : CertificationJudgmentPublicInterestAndSubstantialJustice k t
  coversOffense : CertificationCoversOffense k o t
  notDelegated : ¬ CertificationFunctionDelegated k t



structure Section247CertificationPrerequisite
    (k : Certification) (o : Offense) (t : ComplaintText) : Prop where
  inWriting : CertificationInWritingExecuted k t
  byAttorneyGeneralOrDesignee : CertifierIsAttorneyGeneralOrDesignee k t
  publicInterestJudgment : CertificationJudgmentPublicInterestAndSubstantialJustice k t
  coversOffense : CertificationCoversOffense k o t



structure Section245ProsecutionAuthorized
    (k : Certification) (o : Offense) (t : ComplaintText) : Prop where
  charged : Section245OffenseCharged o t
  undertaken : FederalProsecutionUndertaken o t
  certified : Section245CertificationPrerequisite k o t





def Section245UncertifiedProsecutionDefect (o : Offense) (t : ComplaintText) : Prop :=
  Section245OffenseCharged o t ∧ FederalProsecutionUndertaken o t ∧
    ∀ k : Certification, ¬ Section245CertificationPrerequisite k o t




def InvestigationAuthorizedWithoutCertification (o : Offense) (t : ComplaintText) : Prop :=
  FederalInvestigationConducted o t ∧ ¬ FederalProsecutionUndertaken o t






def Section245ViolationAttributable
    (p : Person) (o : Offense) (t : ComplaintText) : Prop :=
  Section245OffenseCharged o t ∧
    ¬ (ActorIsLawEnforcementOfficer p t ∧ LawEnforcementOfficerLawfullyCarryingOutDuties p t)





structure Section247ProsecutionTimely (o : Offense) (t : ComplaintText) : Prop where
  charged : Section247OffenseCharged o t
  commerceNexus : OffenseInOrAffectingInterstateCommerce o t
  instrumentInstituted : ChargingInstrumentInstituted o t
  noncapital : NoncapitalOffenseCharged o t
  withinLimitation : WithinSevenYearLimitation o t



structure Section247ProsecutionAuthorized
    (k : Certification) (o : Offense) (t : ComplaintText) : Prop where
  timely : Section247ProsecutionTimely o t
  certified : Section247CertificationPrerequisite k o t







def Section248SanctionsAvailable
    (p : Person) (o : Offense) (t : ComplaintText) : Prop :=
  Section248OffenseCharged o t ∧
    ¬ ParentOrGuardianActingExclusivelyTowardOwnMinor p t ∧
    ¬ ExpressiveConductProtectedByFirstAmendment p t



structure Section248PrivateActionReproductiveHealth
    (p : Person) (a : CivilAction) (t : ComplaintText) : Prop where
  aggrieved : PersonAggrievedByProhibitedConduct p t
  commenced : CivilActionCommenced a t
  predicateSubsection : ClaimPredicatedOnReproductiveHealthServicesInterference a t
  standing : PlaintiffInvolvedWithReproductiveHealthServicesAtFacility p t




inductive Section248ReligiousFreedomStanding (p : Person) (t : ComplaintText) : Prop where
  | worshipper : PlaintiffExercisingReligiousFreedomAtPlaceOfWorship p t →
      Section248ReligiousFreedomStanding p t
  | owner : PlaintiffOwnsOrOperatesPlaceOfReligiousWorship p t →
      Section248ReligiousFreedomStanding p t



structure Section248PrivateActionReligiousFreedom
    (p : Person) (a : CivilAction) (t : ComplaintText) : Prop where
  aggrieved : PersonAggrievedByProhibitedConduct p t
  commenced : CivilActionCommenced a t
  predicateSubsection : ClaimPredicatedOnReligiousFreedomInterference a t
  standing : Section248ReligiousFreedomStanding p t





structure Section248PrivateActionPropertyDamage
    (p : Person) (a : CivilAction) (t : ComplaintText) : Prop where
  aggrieved : PersonAggrievedByProhibitedConduct p t
  commenced : CivilActionCommenced a t
  predicateSubsection : ClaimPredicatedOnPropertyDamage a t



inductive Section248PrivateAction (p : Person) (a : CivilAction) (t : ComplaintText) : Prop where
  | reproductiveHealth : Section248PrivateActionReproductiveHealth p a t →
      Section248PrivateAction p a t
  | religiousFreedom : Section248PrivateActionReligiousFreedom p a t →
      Section248PrivateAction p a t
  | propertyDamage : Section248PrivateActionPropertyDamage p a t →
      Section248PrivateAction p a t



structure Section248AttorneyGeneralAction
    (p : Person) (a : CivilAction) (t : ComplaintText) : Prop where
  isAttorneyGeneral : PlaintiffIsUnitedStatesAttorneyGeneral p t
  reasonableCause : ReasonableCauseToBelievePersonsInjuredByViolation p t
  commenced : CivilActionCommenced a t
  venue : ActionCommencedInUnitedStatesDistrictCourt a t



structure Section248StateAttorneyGeneralAction
    (p : Person) (a : CivilAction) (t : ComplaintText) : Prop where
  isStateAttorneyGeneral : PlaintiffIsStateAttorneyGeneral p t
  reasonableCause : ReasonableCauseToBelievePersonsInjuredByViolation p t
  commenced : CivilActionCommenced a t
  parensPatriae : ActionBroughtAsParensPatriaeForStateResidents a t
  venue : ActionCommencedInUnitedStatesDistrictCourt a t


inductive Section248CivilEnforcement
    (p : Person) (a : CivilAction) (t : ComplaintText) : Prop where
  | private' : Section248PrivateAction p a t → Section248CivilEnforcement p a t
  | unitedStates : Section248AttorneyGeneralAction p a t → Section248CivilEnforcement p a t
  | state : Section248StateAttorneyGeneralAction p a t → Section248CivilEnforcement p a t



structure Section248TimelyStatutoryDamagesElection
    (a : CivilAction) (t : ComplaintText) : Prop where
  elected : StatutoryDamagesElected a t
  beforeFinalJudgment : ElectionBeforeFinalJudgment a t




structure ConcurrentRemediesPreserved (o : Offense) (t : ComplaintText) : Prop where
  stateJurisdictionSurvives : StateWouldHaveJurisdictionAbsentSection o t
  stateOrLocalRemedyAvailable : StateOrLocalPenaltyOrRemedyAvailable o t




def section245CertificationTransition
    (k : Certification) (o : Offense) (t : ComplaintText) :
    GuardedTransition CriminalStage :=
  { source := .Investigated
    target := .Certified
    guard := Section245CertificationPrerequisite k o t }


def section247CertificationTransition
    (k : Certification) (o : Offense) (t : ComplaintText) :
    GuardedTransition CriminalStage :=
  { source := .Investigated
    target := .Certified
    guard := Section247CertificationPrerequisite k o t }


def chargingTransition (o : Offense) (t : ComplaintText) :
    GuardedTransition CriminalStage :=
  { source := .Certified
    target := .Charged
    guard := ChargingInstrumentInstituted o t }


def limitationBarTransition (o : Offense) (t : ComplaintText) :
    GuardedTransition CriminalStage :=
  { source := .Certified
    target := .TimeBarred
    guard := Section247LimitationBar o t }



def reliefTransition (a : CivilAction) (t : ComplaintText) :
    GuardedTransition CivilStage :=
  { source := .Filed
    target := .ReliefAwarded
    guard := ActionCommencedInUnitedStatesDistrictCourt a t }



inductive CriminalReachable
    (k : Certification) (o : Offense) (t : ComplaintText) : CriminalStage → Prop where
  | investigated :
      FederalInvestigationConducted o t → CriminalReachable k o t .Investigated
  | certified245 :
      CriminalReachable k o t .Investigated →
      Section245CertificationPrerequisite k o t →
      CriminalReachable k o t .Certified
  | certified247 :
      CriminalReachable k o t .Investigated →
      Section247CertificationPrerequisite k o t →
      CriminalReachable k o t .Certified
  | charged :
      CriminalReachable k o t .Certified →
      ChargingInstrumentInstituted o t →
      CriminalReachable k o t .Charged
  | timeBarred :
      CriminalReachable k o t .Certified →
      Section247LimitationBar o t →
      CriminalReachable k o t .TimeBarred
  | adjudicated :
      CriminalReachable k o t .Charged →
      ¬ Section247LimitationBar o t →
      CriminalReachable k o t .Adjudicated


inductive CivilReachable
    (p : Person) (a : CivilAction) (t : ComplaintText) : CivilStage → Prop where
  | aggrieved :
      PersonAggrievedByProhibitedConduct p t → CivilReachable p a t .Injured
  | enforcerCause :
      ReasonableCauseToBelievePersonsInjuredByViolation p t →
      CivilReachable p a t .Injured
  | filed :
      CivilReachable p a t .Injured →
      Section248CivilEnforcement p a t →
      CivilReachable p a t .Filed
  | reliefAwarded :
      CivilReachable p a t .Filed →
      ActionCommencedInUnitedStatesDistrictCourt a t →
      CivilReachable p a t .ReliefAwarded
  | finalJudgment :
      CivilReachable p a t .ReliefAwarded → CivilReachable p a t .FinalJudgment

end Proving.USC.T18.Ch13.Reslice.Procedure
