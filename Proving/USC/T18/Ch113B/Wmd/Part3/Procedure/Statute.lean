









import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Procedure.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Procedure

open Proving.USC.Common







inductive Jurisdiction2332a (p : Person) (c : ComplaintText) : Prop where

  | viaSubsectionA (b : Base2332a) (h : Base2332aEstablished b p c)
      : Jurisdiction2332a p c

  | viaSubsectionB (hNational : IsNationalOfTheUnitedStates p c)
      (h : Base2332aEstablished Base2332a.nationalUsingAbroad p c)
      : Jurisdiction2332a p c



structure ProsecutionGrounded2332a (p : Person) (c : ComplaintText) : Prop where
  conduct      : Conduct2332aAlleged p c
  jurisdiction : Jurisdiction2332a p c



structure DeathResultPenaltyTriggered2332a (p : Person) (c : ComplaintText) : Prop where
  grounded : ProsecutionGrounded2332a p c
  death    : DeathResulted p c





inductive Offense2332bAlleged (p : Person) (c : ComplaintText) : Prop where
  | substantive (h : Conduct2332bAlleged p c) : Offense2332bAlleged p c
  | inchoate (h : Inchoate2332bAlleged p c) : Offense2332bAlleged p c




def CircumstanceAsToSomeOffender (d : Person) (c : ComplaintText) : Prop :=
  ∃ (o : Person) (x : Circumstance2332b),
    CoOffenderInSameOffense o d c ∧ Circumstance2332bPresentAsTo x o c




structure Jurisdiction2332b (d : Person) (c : ComplaintText) : Prop where
  coveredRole  : ∃ r : OffenderRole, HasRole r d c
  circumstance : CircumstanceAsToSomeOffender d c




inductive ExtraterritorialJurisdiction2332b (d : Person) (c : ComplaintText) : Prop where

  | overSubsectionAOffense (h : Offense2332bAlleged d c)
      : ExtraterritorialJurisdiction2332b d c

  | overAccessoryAfterTheFact (h : HasRole OffenderRole.accessoryAfterTheFact d c)
      : ExtraterritorialJurisdiction2332b d c





structure ProsecutionGrounded2332b (d : Person) (c : ComplaintText) : Prop where
  offense      : Offense2332bAlleged d c
  transcends   : ConductTranscendsNationalBoundaries d c
  unlawful     : ViolatesStateOrFederalLaw d c
  jurisdiction : Jurisdiction2332b d c





structure SeriousBodilyInjuryGravamen2332b (p : Person) (c : ComplaintText) : Prop where
  offense : Offense2332bAlleged p c
  injury  : SeriousBodilyInjuryAsDefined p c







def AdoptedStateLawPredicateMet (d : Person) (c : ComplaintText) : Prop :=
  StateLawElementsSatisfied d c







structure FederalCrimeOfTerrorism (p : Person) (c : ComplaintText) : Prop where
  calculated : CalculatedToInfluenceOrRetaliateAgainstGovernment p c
  enumerated : ViolatesEnumeratedTerrorismOffense p c




inductive AttorneyGeneralPrimaryInvestigativeResponsibility
    (p : Person) (c : ComplaintText) : Prop where
  | viaFederalCrimeOfTerrorism (h : FederalCrimeOfTerrorism p c)
      : AttorneyGeneralPrimaryInvestigativeResponsibility p c
  | viaEnumeratedOffense (x : EnumeratedInvestigativeOffense)
      (h : ChargedUnderEnumeratedInvestigativeOffense x p c)
      : AttorneyGeneralPrimaryInvestigativeResponsibility p c




def TreasuryAssistanceDue (p : Person) (c : ComplaintText) : Prop :=
  AttorneyGeneralPrimaryInvestigativeResponsibility p c ∧
    AttorneyGeneralRequestedTreasuryAssistance c








def statutoryMaximumYears : ConductClass → Option Nat
  | .killingOrDeathResulting => none
  | .kidnapping => none
  | .maiming => some 35
  | .assaultWithDangerousWeaponOrSeriousBodilyInjury => some 30
  | .destructionOfProperty => some 25
  | .threat => some 10
  | .attemptOrConspiracy t => statutoryMaximumYears t





def WithinStatutoryMaximum (s : SentencingRecord) (c : ComplaintText) : Prop :=
  ∀ cap : Nat,
    statutoryMaximumYears (chargedConductClass s c) = some cap →
      imposedTermYears s c ≤ cap




def RunsConsecutively (s : SentencingRecord) (c : ComplaintText) : Prop :=
  otherTermsEndDay s c ≤ sectionTermStartDay s c




def ConcurrencyBarSatisfied (s : SentencingRecord) (c : ComplaintText) : Prop :=
  AnotherTermOfImprisonmentExists s c → RunsConsecutively s c




structure SentencingCompliant2332b (s : SentencingRecord) (c : ComplaintText) : Prop where
  noProbation   : ¬ ProbationImposed s c
  consecutive   : ConcurrencyBarSatisfied s c
  withinMaximum : WithinStatutoryMaximum s c




def jurisdictionStep2332a (p : Person) (c : ComplaintText) : Transition :=
  { source := State.conductAlleged
    target := State.jurisdictionEstablished
    guard  := Jurisdiction2332a p c }


def prosecutionStep2332a (p : Person) (c : ComplaintText) : Transition :=
  { source := State.jurisdictionEstablished
    target := State.prosecutionCommenced
    guard  := ProsecutionGrounded2332a p c }


def jurisdictionStep2332b (d : Person) (c : ComplaintText) : Transition :=
  { source := State.conductAlleged
    target := State.jurisdictionEstablished
    guard  := Jurisdiction2332b d c }


def investigationStep2332b (d : Person) (c : ComplaintText) : Transition :=
  { source := State.jurisdictionEstablished
    target := State.investigationOpened
    guard  := AttorneyGeneralPrimaryInvestigativeResponsibility d c }


def prosecutionStep2332b (d : Person) (c : ComplaintText) : Transition :=
  { source := State.investigationOpened
    target := State.prosecutionCommenced
    guard  := ProsecutionGrounded2332b d c }



def adjudicationStep2332b (d : Person) (c : ComplaintText) : Transition :=
  { source := State.prosecutionCommenced
    target := State.adjudicated
    guard  := ProsecutionGrounded2332b d c }



def sentencingStep2332b (s : SentencingRecord) (c : ComplaintText) : Transition :=
  { source := State.adjudicated
    target := State.sentenced
    guard  := SentencingCompliant2332b s c }




inductive Reachable (c : ComplaintText) : State → Prop where
  | initial : Reachable c State.conductAlleged
  | step {s t : State} (tr : Transition)
      (hsrc : tr.source = s) (htgt : tr.target = t)
      (hguard : tr.guard) (hprev : Reachable c s) : Reachable c t

end Proving.USC.T18.Ch113B.Wmd.Part3.Procedure
