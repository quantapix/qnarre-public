















import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Procedure.Types
import Proving.USC.T18.Ch113B.Wmd.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Procedure

open Proving.USC.Common





inductive Section2332aCommerceHook (d : Person) (c : ComplaintText) : Prop

  | mailOrFacility : MailOrInterstateFacilityUsedInFurtherance d c →
      Section2332aCommerceHook d c

  | propertyInCommerce : PropertyUsedInOrAffectingInterstateCommerce d c →
      Section2332aCommerceHook d c

  | perpetratorTravel : PerpetratorTraveledInInterstateCommerce d c →
      Section2332aCommerceHook d c

  | offenseAffectsCommerce : OffenseAffectedInterstateCommerce d c →
      Section2332aCommerceHook d c



inductive Section2332aJurisdictionalBasis (d : Person) (c : ComplaintText) : Prop

  | nationalAbroad : VictimIsUnitedStatesNationalAbroad d c →
      Section2332aJurisdictionalBasis d c

  | withinUnitedStates : TargetWithinUnitedStates d c →
      Section2332aCommerceHook d c → Section2332aJurisdictionalBasis d c

  | unitedStatesProperty : TargetIsUnitedStatesOwnedOrUsedProperty d c →
      Section2332aJurisdictionalBasis d c

  | foreignGovernmentProperty : TargetIsForeignGovernmentPropertyWithinUnitedStates d c →
      Section2332aJurisdictionalBasis d c



structure Section2332aNationalAbroadBasis (d : Person) (c : ComplaintText) : Prop where

  defendantIsNational : DefendantIsNationalOfUnitedStates d c

  conductAbroad : ConductOccurredOutsideUnitedStates d c


inductive Section2332aProsecutionBasis (d : Person) (c : ComplaintText) : Prop

  | subsectionA : Section2332aJurisdictionalBasis d c → Section2332aProsecutionBasis d c

  | subsectionB : Section2332aNationalAbroadBasis d c → Section2332aProsecutionBasis d c





structure Section2332aChargeable (d : Person) (c : ComplaintText) : Prop where

  withoutLawfulAuthority : ActedWithoutLawfulAuthority d c

  basis : Section2332aProsecutionBasis d c



structure Section2332aCapitalExposure (d : Person) (c : ComplaintText) : Prop where

  chargeable : Section2332aChargeable d c

  deathResulted : DeathResultedFromOffense d c





inductive Section2332bCircumstance (d : Person) (c : ComplaintText) : Prop

  | mailOrFacility : MailOrInterstateFacilityUsedInFurtherance d c →
      Section2332bCircumstance d c

  | commerceObstruction : OffenseObstructedDelayedOrAffectedInterstateCommerce d c →
      Section2332bCircumstance d c


  | federalVictim : VictimIsUnitedStatesGovernmentOrFederalOfficial d c →
      Section2332bCircumstance d c

  | federalProperty : PropertyOwnedPossessedOrLeasedToUnitedStates d c →
      Section2332bCircumstance d c

  | territorialSea : OffenseCommittedInTerritorialSea d c →
      Section2332bCircumstance d c

  | specialMaritimeAndTerritorialJurisdiction :
      OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction d c →
      Section2332bCircumstance d c





structure Section2332bOffenseConduct (d : Person) (c : ComplaintText) : Prop where

  transcendsNationalBoundaries : ConductTranscendedNationalBoundaries d c

  circumstance : Section2332bCircumstance d c


  violatesStateOrFederalLaw : ConductViolatedStateOrFederalLaw d c




structure Section2332bJurisdictionOverDefendant
    (d : Person) (c : ComplaintText) : Prop where

  role : DefendantIsPrincipalCoconspiratorOrAccessoryAfterTheFact d c

  circumstanceOnSomeOffender : CircumstanceAppliesToAtLeastOneOffender d c


inductive Section2332bExtraterritorialJurisdiction
    (d : Person) (c : ComplaintText) : Prop


  | offenseUnderSubsectionA : Section2332bOffenseConduct d c →
      Section2332bExtraterritorialJurisdiction d c


  | accessoryAfterTheFact : ConductWasAccessoryAfterTheFactUnderSection3 d c →
      Section2332bExtraterritorialJurisdiction d c



structure Section2332bStateLawAdoption (d : Person) (c : ComplaintText) : Prop where

  basedOnStateLaw : OffenseBasedOnAdoptionOfStateLaw d c


  elementsOnly : OnlyStateLawElementsApplied d c





structure Section2332bProsecutionBurden
    (d : Person) (i : ChargingInstrument) (c : ComplaintText) : Prop where

  jurisdictionAlleged : JurisdictionalBaseAllegedInIndictment i c

  jurisdictionOverDefendant : Section2332bJurisdictionOverDefendant d c

  conduct : Section2332bOffenseConduct d c










def maximumTermYears : ConductClass → Option Nat
  | .killingOrDeathResulting => none
  | .kidnapping => none
  | .maiming => some 35
  | .assaultDangerousWeaponOrSeriousBodilyInjury => some 30
  | .destructionOfProperty => some 25
  | .attemptOrConspiracy completed => maximumTermYears completed
  | .threat => some 10


def sentenceWithinMaximum (cls : ConductClass) (imposedYears : Nat) : Bool :=
  match maximumTermYears cls with
  | none => true
  | some cap => decide (imposedYears ≤ cap)




def SentenceWithinStatutoryMaximum (cls : ConductClass) (imposedYears : Nat) : Prop :=
  sentenceWithinMaximum cls imposedYears = true

instance (cls : ConductClass) (n : Nat) :
    Decidable (SentenceWithinStatutoryMaximum cls n) :=
  inferInstanceAs (Decidable (sentenceWithinMaximum cls n = true))









structure Section2332bConformingSentence
    (d : Person) (i : ChargingInstrument) (c : ComplaintText) : Prop where

  convicted : Section2332bProsecutionBurden d i c

  withinMaximum :
    SentenceWithinStatutoryMaximum (convictedConductClass d c)
      (termOfImprisonmentYearsImposed d c)


  noProbation : ¬ ProbationImposed d c


  notConcurrent : ¬ TermRunsConcurrentlyWithAnotherTerm d c





structure FederalCrimeOfTerrorism (d : Person) (c : ComplaintText) : Prop where


  motive : CalculatedToInfluenceGovernmentConduct d c

  enumeratedViolation : ViolatesEnumeratedTerrorismOffense d c



inductive AttorneyGeneralPrimaryInvestigativeResponsibility
    (d : Person) (c : ComplaintText) : Prop

  | federalCrimeOfTerrorism : FederalCrimeOfTerrorism d c →
      AttorneyGeneralPrimaryInvestigativeResponsibility d c

  | enumeratedSection : ViolatesSection2332bEnumeratedInvestigativeOffense d c →
      AttorneyGeneralPrimaryInvestigativeResponsibility d c



structure TreasuryAssistanceDuty (d : Person) (c : ComplaintText) : Prop where

  attorneyGeneralResponsible : AttorneyGeneralPrimaryInvestigativeResponsibility d c

  requested : AttorneyGeneralRequestedTreasuryAssistance d c




structure Transition where

  fromStage : ProceedingStage

  toStage : ProceedingStage

  guard : Prop




def stepChargeable2332a (d : Person) (c : ComplaintText) : Transition :=
  { fromStage := .conductCompleted, toStage := .charged,
    guard := Section2332aChargeable d c }


def stepJurisdiction2332b (d : Person) (c : ComplaintText) : Transition :=
  { fromStage := .conductCompleted, toStage := .jurisdictionEstablished,
    guard := Section2332bOffenseConduct d c }


def stepInvestigation2332b (d : Person) (c : ComplaintText) : Transition :=
  { fromStage := .jurisdictionEstablished, toStage := .investigationOpened,
    guard := AttorneyGeneralPrimaryInvestigativeResponsibility d c }


def stepCharge2332b (d : Person) (c : ComplaintText) : Transition :=
  { fromStage := .investigationOpened, toStage := .charged,
    guard := Section2332bJurisdictionOverDefendant d c }


def stepConviction2332b
    (d : Person) (i : ChargingInstrument) (c : ComplaintText) : Transition :=
  { fromStage := .charged, toStage := .convicted,
    guard := Section2332bProsecutionBurden d i c }


def stepSentencing2332b
    (d : Person) (i : ChargingInstrument) (c : ComplaintText) : Transition :=
  { fromStage := .convicted, toStage := .sentenced,
    guard := Section2332bConformingSentence d i c }



inductive DeclaredTransition
    (d : Person) (i : ChargingInstrument) (c : ComplaintText) : Transition → Prop
  | chargeable2332a : DeclaredTransition d i c (stepChargeable2332a d c)
  | jurisdiction2332b : DeclaredTransition d i c (stepJurisdiction2332b d c)
  | investigation2332b : DeclaredTransition d i c (stepInvestigation2332b d c)
  | charge2332b : DeclaredTransition d i c (stepCharge2332b d c)
  | conviction2332b : DeclaredTransition d i c (stepConviction2332b d i c)
  | sentencing2332b : DeclaredTransition d i c (stepSentencing2332b d i c)



inductive Reachable (d : Person) (i : ChargingInstrument) (c : ComplaintText) :
    ProceedingStage → Prop

  | start : Reachable d i c .conductCompleted

  | step {t : Transition} (hDeclared : DeclaredTransition d i c t)
      (hFrom : Reachable d i c t.fromStage) (hGuard : t.guard) :
      Reachable d i c t.toStage


def Section2332bSentenceReachable
    (d : Person) (i : ChargingInstrument) (c : ComplaintText) : Prop :=
  Reachable d i c .sentenced


def Section2332aChargeReachable
    (d : Person) (i : ChargingInstrument) (c : ComplaintText) : Prop :=
  Reachable d i c .charged

end Proving.USC.T18.Ch113B.Wmd.Procedure
