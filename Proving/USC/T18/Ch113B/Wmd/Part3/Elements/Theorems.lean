






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Statute

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Elements



theorem weaponOfMassDestruction2332aC2_intro
    {w : Weapon} {c : ComplaintText} (h : IsDestructiveDevice w c) :
    WeaponOfMassDestruction2332aC2 w c := .destructiveDevice h

theorem weaponOfMassDestruction2332aC2_intro_chemical
    {w : Weapon} {c : ComplaintText} (h : IsChemicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .chemical h

theorem weaponOfMassDestruction2332aC2_intro_biological
    {w : Weapon} {c : ComplaintText} (h : IsBiologicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .biological h

theorem weaponOfMassDestruction2332aC2_intro_radiological
    {w : Weapon} {c : ComplaintText} (h : IsRadiologicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .radiological h



theorem conspiracyToUseWeapon_intro
    {ag : Agreement} {w : Weapon} {c : ComplaintText}
    (hAgree : AgreementAmongTwoOrMore ag c) (hObject : AgreedObjectIsWeaponUse ag w c) :
    ConspiracyToUseWeapon ag w c := ⟨hAgree, hObject⟩

theorem wmdConductMode_intro
    {p : Person} {w : Weapon} {ag : Agreement} {c : ComplaintText}
    (h : UsesWeapon p w c) : WmdConductMode p w ag c := .uses h

theorem wmdConductMode_intro_threatens
    {p : Person} {w : Weapon} {ag : Agreement} {c : ComplaintText}
    (h : ThreatensToUseWeapon p w c) : WmdConductMode p w ag c := .threatens h

theorem wmdConductMode_intro_attempts
    {p : Person} {w : Weapon} {ag : Agreement} {c : ComplaintText}
    (h : AttemptsToUseWeapon p w c) : WmdConductMode p w ag c := .attempts h

theorem wmdConductMode_intro_conspires
    {p : Person} {w : Weapon} {ag : Agreement} {c : ComplaintText}
    (h : ConspiracyToUseWeapon ag w c) : WmdConductMode p w ag c := .conspires h



theorem nationalAbroadTarget_intro
    {t : Target} {c : ComplaintText}
    (hNational : TargetIsNationalOfUnitedStates t c)
    (hAbroad : TargetIsOutsideUnitedStates t c) :
    NationalAbroadTarget t c := ⟨hNational, hAbroad⟩

theorem section2332aCommerceHook_intro
    {o : Offense} {t : Target} {c : ComplaintText}
    (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance o c) :
    Section2332aCommerceHook o t c := .mailOrFacility h

theorem section2332aCommerceHook_intro_propertyInCommerce
    {o : Offense} {t : Target} {c : ComplaintText}
    (h : PropertyUsedInOrAffectingInterstateCommerce t c) :
    Section2332aCommerceHook o t c := .propertyInCommerce h

theorem section2332aCommerceHook_intro_perpetratorTravels
    {o : Offense} {t : Target} {c : ComplaintText}
    (h : PerpetratorTravelsInInterstateCommerceInFurtherance o c) :
    Section2332aCommerceHook o t c := .perpetratorTravels h

theorem section2332aCommerceHook_intro_offenseAffectsCommerce
    {o : Offense} {t : Target} {c : ComplaintText}
    (h : OffenseAffectsOrWouldAffectInterstateCommerce o c) :
    Section2332aCommerceHook o t c := .offenseAffectsCommerce h

theorem domesticTargetWithCommerceHook_intro
    {o : Offense} {t : Target} {c : ComplaintText}
    (hWithin : TargetIsPersonOrPropertyWithinUnitedStates t c)
    (hHook : Section2332aCommerceHook o t c) :
    DomesticTargetWithCommerceHook o t c := ⟨hWithin, hHook⟩

theorem section2332aTargetCircumstance_intro
    {o : Offense} {t : Target} {c : ComplaintText}
    (h : NationalAbroadTarget t c) :
    Section2332aTargetCircumstance o t c := .nationalAbroad h

theorem section2332aTargetCircumstance_intro_domestic
    {o : Offense} {t : Target} {c : ComplaintText}
    (h : DomesticTargetWithCommerceHook o t c) :
    Section2332aTargetCircumstance o t c := .domesticWithCommerceHook h

theorem section2332aTargetCircumstance_intro_unitedStatesProperty
    {o : Offense} {t : Target} {c : ComplaintText}
    (h : TargetIsUnitedStatesProperty t c) :
    Section2332aTargetCircumstance o t c := .unitedStatesProperty h

theorem section2332aTargetCircumstance_intro_foreignGovernmentProperty
    {o : Offense} {t : Target} {c : ComplaintText}
    (h : TargetIsForeignGovernmentPropertyWithinUnitedStates t c) :
    Section2332aTargetCircumstance o t c := .foreignGovernmentProperty h



theorem section2332aA_intro
    {p : Person} {w : Weapon} {ag : Agreement} {o : Offense} {t : Target}
    {c : ComplaintText}
    (hScienter : ActedWithScienter p c)
    (hNoAuthority : ¬ HasLawfulAuthority p o c)
    (hConduct : WmdConductMode p w ag c)
    (hWeapon : IsWeaponOfMassDestruction w c)
    (hTarget : Section2332aTargetCircumstance o t c) :
    Section2332aA p w ag o t c :=
  ⟨hScienter, hNoAuthority, hConduct, hWeapon, hTarget⟩

theorem section2332aB_intro
    {p : Person} {w : Weapon} {ag : Agreement} {o : Offense} {c : ComplaintText}
    (hNational : IsNationalOfUnitedStates p c)
    (hScienter : ActedWithScienter p c)
    (hNoAuthority : ¬ HasLawfulAuthority p o c)
    (hConduct : WmdConductMode p w ag c)
    (hWeapon : IsWeaponOfMassDestruction w c)
    (hAbroad : ConductOccurredOutsideUnitedStates o c) :
    Section2332aB p w ag o c :=
  ⟨hNational, hScienter, hNoAuthority, hConduct, hWeapon, hAbroad⟩

theorem section2332aViolation_intro
    {p : Person} {w : Weapon} {ag : Agreement} {o : Offense} {t : Target}
    {c : ComplaintText} (h : Section2332aA p w ag o t c) :
    Section2332aViolation p w ag o t c := .subsectionA h

theorem section2332aViolation_intro_subsectionB
    {p : Person} {w : Weapon} {ag : Agreement} {o : Offense} {t : Target}
    {c : ComplaintText} (h : Section2332aB p w ag o c) :
    Section2332aViolation p w ag o t c := .subsectionB h

theorem section2332aDeathAggravator_intro
    {p : Person} {w : Weapon} {ag : Agreement} {o : Offense} {t : Target}
    {c : ComplaintText}
    (hViolation : Section2332aViolation p w ag o t c)
    (hDeath : DeathResultedFromOffense o c) :
    Section2332aDeathAggravator p w ag o t c := ⟨hViolation, hDeath⟩



theorem conductTranscendingNationalBoundaries_intro
    {o : Offense} {c : ComplaintText}
    (hWithin : ConductOccurredWithinUnitedStates o c)
    (hOutside : ConductOccurredOutsideUnitedStates o c) :
    ConductTranscendingNationalBoundaries o c := ⟨hWithin, hOutside⟩



theorem section2332bCircumstance_intro
    {o : Offense} {c : ComplaintText}
    (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance o c) :
    Section2332bCircumstance o c := .mailOrFacility h

theorem section2332bCircumstance_intro_commerceObstructed
    {o : Offense} {c : ComplaintText}
    (h : OffenseObstructsDelaysOrAffectsInterstateCommerce o c) :
    Section2332bCircumstance o c := .commerceObstructed h

theorem section2332bCircumstance_intro_federalVictim
    {o : Offense} {c : ComplaintText}
    (h : VictimIsUnitedStatesGovernmentOrOfficer o c) :
    Section2332bCircumstance o c := .federalVictim h

theorem section2332bCircumstance_intro_federalProperty
    {o : Offense} {c : ComplaintText}
    (h : PropertyInvolvedIsUnitedStatesOwned o c) :
    Section2332bCircumstance o c := .federalProperty h

theorem section2332bCircumstance_intro_territorialSea
    {o : Offense} {c : ComplaintText}
    (h : OffenseCommittedInTerritorialSea o c) :
    Section2332bCircumstance o c := .territorialSea h

theorem section2332bCircumstance_intro_specialMaritimeJurisdiction
    {o : Offense} {c : ComplaintText}
    (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c) :
    Section2332bCircumstance o c := .specialMaritimeJurisdiction h



theorem section2332bViolentAct_intro
    {p : Person} {v : Person} {c : ComplaintText} (h : KillsPerson p v c) :
    Section2332bViolentAct p v c := .kills h

theorem section2332bViolentAct_intro_kidnaps
    {p : Person} {v : Person} {c : ComplaintText} (h : KidnapsPerson p v c) :
    Section2332bViolentAct p v c := .kidnaps h

theorem section2332bViolentAct_intro_maims
    {p : Person} {v : Person} {c : ComplaintText} (h : MaimsPerson p v c) :
    Section2332bViolentAct p v c := .maims h

theorem section2332bViolentAct_intro_assaultSeriousBodilyInjury
    {p : Person} {v : Person} {c : ComplaintText}
    (h : CommitsAssaultResultingInSeriousBodilyInjury p v c) :
    Section2332bViolentAct p v c := .assaultSeriousBodilyInjury h

theorem section2332bViolentAct_intro_assaultDangerousWeapon
    {p : Person} {v : Person} {c : ComplaintText}
    (h : AssaultsWithDangerousWeapon p v c) :
    Section2332bViolentAct p v c := .assaultDangerousWeapon h

theorem section2332bPersonRoute_intro
    {p : Person} {v : Person} {c : ComplaintText}
    (hAct : Section2332bViolentAct p v c) (hWithin : IsPersonInUS v c) :
    Section2332bPersonRoute p v c := ⟨hAct, hWithin⟩

theorem section2332bPropertyAct_intro
    {p : Person} {pr : PropertyItem} {c : ComplaintText}
    (h : DestroysOrDamagesProperty p pr c) :
    Section2332bPropertyAct p pr c := .destroysOrDamages h

theorem section2332bPropertyAct_intro_attemptsOrConspires
    {p : Person} {pr : PropertyItem} {c : ComplaintText}
    (h : AttemptsOrConspiresToDestroyOrDamageProperty p pr c) :
    Section2332bPropertyAct p pr c := .attemptsOrConspires h

theorem section2332bPropertyRoute_intro
    {p : Person} {pr : PropertyItem} {c : ComplaintText}
    (hAct : Section2332bPropertyAct p pr c)
    (hWithin : PropertyIsWithinUnitedStates pr c)
    (hRisk : CreatesSubstantialRiskOfSeriousBodilyInjury p pr c) :
    Section2332bPropertyRoute p pr c := ⟨hAct, hWithin, hRisk⟩

theorem section2332bProhibitedConduct_intro
    {p : Person} {v : Person} {pr : PropertyItem} {c : ComplaintText}
    (h : Section2332bPersonRoute p v c) :
    Section2332bProhibitedConduct p v pr c := .againstPerson h

theorem section2332bProhibitedConduct_intro_againstProperty
    {p : Person} {v : Person} {pr : PropertyItem} {c : ComplaintText}
    (h : Section2332bPropertyRoute p pr c) :
    Section2332bProhibitedConduct p v pr c := .againstProperty h



theorem section2332bA1_intro
    {p : Person} {v : Person} {pr : PropertyItem} {o : Offense} {c : ComplaintText}
    (hTranscends : ConductTranscendingNationalBoundaries o c)
    (hCircumstance : Section2332bCircumstance o c)
    (hConduct : Section2332bProhibitedConduct p v pr c)
    (hViolatesLaw : ViolatesLawOfStateOrUnitedStates o c) :
    Section2332bA1 p v pr o c :=
  ⟨hTranscends, hCircumstance, hConduct, hViolatesLaw⟩

theorem section2332bInchoateMode_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : ThreatensToCommitSection2332bOffense p o c) :
    Section2332bInchoateMode p o c := .threatens h

theorem section2332bInchoateMode_intro_attempts
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : AttemptsToCommitSection2332bOffense p o c) :
    Section2332bInchoateMode p o c := .attempts h

theorem section2332bInchoateMode_intro_conspires
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : ConspiresToCommitSection2332bOffense p o c) :
    Section2332bInchoateMode p o c := .conspires h

theorem section2332bA2_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (hMode : Section2332bInchoateMode p o c)
    (hObject : ObjectOffenseWouldViolateParagraph1 o c)
    (hTranscends : ConductTranscendingNationalBoundaries o c)
    (hCircumstance : Section2332bCircumstance o c) :
    Section2332bA2 p o c := ⟨hMode, hObject, hTranscends, hCircumstance⟩

theorem section2332bOffense_intro
    {p : Person} {v : Person} {pr : PropertyItem} {o : Offense} {c : ComplaintText}
    (h : Section2332bA1 p v pr o c) :
    Section2332bOffense p v pr o c := .substantive h

theorem section2332bOffense_intro_inchoate
    {p : Person} {v : Person} {pr : PropertyItem} {o : Offense} {c : ComplaintText}
    (h : Section2332bA2 p o c) :
    Section2332bOffense p v pr o c := .inchoate h

theorem section2332bDeathAggravator_intro
    {p : Person} {v : Person} {pr : PropertyItem} {o : Offense} {c : ComplaintText}
    (hOffense : Section2332bOffense p v pr o c)
    (hDeath : DeathResultedFromOffense o c) :
    Section2332bDeathAggravator p v pr o c := ⟨hOffense, hDeath⟩



theorem section2332bParticipantRole_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsPrincipalOrCoconspirator p o c) :
    Section2332bParticipantRole p o c := .principalOrCoconspirator h

theorem section2332bParticipantRole_intro_accessoryAfterTheFact
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsAccessoryAfterTheFact p o c) :
    Section2332bParticipantRole p o c := .accessoryAfterTheFact h

theorem section2332bJurisdictionOverParticipant_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (hRole : Section2332bParticipantRole p o c)
    (hCircumstance : Section2332bCircumstance o c) :
    Section2332bJurisdictionOverParticipant p o c := ⟨hRole, hCircumstance⟩



theorem federalCrimeOfTerrorism_intro
    {o : Offense} {c : ComplaintText}
    (hCalculated : CalculatedToInfluenceOrRetaliateAgainstGovernment o c)
    (hEnumerated : IsEnumeratedTerrorismOffense o c) :
    FederalCrimeOfTerrorism o c := ⟨hCalculated, hEnumerated⟩









theorem section2332bOffense_survives_jurisdictional_ignorance
    {p : Person} {v : Person} {pr : PropertyItem} {o : Offense} {c : ComplaintText}
    (hOffense : Section2332bOffense p v pr o c)
    (_hIgnorant : ¬ KnowsOfJurisdictionalBase p o c) :
    Section2332bOffense p v pr o c := hOffense

end Proving.USC.T18.Ch113B.Wmd.Part3.Elements
