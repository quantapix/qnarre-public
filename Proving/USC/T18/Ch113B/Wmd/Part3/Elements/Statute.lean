






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Predicates

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Elements





inductive WeaponOfMassDestruction2332aC2 (w : Weapon) (c : ComplaintText) : Prop where
  | destructiveDevice (h : IsDestructiveDevice w c)
  | chemical (h : IsChemicalWeapon w c)
  | biological (h : IsBiologicalWeapon w c)
  | radiological (h : IsRadiologicalWeapon w c)



abbrev IsWeaponOfMassDestruction (w : Weapon) (c : ComplaintText) : Prop :=
  WeaponOfMassDestruction2332aC2 w c





structure ConspiracyToUseWeapon
    (ag : Agreement) (w : Weapon) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  object : AgreedObjectIsWeaponUse ag w c


inductive WmdConductMode
    (p : Person) (w : Weapon) (ag : Agreement) (c : ComplaintText) : Prop where
  | uses (h : UsesWeapon p w c)
  | threatens (h : ThreatensToUseWeapon p w c)
  | attempts (h : AttemptsToUseWeapon p w c)
  | conspires (h : ConspiracyToUseWeapon ag w c)





structure NationalAbroadTarget (t : Target) (c : ComplaintText) : Prop where
  isNational : TargetIsNationalOfUnitedStates t c
  outsideUnitedStates : TargetIsOutsideUnitedStates t c



inductive Section2332aCommerceHook
    (o : Offense) (t : Target) (c : ComplaintText) : Prop where
  | mailOrFacility (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance o c)
  | propertyInCommerce (h : PropertyUsedInOrAffectingInterstateCommerce t c)
  | perpetratorTravels (h : PerpetratorTravelsInInterstateCommerceInFurtherance o c)
  | offenseAffectsCommerce (h : OffenseAffectsOrWouldAffectInterstateCommerce o c)



structure DomesticTargetWithCommerceHook
    (o : Offense) (t : Target) (c : ComplaintText) : Prop where
  withinUnitedStates : TargetIsPersonOrPropertyWithinUnitedStates t c
  commerceHook : Section2332aCommerceHook o t c


inductive Section2332aTargetCircumstance
    (o : Offense) (t : Target) (c : ComplaintText) : Prop where
  | nationalAbroad (h : NationalAbroadTarget t c)
  | domesticWithCommerceHook (h : DomesticTargetWithCommerceHook o t c)
  | unitedStatesProperty (h : TargetIsUnitedStatesProperty t c)
  | foreignGovernmentProperty (h : TargetIsForeignGovernmentPropertyWithinUnitedStates t c)






structure Section2332aA
    (p : Person) (w : Weapon) (ag : Agreement) (o : Offense) (t : Target)
    (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  lawfulAuthorityAbsent : ¬ HasLawfulAuthority p o c
  conduct : WmdConductMode p w ag c
  weapon : IsWeaponOfMassDestruction w c
  targetCircumstance : Section2332aTargetCircumstance o t c



structure Section2332aB
    (p : Person) (w : Weapon) (ag : Agreement) (o : Offense)
    (c : ComplaintText) : Prop where
  nationalOfUnitedStates : IsNationalOfUnitedStates p c
  scienter : ActedWithScienter p c
  lawfulAuthorityAbsent : ¬ HasLawfulAuthority p o c
  conduct : WmdConductMode p w ag c
  weapon : IsWeaponOfMassDestruction w c
  outsideUnitedStates : ConductOccurredOutsideUnitedStates o c


inductive Section2332aViolation
    (p : Person) (w : Weapon) (ag : Agreement) (o : Offense) (t : Target)
    (c : ComplaintText) : Prop where
  | subsectionA (h : Section2332aA p w ag o t c)
  | subsectionB (h : Section2332aB p w ag o c)



structure Section2332aDeathAggravator
    (p : Person) (w : Weapon) (ag : Agreement) (o : Offense) (t : Target)
    (c : ComplaintText) : Prop where
  violation : Section2332aViolation p w ag o t c
  deathResulted : DeathResultedFromOffense o c






structure ConductTranscendingNationalBoundaries
    (o : Offense) (c : ComplaintText) : Prop where
  withinUnitedStates : ConductOccurredWithinUnitedStates o c
  outsideUnitedStates : ConductOccurredOutsideUnitedStates o c




inductive Section2332bCircumstance (o : Offense) (c : ComplaintText) : Prop where
  | mailOrFacility (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance o c)
  | commerceObstructed (h : OffenseObstructsDelaysOrAffectsInterstateCommerce o c)
  | federalVictim (h : VictimIsUnitedStatesGovernmentOrOfficer o c)
  | federalProperty (h : PropertyInvolvedIsUnitedStatesOwned o c)
  | territorialSea (h : OffenseCommittedInTerritorialSea o c)
  | specialMaritimeJurisdiction
      (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c)




inductive Section2332bViolentAct
    (p : Person) (v : Person) (c : ComplaintText) : Prop where
  | kills (h : KillsPerson p v c)
  | kidnaps (h : KidnapsPerson p v c)
  | maims (h : MaimsPerson p v c)
  | assaultSeriousBodilyInjury (h : CommitsAssaultResultingInSeriousBodilyInjury p v c)
  | assaultDangerousWeapon (h : AssaultsWithDangerousWeapon p v c)



structure Section2332bPersonRoute
    (p : Person) (v : Person) (c : ComplaintText) : Prop where
  act : Section2332bViolentAct p v c
  victimWithinUnitedStates : IsPersonInUS v c



inductive Section2332bPropertyAct
    (p : Person) (pr : PropertyItem) (c : ComplaintText) : Prop where
  | destroysOrDamages (h : DestroysOrDamagesProperty p pr c)
  | attemptsOrConspires (h : AttemptsOrConspiresToDestroyOrDamageProperty p pr c)




structure Section2332bPropertyRoute
    (p : Person) (pr : PropertyItem) (c : ComplaintText) : Prop where
  act : Section2332bPropertyAct p pr c
  propertyWithinUnitedStates : PropertyIsWithinUnitedStates pr c
  substantialRisk : CreatesSubstantialRiskOfSeriousBodilyInjury p pr c


inductive Section2332bProhibitedConduct
    (p : Person) (v : Person) (pr : PropertyItem) (c : ComplaintText) : Prop where
  | againstPerson (h : Section2332bPersonRoute p v c)
  | againstProperty (h : Section2332bPropertyRoute p pr c)




structure Section2332bA1
    (p : Person) (v : Person) (pr : PropertyItem) (o : Offense)
    (c : ComplaintText) : Prop where
  transcendsNationalBoundaries : ConductTranscendingNationalBoundaries o c
  circumstance : Section2332bCircumstance o c
  conduct : Section2332bProhibitedConduct p v pr c
  violatesStateOrFederalLaw : ViolatesLawOfStateOrUnitedStates o c


inductive Section2332bInchoateMode
    (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  | threatens (h : ThreatensToCommitSection2332bOffense p o c)
  | attempts (h : AttemptsToCommitSection2332bOffense p o c)
  | conspires (h : ConspiresToCommitSection2332bOffense p o c)





structure Section2332bA2
    (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  mode : Section2332bInchoateMode p o c
  objectWouldViolateParagraph1 : ObjectOffenseWouldViolateParagraph1 o c
  transcendsNationalBoundaries : ConductTranscendingNationalBoundaries o c
  circumstance : Section2332bCircumstance o c


inductive Section2332bOffense
    (p : Person) (v : Person) (pr : PropertyItem) (o : Offense)
    (c : ComplaintText) : Prop where
  | substantive (h : Section2332bA1 p v pr o c)
  | inchoate (h : Section2332bA2 p o c)



structure Section2332bDeathAggravator
    (p : Person) (v : Person) (pr : PropertyItem) (o : Offense)
    (c : ComplaintText) : Prop where
  offense : Section2332bOffense p v pr o c
  deathResulted : DeathResultedFromOffense o c





inductive Section2332bParticipantRole
    (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  | principalOrCoconspirator (h : IsPrincipalOrCoconspirator p o c)
  | accessoryAfterTheFact (h : IsAccessoryAfterTheFact p o c)




structure Section2332bJurisdictionOverParticipant
    (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  role : Section2332bParticipantRole p o c
  circumstanceAsToSomeOffender : Section2332bCircumstance o c





structure FederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop where
  calculatedToInfluenceGovernment : CalculatedToInfluenceOrRetaliateAgainstGovernment o c
  enumeratedOffense : IsEnumeratedTerrorismOffense o c

end Proving.USC.T18.Ch113B.Wmd.Part3.Elements
