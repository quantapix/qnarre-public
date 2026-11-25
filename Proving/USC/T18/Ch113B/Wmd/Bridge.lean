






































import Proving.USC.T18.Ch113B.Wmd.Elements.Statute
import Proving.USC.T18.Ch113B.Wmd.Deontic.Statute
import Proving.USC.T18.Ch113B.Wmd.Ontology.Statute
import Proving.USC.T18.Ch113B.Wmd.Procedure.Statute
import Proving.USC.T18.Ch113B.Wmd.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Bridge

open Proving.USC.Common











axiom edConductA : Person → Elements.Weapon → ComplaintText → Deontic.Conduct


axiom edConductB : Person → ComplaintText → Deontic.Conduct


axiom edTarget : Person → Elements.Property → ComplaintText → Deontic.Target


axiom eoWeapon : Elements.Weapon → Ontology.Weapon



axiom eoConduct : ComplaintText → Ontology.Conduct


axiom eoCircumstance : Person → Elements.Property → ComplaintText → Ontology.Circumstance

axiom eoOffense : Elements.Offense → Ontology.Offense


axiom doWeapon : Deontic.Conduct → Ontology.Weapon

axiom doConduct : Deontic.Conduct → Ontology.Conduct












axiom corr_a_addressee {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.UseModeWmd2332a p w c → Deontic.AddresseeAnyPerson2332aA p c




axiom corr_a_act {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.WeaponOfMassDestruction2332aC2 w c → Elements.UseModeWmd2332a p w c →
    Deontic.RegulatedActUseOfWeaponOfMassDestruction2332a p (edConductA p w c) c





axiom corr_a_authority {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Deontic.HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p (edConductA p w c) c →
    Elements.ActsUnderLawfulAuthority p c


axiom corr_a1 {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.NationalOutsideUS2332aA1 v c →
    Deontic.ConditionAgainstUnitedStatesNationalAbroad2332aA1
      (edConductA p w c) (edTarget v r c) c


axiom corr_a2_target {p v : Person} {r : Elements.Property} {w : Elements.Weapon}
    {c : ComplaintText} :
    Elements.TargetWithinUS2332aA2 v r c →
    Deontic.ConditionAgainstPersonOrPropertyWithinUnitedStates2332aA2
      (edConductA p w c) (edTarget v r c) c


axiom corr_a2_nexus {p v : Person} {r : Elements.Property} {w : Elements.Weapon}
    {c : ComplaintText} :
    Elements.InterstateCircumstance2332aA2 r c →
    Deontic.ConditionInterstateOrForeignCommerceNexus2332aA2
      (edConductA p w c) (edTarget v r c) c


axiom corr_a3 {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.PropertyOwnedLeasedOrUsedByUnitedStates r c →
    Deontic.ConditionAgainstUnitedStatesProperty2332aA3
      (edConductA p w c) (edTarget v r c) c


axiom corr_a4 {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.ForeignGovernmentPropertyWithinUS2332aA4 r c →
    Deontic.ConditionAgainstForeignGovernmentPropertyWithinUnitedStates2332aA4
      (edConductA p w c) (edTarget v r c) c



theorem targetRoute_elements_implies_deontic
    {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.TargetRoute2332aA v r c) :
    Deontic.TargetCircumstance2332aA (edConductA p w c) (edTarget v r c) c :=
  match h with
  | .nationalAbroad ht => .nationalAbroad (corr_a1 ht)
  | .withinUS ht => .withinUnitedStatesWithNexus (corr_a2_target ht.target) (corr_a2_nexus ht.circumstance)
  | .unitedStatesProperty ht => .unitedStatesProperty (corr_a3 ht)
  | .foreignGovernmentProperty ht => .foreignGovernmentProperty (corr_a4 ht)



theorem s2332a_a_elements_implies_deontic
    {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.Section2332aA p v r w c) :
    Deontic.Prohibition2332aAViolated p (edConductA p w c) (edTarget v r c) c :=
  ⟨⟨corr_a_addressee h.conduct, targetRoute_elements_implies_deontic h.target⟩,
   corr_a_act h.weapon h.conduct,
   fun hAuth => h.withoutLawfulAuthority (corr_a_authority hAuth)⟩


axiom corr_b_national {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfTheUnitedStates p c → Deontic.IsNationalOfTheUnitedStates p c


axiom corr_b_outside {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.ConductOccursOutsideTheUnitedStates c →
    Deontic.ConditionConductOutsideTheUnitedStates2332aB (edConductA p w c) c



theorem s2332a_b_elements_implies_deontic
    {p : Person} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.Section2332aB p w c) :
    Deontic.Prohibition2332aBViolated p (edConductA p w c) c :=
  ⟨⟨corr_b_national h.nationalOfUS, corr_b_outside h.outsideUS⟩,
   corr_a_act h.weapon h.conduct,
   fun hAuth => h.withoutLawfulAuthority (corr_a_authority hAuth)⟩



theorem s2332a_elements_implies_deontic
    {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.Section2332aA p v r w c) :
    Deontic.Section2332aViolated p (edConductA p w c) (edTarget v r c) c :=
  .subsectionA (s2332a_a_elements_implies_deontic h)









axiom corr_p_authority {p : Person} {c : ComplaintText} :
    ¬ Elements.ActsUnderLawfulAuthority p c → Procedure.ActedWithoutLawfulAuthority p c



axiom corr_p_a1 {p v : Person} {c : ComplaintText} :
    Elements.NationalOutsideUS2332aA1 v c → Procedure.VictimIsUnitedStatesNationalAbroad p c

axiom corr_p_a2_target {p v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.TargetWithinUS2332aA2 v r c → Procedure.TargetWithinUnitedStates p c

axiom corr_p_hook_mail {p : Person} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance c →
    Procedure.MailOrInterstateFacilityUsedInFurtherance p c

axiom corr_p_hook_property {p : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.PropertyUsedInOrAffectingInterstateCommerce r c →
    Procedure.PropertyUsedInOrAffectingInterstateCommerce p c

axiom corr_p_hook_travel {p : Person} {c : ComplaintText} :
    Elements.PerpetratorTravelsInInterstateCommerceInFurtherance c →
    Procedure.PerpetratorTraveledInInterstateCommerce p c

axiom corr_p_hook_affects {p : Person} {c : ComplaintText} :
    Elements.OffenseAffectsInterstateCommerce c →
    Procedure.OffenseAffectedInterstateCommerce p c

axiom corr_p_a3 {p : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.PropertyOwnedLeasedOrUsedByUnitedStates r c →
    Procedure.TargetIsUnitedStatesOwnedOrUsedProperty p c

axiom corr_p_a4 {p : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.ForeignGovernmentPropertyWithinUS2332aA4 r c →
    Procedure.TargetIsForeignGovernmentPropertyWithinUnitedStates p c

axiom corr_p_national {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfTheUnitedStates p c → Procedure.DefendantIsNationalOfUnitedStates p c

axiom corr_p_outside {p : Person} {c : ComplaintText} :
    Elements.ConductOccursOutsideTheUnitedStates c → Procedure.ConductOccurredOutsideUnitedStates p c


theorem hook_elements_implies_procedure
    {p : Person} {r : Elements.Property} {c : ComplaintText}
    (h : Elements.InterstateCircumstance2332aA2 r c) :
    Procedure.Section2332aCommerceHook p c :=
  match h with
  | .mailOrFacility hx => .mailOrFacility (corr_p_hook_mail hx)
  | .propertyInCommerce hx => .propertyInCommerce (corr_p_hook_property hx)
  | .perpetratorTravels hx => .perpetratorTravel (corr_p_hook_travel hx)
  | .offenseAffectsCommerce hx => .offenseAffectsCommerce (corr_p_hook_affects hx)



theorem s2332a_a_elements_implies_procedure
    {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.Section2332aA p v r w c) :
    Procedure.Section2332aChargeable p c :=
  ⟨corr_p_authority h.withoutLawfulAuthority,
   .subsectionA
     (match h.target with
      | .nationalAbroad ht => .nationalAbroad (corr_p_a1 ht)
      | .withinUS ht => .withinUnitedStates (corr_p_a2_target ht.target)
          (hook_elements_implies_procedure ht.circumstance)
      | .unitedStatesProperty ht => .unitedStatesProperty (corr_p_a3 ht)
      | .foreignGovernmentProperty ht => .foreignGovernmentProperty (corr_p_a4 ht))⟩


theorem s2332a_b_elements_implies_procedure
    {p : Person} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.Section2332aB p w c) :
    Procedure.Section2332aChargeable p c :=
  ⟨corr_p_authority h.withoutLawfulAuthority,
   .subsectionB ⟨corr_p_national h.nationalOfUS, corr_p_outside h.outsideUS⟩⟩










axiom corr_o_wmd_dd {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsDestructiveDevice921 w c → Ontology.IsDestructiveDevice (eoWeapon w) c

axiom corr_o_wmd_chem {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsToxicChemicalWeapon w c → Ontology.IsToxicChemicalWeapon (eoWeapon w) c

axiom corr_o_wmd_bio {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsBiologicalWeapon w c → Ontology.InvolvesBiologicalAgentToxinOrVector (eoWeapon w) c

axiom corr_o_wmd_rad {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsRadiologicalWeapon w c → Ontology.IsRadiologicalWeapon (eoWeapon w) c



theorem wmd_elements_implies_ontology
    {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.WeaponOfMassDestruction2332aC2 w c) :
    Ontology.WeaponOfMassDestruction (eoWeapon w) c :=
  match h with
  | .destructiveDevice hx => .destructiveDevice (corr_o_wmd_dd hx)
  | .chemical hx => .toxicChemical (corr_o_wmd_chem hx)
  | .biological hx => .biological (corr_o_wmd_bio hx)
  | .radiological hx => .radiological (corr_o_wmd_rad hx)



theorem s2332a_a_elements_implies_ontology
    {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.Section2332aA p v r w c) :
    Ontology.WeaponOfMassDestruction (eoWeapon w) c :=
  wmd_elements_implies_ontology h.weapon




axiom corr_do_wmd {p : Person} {cd : Deontic.Conduct} {c : ComplaintText} :
    Deontic.RegulatedActUseOfWeaponOfMassDestruction2332a p cd c →
    Ontology.WeaponOfMassDestruction (doWeapon cd) c


theorem s2332a_deontic_implies_ontology
    {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText}
    (h : Deontic.Prohibition2332aAViolated p cd t c) :
    Ontology.WeaponOfMassDestruction (doWeapon cd) c :=
  corr_do_wmd h.2.1


axiom corr_dp_authority {p : Person} {cd : Deontic.Conduct} {c : ComplaintText} :
    ¬ Deontic.HasLawfulAuthorityForWeaponOfMassDestructionUse2332a p cd c →
    Procedure.ActedWithoutLawfulAuthority p c

axiom corr_dp_a1 {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText} :
    Deontic.ConditionAgainstUnitedStatesNationalAbroad2332aA1 cd t c →
    Procedure.VictimIsUnitedStatesNationalAbroad p c

axiom corr_dp_a2 {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText} :
    Deontic.ConditionAgainstPersonOrPropertyWithinUnitedStates2332aA2 cd t c →
    Procedure.TargetWithinUnitedStates p c



axiom corr_dp_hook {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText} :
    Deontic.ConditionInterstateOrForeignCommerceNexus2332aA2 cd t c →
    Procedure.Section2332aCommerceHook p c

axiom corr_dp_a3 {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText} :
    Deontic.ConditionAgainstUnitedStatesProperty2332aA3 cd t c →
    Procedure.TargetIsUnitedStatesOwnedOrUsedProperty p c

axiom corr_dp_a4 {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText} :
    Deontic.ConditionAgainstForeignGovernmentPropertyWithinUnitedStates2332aA4 cd t c →
    Procedure.TargetIsForeignGovernmentPropertyWithinUnitedStates p c



theorem s2332a_deontic_implies_procedure
    {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText}
    (h : Deontic.Prohibition2332aAViolated p cd t c) :
    Procedure.Section2332aChargeable p c :=
  ⟨corr_dp_authority h.2.2,
   .subsectionA
     (match h.1.condition with
      | .nationalAbroad hx => .nationalAbroad (corr_dp_a1 hx)
      | .withinUnitedStatesWithNexus hx hy => .withinUnitedStates (corr_dp_a2 hx) (corr_dp_hook hy)
      | .unitedStatesProperty hx => .unitedStatesProperty (corr_dp_a3 hx)
      | .foreignGovernmentProperty hx => .foreignGovernmentProperty (corr_dp_a4 hx))⟩







axiom corr_b1_addressee {p v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.ProhibitedAct2332bA1 p v r c → Deontic.AddresseeAnyPerson2332bA p c



axiom corr_b1_transcending {p : Person} {c : ComplaintText} :
    Elements.ConductOccursWithinTheUnitedStates c →
    Elements.ConductOccursOutsideTheUnitedStates c →
    Deontic.ConditionConductTranscendingNationalBoundaries2332b (edConductB p c) c

axiom corr_b1_circumstance {p v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.Circumstance2332bB1 v r c →
    Deontic.ConditionCircumstanceUnderSubsectionB2332bB1 (edConductB p c) (edTarget v r c) c

axiom corr_b1_violation {p : Person} {c : ComplaintText} :
    Elements.InViolationOfLaw2332bA1 p c →
    Deontic.ConditionInViolationOfStateOrFederalLaw2332bA1 (edConductB p c) c

axiom corr_b1_actA {p v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.ViolentActAgainstPerson2332bA1A p v c →
    Deontic.RegulatedActViolenceAgainstPersonWithinUnitedStates2332bA1A
      p (edConductB p c) (edTarget v r c) c

axiom corr_b1_actB {p v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.PropertyAttack2332bA1B p r c →
    Deontic.RegulatedActPropertyDestructionRiskingSeriousBodilyInjury2332bA1B
      p (edConductB p c) (edTarget v r c) c



theorem s2332b_a1_elements_implies_deontic
    {p v : Person} {r : Elements.Property} {c : ComplaintText}
    (h : Elements.Section2332bA1 p v r c) :
    Deontic.Prohibition2332bA1Violated p (edConductB p c) (edTarget v r c) c :=
  ⟨⟨corr_b1_addressee h.prohibitedAct,
    corr_b1_transcending h.transcendsNationalBoundaries.withinUS
      h.transcendsNationalBoundaries.outsideUS,
    corr_b1_circumstance h.circumstance,
    corr_b1_violation h.violationOfLaw⟩,
   match h.prohibitedAct with
   | .againstPerson ht => .violenceAgainstPerson (corr_b1_actA ht)
   | .againstProperty ht => .propertyDestruction (corr_b1_actB ht)⟩


axiom corr_pb_transcending {p : Person} {c : ComplaintText} :
    Elements.ConductOccursWithinTheUnitedStates c →
    Elements.ConductOccursOutsideTheUnitedStates c →
    Procedure.ConductTranscendedNationalBoundaries p c

axiom corr_pb_c_mail {p : Person} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance c →
    Procedure.MailOrInterstateFacilityUsedInFurtherance p c

axiom corr_pb_c_obstruct {p : Person} {c : ComplaintText} :
    Elements.OffenseObstructsDelaysOrAffectsInterstateCommerce c →
    Procedure.OffenseObstructedDelayedOrAffectedInterstateCommerce p c

axiom corr_pb_c_victim {p v : Person} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrOfficial v c →
    Procedure.VictimIsUnitedStatesGovernmentOrFederalOfficial p c

axiom corr_pb_c_property {p : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.PropertyOwnedPossessedOrLeasedByUnitedStates r c →
    Procedure.PropertyOwnedPossessedOrLeasedToUnitedStates p c

axiom corr_pb_c_sea {p : Person} {c : ComplaintText} :
    Elements.OffenseCommittedInTerritorialSeaOfTheUnitedStates c →
    Procedure.OffenseCommittedInTerritorialSea p c

axiom corr_pb_c_smtj {p : Person} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction c →
    Procedure.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction p c

axiom corr_pb_violation {p : Person} {c : ComplaintText} :
    Elements.InViolationOfLaw2332bA1 p c → Procedure.ConductViolatedStateOrFederalLaw p c



theorem circumstance_elements_implies_procedure
    {p v : Person} {r : Elements.Property} {c : ComplaintText}
    (h : Elements.Circumstance2332bB1 v r c) :
    Procedure.Section2332bCircumstance p c :=
  match h with
  | .mailOrFacility hx => .mailOrFacility (corr_pb_c_mail hx)
  | .obstructsCommerce hx => .commerceObstruction (corr_pb_c_obstruct hx)
  | .governmentVictim hx => .federalVictim (corr_pb_c_victim hx)
  | .governmentProperty hx => .federalProperty (corr_pb_c_property hx)
  | .territorialSea hx => .territorialSea (corr_pb_c_sea hx)
  | .maritimeJurisdiction hx => .specialMaritimeAndTerritorialJurisdiction (corr_pb_c_smtj hx)



theorem s2332b_a1_elements_implies_procedure
    {p v : Person} {r : Elements.Property} {c : ComplaintText}
    (h : Elements.Section2332bA1 p v r c) :
    Procedure.Section2332bOffenseConduct p c :=
  ⟨corr_pb_transcending h.transcendsNationalBoundaries.withinUS
     h.transcendsNationalBoundaries.outsideUS,
   circumstance_elements_implies_procedure h.circumstance,
   corr_pb_violation h.violationOfLaw⟩


axiom corr_ob_within {c : ComplaintText} :
    Elements.ConductOccursWithinTheUnitedStates c → Ontology.OccursWithinTheUnitedStates (eoConduct c) c

axiom corr_ob_outside {c : ComplaintText} :
    Elements.ConductOccursOutsideTheUnitedStates c → Ontology.OccursOutsideTheUnitedStates (eoConduct c) c

axiom corr_oc_mail {v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance c →
    Ontology.MailOrFacilityOfCommerceUsedInFurtherance (eoCircumstance v r c) c

axiom corr_oc_obstruct {v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.OffenseObstructsDelaysOrAffectsInterstateCommerce c →
    Ontology.OffenseObstructsDelaysOrAffectsCommerce (eoCircumstance v r c) c

axiom corr_oc_victim {v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrOfficial v c →
    Ontology.VictimIsUnitedStatesGovernmentOrOfficial (eoCircumstance v r c) c

axiom corr_oc_property {v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.PropertyOwnedPossessedOrLeasedByUnitedStates r c →
    Ontology.PropertyOwnedPossessedOrLeasedByUnitedStates (eoCircumstance v r c) c

axiom corr_oc_sea {v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.OffenseCommittedInTerritorialSeaOfTheUnitedStates c →
    Ontology.CommittedInTerritorialSeaOfTheUnitedStates (eoCircumstance v r c) c

axiom corr_oc_smtj {v : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction c →
    Ontology.CommittedWithinSpecialMaritimeAndTerritorialJurisdiction (eoCircumstance v r c) c



theorem transcending_elements_implies_ontology {c : ComplaintText}
    (h : Elements.TranscendsNationalBoundaries2332bG1 c) :
    Ontology.ConductTranscendingNationalBoundaries (eoConduct c) c :=
  ⟨corr_ob_outside h.outsideUS, corr_ob_within h.withinUS⟩



theorem circumstance_elements_implies_ontology
    {v : Person} {r : Elements.Property} {c : ComplaintText}
    (h : Elements.Circumstance2332bB1 v r c) :
    Ontology.CircumstanceUnder2332b (eoCircumstance v r c) c :=
  match h with
  | .mailOrFacility hx => .mailOrFacility (corr_oc_mail hx)
  | .obstructsCommerce hx => .commerceEffect (corr_oc_obstruct hx)
  | .governmentVictim hx => .federalVictim (corr_oc_victim hx)
  | .governmentProperty hx => .federalProperty (corr_oc_property hx)
  | .territorialSea hx => .territorialSea (corr_oc_sea hx)
  | .maritimeJurisdiction hx => .specialJurisdiction (corr_oc_smtj hx)



theorem s2332b_a1_elements_implies_ontology
    {p v : Person} {r : Elements.Property} {c : ComplaintText}
    (h : Elements.Section2332bA1 p v r c) :
    Ontology.ConductTranscendingNationalBoundaries (eoConduct c) c
      ∧ Ontology.CircumstanceUnder2332b (eoCircumstance v r c) c :=
  ⟨transcending_elements_implies_ontology h.transcendsNationalBoundaries,
   circumstance_elements_implies_ontology h.circumstance⟩


axiom corr_dpb_transcending {p : Person} {cd : Deontic.Conduct} {c : ComplaintText} :
    Deontic.ConditionConductTranscendingNationalBoundaries2332b cd c →
    Procedure.ConductTranscendedNationalBoundaries p c

axiom corr_dpb_circumstance {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target}
    {c : ComplaintText} :
    Deontic.ConditionCircumstanceUnderSubsectionB2332bB1 cd t c →
    Procedure.Section2332bCircumstance p c

axiom corr_dpb_violation {p : Person} {cd : Deontic.Conduct} {c : ComplaintText} :
    Deontic.ConditionInViolationOfStateOrFederalLaw2332bA1 cd c →
    Procedure.ConductViolatedStateOrFederalLaw p c



theorem s2332b_a1_deontic_implies_procedure
    {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText}
    (h : Deontic.Prohibition2332bA1Violated p cd t c) :
    Procedure.Section2332bOffenseConduct p c :=
  ⟨corr_dpb_transcending h.1.transnational,
   corr_dpb_circumstance h.1.circumstance,
   corr_dpb_violation h.1.unlawfulUnderOtherLaw⟩


axiom corr_dob_transcending {cd : Deontic.Conduct} {c : ComplaintText} :
    Deontic.ConditionConductTranscendingNationalBoundaries2332b cd c →
    Ontology.ConductTranscendingNationalBoundaries (doConduct cd) c


theorem s2332b_a1_deontic_implies_ontology
    {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText}
    (h : Deontic.Prohibition2332bA1Violated p cd t c) :
    Ontology.ConductTranscendingNationalBoundaries (doConduct cd) c :=
  corr_dob_transcending h.1.transnational





















axiom corr_b2_addressee {p : Person} {c : ComplaintText} :
    Elements.InchoateMode2332bA2 p c → Deontic.AddresseeAnyPerson2332bA p c

axiom corr_b2_act {p : Person} {c : ComplaintText} :
    Elements.InchoateMode2332bA2 p c →
    Deontic.RegulatedActThreatAttemptOrConspiracy2332bA2 p (edConductB p c) c






theorem s2332b_a2_elements_implies_deontic_modulo_gaps
    {p v : Person} {r : Elements.Property} {c : ComplaintText}
    (gap_a2_transcending :
      Deontic.ConditionConductTranscendingNationalBoundaries2332b (edConductB p c) c)
    (gap_a2_circumstance :
      Deontic.ConditionCircumstanceUnderSubsectionB2332bB1 (edConductB p c) (edTarget v r c) c)
    (h : Elements.Section2332bA2 p c) :
    Deontic.Prohibition2332bA2Violated p (edConductB p c) (edTarget v r c) c :=
  ⟨⟨corr_b2_addressee h.inchoate, gap_a2_transcending, gap_a2_circumstance⟩,
   corr_b2_act h.inchoate⟩










axiom corr_g5_motive_o {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToInfluenceOrRetaliateAgainstGovernment o c →
    Ontology.CalculatedToInfluenceOrRetaliateAgainstGovernmentConduct (eoOffense o) c



axiom corr_g5_enum_o {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesEnumeratedTerrorismOffense o c →
    Ontology.EnumeratedTerrorismProvisionViolation (eoOffense o) c

axiom corr_g5_motive_p {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToInfluenceOrRetaliateAgainstGovernment o c →
    Procedure.CalculatedToInfluenceGovernmentConduct p c

axiom corr_g5_enum_p {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesEnumeratedTerrorismOffense o c →
    Procedure.ViolatesEnumeratedTerrorismOffense p c


theorem g5_elements_implies_ontology {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalCrimeOfTerrorism2332bG5 o c) :
    Ontology.FederalCrimeOfTerrorism (eoOffense o) c :=
  ⟨corr_g5_motive_o h.motive, corr_g5_enum_o h.enumeratedOffense⟩


theorem g5_elements_implies_procedure {p : Person} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalCrimeOfTerrorism2332bG5 o c) :
    Procedure.FederalCrimeOfTerrorism p c :=
  ⟨corr_g5_motive_p h.motive, corr_g5_enum_p h.enumeratedOffense⟩

















axiom corr_e_jurisdiction {p : Person} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.ConditionOffenseOrAccessoryConductUnderSubsectionA2332bE pr c →
    Procedure.Section2332bExtraterritorialJurisdiction p c



theorem s2332bE_deontic_implies_procedure
    {p : Person} {o : Deontic.Office} {pr : Deontic.Proceeding} {c : ComplaintText}
    (h : Deontic.Power2332bEConferred o pr c) :
    Procedure.Section2332bExtraterritorialJurisdiction p c :=
  corr_e_jurisdiction h.1.condition




axiom corr_f_responsibility {p : Person} {cd : Deontic.Conduct} {c : ComplaintText} :
    Deontic.ConditionFederalCrimeOfTerrorismOrEnumeratedViolation2332bF cd c →
    Procedure.AttorneyGeneralPrimaryInvestigativeResponsibility p c

axiom corr_f_request {p : Person} {o : Deontic.Office} {cd : Deontic.Conduct}
    {c : ComplaintText} :
    Deontic.ConditionAttorneyGeneralRequestedAssistance2332bF o cd c →
    Procedure.AttorneyGeneralRequestedTreasuryAssistance p c







theorem s2332bF_ag_deontic_implies_procedure
    {p : Person} {o : Deontic.Office} {cd : Deontic.Conduct} {c : ComplaintText}
    (h : Deontic.Obligation2332bFAttorneyGeneralDischarged o cd c) :
    Procedure.AttorneyGeneralPrimaryInvestigativeResponsibility p c :=
  corr_f_responsibility h.1.condition




theorem s2332bF_treasury_deontic_implies_procedure
    {p : Person} {o ag : Deontic.Office} {cd : Deontic.Conduct} {c : ComplaintText}
    (h : Deontic.Obligation2332bFTreasury o ag cd c) :
    Procedure.TreasuryAssistanceDuty p c :=
  ⟨corr_f_responsibility h.matter, corr_f_request h.request⟩








def s2332a_tierA_pairwise_discharge : Prop :=
  (∀ {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText},
      Elements.Section2332aA p v r w c →
      Deontic.Section2332aViolated p (edConductA p w c) (edTarget v r c) c)
  ∧ (∀ {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText},
      Elements.Section2332aA p v r w c → Procedure.Section2332aChargeable p c)
  ∧ (∀ {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText},
      Elements.Section2332aA p v r w c → Ontology.WeaponOfMassDestruction (eoWeapon w) c)
  ∧ (∀ {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText},
      Deontic.Prohibition2332aAViolated p cd t c → Procedure.Section2332aChargeable p c)
  ∧ (∀ {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText},
      Deontic.Prohibition2332aAViolated p cd t c → Ontology.WeaponOfMassDestruction (doWeapon cd) c)


theorem s2332a_tierA : s2332a_tierA_pairwise_discharge :=
  ⟨fun h => s2332a_elements_implies_deontic h,
   fun h => s2332a_a_elements_implies_procedure h,
   fun h => s2332a_a_elements_implies_ontology h,
   fun h => s2332a_deontic_implies_procedure h,
   fun h => s2332a_deontic_implies_ontology h⟩





def s2332b_a1_pairwise_discharge : Prop :=
  (∀ {p v : Person} {r : Elements.Property} {c : ComplaintText},
      Elements.Section2332bA1 p v r c →
      Deontic.Prohibition2332bA1Violated p (edConductB p c) (edTarget v r c) c)
  ∧ (∀ {p v : Person} {r : Elements.Property} {c : ComplaintText},
      Elements.Section2332bA1 p v r c → Procedure.Section2332bOffenseConduct p c)
  ∧ (∀ {p v : Person} {r : Elements.Property} {c : ComplaintText},
      Elements.Section2332bA1 p v r c →
      Ontology.ConductTranscendingNationalBoundaries (eoConduct c) c
        ∧ Ontology.CircumstanceUnder2332b (eoCircumstance v r c) c)
  ∧ (∀ {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText},
      Deontic.Prohibition2332bA1Violated p cd t c → Procedure.Section2332bOffenseConduct p c)
  ∧ (∀ {p : Person} {cd : Deontic.Conduct} {t : Deontic.Target} {c : ComplaintText},
      Deontic.Prohibition2332bA1Violated p cd t c →
      Ontology.ConductTranscendingNationalBoundaries (doConduct cd) c)



theorem s2332b_a1_agreement : s2332b_a1_pairwise_discharge :=
  ⟨fun h => s2332b_a1_elements_implies_deontic h,
   fun h => s2332b_a1_elements_implies_procedure h,
   fun h => s2332b_a1_elements_implies_ontology h,
   fun h => s2332b_a1_deontic_implies_procedure h,
   fun h => s2332b_a1_deontic_implies_ontology h⟩

end Proving.USC.T18.Ch113B.Wmd.Bridge
