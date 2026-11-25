












import Proving.USC.T21.Procedure.Types
import Proving.USC.T21.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T21.Procedure

open Proving.USC.Common






def priorFinalBeforeViolation (finalDay violationDay : Nat) : Prop :=
  finalDay < violationDay


def punishableByMoreThanOneYear (months : Nat) : Prop := 12 < months


def servedMoreThanTwelveMonths (months : Nat) : Prop := 12 < months



def withinFifteenYearLookback (releaseDay commenceDay : Nat) : Prop :=
  commenceDay ≤ releaseDay + 15 * 365



def supervisedReleaseFloorMet (floorYears termYears : Nat) : Prop :=
  floorYears ≤ termYears


def injunctionWithinTenYearCap (years : Nat) : Prop := years ≤ 10



def maintenanceTreatmentPeriod (days : Nat) : Prop := 21 < days



def detoxificationTreatmentPeriod (days : Nat) : Prop := days ≤ 180





structure FelonyDrugOffense (p : Person) (k : Conviction) (maxMonths : Nat)
    (c : ComplaintText) : Prop where
  drugRelated : PriorFelonyDrugConviction p k c
  punishable  : OffensePunishableByImprisonmentMonths k maxMonths c
  threshold   : punishableByMoreThanOneYear maxMonths




structure SeriousDrugFelonyStatus (p : Person) (k : Conviction) (o : Offense)
    (servedM releaseDay commenceDay : Nat) (c : ComplaintText) : Prop where
  described  : OffenseDescribedInSection924e2 k c
  served     : ServedImprisonmentMonths p k servedM c
  servedMin  : servedMoreThanTwelveMonths servedM
  released   : ReleasedFromImprisonmentOnDay p k releaseDay c
  commenced  : InstantOffenseCommencedOnDay p o commenceDay c
  lookback   : withinFifteenYearLookback releaseDay commenceDay






structure RecidivistEnhancementTrigger (p : Person) (o : Offense) (k : Conviction)
    (finalDay violationDay maxMonths : Nat) (c : ComplaintText) : Prop where
  violation : ViolationCommitted p o c
  onDay     : ViolationCommittedOnDay p o violationDay c
  prior     : FelonyDrugOffense p k maxMonths c
  finality  : ConvictionBecameFinalOnDay k finalDay c
  sequence  : priorFinalBeforeViolation finalDay violationDay




structure SupervisedReleaseCompliant (p : Person) (o : Offense) (s : Sentence)
    (floorYears termYears : Nat) (c : ComplaintText) : Prop where
  imposed  : SentenceImposed p o s c
  term     : SupervisedReleaseTermYears s termYears c
  floorMet : supervisedReleaseFloorMet floorYears termYears




structure ProbationBarApplies (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  convicted : ConvictedOfViolation p o c
  harm      : DeathOrSeriousInjuryResulted o c



structure ProbationBarBreached (p : Person) (o : Offense) (s : Sentence)
    (c : ComplaintText) : Prop where
  bar       : ProbationBarApplies p o c
  sentenced : SentenceImposed p o s c
  probation : PlacedOnProbationOrSentenceSuspended p s c





structure ChemicalInjunctionWithinCap (p : Person) (o : Offense) (years : Nat)
    (c : ComplaintText) : Prop where
  conviction : FelonyListedChemicalConviction p o c
  enjoined   : EnjoinedFromListedChemicalTransactionsForYears p years c
  cap        : injunctionWithinTenYearCap years




structure TimelyChemicalRemediation (p : Person) (c : ComplaintText) : Prop where
  knowledge : KnowledgeOfRecordkeepingNoncomplianceAcquired p c
  remedied  : ImmediateRemedialStepsTaken p c



structure AuthorizedInternetDispensing (p : Person) (o : Offense)
    (c : ComplaintText) : Prop where
  dispensed  : DispensedControlledSubstanceByInternet p o c
  registered : ValidlyRegisteredWithInternetModification p c






structure AttemptConspiracyPenaltyParity (p : Person) (o : Offense)
    (c : ComplaintText) : Prop where
  inchoate      : AttemptsOrConspiresToCommit p o c
  objectDefined : OffenseDefinedInSubchapter o c





structure MaintenanceTreatmentWindow (p : Person) (days : Nat)
    (c : ComplaintText) : Prop where
  dispensed : NarcoticDispensedForTreatmentDays p days c
  window    : maintenanceTreatmentPeriod days



structure DetoxificationTreatmentWindow (p : Person) (days : Nat)
    (c : ComplaintText) : Prop where
  dispensed : NarcoticDispensedForTreatmentDays p days c
  window    : detoxificationTreatmentPeriod days





inductive Reaches (p : Person) (o : Offense) (c : ComplaintText) : Stage → Prop
  | violated (hV : ViolationCommitted p o c) :
      Reaches p o c .violated
  | convicted (prev : Reaches p o c .violated)
      (hK : ConvictedOfViolation p o c) :
      Reaches p o c .convicted
  | sentenced (s : Sentence) (prev : Reaches p o c .convicted)
      (hS : SentenceImposed p o s c) :
      Reaches p o c .sentenced

end Proving.USC.T21.Procedure
