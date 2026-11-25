







































import Proving.USC.T18.Ch113B.Wmd.Part2.Deontic.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Deontic

open Proving.USC.Common






structure TranscendsNationalBoundaries (k : Conduct) (c : ComplaintText) : Prop where
  insideUnitedStates : ConductOccurredInUnitedStates k c
  outsideUnitedStates : ConductOccurredOutsideUnitedStates k c





inductive CommerceNexusB1B (k : Conduct) (c : ComplaintText) : Prop where
  | actualEffect :
      OffenseObstructsDelaysOrAffectsInterstateCommerce k c → CommerceNexusB1B k c
  | ifConsummated :
      OffenseWouldHaveAffectedInterstateCommerceIfConsummated k c → CommerceNexusB1B k c


inductive VictimNexusB1C (k : Conduct) (c : ComplaintText) : Prop where
  | unitedStatesGovernment :
      VictimOrIntendedVictimIsUnitedStatesGovernment k c → VictimNexusB1C k c
  | uniformedServicesMember :
      VictimOrIntendedVictimIsMemberOfUniformedServices k c → VictimNexusB1C k c
  | federalOfficial :
      VictimOrIntendedVictimIsFederalOfficialOfficerEmployeeOrAgent k c → VictimNexusB1C k c





inductive SubsectionBCircumstance (pr : Property) (k : Conduct) (c : ComplaintText) : Prop where
  | mailOrCommerceFacility :
      MailOrFacilityOfInterstateCommerceUsedInFurtherance k c → SubsectionBCircumstance pr k c
  | commerceEffect :
      CommerceNexusB1B k c → SubsectionBCircumstance pr k c
  | victimClass :
      VictimNexusB1C k c → SubsectionBCircumstance pr k c
  | federalProperty :
      PropertyOwnedPossessedOrLeasedByUnitedStates pr c → SubsectionBCircumstance pr k c
  | territorialSea :
      OffenseCommittedInTerritorialSeaOfUnitedStates k c → SubsectionBCircumstance pr k c
  | specialMaritimeAndTerritorialJurisdiction :
      OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction k c →
      SubsectionBCircumstance pr k c




inductive ProscribedActAgainstPerson (p v : Person) (k : Conduct) (c : ComplaintText) : Prop where
  | killing : KilledVictim p v k c → ProscribedActAgainstPerson p v k c
  | kidnapping : KidnappedVictim p v k c → ProscribedActAgainstPerson p v k c
  | maiming : MaimedVictim p v k c → ProscribedActAgainstPerson p v k c
  | assaultSeriousBodilyInjury :
      CommittedAssaultResultingInSeriousBodilyInjury p v k c → ProscribedActAgainstPerson p v k c
  | assaultDangerousWeapon :
      AssaultedWithDangerousWeapon p v k c → ProscribedActAgainstPerson p v k c



structure ActClauseA (p v : Person) (k : Conduct) (c : ComplaintText) : Prop where
  act : ProscribedActAgainstPerson p v k c
  victimLocus : VictimIsPersonWithinUnitedStates v c



inductive PropertyMeansClauseB (p : Person) (pr : Property) (k : Conduct) (c : ComplaintText) : Prop where
  | destroyedOrDamaged :
      DestroyedOrDamagedProperty p pr k c → PropertyMeansClauseB p pr k c
  | attemptedOrConspired :
      AttemptedOrConspiredToDestroyOrDamageProperty p pr k c → PropertyMeansClauseB p pr k c




structure ActClauseB (p : Person) (pr : Property) (k : Conduct) (c : ComplaintText) : Prop where
  risk : CreatedSubstantialRiskOfSeriousBodilyInjuryToAnotherPerson p k c
  means : PropertyMeansClauseB p pr k c
  propertyLocus : PropertyIsWithinUnitedStates pr c



inductive ProscribedConduct2332bA1 (p v : Person) (pr : Property) (k : Conduct)
    (c : ComplaintText) : Prop where
  | againstPerson : ActClauseA p v k c → ProscribedConduct2332bA1 p v pr k c
  | againstProperty : ActClauseB p pr k c → ProscribedConduct2332bA1 p v pr k c




inductive PredicateLawViolated (p : Person) (k : Conduct) (c : ComplaintText) : Prop where
  | stateLaw : ViolatesLawOfAState p k c → PredicateLawViolated p k c
  | federalLaw : ViolatesLawOfTheUnitedStates p k c → PredicateLawViolated p k c




structure Prohibition2332bA1 (p : Person) (pr : Property) (k : Conduct)
    (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  transnational : TranscendsNationalBoundaries k c
  circumstance : SubsectionBCircumstance pr k c
  unlawful : PredicateLawViolated p k c



def Prohibition2332bA1Violated (p v : Person) (pr : Property) (k : Conduct)
    (c : ComplaintText) : Prop :=
  Prohibition2332bA1 p pr k c ∧ ProscribedConduct2332bA1 p v pr k c


def modality2332bA1 : Modality := Modality.Prohibition




inductive InchoateMode2332bA2 (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  | threat : ThreatenedToCommitOffense p o c → InchoateMode2332bA2 p o c
  | attempt : AttemptedToCommitOffense p o c → InchoateMode2332bA2 p o c
  | conspiracy : ConspiredToCommitOffense p o c → InchoateMode2332bA2 p o c








structure ObjectOffenseUnderParagraph1 (q v : Person) (pr : Property) (o : Offense)
    (k : Conduct) (c : ComplaintText) : Prop where
  constitutedBy : OffenseWouldBeConstitutedByConduct o k c
  transnational : TranscendsNationalBoundaries k c
  circumstance : SubsectionBCircumstance pr k c
  proscribedAct : ProscribedConduct2332bA1 q v pr k c
  unlawful : PredicateLawViolated q k c



structure Prohibition2332bA2 (p q v : Person) (pr : Property) (o : Offense)
    (k : Conduct) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  objectOffense : ObjectOffenseUnderParagraph1 q v pr o k c



def Prohibition2332bA2Violated (p q v : Person) (pr : Property) (o : Offense)
    (k : Conduct) (c : ComplaintText) : Prop :=
  Prohibition2332bA2 p q v pr o k c ∧ InchoateMode2332bA2 p o c


def modality2332bA2 : Modality := Modality.Prohibition






def ViolatesThisSection (p : Person) (c : ComplaintText) : Prop :=
  (∃ (v : Person) (pr : Property) (k : Conduct), Prohibition2332bA1Violated p v pr k c)
  ∨ (∃ (q v : Person) (pr : Property) (o : Offense) (k : Conduct),
        Prohibition2332bA2Violated p q v pr o k c)





inductive JurisdictionalPersonClass2332bB2 (p : Person) (o : Offense)
    (c : ComplaintText) : Prop where
  | principal : IsPrincipalOfOffenseUnderThisSection p o c → JurisdictionalPersonClass2332bB2 p o c
  | coconspirator :
      IsCoconspiratorOfOffenseUnderThisSection p o c → JurisdictionalPersonClass2332bB2 p o c
  | accessoryAfterTheFact :
      IsAccessoryAfterTheFactToOffenseUnderThisSection p o c →
      JurisdictionalPersonClass2332bB2 p o c





def CircumstanceApplicableToAtLeastOneOffender (o : Offense) (c : ComplaintText) : Prop :=
  ∃ (q : Person) (pr : Property) (k : Conduct),
    IsOffenderInOffense q o c ∧
    OffenseWouldBeConstitutedByConduct o k c ∧
    SubsectionBCircumstance pr k c


structure Power2332bB2 (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  personClass : JurisdictionalPersonClass2332bB2 p o c
  circumstanceApplicable : CircumstanceApplicableToAtLeastOneOffender o c


def Power2332bB2Exercised (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  Power2332bB2 p o c ∧ JurisdictionExercisedOverOffender p o c




def modality2332bB2 : Modality := Modality.Power


def modality2332bB1 : Modality := Modality.Definition





inductive PunishmentPrescribed2332bC1 (p : Person) (o : Offense) (s : Sentence)
    (c : ComplaintText) : Prop where
  | killingOrDeathResulting :
      ConvictedForKilling p c →
      SentenceIsDeathOrImprisonmentForAnyTermOfYearsOrLife s c →
      PunishmentPrescribed2332bC1 p o s c
  | deathResultingFromOtherConduct :
      DeathResultedFromOtherProhibitedConduct p c →
      SentenceIsDeathOrImprisonmentForAnyTermOfYearsOrLife s c →
      PunishmentPrescribed2332bC1 p o s c
  | kidnapping :
      ConvictedForKidnapping p c →
      SentenceIsImprisonmentForAnyTermOfYearsOrLife s c →
      PunishmentPrescribed2332bC1 p o s c
  | maiming :
      ConvictedForMaiming p c →
      SentenceIsImprisonmentNotMoreThanYears s 35 c →
      PunishmentPrescribed2332bC1 p o s c
  | assault :
      ConvictedForAssaultWithDangerousWeaponOrResultingInSeriousBodilyInjury p c →
      SentenceIsImprisonmentNotMoreThanYears s 30 c →
      PunishmentPrescribed2332bC1 p o s c
  | propertyDestruction :
      ConvictedForDestroyingOrDamagingProperty p c →
      SentenceIsImprisonmentNotMoreThanYears s 25 c →
      PunishmentPrescribed2332bC1 p o s c
  | attemptOrConspiracy :
      ConvictedForAttemptOrConspiracyToCommitOffense p o c →
      SentenceDoesNotExceedMaximumForCompletedOffense s o c →
      PunishmentPrescribed2332bC1 p o s c
  | threat :
      ConvictedForThreateningToCommitOffense p c →
      SentenceIsImprisonmentNotMoreThanYears s 10 c →
      PunishmentPrescribed2332bC1 p o s c



structure Obligation2332bC1 (t : Tribunal) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSentencingCourt t c
  convicted : PersonConvictedOfViolationOfThisSection p c



def Obligation2332bC1Discharged (t : Tribunal) (p : Person) (o : Offense) (s : Sentence)
    (c : ComplaintText) : Prop :=
  Obligation2332bC1 t p c ∧ SentenceImposedOnPerson t p s c ∧ PunishmentPrescribed2332bC1 p o s c




def Obligation2332bC1Breached (t : Tribunal) (p : Person) (c : ComplaintText) : Prop :=
  Obligation2332bC1 t p c ∧
  ¬ ∃ (o : Offense) (s : Sentence),
      SentenceImposedOnPerson t p s c ∧ PunishmentPrescribed2332bC1 p o s c


def modality2332bC1 : Modality := Modality.Obligation




structure Prohibition2332bC2Probation (t : Tribunal) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSentencingCourt t c
  convicted : PersonConvictedOfViolationOfThisSection p c



def Prohibition2332bC2ProbationViolated (t : Tribunal) (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2332bC2Probation t p c ∧ PlacedPersonOnProbation t p c



structure Prohibition2332bC2ConcurrentTerm (t : Tribunal) (p : Person) (s : Sentence)
    (c : ComplaintText) : Prop where
  addressee : AddresseeIsSentencingCourt t c
  imposedUnderThisSection : TermOfImprisonmentImposedUnderThisSection s p c



def Prohibition2332bC2ConcurrentTermViolated (t : Tribunal) (p : Person) (s : Sentence)
    (c : ComplaintText) : Prop :=
  Prohibition2332bC2ConcurrentTerm t p s c ∧ TermRunsConcurrentlyWithAnotherTermOfImprisonment s c


def modality2332bC2 : Modality := Modality.Prohibition








structure Permission2332bD1 (pros : Prosecution) (c : ComplaintText) : Prop where
  scope : IsProsecutionUnderThisSection pros c
  jurisdictionalBaseAlleged : JurisdictionalBaseAllegedInIndictment pros c



def Permission2332bD1Exercised (pros : Prosecution) (p : Person) (c : ComplaintText) : Prop :=
  Permission2332bD1 pros c ∧ ProceededWithoutProvingDefendantKnowledgeOfJurisdictionalBase pros p c


def modality2332bD1 : Modality := Modality.Permission




structure Prohibition2332bD2 (pros : Prosecution) (c : ComplaintText) : Prop where
  scope : IsProsecutionUnderThisSection pros c
  basedOnStateLaw : ProsecutionBasedOnAdoptionOfStateLaw pros c



def Prohibition2332bD2Violated (pros : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition2332bD2 pros c ∧ AdoptedStateProvisionPertainingToCriminalProcedureOrEvidence pros c





def Prohibition2332bD2Complied (pros : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition2332bD2 pros c ∧
  AdoptedOnlyElementsOfOffenseUnderStateLaw pros c ∧
  ¬ AdoptedStateProvisionPertainingToCriminalProcedureOrEvidence pros c


def modality2332bD2 : Modality := Modality.Prohibition







def OffenseUnderSubsectionA (o : Offense) (c : ComplaintText) : Prop :=
  ∃ (q : Person), IsOffenderInOffense q o c ∧ ViolatesThisSection q c


inductive ExtraterritorialJurisdictionBasis2332bE (p : Person) (o : Offense)
    (c : ComplaintText) : Prop where
  | offenseUnderSubsectionA :
      OffenseUnderSubsectionA o c → IsOffenderInOffense p o c →
      ExtraterritorialJurisdictionBasis2332bE p o c
  | accessoryAfterTheFact :
      OffenseUnderSubsectionA o c → IsAccessoryAfterTheFactUnderSection3 p o c →
      ExtraterritorialJurisdictionBasis2332bE p o c



def Power2332bEExercised (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  ExtraterritorialJurisdictionBasis2332bE p o c ∧ ExtraterritorialFederalJurisdictionExercised p o c


def modality2332bE : Modality := Modality.Power




inductive TerrorismMotive2332bG5A (o : Offense) (c : ComplaintText) : Prop where
  | influenceOrAffect :
      CalculatedToInfluenceOrAffectGovernmentConductByIntimidationOrCoercion o c →
      TerrorismMotive2332bG5A o c
  | retaliate :
      CalculatedToRetaliateAgainstGovernmentConduct o c → TerrorismMotive2332bG5A o c



inductive EnumeratedPredicateViolation2332bG5B (o : Offense) (c : ComplaintText) : Prop where
  | title18 :
      ViolatesEnumeratedTitle18TerrorismProvision o c → EnumeratedPredicateViolation2332bG5B o c
  | atomicEnergyAct :
      ViolatesEnumeratedAtomicEnergyActProvision o c → EnumeratedPredicateViolation2332bG5B o c
  | title49 :
      ViolatesEnumeratedTitle49Provision o c → EnumeratedPredicateViolation2332bG5B o c
  | narcoTerrorism :
      ViolatesNarcoTerrorismProvision o c → EnumeratedPredicateViolation2332bG5B o c





structure FederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop where
  motive : TerrorismMotive2332bG5A o c
  enumerated : EnumeratedPredicateViolation2332bG5B o c


def modality2332bG : Modality := Modality.Definition






inductive InvestigativeResponsibilityMatter2332bF (o : Offense) (c : ComplaintText) : Prop where
  | federalCrimeOfTerrorism :
      FederalCrimeOfTerrorism o c → InvestigativeResponsibilityMatter2332bF o c
  | enumeratedSectionViolation :
      ViolatesProvisionEnumeratedInSubsectionF o c → InvestigativeResponsibilityMatter2332bF o c



structure Obligation2332bFAttorneyGeneral (p : Person) (o : Offense)
    (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral p c
  matter : InvestigativeResponsibilityMatter2332bF o c


def Obligation2332bFAttorneyGeneralDischarged (p : Person) (o : Offense)
    (c : ComplaintText) : Prop :=
  Obligation2332bFAttorneyGeneral p o c ∧ ExercisedPrimaryInvestigativeResponsibility p o c




def Obligation2332bFAttorneyGeneralBreached (p : Person) (o : Offense)
    (c : ComplaintText) : Prop :=
  Obligation2332bFAttorneyGeneral p o c ∧ ¬ ExercisedPrimaryInvestigativeResponsibility p o c



structure Obligation2332bFTreasury (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsSecretaryOfTheTreasury p c
  requested : AttorneyGeneralRequestedAssistance c


def Obligation2332bFTreasuryDischarged (p : Person) (c : ComplaintText) : Prop :=
  Obligation2332bFTreasury p c ∧ AssistedAttorneyGeneral p c


def Obligation2332bFTreasuryBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation2332bFTreasury p c ∧ ¬ AssistedAttorneyGeneral p c


def modality2332bF : Modality := Modality.Obligation





structure Prohibition2332bFSecretServiceSavings (x : Construction)
    (c : ComplaintText) : Prop where
  addressee : IsConstructionOfThisSection x c



def Prohibition2332bFSecretServiceSavingsViolated (x : Construction)
    (c : ComplaintText) : Prop :=
  Prohibition2332bFSecretServiceSavings x c ∧ ConstruedToInterfereWithSecretServiceAuthority x c


def modality2332bFSavings : Modality := Modality.Prohibition

end Proving.USC.T18.Ch113B.Wmd.Part2.Deontic
