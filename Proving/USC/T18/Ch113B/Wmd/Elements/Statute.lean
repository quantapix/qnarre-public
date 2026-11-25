














import Proving.USC.T18.Ch113B.Wmd.Elements.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Elements

open Proving.USC.Common





inductive WeaponOfMassDestruction2332aC2 (w : Weapon) (c : ComplaintText) : Prop where
  | destructiveDevice (h : IsDestructiveDevice921 w c)
  | chemical (h : IsToxicChemicalWeapon w c)
  | biological (h : IsBiologicalWeapon w c)
  | radiological (h : IsRadiologicalWeapon w c)



abbrev IsWeaponOfMassDestruction (w : Weapon) (c : ComplaintText) : Prop :=
  WeaponOfMassDestruction2332aC2 w c




inductive UseModeWmd2332a (p : Person) (w : Weapon) (c : ComplaintText) : Prop where
  | uses (h : UsesWeaponOfMassDestruction p w c)
  | threatens (h : ThreatensToUseWeaponOfMassDestruction p w c)
  | attempts (h : AttemptsToUseWeaponOfMassDestruction p w c)
  | conspires {ag : Agreement} (hAgree : AgreementAmongTwoOrMore ag c)
      (h : ConspiresToUseWeaponOfMassDestruction p w c)



structure NationalOutsideUS2332aA1 (v : Person) (c : ComplaintText) : Prop where
  national : IsNationalOfTheUnitedStates v c
  outsideUS : IsOutsideTheUnitedStates v c



inductive InterstateCircumstance2332aA2 (r : Property) (c : ComplaintText) : Prop where
  | mailOrFacility (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance c)
  | propertyInCommerce (h : PropertyUsedInOrAffectingInterstateCommerce r c)
  | perpetratorTravels (h : PerpetratorTravelsInInterstateCommerceInFurtherance c)
  | offenseAffectsCommerce (h : OffenseAffectsInterstateCommerce c)


inductive TargetWithinUS2332aA2 (v : Person) (r : Property) (c : ComplaintText) : Prop where
  | person (h : IsPersonInUS v c)
  | property (h : PropertyIsWithinTheUnitedStates r c)



structure Target2332aA2 (v : Person) (r : Property) (c : ComplaintText) : Prop where
  target : TargetWithinUS2332aA2 v r c
  circumstance : InterstateCircumstance2332aA2 r c



structure ForeignGovernmentPropertyWithinUS2332aA4 (r : Property) (c : ComplaintText) : Prop where
  withinUS : PropertyIsWithinTheUnitedStates r c
  foreignGovernment : PropertyOwnedLeasedOrUsedByForeignGovernment r c


inductive TargetRoute2332aA (v : Person) (r : Property) (c : ComplaintText) : Prop where
  | nationalAbroad (h : NationalOutsideUS2332aA1 v c)
  | withinUS (h : Target2332aA2 v r c)
  | unitedStatesProperty (h : PropertyOwnedLeasedOrUsedByUnitedStates r c)
  | foreignGovernmentProperty (h : ForeignGovernmentPropertyWithinUS2332aA4 r c)




structure Section2332aA (p v : Person) (r : Property) (w : Weapon) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  withoutLawfulAuthority : ¬ ActsUnderLawfulAuthority p c
  weapon : IsWeaponOfMassDestruction w c
  conduct : UseModeWmd2332a p w c
  target : TargetRoute2332aA v r c


structure Section2332aB (p : Person) (w : Weapon) (c : ComplaintText) : Prop where
  nationalOfUS : IsNationalOfTheUnitedStates p c
  scienter : ActedWithScienter p c
  withoutLawfulAuthority : ¬ ActsUnderLawfulAuthority p c
  weapon : IsWeaponOfMassDestruction w c
  conduct : UseModeWmd2332a p w c
  outsideUS : ConductOccursOutsideTheUnitedStates c





structure Section2332aADeathResults (p v : Person) (r : Property) (w : Weapon)
    (c : ComplaintText) : Prop where
  offense : Section2332aA p v r w c
  death : DeathResultsFromOffenseConduct c


structure Section2332aBDeathResults (p : Person) (w : Weapon) (c : ComplaintText) : Prop where
  offense : Section2332aB p w c
  death : DeathResultsFromOffenseConduct c





structure TranscendsNationalBoundaries2332bG1 (c : ComplaintText) : Prop where
  withinUS : ConductOccursWithinTheUnitedStates c
  outsideUS : ConductOccursOutsideTheUnitedStates c



abbrev ConductTranscendingNationalBoundaries (c : ComplaintText) : Prop :=
  TranscendsNationalBoundaries2332bG1 c



inductive Circumstance2332bB1 (v : Person) (r : Property) (c : ComplaintText) : Prop where
  | mailOrFacility (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance c)
  | obstructsCommerce (h : OffenseObstructsDelaysOrAffectsInterstateCommerce c)
  | governmentVictim (h : VictimIsUnitedStatesGovernmentOrOfficial v c)
  | governmentProperty (h : PropertyOwnedPossessedOrLeasedByUnitedStates r c)
  | territorialSea (h : OffenseCommittedInTerritorialSeaOfTheUnitedStates c)
  | maritimeJurisdiction
      (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction c)


inductive ViolentActMode2332bA1A (p v : Person) (c : ComplaintText) : Prop where
  | kills (h : KillsVictim p v c)
  | kidnaps (h : KidnapsVictim p v c)
  | maims (h : MaimsVictim p v c)
  | assaultSeriousBodilyInjury (h : AssaultsVictimResultingInSeriousBodilyInjury p v c)
  | assaultDangerousWeapon (h : AssaultsVictimWithDangerousWeapon p v c)



structure ViolentActAgainstPerson2332bA1A (p v : Person) (c : ComplaintText) : Prop where
  victimWithinUS : IsPersonInUS v c
  act : ViolentActMode2332bA1A p v c




inductive PropertyAttackMode2332bA1B (p : Person) (r : Property) (c : ComplaintText) : Prop where
  | destroysOrDamages (h : DestroysOrDamagesProperty p r c)
  | attempts (h : AttemptsToDestroyOrDamageProperty p r c)
  | conspires {ag : Agreement} (hAgree : AgreementAmongTwoOrMore ag c)
      (h : ConspiresToDestroyOrDamageProperty p r c)




structure PropertyAttack2332bA1B (p : Person) (r : Property) (c : ComplaintText) : Prop where
  propertyWithinUS : PropertyIsWithinTheUnitedStates r c
  mode : PropertyAttackMode2332bA1B p r c
  substantialRisk : CreatesSubstantialRiskOfSeriousBodilyInjury p c


inductive ProhibitedAct2332bA1 (p v : Person) (r : Property) (c : ComplaintText) : Prop where
  | againstPerson (h : ViolentActAgainstPerson2332bA1A p v c)
  | againstProperty (h : PropertyAttack2332bA1B p r c)





inductive InViolationOfLaw2332bA1 (p : Person) (c : ComplaintText) : Prop where
  | stateLaw (h : ViolatesStateLawOffenseElements p c)
  | federalLaw (h : ViolatesFederalLaw p c)








structure Section2332bA1 (p v : Person) (r : Property) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  transcendsNationalBoundaries : ConductTranscendingNationalBoundaries c
  circumstance : Circumstance2332bB1 v r c
  prohibitedAct : ProhibitedAct2332bA1 p v r c
  violationOfLaw : InViolationOfLaw2332bA1 p c


inductive InchoateMode2332bA2 (p : Person) (c : ComplaintText) : Prop where
  | threatens (h : ThreatensToCommitOffenseUnderSubsectionA1 p c)
  | attempts (h : AttemptsToCommitOffenseUnderSubsectionA1 p c)
  | conspires {ag : Agreement} (hAgree : AgreementAmongTwoOrMore ag c)
      (h : ConspiresToCommitOffenseUnderSubsectionA1 p c)



structure Section2332bA2 (p : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  inchoate : InchoateMode2332bA2 p c




structure Jurisdiction2332bB2 (p : Person) (c : ComplaintText) : Prop where
  role : IsPrincipalCoconspiratorOrAccessoryAfterTheFact p c
  circumstanceAsToOneOffender : CircumstanceAppliesToAtLeastOneOffender c



structure Section2332bA1DeathResults (p v : Person) (r : Property) (c : ComplaintText) : Prop where
  offense : Section2332bA1 p v r c
  death : DeathResultsFromOffenseConduct c



structure FederalCrimeOfTerrorism2332bG5 (o : Offense) (c : ComplaintText) : Prop where
  motive : CalculatedToInfluenceOrRetaliateAgainstGovernment o c
  enumeratedOffense : ViolatesEnumeratedTerrorismOffense o c



abbrev FederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop :=
  FederalCrimeOfTerrorism2332bG5 o c

end Proving.USC.T18.Ch113B.Wmd.Elements
