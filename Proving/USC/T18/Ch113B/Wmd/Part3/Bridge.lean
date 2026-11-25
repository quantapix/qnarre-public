


































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Statute
import Proving.USC.T18.Ch113B.Wmd.Part3.Deontic.Statute
import Proving.USC.T18.Ch113B.Wmd.Part3.Ontology.Statute
import Proving.USC.T18.Ch113B.Wmd.Part3.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Bridge

open Proving.USC.Common








axiom weaponED : Elements.Weapon → Deontic.Weapon

axiom weaponEO : Elements.Weapon → Ontology.Weapon

axiom weaponDO : Deontic.Weapon → Ontology.Weapon



axiom weaponAlleged : Person → Ontology.Weapon


axiom targetPropED : Elements.Target → Deontic.Property

axiom targetPersonE : Elements.Target → Person

axiom propItemED : Elements.PropertyItem → Deontic.Property

axiom offenceEO : Elements.Offense → Ontology.Offense


axiom conductEO : Elements.Offense → Ontology.Conduct

axiom offencePropEO : Elements.Offense → Ontology.Property

axiom offenceWatersEO : Elements.Offense → Ontology.Waters


axiom offencePlaceEO : Elements.Offense → Ontology.Place

axiom offenceVictimE : Elements.Offense → Person



axiom offenceOfPersonO : Person → Ontology.Offense

axiom conductOfPersonO : Person → Ontology.Conduct

axiom propertyOfPersonO : Person → Ontology.Property


axiom watersOfPersonO : Person → Ontology.Waters


axiom placeOfPersonO : Person → Ontology.Place









axiom corrED_authority {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    ¬ Elements.HasLawfulAuthority p o c → Deontic.ActedWithoutLawfulAuthority p c



axiom corrED_wmd {w : Elements.Weapon} {c : ComplaintText} :
    Elements.WeaponOfMassDestruction2332aC2 w c →
    Deontic.IsWeaponOfMassDestruction (weaponED w) c




axiom corrED_conduct {p : Person} {w : Elements.Weapon} {ag : Agreement}
    {c : ComplaintText} :
    Elements.WmdConductMode p w ag c →
    Deontic.UsedThreatenedAttemptedOrConspiredToUseWmd p (weaponED w) c


axiom corrED_a1_national {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsNationalOfUnitedStates t c →
    Deontic.IsNationalOfTheUnitedStates (targetPersonE t) c



axiom corrED_a1_abroad {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsNationalOfUnitedStates t c →
    Elements.TargetIsOutsideUnitedStates t c →
    Deontic.TargetIsUnitedStatesNationalOutsideUnitedStates p (targetPersonE t) c


axiom corrED_a2_within {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsPersonOrPropertyWithinUnitedStates t c →
    Deontic.TargetIsPersonOrPropertyWithinUnitedStates p c


axiom corrED_a2A {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance o c →
    Deontic.MailOrFacilityOfInterstateCommerceUsedInFurtherance p c







axiom corrED_a2B_isProperty {t : Elements.Target} {c : ComplaintText} :
    Elements.PropertyUsedInOrAffectingInterstateCommerce t c →
    Deontic.IsRealOrPersonalProperty (targetPropED t) c


axiom corrED_a2B_commerce {t : Elements.Target} {c : ComplaintText} :
    Elements.PropertyUsedInOrAffectingInterstateCommerce t c →
    Deontic.PropertyUsedInOrAffectingInterstateCommerce (targetPropED t) c


axiom corrED_a2C {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.PerpetratorTravelsInInterstateCommerceInFurtherance o c →
    Deontic.PerpetratorTravelsInInterstateCommerceInFurtherance p c




axiom corrED_a2D {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseAffectsOrWouldAffectInterstateCommerce o c →
    Deontic.OffenseAffectsInterstateOrForeignCommerce p c


axiom corrED_a3_isProperty {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsUnitedStatesProperty t c →
    Deontic.IsRealOrPersonalProperty (targetPropED t) c


axiom corrED_a3 {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsUnitedStatesProperty t c →
    Deontic.TargetIsPropertyOfTheUnitedStates (targetPropED t) c


axiom corrED_a4_isProperty {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsForeignGovernmentPropertyWithinUnitedStates t c →
    Deontic.IsRealOrPersonalProperty (targetPropED t) c


axiom corrED_a4 {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsForeignGovernmentPropertyWithinUnitedStates t c →
    Deontic.TargetIsForeignGovernmentPropertyWithinUnitedStates (targetPropED t) c


axiom corrED_b_national {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates p c → Deontic.IsNationalOfTheUnitedStates p c


axiom corrED_b_outside {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurredOutsideUnitedStates o c →
    Deontic.ConductOccurredOutsideTheUnitedStates p c






theorem targetCircumstance_ED {p : Person} {o : Elements.Offense}
    {t : Elements.Target} {c : ComplaintText}
    (h : Elements.Section2332aTargetCircumstance o t c) :
    Deontic.Condition2332aA p (targetPersonE t) (targetPropED t) c :=
  match h with
  | .nationalAbroad hn =>
      .nationalAbroad (corrED_a1_national hn.isNational)
        (corrED_a1_abroad hn.isNational hn.outsideUnitedStates)
  | .domesticWithCommerceHook hd =>
      .withinUnitedStates (corrED_a2_within hd.withinUnitedStates)
        (match hd.commerceHook with
         | .mailOrFacility hm => .mailOrFacility (corrED_a2A hm)
         | .propertyInCommerce hp =>
             .propertyInCommerce (corrED_a2B_isProperty hp) (corrED_a2B_commerce hp)
         | .perpetratorTravels ht => .perpetratorTravel (corrED_a2C ht)
         | .offenseAffectsCommerce he => .commerceEffect (corrED_a2D he))
  | .unitedStatesProperty hu =>
      .unitedStatesProperty (corrED_a3_isProperty hu) (corrED_a3 hu)
  | .foreignGovernmentProperty hf =>
      .foreignGovernmentProperty (corrED_a4_isProperty hf) (corrED_a4 hf)




theorem s2332aA_elements_implies_deontic {p : Person} {w : Elements.Weapon}
    {ag : Agreement} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText}
    (h : Elements.Section2332aA p w ag o t c) :
    Deontic.Prohibition2332aAViolated p (weaponED w) (targetPersonE t)
      (targetPropED t) c :=
  ⟨⟨corrED_authority h.lawfulAuthorityAbsent, corrED_wmd h.weapon,
    targetCircumstance_ED h.targetCircumstance⟩,
   corrED_conduct h.conduct⟩


theorem s2332aB_elements_implies_deontic {p : Person} {w : Elements.Weapon}
    {ag : Agreement} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332aB p w ag o c) :
    Deontic.Prohibition2332aBViolated p (weaponED w) c :=
  ⟨⟨corrED_b_national h.nationalOfUnitedStates,
    corrED_authority h.lawfulAuthorityAbsent, corrED_wmd h.weapon,
    corrED_b_outside h.outsideUnitedStates⟩,
   corrED_conduct h.conduct⟩




theorem s2332a_elements_implies_deontic {p : Person} {w : Elements.Weapon}
    {ag : Agreement} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText}
    (h : Elements.Section2332aViolation p w ag o t c) :
    Deontic.Prohibition2332aAViolated p (weaponED w) (targetPersonE t)
        (targetPropED t) c ∨
      Deontic.Prohibition2332aBViolated p (weaponED w) c :=
  match h with
  | .subsectionA ha => Or.inl (s2332aA_elements_implies_deontic ha)
  | .subsectionB hb => Or.inr (s2332aB_elements_implies_deontic hb)










axiom corrEP_conduct {p : Person} {w : Elements.Weapon} {ag : Agreement}
    {c : ComplaintText} :
    Elements.WmdConductMode p w ag c → Elements.WeaponOfMassDestruction2332aC2 w c →
    Procedure.Conduct2332aAlleged p c


axiom corrEP_base_a1 {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.NationalAbroadTarget t c →
    Procedure.Base2332aEstablished Procedure.Base2332a.againstNationalAbroad p c



axiom corrEP_base_a2A {p : Person} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText} :
    Elements.TargetIsPersonOrPropertyWithinUnitedStates t c →
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance o c →
    Procedure.Base2332aEstablished
      (Procedure.Base2332a.againstPersonOrPropertyInUS
        Procedure.Nexus2332a.mailOrFacilityOfCommerceUsed) p c


axiom corrEP_base_a2B {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsPersonOrPropertyWithinUnitedStates t c →
    Elements.PropertyUsedInOrAffectingInterstateCommerce t c →
    Procedure.Base2332aEstablished
      (Procedure.Base2332a.againstPersonOrPropertyInUS
        Procedure.Nexus2332a.propertyUsedInOrAffectingCommerce) p c


axiom corrEP_base_a2C {p : Person} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText} :
    Elements.TargetIsPersonOrPropertyWithinUnitedStates t c →
    Elements.PerpetratorTravelsInInterstateCommerceInFurtherance o c →
    Procedure.Base2332aEstablished
      (Procedure.Base2332a.againstPersonOrPropertyInUS
        Procedure.Nexus2332a.perpetratorTravelsInCommerce) p c


axiom corrEP_base_a2D {p : Person} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText} :
    Elements.TargetIsPersonOrPropertyWithinUnitedStates t c →
    Elements.OffenseAffectsOrWouldAffectInterstateCommerce o c →
    Procedure.Base2332aEstablished
      (Procedure.Base2332a.againstPersonOrPropertyInUS
        Procedure.Nexus2332a.offenseAffectsInterstateCommerce) p c


axiom corrEP_base_a3 {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsUnitedStatesProperty t c →
    Procedure.Base2332aEstablished
      Procedure.Base2332a.againstUnitedStatesProperty p c


axiom corrEP_base_a4 {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsForeignGovernmentPropertyWithinUnitedStates t c →
    Procedure.Base2332aEstablished
      Procedure.Base2332a.againstForeignGovernmentPropertyInUS p c


axiom corrEP_national {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates p c → Procedure.IsNationalOfTheUnitedStates p c


axiom corrEP_base_b {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates p c →
    Elements.ConductOccurredOutsideUnitedStates o c →
    Procedure.Base2332aEstablished Procedure.Base2332a.nationalUsingAbroad p c


theorem jurisdiction_EP {p : Person} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText} (h : Elements.Section2332aTargetCircumstance o t c) :
    Procedure.Jurisdiction2332a p c :=
  match h with
  | .nationalAbroad hn => .viaSubsectionA _ (corrEP_base_a1 hn)
  | .domesticWithCommerceHook hd =>
      match hd.commerceHook with
      | .mailOrFacility hm =>
          .viaSubsectionA _ (corrEP_base_a2A hd.withinUnitedStates hm)
      | .propertyInCommerce hp =>
          .viaSubsectionA _ (corrEP_base_a2B hd.withinUnitedStates hp)
      | .perpetratorTravels ht =>
          .viaSubsectionA _ (corrEP_base_a2C hd.withinUnitedStates ht)
      | .offenseAffectsCommerce he =>
          .viaSubsectionA _ (corrEP_base_a2D hd.withinUnitedStates he)
  | .unitedStatesProperty hu => .viaSubsectionA _ (corrEP_base_a3 hu)
  | .foreignGovernmentProperty hf => .viaSubsectionA _ (corrEP_base_a4 hf)



theorem s2332a_elements_implies_procedure {p : Person} {w : Elements.Weapon}
    {ag : Agreement} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText}
    (h : Elements.Section2332aViolation p w ag o t c) :
    Procedure.ProsecutionGrounded2332a p c :=
  match h with
  | .subsectionA ha =>
      ⟨corrEP_conduct ha.conduct ha.weapon, jurisdiction_EP ha.targetCircumstance⟩
  | .subsectionB hb =>
      ⟨corrEP_conduct hb.conduct hb.weapon,
       .viaSubsectionB (corrEP_national hb.nationalOfUnitedStates)
         (corrEP_base_b hb.nationalOfUnitedStates hb.outsideUnitedStates)⟩









axiom corrEO_wmd {w : Elements.Weapon} {c : ComplaintText} :
    Elements.WeaponOfMassDestruction2332aC2 w c →
    Ontology.IsWeaponOfMassDestruction (weaponEO w) c



axiom corrEO_destructiveDevice {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsDestructiveDevice w c →
    Ontology.IsDestructiveDevice (weaponEO w) c


axiom corrDO_wmd {w : Deontic.Weapon} {c : ComplaintText} :
    Deontic.IsWeaponOfMassDestruction w c →
    Ontology.IsWeaponOfMassDestruction (weaponDO w) c




axiom corrPO_wmd {p : Person} {c : ComplaintText} :
    Procedure.Conduct2332aAlleged p c →
    Ontology.IsWeaponOfMassDestruction (weaponAlleged p) c




theorem s2332a_elements_implies_ontology {p : Person} {w : Elements.Weapon}
    {ag : Agreement} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText}
    (h : Elements.Section2332aViolation p w ag o t c) :
    Ontology.IsWeaponOfMassDestruction (weaponEO w) c :=
  match h with
  | .subsectionA ha => corrEO_wmd ha.weapon
  | .subsectionB hb => corrEO_wmd hb.weapon





theorem s2332a_elements_implies_ontology_destructiveDeviceRoute
    {w : Elements.Weapon} {c : ComplaintText}
    (hCase : Elements.IsDestructiveDevice w c)
    (hWmd : Elements.WeaponOfMassDestruction2332aC2 w c) :
    Ontology.WeaponOfMassDestructionMembership (weaponEO w) c :=
  .destructiveDevice (corrEO_destructiveDevice hCase) (corrEO_wmd hWmd)


theorem s2332a_deontic_implies_ontology {p : Person} {w : Deontic.Weapon}
    {v : Person} {pr : Deontic.Property} {c : ComplaintText}
    (h : Deontic.Prohibition2332aAViolated p w v pr c) :
    Ontology.IsWeaponOfMassDestruction (weaponDO w) c :=
  corrDO_wmd h.1.weapon




theorem s2332a_procedure_implies_ontology {p : Person} {c : ComplaintText}
    (h : Procedure.ProsecutionGrounded2332a p c) :
    Ontology.IsWeaponOfMassDestruction (weaponAlleged p) c :=
  corrPO_wmd h.conduct













axiom corrEO_radiological {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsRadiologicalWeapon w c → Ontology.IsRadiologicalWeapon (weaponEO w) c


axiom corrEO_chemical {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsChemicalWeapon w c → Ontology.IsChemicalWeapon (weaponEO w) c




theorem diag_s2332a_elements_ontology_radiologicalRoute_modulo_gaps
    {w : Elements.Weapon} {c : ComplaintText}
    (gap_design : Ontology.DesignedToReleaseDangerousRadiation (weaponEO w) c)
    (hCase : Elements.IsRadiologicalWeapon w c)
    (hWmd : Elements.WeaponOfMassDestruction2332aC2 w c) :
    Ontology.WeaponOfMassDestructionMembership (weaponEO w) c :=
  .radiological ⟨gap_design, corrEO_radiological hCase⟩ (corrEO_wmd hWmd)




theorem diag_s2332a_elements_ontology_chemicalRoute_modulo_gaps
    {w : Elements.Weapon} {ch : Ontology.ToxicChemical} {c : ComplaintText}
    (gap_chemical : Ontology.IsToxicOrPoisonousChemicalOrPrecursor ch c)
    (gap_design : Ontology.DesignedOrIntendedToCauseDeathOrSeriousBodilyInjury
        (weaponEO w) c)
    (gap_mechanism : Ontology.ActsByReleaseDisseminationOrImpactOfToxicChemicals
        (weaponEO w) ch c)
    (hCase : Elements.IsChemicalWeapon w c)
    (hWmd : Elements.WeaponOfMassDestruction2332aC2 w c) :
    Ontology.WeaponOfMassDestructionMembership (weaponEO w) c :=
  .chemical ⟨gap_chemical, gap_design, gap_mechanism, corrEO_chemical hCase⟩
    (corrEO_wmd hWmd)




axiom corrDP_conduct {p : Person} {w : Deontic.Weapon} {c : ComplaintText} :
    Deontic.UsedThreatenedAttemptedOrConspiredToUseWmd p w c →
    Deontic.IsWeaponOfMassDestruction w c → Procedure.Conduct2332aAlleged p c


axiom corrDP_base_a1 {p : Person} {v : Person} {c : ComplaintText} :
    Deontic.TargetIsUnitedStatesNationalOutsideUnitedStates p v c →
    Procedure.Base2332aEstablished Procedure.Base2332a.againstNationalAbroad p c






axiom corrDP_base_a2 {p : Person} {pr : Deontic.Property}
    {c : ComplaintText} :
    Deontic.TargetIsPersonOrPropertyWithinUnitedStates p c →
    Deontic.Wmd2332aCommerceNexus p pr c →
    ∃ n : Procedure.Nexus2332a,
      Procedure.Base2332aEstablished
        (Procedure.Base2332a.againstPersonOrPropertyInUS n) p c


axiom corrDP_base_a3 {p : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.TargetIsPropertyOfTheUnitedStates pr c →
    Procedure.Base2332aEstablished
      Procedure.Base2332a.againstUnitedStatesProperty p c


axiom corrDP_base_a4 {p : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.TargetIsForeignGovernmentPropertyWithinUnitedStates pr c →
    Procedure.Base2332aEstablished
      Procedure.Base2332a.againstForeignGovernmentPropertyInUS p c


theorem s2332a_deontic_implies_procedure {p : Person} {w : Deontic.Weapon}
    {v : Person} {pr : Deontic.Property} {c : ComplaintText}
    (h : Deontic.Prohibition2332aAViolated p w v pr c) :
    Procedure.ProsecutionGrounded2332a p c :=
  ⟨corrDP_conduct h.2 h.1.weapon,
   match h.1.condition with
   | .nationalAbroad _ hAbroad => .viaSubsectionA _ (corrDP_base_a1 hAbroad)
   | .withinUnitedStates hWithin hNexus =>
       match corrDP_base_a2 hWithin hNexus with
       | ⟨_, hBase⟩ => .viaSubsectionA _ hBase
   | .unitedStatesProperty _ hUs => .viaSubsectionA _ (corrDP_base_a3 hUs)
   | .foreignGovernmentProperty _ hFg => .viaSubsectionA _ (corrDP_base_a4 hFg)⟩






axiom corrED_b_transcends {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductTranscendingNationalBoundaries o c →
    Deontic.ConductTranscendsNationalBoundaries p c


axiom corrED_b_unlawful {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesLawOfStateOrUnitedStates o c →
    Deontic.ConductViolatesLawsOfAStateOrTheUnitedStates p c


axiom corrED_c1A {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance o c →
    Deontic.MailOrFacilityOfInterstateCommerceUsedInFurtherance p c

axiom corrED_c1B {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseObstructsDelaysOrAffectsInterstateCommerce o c →
    Deontic.OffenseAffectsInterstateOrForeignCommerce p c

axiom corrED_c1C {v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrOfficer o c →
    Deontic.VictimIsUnitedStatesGovernmentOrFederalOfficial v c

axiom corrED_c1D {pr : Deontic.Property} {o : Elements.Offense} {c : ComplaintText} :
    Elements.PropertyInvolvedIsUnitedStatesOwned o c →
    Deontic.PropertyIsOwnedPossessedOrLeasedByTheUnitedStates pr c

axiom corrED_c1E {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedInTerritorialSea o c →
    Deontic.OffenseCommittedInTerritorialSeaOfTheUnitedStates p c

axiom corrED_c1F {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c →
    Deontic.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction p c




theorem circumstance_ED {p : Person} {v : Person} {pr : Deontic.Property}
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bCircumstance o c) :
    Deontic.Circumstance2332bB1 p v pr c :=
  match h with
  | .mailOrFacility hm => .mailOrFacility (corrED_c1A hm)
  | .commerceObstructed hb => .commerceEffect (corrED_c1B hb)
  | .federalVictim hv => .federalVictim (corrED_c1C hv)
  | .federalProperty hp => .federalProperty (corrED_c1D hp)
  | .territorialSea hs => .territorialSea (corrED_c1E hs)
  | .specialMaritimeJurisdiction hj => .specialMaritimeJurisdiction (corrED_c1F hj)




axiom corrED_kill {p v : Person} {c : ComplaintText} :
    Elements.KillsPerson p v c → IsPersonInUS v c →
    Deontic.KilledKidnappedOrMaimedPersonWithinUnitedStates p v c

axiom corrED_kidnap {p v : Person} {c : ComplaintText} :
    Elements.KidnapsPerson p v c → IsPersonInUS v c →
    Deontic.KilledKidnappedOrMaimedPersonWithinUnitedStates p v c

axiom corrED_maim {p v : Person} {c : ComplaintText} :
    Elements.MaimsPerson p v c → IsPersonInUS v c →
    Deontic.KilledKidnappedOrMaimedPersonWithinUnitedStates p v c

axiom corrED_assaultSbi {p v : Person} {c : ComplaintText} :
    Elements.CommitsAssaultResultingInSeriousBodilyInjury p v c →
    IsPersonInUS v c → Deontic.AssaultedPersonWithinUnitedStates p v c

axiom corrED_assaultWeapon {p v : Person} {c : ComplaintText} :
    Elements.AssaultsWithDangerousWeapon p v c → IsPersonInUS v c →
    Deontic.AssaultedPersonWithinUnitedStates p v c



axiom corrED_propertyRisk {p : Person} {pr : Elements.PropertyItem}
    {c : ComplaintText} :
    Elements.Section2332bPropertyAct p pr c →
    Elements.PropertyIsWithinUnitedStates pr c →
    Elements.CreatesSubstantialRiskOfSeriousBodilyInjury p pr c →
    Deontic.CreatedSubstantialRiskOfSeriousBodilyInjuryByDamagingProperty p
      (propItemED pr) c


theorem act_ED {p v : Person} {pr : Elements.PropertyItem} {c : ComplaintText}
    (h : Elements.Section2332bProhibitedConduct p v pr c) :
    Deontic.Act2332bA1 p v (propItemED pr) c :=
  match h with
  | .againstPerson hp =>
      match hp.act with
      | .kills hk => .violentAct (corrED_kill hk hp.victimWithinUnitedStates)
      | .kidnaps hk => .violentAct (corrED_kidnap hk hp.victimWithinUnitedStates)
      | .maims hm => .violentAct (corrED_maim hm hp.victimWithinUnitedStates)
      | .assaultSeriousBodilyInjury ha =>
          .assault (corrED_assaultSbi ha hp.victimWithinUnitedStates)
      | .assaultDangerousWeapon ha =>
          .assault (corrED_assaultWeapon ha hp.victimWithinUnitedStates)
  | .againstProperty hq =>
      .propertyRisk (corrED_propertyRisk hq.act hq.propertyWithinUnitedStates
        hq.substantialRisk)


axiom corrED_inchoate {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.Section2332bInchoateMode p o c →
    Deontic.ThreatenedAttemptedOrConspiredToCommitSection2332bOffense p c






axiom corrED_objectUnlawful {p : Person} {o : Elements.Offense}
    {c : ComplaintText} :
    Elements.ObjectOffenseWouldViolateParagraph1 o c →
    Deontic.ConductViolatesLawsOfAStateOrTheUnitedStates p c


theorem s2332bA1_elements_implies_deontic {p v : Person}
    {pr : Elements.PropertyItem} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bA1 p v pr o c) :
    Deontic.Prohibition2332bA1Violated p v (propItemED pr) c :=
  ⟨⟨corrED_b_transcends h.transcendsNationalBoundaries,
    circumstance_ED h.circumstance,
    corrED_b_unlawful h.violatesStateOrFederalLaw⟩,
   act_ED h.conduct⟩


theorem s2332bA2_elements_implies_deontic {p v : Person}
    {pr : Elements.PropertyItem} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bA2 p o c) :
    Deontic.Prohibition2332bA2Violated p v (propItemED pr) c :=
  ⟨⟨⟨corrED_b_transcends h.transcendsNationalBoundaries,
     circumstance_ED (o := o) h.circumstance,
     corrED_objectUnlawful h.objectWouldViolateParagraph1⟩⟩,
   corrED_inchoate h.mode⟩


theorem s2332b_elements_implies_deontic {p v : Person}
    {pr : Elements.PropertyItem} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bOffense p v pr o c) :
    Deontic.Prohibition2332bA1Violated p v (propItemED pr) c ∨
      Deontic.Prohibition2332bA2Violated p v (propItemED pr) c :=
  match h with
  | .substantive h1 => Or.inl (s2332bA1_elements_implies_deontic h1)
  | .inchoate h2 => Or.inr (s2332bA2_elements_implies_deontic (v := v) (pr := pr) h2)




axiom corrEP_b_conduct {p v : Person} {pr : Elements.PropertyItem}
    {c : ComplaintText} :
    Elements.Section2332bProhibitedConduct p v pr c → Procedure.Conduct2332bAlleged p c

axiom corrEP_b_inchoate {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.Section2332bInchoateMode p o c →
    Elements.ObjectOffenseWouldViolateParagraph1 o c →
    Procedure.Inchoate2332bAlleged p c

axiom corrEP_b_transcends {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductTranscendingNationalBoundaries o c →
    Procedure.ConductTranscendsNationalBoundaries p c

axiom corrEP_b_unlawful {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesLawOfStateOrUnitedStates o c →
    Procedure.ViolatesStateOrFederalLaw p c


axiom corrEP_b_objectUnlawful {p : Person} {o : Elements.Offense}
    {c : ComplaintText} :
    Elements.ObjectOffenseWouldViolateParagraph1 o c →
    Procedure.ViolatesStateOrFederalLaw p c



axiom corrEP_b_principal {p v : Person} {pr : Elements.PropertyItem}
    {c : ComplaintText} :
    Elements.Section2332bProhibitedConduct p v pr c →
    Procedure.HasRole Procedure.OffenderRole.principal p c


axiom corrEP_b_principalInchoate {p : Person} {o : Elements.Offense}
    {c : ComplaintText} :
    Elements.Section2332bInchoateMode p o c →
    Procedure.HasRole Procedure.OffenderRole.principal p c

axiom corrEP_b_selfOffender {p : Person} {c : ComplaintText} :
    Procedure.HasRole Procedure.OffenderRole.principal p c →
    Procedure.CoOffenderInSameOffense p p c


axiom corrEP_c1A {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance o c →
    Procedure.Circumstance2332bPresentAsTo
      Procedure.Circumstance2332b.mailOrFacilityOfCommerceUsed p c

axiom corrEP_c1B {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseObstructsDelaysOrAffectsInterstateCommerce o c →
    Procedure.Circumstance2332bPresentAsTo
      Procedure.Circumstance2332b.offenseAffectsInterstateCommerce p c

axiom corrEP_c1C {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrOfficer o c →
    Procedure.Circumstance2332bPresentAsTo
      Procedure.Circumstance2332b.victimIsUnitedStatesGovernmentOrOfficial p c

axiom corrEP_c1D {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.PropertyInvolvedIsUnitedStatesOwned o c →
    Procedure.Circumstance2332bPresentAsTo
      Procedure.Circumstance2332b.propertyOwnedPossessedOrLeasedByUnitedStates p c

axiom corrEP_c1E {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedInTerritorialSea o c →
    Procedure.Circumstance2332bPresentAsTo
      Procedure.Circumstance2332b.committedInTerritorialSea p c

axiom corrEP_c1F {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c →
    Procedure.Circumstance2332bPresentAsTo
      Procedure.Circumstance2332b.committedInSpecialMaritimeAndTerritorialJurisdiction
      p c



theorem circumstanceAsTo_EP {p : Person} {o : Elements.Offense}
    {c : ComplaintText} (h : Elements.Section2332bCircumstance o c) :
    ∃ x : Procedure.Circumstance2332b, Procedure.Circumstance2332bPresentAsTo x p c :=
  match h with
  | .mailOrFacility hm => ⟨_, corrEP_c1A hm⟩
  | .commerceObstructed hb => ⟨_, corrEP_c1B hb⟩
  | .federalVictim hv => ⟨_, corrEP_c1C hv⟩
  | .federalProperty hq => ⟨_, corrEP_c1D hq⟩
  | .territorialSea hs => ⟨_, corrEP_c1E hs⟩
  | .specialMaritimeJurisdiction hj => ⟨_, corrEP_c1F hj⟩


theorem s2332b_elements_implies_procedure {p v : Person}
    {pr : Elements.PropertyItem} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bOffense p v pr o c) :
    Procedure.ProsecutionGrounded2332b p c :=
  match h with
  | .substantive h1 =>
      ⟨.substantive (corrEP_b_conduct h1.conduct),
       corrEP_b_transcends h1.transcendsNationalBoundaries,
       corrEP_b_unlawful h1.violatesStateOrFederalLaw,
       ⟨⟨_, corrEP_b_principal h1.conduct⟩,
        match circumstanceAsTo_EP (p := p) h1.circumstance with
        | ⟨x, hx⟩ => ⟨p, x, corrEP_b_selfOffender (corrEP_b_principal h1.conduct), hx⟩⟩⟩
  | .inchoate h2 =>
      ⟨.inchoate (corrEP_b_inchoate h2.mode h2.objectWouldViolateParagraph1),
       corrEP_b_transcends h2.transcendsNationalBoundaries,
       corrEP_b_objectUnlawful h2.objectWouldViolateParagraph1,
       ⟨⟨_, corrEP_b_principalInchoate h2.mode⟩,
        match circumstanceAsTo_EP (p := p) h2.circumstance with
        | ⟨x, hx⟩ =>
            ⟨p, x, corrEP_b_selfOffender (corrEP_b_principalInchoate h2.mode), hx⟩⟩⟩











axiom corrEO_transcends {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductTranscendingNationalBoundaries o c →
    Ontology.IsConductTranscendingNationalBoundaries (conductEO o) c

axiom corrEO_c1A {o : Elements.Offense} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance o c →
    Ontology.JurisdictionalCircumstance (offenceEO o) c

axiom corrEO_c1B {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseObstructsDelaysOrAffectsInterstateCommerce o c →
    Ontology.OffenseObstructsDelaysOrAffectsInterstateCommerce (offenceEO o) c

axiom corrEO_c1C {o : Elements.Offense} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrOfficer o c →
    Ontology.VictimIsUnitedStatesGovernmentOrOfficer (offenceEO o)
      (offenceVictimE o) c

axiom corrEO_c1D_isProperty {o : Elements.Offense} {c : ComplaintText} :
    Elements.PropertyInvolvedIsUnitedStatesOwned o c →
    Ontology.IsProperty (offencePropEO o) c

axiom corrEO_c1D {o : Elements.Offense} {c : ComplaintText} :
    Elements.PropertyInvolvedIsUnitedStatesOwned o c →
    Ontology.PropertyOwnedPossessedOrLeasedByUnitedStates (offencePropEO o) c


axiom corrEO_c1E_isSea {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedInTerritorialSea o c →
    Ontology.IsTerritorialSeaOfTheUnitedStates (offenceWatersEO o) c

axiom corrEO_c1E {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedInTerritorialSea o c →
    Ontology.CommittedInTerritorialSeaOfTheUnitedStates (offenceEO o)
      (offenceWatersEO o) c

axiom corrEO_c1F {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c →
    Ontology.CommittedWithinSpecialMaritimeAndTerritorialJurisdiction
      (offenceEO o) (offencePlaceEO o) c


theorem circumstance_EO {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bCircumstance o c) :
    Ontology.JurisdictionalCircumstance (offenceEO o) c :=
  match h with
  | .mailOrFacility hm => corrEO_c1A hm
  | .commerceObstructed hb => .affectsCommerce (corrEO_c1B hb)
  | .federalVictim hv => .federalVictim (corrEO_c1C hv)
  | .federalProperty hq => .federalProperty (corrEO_c1D_isProperty hq) (corrEO_c1D hq)
  | .territorialSea hs => .territorialSea (corrEO_c1E_isSea hs) (corrEO_c1E hs)
  | .specialMaritimeJurisdiction hj => .specialMaritimeJurisdiction (corrEO_c1F hj)




theorem s2332b_elements_implies_ontology {p v : Person}
    {pr : Elements.PropertyItem} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bOffense p v pr o c) :
    Ontology.IsConductTranscendingNationalBoundaries (conductEO o) c ∧
      Ontology.JurisdictionalCircumstance (offenceEO o) c :=
  match h with
  | .substantive h1 =>
      ⟨corrEO_transcends h1.transcendsNationalBoundaries,
       circumstance_EO h1.circumstance⟩
  | .inchoate h2 =>
      ⟨corrEO_transcends h2.transcendsNationalBoundaries,
       circumstance_EO h2.circumstance⟩


axiom corrDO_transcends {p : Person} {c : ComplaintText} :
    Deontic.ConductTranscendsNationalBoundaries p c →
    Ontology.IsConductTranscendingNationalBoundaries (conductOfPersonO p) c


axiom corrDO_c1A {p : Person} {c : ComplaintText} :
    Deontic.MailOrFacilityOfInterstateCommerceUsedInFurtherance p c →
    Ontology.JurisdictionalCircumstance (offenceOfPersonO p) c

axiom corrDO_c1B {p : Person} {c : ComplaintText} :
    Deontic.OffenseAffectsInterstateOrForeignCommerce p c →
    Ontology.OffenseObstructsDelaysOrAffectsInterstateCommerce
      (offenceOfPersonO p) c

axiom corrDO_c1C {p v : Person} {c : ComplaintText} :
    Deontic.VictimIsUnitedStatesGovernmentOrFederalOfficial v c →
    Ontology.VictimIsUnitedStatesGovernmentOrOfficer (offenceOfPersonO p) v c

axiom corrDO_c1D_isProperty {p : Person} {pr : Deontic.Property}
    {c : ComplaintText} :
    Deontic.PropertyIsOwnedPossessedOrLeasedByTheUnitedStates pr c →
    Ontology.IsProperty (propertyOfPersonO p) c

axiom corrDO_c1D {p : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.PropertyIsOwnedPossessedOrLeasedByTheUnitedStates pr c →
    Ontology.PropertyOwnedPossessedOrLeasedByUnitedStates (propertyOfPersonO p) c

axiom corrDO_c1E_isSea {p : Person} {c : ComplaintText} :
    Deontic.OffenseCommittedInTerritorialSeaOfTheUnitedStates p c →
    Ontology.IsTerritorialSeaOfTheUnitedStates (watersOfPersonO p) c

axiom corrDO_c1E {p : Person} {c : ComplaintText} :
    Deontic.OffenseCommittedInTerritorialSeaOfTheUnitedStates p c →
    Ontology.CommittedInTerritorialSeaOfTheUnitedStates (offenceOfPersonO p)
      (watersOfPersonO p) c

axiom corrDO_c1F {p : Person} {c : ComplaintText} :
    Deontic.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction p c →
    Ontology.CommittedWithinSpecialMaritimeAndTerritorialJurisdiction
      (offenceOfPersonO p) (placeOfPersonO p) c


theorem circumstance_DO {p v : Person} {pr : Deontic.Property} {c : ComplaintText}
    (h : Deontic.Circumstance2332bB1 p v pr c) :
    Ontology.JurisdictionalCircumstance (offenceOfPersonO p) c :=
  match h with
  | .mailOrFacility hm => corrDO_c1A hm
  | .commerceEffect hb => .affectsCommerce (corrDO_c1B hb)
  | .federalVictim hv => .federalVictim (corrDO_c1C (p := p) hv)
  | .federalProperty hq => .federalProperty (corrDO_c1D_isProperty (p := p) hq)
      (corrDO_c1D (p := p) hq)
  | .territorialSea hs => .territorialSea (corrDO_c1E_isSea hs) (corrDO_c1E hs)
  | .specialMaritimeJurisdiction hj => .specialMaritimeJurisdiction (corrDO_c1F hj)


theorem s2332b_deontic_implies_ontology {p v : Person} {pr : Deontic.Property}
    {c : ComplaintText} (h : Deontic.Prohibition2332bA1Violated p v pr c) :
    Ontology.IsConductTranscendingNationalBoundaries (conductOfPersonO p) c ∧
      Ontology.JurisdictionalCircumstance (offenceOfPersonO p) c :=
  ⟨corrDO_transcends h.1.transnational, circumstance_DO h.1.circumstance⟩


axiom corrPO_transcends {p : Person} {c : ComplaintText} :
    Procedure.ConductTranscendsNationalBoundaries p c →
    Ontology.IsConductTranscendingNationalBoundaries (conductOfPersonO p) c



axiom corrPO_circumstance {p o : Person} {x : Procedure.Circumstance2332b}
    {c : ComplaintText} :
    Procedure.Circumstance2332bPresentAsTo x o c →
    Procedure.CoOffenderInSameOffense o p c →
    Ontology.JurisdictionalCircumstance (offenceOfPersonO p) c


theorem s2332b_procedure_implies_ontology {p : Person} {c : ComplaintText}
    (h : Procedure.ProsecutionGrounded2332b p c) :
    Ontology.IsConductTranscendingNationalBoundaries (conductOfPersonO p) c ∧
      Ontology.JurisdictionalCircumstance (offenceOfPersonO p) c :=
  ⟨corrPO_transcends h.transcends,
   match h.jurisdiction.circumstance with
   | ⟨_, _, hCo, hCirc⟩ => corrPO_circumstance hCirc hCo⟩




axiom corrDP_b_conduct {p v : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.Act2332bA1 p v pr c → Procedure.Conduct2332bAlleged p c

axiom corrDP_b_transcends {p : Person} {c : ComplaintText} :
    Deontic.ConductTranscendsNationalBoundaries p c →
    Procedure.ConductTranscendsNationalBoundaries p c

axiom corrDP_b_unlawful {p : Person} {c : ComplaintText} :
    Deontic.ConductViolatesLawsOfAStateOrTheUnitedStates p c →
    Procedure.ViolatesStateOrFederalLaw p c


axiom corrDP_b_principal {p v : Person} {pr : Deontic.Property}
    {c : ComplaintText} :
    Deontic.Act2332bA1 p v pr c →
    Procedure.HasRole Procedure.OffenderRole.principal p c ∧
      Procedure.CoOffenderInSameOffense p p c


axiom corrDP_b_circumstance {p v : Person} {pr : Deontic.Property}
    {c : ComplaintText} :
    Deontic.Circumstance2332bB1 p v pr c →
    ∃ x : Procedure.Circumstance2332b, Procedure.Circumstance2332bPresentAsTo x p c


theorem s2332b_deontic_implies_procedure {p v : Person} {pr : Deontic.Property}
    {c : ComplaintText} (h : Deontic.Prohibition2332bA1Violated p v pr c) :
    Procedure.ProsecutionGrounded2332b p c :=
  ⟨.substantive (corrDP_b_conduct h.2),
   corrDP_b_transcends h.1.transnational,
   corrDP_b_unlawful h.1.unlawfulUnderStateOrFederalLaw,
   ⟨⟨_, (corrDP_b_principal h.2).1⟩,
    match corrDP_b_circumstance h.1.circumstance with
    | ⟨x, hx⟩ => ⟨p, x, (corrDP_b_principal h.2).2, hx⟩⟩⟩

end Proving.USC.T18.Ch113B.Wmd.Part3.Bridge
