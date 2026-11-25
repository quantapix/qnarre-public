







import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Deontic.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Deontic

open Proving.USC.Common






inductive Wmd2332aCommerceNexus (p : Person) (pr : Property) (c : ComplaintText) : Prop where

  | mailOrFacility :
      MailOrFacilityOfInterstateCommerceUsedInFurtherance p c → Wmd2332aCommerceNexus p pr c

  | propertyInCommerce :
      IsRealOrPersonalProperty pr c →
      PropertyUsedInOrAffectingInterstateCommerce pr c → Wmd2332aCommerceNexus p pr c

  | perpetratorTravel :
      PerpetratorTravelsInInterstateCommerceInFurtherance p c → Wmd2332aCommerceNexus p pr c

  | commerceEffect :
      OffenseAffectsInterstateOrForeignCommerce p c → Wmd2332aCommerceNexus p pr c



inductive Condition2332aA (p : Person) (v : Person) (pr : Property) (c : ComplaintText) : Prop where

  | nationalAbroad :
      IsNationalOfTheUnitedStates v c →
      TargetIsUnitedStatesNationalOutsideUnitedStates p v c → Condition2332aA p v pr c


  | withinUnitedStates :
      TargetIsPersonOrPropertyWithinUnitedStates p c →
      Wmd2332aCommerceNexus p pr c → Condition2332aA p v pr c

  | unitedStatesProperty :
      IsRealOrPersonalProperty pr c →
      TargetIsPropertyOfTheUnitedStates pr c → Condition2332aA p v pr c


  | foreignGovernmentProperty :
      IsRealOrPersonalProperty pr c →
      TargetIsForeignGovernmentPropertyWithinUnitedStates pr c → Condition2332aA p v pr c




structure Prohibition2332aA (p : Person) (w : Weapon) (v : Person) (pr : Property)
    (c : ComplaintText) : Prop where

  addressee : ActedWithoutLawfulAuthority p c

  weapon : IsWeaponOfMassDestruction w c

  condition : Condition2332aA p v pr c


def modality2332aA : Modality := Modality.prohibition




def Prohibition2332aAViolated (p : Person) (w : Weapon) (v : Person) (pr : Property)
    (c : ComplaintText) : Prop :=
  Prohibition2332aA p w v pr c ∧ UsedThreatenedAttemptedOrConspiredToUseWmd p w c






structure Prohibition2332aB (p : Person) (w : Weapon) (c : ComplaintText) : Prop where

  addressee : IsNationalOfTheUnitedStates p c

  lawfulAuthority : ActedWithoutLawfulAuthority p c

  weapon : IsWeaponOfMassDestruction w c

  condition : ConductOccurredOutsideTheUnitedStates p c


def modality2332aB : Modality := Modality.prohibition


def Prohibition2332aBViolated (p : Person) (w : Weapon) (c : ComplaintText) : Prop :=
  Prohibition2332aB p w c ∧ UsedThreatenedAttemptedOrConspiredToUseWmd p w c






inductive Circumstance2332bB1 (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText) : Prop where

  | mailOrFacility :
      MailOrFacilityOfInterstateCommerceUsedInFurtherance p c → Circumstance2332bB1 p v pr c

  | commerceEffect :
      OffenseAffectsInterstateOrForeignCommerce p c → Circumstance2332bB1 p v pr c

  | federalVictim :
      VictimIsUnitedStatesGovernmentOrFederalOfficial v c → Circumstance2332bB1 p v pr c

  | federalProperty :
      PropertyIsOwnedPossessedOrLeasedByTheUnitedStates pr c → Circumstance2332bB1 p v pr c

  | territorialSea :
      OffenseCommittedInTerritorialSeaOfTheUnitedStates p c → Circumstance2332bB1 p v pr c


  | specialMaritimeJurisdiction :
      OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction p c →
        Circumstance2332bB1 p v pr c


inductive Act2332bA1 (p : Person) (v : Person) (pr : Property) (c : ComplaintText) : Prop where

  | violentAct :
      KilledKidnappedOrMaimedPersonWithinUnitedStates p v c → Act2332bA1 p v pr c


  | assault :
      AssaultedPersonWithinUnitedStates p v c → Act2332bA1 p v pr c



  | propertyRisk :
      CreatedSubstantialRiskOfSeriousBodilyInjuryByDamagingProperty p pr c →
        Act2332bA1 p v pr c





structure Prohibition2332bA1 (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText) : Prop where

  transnational : ConductTranscendsNationalBoundaries p c

  circumstance : Circumstance2332bB1 p v pr c

  unlawfulUnderStateOrFederalLaw : ConductViolatesLawsOfAStateOrTheUnitedStates p c


def modality2332bA1 : Modality := Modality.prohibition


def Prohibition2332bA1Violated (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText) : Prop :=
  Prohibition2332bA1 p v pr c ∧ Act2332bA1 p v pr c






structure Prohibition2332bA2 (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText) : Prop where

  referencedOffense : Prohibition2332bA1 p v pr c


def modality2332bA2 : Modality := Modality.prohibition


def Prohibition2332bA2Violated (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText) : Prop :=
  Prohibition2332bA2 p v pr c ∧ ThreatenedAttemptedOrConspiredToCommitSection2332bOffense p c







structure Power2332bB2 (p : Person) (o : Offense) (c : ComplaintText) : Prop where

  addressee : IsPrincipalCoConspiratorOrAccessoryAfterTheFact p o c

  condition : AtLeastOneCircumstanceAppliesToAtLeastOneOffender o c


def modality2332bB2 : Modality := Modality.power





structure Obligation2332bC1 (t : Tribunal) (p : Person) (c : ComplaintText) : Prop where

  addressee : IsAdjudicatingCourt t c

  condition : ConvictedOfViolatingSection2332b p c


def modality2332bC1 : Modality := Modality.obligation



def Obligation2332bC1Satisfied (t : Tribunal) (p : Person) (c : ComplaintText) : Prop :=
  Obligation2332bC1 t p c ∧ PrescribedPunishmentImposed t p c



def Obligation2332bC1Breached (t : Tribunal) (p : Person) (c : ComplaintText) : Prop :=
  Obligation2332bC1 t p c ∧ ¬ PrescribedPunishmentImposed t p c





inductive Act2332bC2 (t : Tribunal) (p : Person) (c : ComplaintText) : Prop where

  | probation : ProbationImposedOnConvictedPerson t p c → Act2332bC2 t p c


  | concurrentTerm : TermOfImprisonmentRunsConcurrently t p c → Act2332bC2 t p c


structure Prohibition2332bC2 (t : Tribunal) (p : Person) (c : ComplaintText) : Prop where

  addressee : IsAdjudicatingCourt t c

  condition : ConvictedOfViolatingSection2332b p c


def modality2332bC2 : Modality := Modality.prohibition


def Prohibition2332bC2Violated (t : Tribunal) (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332bC2 t p c ∧ Act2332bC2 t p c






structure Permission2332bD1 (p : Person) (c : ComplaintText) : Prop where

  condition : ProsecutionUnderSection2332bPending p c


def modality2332bD1 : Modality := Modality.permission



def Permission2332bD1Exercised (p : Person) (c : ComplaintText) : Prop :=
  Permission2332bD1 p c ∧ ProofOfDefendantKnowledgeOfJurisdictionalBaseOmitted p c




structure Prohibition2332bD2 (t : Tribunal) (p : Person) (c : ComplaintText) : Prop where

  addressee : IsAdjudicatingCourt t c

  condition : ProsecutionBasedOnAdoptionOfStateLaw p c


def modality2332bD2 : Modality := Modality.prohibition



def Prohibition2332bD2Violated (t : Tribunal) (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332bD2 t p c ∧ StateCriminalProcedureOrEvidenceProvisionsAdopted t p c





inductive Ground2332bE (p : Person) (o : Offense) (c : ComplaintText) : Prop where

  | offenseUnderSubsectionA : OffenseIsUnderSubsection2332bA o c → Ground2332bE p o c


  | accessoryAfterTheFact :
      IsAccessoryAfterTheFactToSection2332bOffense p o c → Ground2332bE p o c



structure Power2332bE (p : Person) (o : Offense) (c : ComplaintText) : Prop where

  ground : Ground2332bE p o c


def modality2332bE : Modality := Modality.power






inductive Scope2332bF (o : Offense) (c : ComplaintText) : Prop where

  | federalCrimeOfTerrorism : IsFederalCrimeOfTerrorism o c → Scope2332bF o c

  | enumeratedSection : IsEnumeratedSection2332bFOffense o c → Scope2332bF o c



structure Obligation2332bFAttorneyGeneral (e : Entity) (o : Offense)
    (c : ComplaintText) : Prop where

  addressee : IsAttorneyGeneral e c

  condition : Scope2332bF o c


def modality2332bFAttorneyGeneral : Modality := Modality.obligation


def Obligation2332bFAttorneyGeneralSatisfied (e : Entity) (o : Offense)
    (c : ComplaintText) : Prop :=
  Obligation2332bFAttorneyGeneral e o c ∧ PrimaryInvestigativeResponsibilityExercised e o c


def Obligation2332bFAttorneyGeneralBreached (e : Entity) (o : Offense)
    (c : ComplaintText) : Prop :=
  Obligation2332bFAttorneyGeneral e o c ∧ ¬ PrimaryInvestigativeResponsibilityExercised e o c



structure Obligation2332bFTreasury (e : Entity) (c : ComplaintText) : Prop where

  addressee : IsSecretaryOfTheTreasury e c

  condition : AssistanceRequestedByAttorneyGeneral e c


def modality2332bFTreasury : Modality := Modality.obligation


def Obligation2332bFTreasurySatisfied (e : Entity) (c : ComplaintText) : Prop :=
  Obligation2332bFTreasury e c ∧ AssistanceToAttorneyGeneralRendered e c


def Obligation2332bFTreasuryBreached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation2332bFTreasury e c ∧ ¬ AssistanceToAttorneyGeneralRendered e c





structure Prohibition2332bFConstruction (t : Tribunal) (c : ComplaintText) : Prop where

  addressee : IsAdjudicatingCourt t c


def modality2332bFConstruction : Modality := Modality.prohibition


def Prohibition2332bFConstructionViolated (t : Tribunal) (c : ComplaintText) : Prop :=
  Prohibition2332bFConstruction t c ∧ ConstructionInterferesWithSecretServiceAuthority t c

end Proving.USC.T18.Ch113B.Wmd.Part3.Deontic
