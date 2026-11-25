






import Proving.USC.T18.Ch113B.Wmd.Elements.Statute
import Proving.USC.T18.Ch113B.Wmd.Elements.Doctrine

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Elements

open Proving.USC.Common




theorem weaponOfMassDestruction2332aC2_intro_destructiveDevice
    {w : Weapon} {c : ComplaintText} (h : IsDestructiveDevice921 w c) :
    WeaponOfMassDestruction2332aC2 w c := .destructiveDevice h


theorem weaponOfMassDestruction2332aC2_intro_chemical
    {w : Weapon} {c : ComplaintText} (h : IsToxicChemicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .chemical h


theorem weaponOfMassDestruction2332aC2_intro_biological
    {w : Weapon} {c : ComplaintText} (h : IsBiologicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .biological h


theorem weaponOfMassDestruction2332aC2_intro_radiological
    {w : Weapon} {c : ComplaintText} (h : IsRadiologicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .radiological h


theorem useModeWmd2332a_intro_uses
    {p : Person} {w : Weapon} {c : ComplaintText}
    (h : UsesWeaponOfMassDestruction p w c) : UseModeWmd2332a p w c := .uses h


theorem useModeWmd2332a_intro_threatens
    {p : Person} {w : Weapon} {c : ComplaintText}
    (h : ThreatensToUseWeaponOfMassDestruction p w c) : UseModeWmd2332a p w c := .threatens h


theorem useModeWmd2332a_intro_attempts
    {p : Person} {w : Weapon} {c : ComplaintText}
    (h : AttemptsToUseWeaponOfMassDestruction p w c) : UseModeWmd2332a p w c := .attempts h


theorem useModeWmd2332a_intro_conspires
    {p : Person} {w : Weapon} {c : ComplaintText} {ag : Agreement}
    (hAgree : AgreementAmongTwoOrMore ag c)
    (h : ConspiresToUseWeaponOfMassDestruction p w c) : UseModeWmd2332a p w c :=
  .conspires hAgree h


theorem nationalOutsideUS2332aA1_intro
    {v : Person} {c : ComplaintText}
    (hNational : IsNationalOfTheUnitedStates v c)
    (hOutside : IsOutsideTheUnitedStates v c) : NationalOutsideUS2332aA1 v c :=
  ⟨hNational, hOutside⟩


theorem interstateCircumstance2332aA2_intro_mailOrFacility
    {r : Property} {c : ComplaintText}
    (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance c) :
    InterstateCircumstance2332aA2 r c := .mailOrFacility h


theorem interstateCircumstance2332aA2_intro_propertyInCommerce
    {r : Property} {c : ComplaintText}
    (h : PropertyUsedInOrAffectingInterstateCommerce r c) :
    InterstateCircumstance2332aA2 r c := .propertyInCommerce h


theorem interstateCircumstance2332aA2_intro_perpetratorTravels
    {r : Property} {c : ComplaintText}
    (h : PerpetratorTravelsInInterstateCommerceInFurtherance c) :
    InterstateCircumstance2332aA2 r c := .perpetratorTravels h


theorem interstateCircumstance2332aA2_intro_offenseAffectsCommerce
    {r : Property} {c : ComplaintText}
    (h : OffenseAffectsInterstateCommerce c) :
    InterstateCircumstance2332aA2 r c := .offenseAffectsCommerce h


theorem targetWithinUS2332aA2_intro_person
    {v : Person} {r : Property} {c : ComplaintText} (h : IsPersonInUS v c) :
    TargetWithinUS2332aA2 v r c := .person h


theorem targetWithinUS2332aA2_intro_property
    {v : Person} {r : Property} {c : ComplaintText}
    (h : PropertyIsWithinTheUnitedStates r c) : TargetWithinUS2332aA2 v r c := .property h


theorem target2332aA2_intro
    {v : Person} {r : Property} {c : ComplaintText}
    (hTarget : TargetWithinUS2332aA2 v r c)
    (hCircumstance : InterstateCircumstance2332aA2 r c) : Target2332aA2 v r c :=
  ⟨hTarget, hCircumstance⟩


theorem foreignGovernmentPropertyWithinUS2332aA4_intro
    {r : Property} {c : ComplaintText}
    (hWithinUS : PropertyIsWithinTheUnitedStates r c)
    (hForeign : PropertyOwnedLeasedOrUsedByForeignGovernment r c) :
    ForeignGovernmentPropertyWithinUS2332aA4 r c := ⟨hWithinUS, hForeign⟩


theorem targetRoute2332aA_intro_nationalAbroad
    {v : Person} {r : Property} {c : ComplaintText} (h : NationalOutsideUS2332aA1 v c) :
    TargetRoute2332aA v r c := .nationalAbroad h


theorem targetRoute2332aA_intro_withinUS
    {v : Person} {r : Property} {c : ComplaintText} (h : Target2332aA2 v r c) :
    TargetRoute2332aA v r c := .withinUS h


theorem targetRoute2332aA_intro_unitedStatesProperty
    {v : Person} {r : Property} {c : ComplaintText}
    (h : PropertyOwnedLeasedOrUsedByUnitedStates r c) : TargetRoute2332aA v r c :=
  .unitedStatesProperty h


theorem targetRoute2332aA_intro_foreignGovernmentProperty
    {v : Person} {r : Property} {c : ComplaintText}
    (h : ForeignGovernmentPropertyWithinUS2332aA4 r c) : TargetRoute2332aA v r c :=
  .foreignGovernmentProperty h


theorem section2332aA_intro
    {p v : Person} {r : Property} {w : Weapon} {c : ComplaintText}
    (hScienter : ActedWithScienter p c)
    (hNoAuthority : ¬ ActsUnderLawfulAuthority p c)
    (hWeapon : IsWeaponOfMassDestruction w c)
    (hConduct : UseModeWmd2332a p w c)
    (hTarget : TargetRoute2332aA v r c) : Section2332aA p v r w c :=
  ⟨hScienter, hNoAuthority, hWeapon, hConduct, hTarget⟩


theorem section2332aB_intro
    {p : Person} {w : Weapon} {c : ComplaintText}
    (hNational : IsNationalOfTheUnitedStates p c)
    (hScienter : ActedWithScienter p c)
    (hNoAuthority : ¬ ActsUnderLawfulAuthority p c)
    (hWeapon : IsWeaponOfMassDestruction w c)
    (hConduct : UseModeWmd2332a p w c)
    (hOutside : ConductOccursOutsideTheUnitedStates c) : Section2332aB p w c :=
  ⟨hNational, hScienter, hNoAuthority, hWeapon, hConduct, hOutside⟩


theorem section2332aADeathResults_intro
    {p v : Person} {r : Property} {w : Weapon} {c : ComplaintText}
    (hOffense : Section2332aA p v r w c)
    (hDeath : DeathResultsFromOffenseConduct c) : Section2332aADeathResults p v r w c :=
  ⟨hOffense, hDeath⟩


theorem section2332aBDeathResults_intro
    {p : Person} {w : Weapon} {c : ComplaintText}
    (hOffense : Section2332aB p w c)
    (hDeath : DeathResultsFromOffenseConduct c) : Section2332aBDeathResults p w c :=
  ⟨hOffense, hDeath⟩




theorem transcendsNationalBoundaries2332bG1_intro
    {c : ComplaintText}
    (hWithin : ConductOccursWithinTheUnitedStates c)
    (hOutside : ConductOccursOutsideTheUnitedStates c) :
    TranscendsNationalBoundaries2332bG1 c := ⟨hWithin, hOutside⟩


theorem circumstance2332bB1_intro_mailOrFacility
    {v : Person} {r : Property} {c : ComplaintText}
    (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance c) :
    Circumstance2332bB1 v r c := .mailOrFacility h


theorem circumstance2332bB1_intro_obstructsCommerce
    {v : Person} {r : Property} {c : ComplaintText}
    (h : OffenseObstructsDelaysOrAffectsInterstateCommerce c) :
    Circumstance2332bB1 v r c := .obstructsCommerce h


theorem circumstance2332bB1_intro_governmentVictim
    {v : Person} {r : Property} {c : ComplaintText}
    (h : VictimIsUnitedStatesGovernmentOrOfficial v c) :
    Circumstance2332bB1 v r c := .governmentVictim h


theorem circumstance2332bB1_intro_governmentProperty
    {v : Person} {r : Property} {c : ComplaintText}
    (h : PropertyOwnedPossessedOrLeasedByUnitedStates r c) :
    Circumstance2332bB1 v r c := .governmentProperty h


theorem circumstance2332bB1_intro_territorialSea
    {v : Person} {r : Property} {c : ComplaintText}
    (h : OffenseCommittedInTerritorialSeaOfTheUnitedStates c) :
    Circumstance2332bB1 v r c := .territorialSea h


theorem circumstance2332bB1_intro_maritimeJurisdiction
    {v : Person} {r : Property} {c : ComplaintText}
    (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction c) :
    Circumstance2332bB1 v r c := .maritimeJurisdiction h


theorem violentActMode2332bA1A_intro_kills
    {p v : Person} {c : ComplaintText} (h : KillsVictim p v c) :
    ViolentActMode2332bA1A p v c := .kills h


theorem violentActMode2332bA1A_intro_kidnaps
    {p v : Person} {c : ComplaintText} (h : KidnapsVictim p v c) :
    ViolentActMode2332bA1A p v c := .kidnaps h


theorem violentActMode2332bA1A_intro_maims
    {p v : Person} {c : ComplaintText} (h : MaimsVictim p v c) :
    ViolentActMode2332bA1A p v c := .maims h


theorem violentActMode2332bA1A_intro_assaultSeriousBodilyInjury
    {p v : Person} {c : ComplaintText}
    (h : AssaultsVictimResultingInSeriousBodilyInjury p v c) :
    ViolentActMode2332bA1A p v c := .assaultSeriousBodilyInjury h


theorem violentActMode2332bA1A_intro_assaultDangerousWeapon
    {p v : Person} {c : ComplaintText} (h : AssaultsVictimWithDangerousWeapon p v c) :
    ViolentActMode2332bA1A p v c := .assaultDangerousWeapon h


theorem violentActAgainstPerson2332bA1A_intro
    {p v : Person} {c : ComplaintText}
    (hVictimWithinUS : IsPersonInUS v c)
    (hAct : ViolentActMode2332bA1A p v c) : ViolentActAgainstPerson2332bA1A p v c :=
  ⟨hVictimWithinUS, hAct⟩


theorem propertyAttackMode2332bA1B_intro_destroysOrDamages
    {p : Person} {r : Property} {c : ComplaintText}
    (h : DestroysOrDamagesProperty p r c) : PropertyAttackMode2332bA1B p r c :=
  .destroysOrDamages h


theorem propertyAttackMode2332bA1B_intro_attempts
    {p : Person} {r : Property} {c : ComplaintText}
    (h : AttemptsToDestroyOrDamageProperty p r c) : PropertyAttackMode2332bA1B p r c :=
  .attempts h


theorem propertyAttackMode2332bA1B_intro_conspires
    {p : Person} {r : Property} {c : ComplaintText} {ag : Agreement}
    (hAgree : AgreementAmongTwoOrMore ag c)
    (h : ConspiresToDestroyOrDamageProperty p r c) : PropertyAttackMode2332bA1B p r c :=
  .conspires hAgree h


theorem propertyAttack2332bA1B_intro
    {p : Person} {r : Property} {c : ComplaintText}
    (hPropertyWithinUS : PropertyIsWithinTheUnitedStates r c)
    (hMode : PropertyAttackMode2332bA1B p r c)
    (hRisk : CreatesSubstantialRiskOfSeriousBodilyInjury p c) :
    PropertyAttack2332bA1B p r c := ⟨hPropertyWithinUS, hMode, hRisk⟩


theorem prohibitedAct2332bA1_intro_againstPerson
    {p v : Person} {r : Property} {c : ComplaintText}
    (h : ViolentActAgainstPerson2332bA1A p v c) : ProhibitedAct2332bA1 p v r c :=
  .againstPerson h


theorem prohibitedAct2332bA1_intro_againstProperty
    {p v : Person} {r : Property} {c : ComplaintText}
    (h : PropertyAttack2332bA1B p r c) : ProhibitedAct2332bA1 p v r c := .againstProperty h


theorem inViolationOfLaw2332bA1_intro_stateLaw
    {p : Person} {c : ComplaintText} (h : ViolatesStateLawOffenseElements p c) :
    InViolationOfLaw2332bA1 p c := .stateLaw h


theorem inViolationOfLaw2332bA1_intro_federalLaw
    {p : Person} {c : ComplaintText} (h : ViolatesFederalLaw p c) :
    InViolationOfLaw2332bA1 p c := .federalLaw h


theorem section2332bA1_intro
    {p v : Person} {r : Property} {c : ComplaintText}
    (hScienter : ActedWithScienter p c)
    (hTranscends : ConductTranscendingNationalBoundaries c)
    (hCircumstance : Circumstance2332bB1 v r c)
    (hAct : ProhibitedAct2332bA1 p v r c)
    (hViolation : InViolationOfLaw2332bA1 p c) : Section2332bA1 p v r c :=
  ⟨hScienter, hTranscends, hCircumstance, hAct, hViolation⟩


theorem inchoateMode2332bA2_intro_threatens
    {p : Person} {c : ComplaintText}
    (h : ThreatensToCommitOffenseUnderSubsectionA1 p c) : InchoateMode2332bA2 p c :=
  .threatens h


theorem inchoateMode2332bA2_intro_attempts
    {p : Person} {c : ComplaintText}
    (h : AttemptsToCommitOffenseUnderSubsectionA1 p c) : InchoateMode2332bA2 p c :=
  .attempts h


theorem inchoateMode2332bA2_intro_conspires
    {p : Person} {c : ComplaintText} {ag : Agreement}
    (hAgree : AgreementAmongTwoOrMore ag c)
    (h : ConspiresToCommitOffenseUnderSubsectionA1 p c) : InchoateMode2332bA2 p c :=
  .conspires hAgree h


theorem section2332bA2_intro
    {p : Person} {c : ComplaintText}
    (hScienter : ActedWithScienter p c)
    (hInchoate : InchoateMode2332bA2 p c) : Section2332bA2 p c :=
  ⟨hScienter, hInchoate⟩


theorem jurisdiction2332bB2_intro
    {p : Person} {c : ComplaintText}
    (hRole : IsPrincipalCoconspiratorOrAccessoryAfterTheFact p c)
    (hCircumstance : CircumstanceAppliesToAtLeastOneOffender c) : Jurisdiction2332bB2 p c :=
  ⟨hRole, hCircumstance⟩


theorem section2332bA1DeathResults_intro
    {p v : Person} {r : Property} {c : ComplaintText}
    (hOffense : Section2332bA1 p v r c)
    (hDeath : DeathResultsFromOffenseConduct c) : Section2332bA1DeathResults p v r c :=
  ⟨hOffense, hDeath⟩


theorem federalCrimeOfTerrorism2332bG5_intro
    {o : Offense} {c : ComplaintText}
    (hMotive : CalculatedToInfluenceOrRetaliateAgainstGovernment o c)
    (hEnum : ViolatesEnumeratedTerrorismOffense o c) : FederalCrimeOfTerrorism2332bG5 o c :=
  ⟨hMotive, hEnum⟩

end Proving.USC.T18.Ch113B.Wmd.Elements
