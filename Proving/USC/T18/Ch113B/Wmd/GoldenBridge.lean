




























import Proving.USC.T18.Ch113B.Wmd.Elements.Statute
import Proving.Terrorism.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.GoldenBridge

open Proving.USC.Common









axiom gPerson : Person → Proving.Terrorism.Person

axiom gComplaint : ComplaintText → Proving.Terrorism.ComplaintText

axiom gWeapon : Elements.Weapon → Proving.Terrorism.Weapon



axiom gActionA : Person → Elements.Weapon → ComplaintText → Proving.Terrorism.Action

axiom gActionB : Person → ComplaintText → Proving.Terrorism.Action

axiom gActionO : Elements.Offense → Proving.Terrorism.Action









axiom gcorr_wmd_dd {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsDestructiveDevice921 w c →
    Proving.Terrorism.IsWeaponOfMassDestruction (gWeapon w) (gComplaint c)

axiom gcorr_wmd_chem {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsToxicChemicalWeapon w c →
    Proving.Terrorism.IsWeaponOfMassDestruction (gWeapon w) (gComplaint c)

axiom gcorr_wmd_bio {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsBiologicalWeapon w c →
    Proving.Terrorism.IsWeaponOfMassDestruction (gWeapon w) (gComplaint c)

axiom gcorr_wmd_rad {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsRadiologicalWeapon w c →
    Proving.Terrorism.IsWeaponOfMassDestruction (gWeapon w) (gComplaint c)



theorem cand_wmd_implies_golden {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.WeaponOfMassDestruction2332aC2 w c) :
    Proving.Terrorism.IsWeaponOfMassDestruction (gWeapon w) (gComplaint c) :=
  match h with
  | .destructiveDevice hx => gcorr_wmd_dd hx
  | .chemical hx => gcorr_wmd_chem hx
  | .biological hx => gcorr_wmd_bio hx
  | .radiological hx => gcorr_wmd_rad hx




axiom gcorr_authority {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    ¬ Elements.ActsUnderLawfulAuthority p c →
    Proving.Terrorism.WithoutLawfulAuthority (gPerson p) (gActionA p w c) (gComplaint c)


axiom gcorr_conduct_uses {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.UsesWeaponOfMassDestruction p w c →
    Proving.Terrorism.UsesThreatensAttemptsOrConspiresToUse
      (gPerson p) (gWeapon w) (gActionA p w c) (gComplaint c)

axiom gcorr_conduct_threatens {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.ThreatensToUseWeaponOfMassDestruction p w c →
    Proving.Terrorism.UsesThreatensAttemptsOrConspiresToUse
      (gPerson p) (gWeapon w) (gActionA p w c) (gComplaint c)

axiom gcorr_conduct_attempts {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.AttemptsToUseWeaponOfMassDestruction p w c →
    Proving.Terrorism.UsesThreatensAttemptsOrConspiresToUse
      (gPerson p) (gWeapon w) (gActionA p w c) (gComplaint c)




axiom gcorr_conduct_conspires {p : Person} {w : Elements.Weapon} {ag : Agreement}
    {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c →
    Elements.ConspiresToUseWeaponOfMassDestruction p w c →
    Proving.Terrorism.UsesThreatensAttemptsOrConspiresToUse
      (gPerson p) (gWeapon w) (gActionA p w c) (gComplaint c)



theorem cand_conduct_implies_golden {p : Person} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.UseModeWmd2332a p w c) :
    Proving.Terrorism.UsesThreatensAttemptsOrConspiresToUse
      (gPerson p) (gWeapon w) (gActionA p w c) (gComplaint c) :=
  match h with
  | .uses hx => gcorr_conduct_uses hx
  | .threatens hx => gcorr_conduct_threatens hx
  | .attempts hx => gcorr_conduct_attempts hx
  | .conspires hAgree hx => gcorr_conduct_conspires hAgree hx



axiom gcorr_target_a1 {p v : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsNationalOfTheUnitedStates v c → Elements.IsOutsideTheUnitedStates v c →
    Proving.Terrorism.AgainstUsNationalOutsideUs (gActionA p w c) (gComplaint c)

axiom gcorr_target_a2_person {p v : Person} {w : Elements.Weapon} {c : ComplaintText} :
    IsPersonInUS v c →
    Proving.Terrorism.AgainstPersonOrPropertyWithinUs (gActionA p w c) (gComplaint c)

axiom gcorr_target_a2_property {p : Person} {r : Elements.Property} {w : Elements.Weapon}
    {c : ComplaintText} :
    Elements.PropertyIsWithinTheUnitedStates r c →
    Proving.Terrorism.AgainstPersonOrPropertyWithinUs (gActionA p w c) (gComplaint c)

axiom gcorr_hook_mail {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance c →
    Proving.Terrorism.InterstateOrForeignCommerceNexus (gActionA p w c) (gComplaint c)

axiom gcorr_hook_property {p : Person} {r : Elements.Property} {w : Elements.Weapon}
    {c : ComplaintText} :
    Elements.PropertyUsedInOrAffectingInterstateCommerce r c →
    Proving.Terrorism.InterstateOrForeignCommerceNexus (gActionA p w c) (gComplaint c)

axiom gcorr_hook_travel {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.PerpetratorTravelsInInterstateCommerceInFurtherance c →
    Proving.Terrorism.InterstateOrForeignCommerceNexus (gActionA p w c) (gComplaint c)



axiom gcorr_hook_affects {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.OffenseAffectsInterstateCommerce c →
    Proving.Terrorism.InterstateOrForeignCommerceNexus (gActionA p w c) (gComplaint c)

axiom gcorr_target_a3 {p : Person} {r : Elements.Property} {w : Elements.Weapon}
    {c : ComplaintText} :
    Elements.PropertyOwnedLeasedOrUsedByUnitedStates r c →
    Proving.Terrorism.AgainstUnitedStatesProperty (gActionA p w c) (gComplaint c)




axiom gcorr_target_a4 {p : Person} {r : Elements.Property} {w : Elements.Weapon}
    {c : ComplaintText} :
    Elements.PropertyIsWithinTheUnitedStates r c →
    Elements.PropertyOwnedLeasedOrUsedByForeignGovernment r c →
    Proving.Terrorism.AgainstForeignGovernmentPropertyWithinUs (gActionA p w c) (gComplaint c)


theorem cand_hook_implies_golden {p : Person} {r : Elements.Property} {w : Elements.Weapon}
    {c : ComplaintText} (h : Elements.InterstateCircumstance2332aA2 r c) :
    Proving.Terrorism.InterstateOrForeignCommerceNexus (gActionA p w c) (gComplaint c) :=
  match h with
  | .mailOrFacility hx => gcorr_hook_mail hx
  | .propertyInCommerce hx => gcorr_hook_property hx
  | .perpetratorTravels hx => gcorr_hook_travel hx
  | .offenseAffectsCommerce hx => gcorr_hook_affects hx





theorem cand_target_implies_golden {p v : Person} {r : Elements.Property}
    {w : Elements.Weapon} {c : ComplaintText} (h : Elements.TargetRoute2332aA v r c) :
    Proving.Terrorism.Section2332aTarget (gActionA p w c) (gComplaint c) :=
  match h with
  | .nationalAbroad ht => .viaUsNationalAbroad (gcorr_target_a1 ht.national ht.outsideUS)
  | .withinUS ht =>
      .viaWithinUsAndCommerce
        (match ht.target with
         | .person hx => gcorr_target_a2_person hx
         | .property hx => gcorr_target_a2_property hx)
        (cand_hook_implies_golden ht.circumstance)
  | .unitedStatesProperty ht => .viaUnitedStatesProperty (gcorr_target_a3 ht)
  | .foreignGovernmentProperty ht =>
      .viaForeignGovernmentProperty (gcorr_target_a4 ht.withinUS ht.foreignGovernment)





theorem cand_s2332a_a_implies_golden
    {p v : Person} {r : Elements.Property} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.Section2332aA p v r w c) :
    Proving.Terrorism.Section2332aSubsecA
      (gPerson p) (gWeapon w) (gActionA p w c) (gComplaint c) :=
  ⟨cand_wmd_implies_golden h.weapon,
   gcorr_authority h.withoutLawfulAuthority,
   cand_conduct_implies_golden h.conduct,
   cand_target_implies_golden h.target⟩




axiom gcorr_actor_national {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfTheUnitedStates p c →
    Proving.Terrorism.IsNationalOfUnitedStates (gPerson p) (gComplaint c)

axiom gcorr_outside {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.ConductOccursOutsideTheUnitedStates c →
    Proving.Terrorism.ConductOutsideUnitedStates (gActionA p w c) (gComplaint c)



theorem cand_s2332a_b_implies_golden
    {p : Person} {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.Section2332aB p w c) :
    Proving.Terrorism.Section2332aSubsecB
      (gPerson p) (gWeapon w) (gActionA p w c) (gComplaint c) :=
  ⟨cand_wmd_implies_golden h.weapon,
   gcorr_actor_national h.nationalOfUS,
   gcorr_authority h.withoutLawfulAuthority,
   cand_conduct_implies_golden h.conduct,
   gcorr_outside h.outsideUS⟩





axiom gcorr_transcending {p : Person} {c : ComplaintText} :
    Elements.ConductOccursWithinTheUnitedStates c →
    Elements.ConductOccursOutsideTheUnitedStates c →
    Proving.Terrorism.ConductTranscendingNationalBoundaries (gActionB p c) (gComplaint c)

axiom gcorr_circ_mail {p : Person} {c : ComplaintText} :
    Elements.MailOrFacilityOfInterstateCommerceUsedInFurtherance c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gActionB p c) (gComplaint c)

axiom gcorr_circ_obstruct {p : Person} {c : ComplaintText} :
    Elements.OffenseObstructsDelaysOrAffectsInterstateCommerce c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gActionB p c) (gComplaint c)

axiom gcorr_circ_victim {p v : Person} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrOfficial v c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gActionB p c) (gComplaint c)

axiom gcorr_circ_property {p : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.PropertyOwnedPossessedOrLeasedByUnitedStates r c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gActionB p c) (gComplaint c)

axiom gcorr_circ_sea {p : Person} {c : ComplaintText} :
    Elements.OffenseCommittedInTerritorialSeaOfTheUnitedStates c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gActionB p c) (gComplaint c)

axiom gcorr_circ_smtj {p : Person} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gActionB p c) (gComplaint c)



theorem cand_circumstance_implies_golden {p v : Person} {r : Elements.Property}
    {c : ComplaintText} (h : Elements.Circumstance2332bB1 v r c) :
    Proving.Terrorism.JurisdictionalCircumstanceExists (gActionB p c) (gComplaint c) :=
  match h with
  | .mailOrFacility hx => gcorr_circ_mail hx
  | .obstructsCommerce hx => gcorr_circ_obstruct hx
  | .governmentVictim hx => gcorr_circ_victim hx
  | .governmentProperty hx => gcorr_circ_property hx
  | .territorialSea hx => gcorr_circ_sea hx
  | .maritimeJurisdiction hx => gcorr_circ_smtj hx





axiom gcorr_conductA {p v : Person} {c : ComplaintText} :
    IsPersonInUS v c → Elements.ViolentActMode2332bA1A p v c →
    Proving.Terrorism.ViolentActAgainstPersonWithinUs
      (gPerson p) (gActionB p c) (gComplaint c)





axiom gcorr_conductB {p : Person} {r : Elements.Property} {c : ComplaintText} :
    Elements.PropertyIsWithinTheUnitedStates r c →
    Elements.PropertyAttackMode2332bA1B p r c →
    Elements.CreatesSubstantialRiskOfSeriousBodilyInjury p c →
    Proving.Terrorism.PropertyHarmCreatingRiskOfSeriousBodilyInjury
      (gPerson p) (gActionB p c) (gComplaint c)

axiom gcorr_violation_state {p : Person} {c : ComplaintText} :
    Elements.ViolatesStateLawOffenseElements p c →
    Proving.Terrorism.InViolationOfStateOrFederalLaw (gActionB p c) (gComplaint c)

axiom gcorr_violation_federal {p : Person} {c : ComplaintText} :
    Elements.ViolatesFederalLaw p c →
    Proving.Terrorism.InViolationOfStateOrFederalLaw (gActionB p c) (gComplaint c)


theorem cand_conductB_implies_golden {p v : Person} {r : Elements.Property}
    {c : ComplaintText} (h : Elements.ProhibitedAct2332bA1 p v r c) :
    Proving.Terrorism.Section2332bConduct (gPerson p) (gActionB p c) (gComplaint c) :=
  match h with
  | .againstPerson ht => .viaViolenceAgainstPerson (gcorr_conductA ht.victimWithinUS ht.act)
  | .againstProperty ht =>
      .viaPropertyHarm (gcorr_conductB ht.propertyWithinUS ht.mode ht.substantialRisk)


theorem cand_violation_implies_golden {p : Person} {c : ComplaintText}
    (h : Elements.InViolationOfLaw2332bA1 p c) :
    Proving.Terrorism.InViolationOfStateOrFederalLaw (gActionB p c) (gComplaint c) :=
  match h with
  | .stateLaw hx => gcorr_violation_state hx
  | .federalLaw hx => gcorr_violation_federal hx



theorem cand_s2332b_a1_implies_golden
    {p v : Person} {r : Elements.Property} {c : ComplaintText}
    (h : Elements.Section2332bA1 p v r c) :
    Proving.Terrorism.Section2332bSubsecA1 (gPerson p) (gActionB p c) (gComplaint c) :=
  ⟨gcorr_transcending h.transcendsNationalBoundaries.withinUS
     h.transcendsNationalBoundaries.outsideUS,
   cand_circumstance_implies_golden (v := v) (r := r) h.circumstance,
   cand_conductB_implies_golden h.prohibitedAct,
   cand_violation_implies_golden h.violationOfLaw⟩


















axiom gcorr_inchoate {p : Person} {c : ComplaintText} :
    Elements.InchoateMode2332bA2 p c →
    Proving.Terrorism.ThreatensAttemptsOrConspiresUnderSection2332b
      (gPerson p) (gActionB p c) (gComplaint c)




theorem cand_s2332b_a2_implies_golden_modulo_gaps
    {p : Person} {c : ComplaintText}
    (gap_a2_transcending :
      Proving.Terrorism.ConductTranscendingNationalBoundaries (gActionB p c) (gComplaint c))
    (gap_a2_circumstance :
      Proving.Terrorism.JurisdictionalCircumstanceExists (gActionB p c) (gComplaint c))
    (h : Elements.Section2332bA2 p c) :
    Proving.Terrorism.Section2332bSubsecA2 (gPerson p) (gActionB p c) (gComplaint c) :=
  ⟨gap_a2_transcending, gap_a2_circumstance, gcorr_inchoate h.inchoate⟩
















axiom gcorr_g5_motive {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToInfluenceOrRetaliateAgainstGovernment o c →
    Proving.Terrorism.CalculatedToInfluenceOrRetaliateAgainstGovernment
      (gActionO o) (gComplaint c)

axiom gcorr_g5_enum {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesEnumeratedTerrorismOffense o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense (gActionO o) (gComplaint c)



theorem cand_g5_implies_golden {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalCrimeOfTerrorism2332bG5 o c) :
    Proving.Terrorism.FederalCrimeOfTerrorism (gActionO o) (gComplaint c) :=
  ⟨gcorr_g5_motive h.motive, gcorr_g5_enum h.enumeratedOffense⟩









theorem cand_implies_golden_clauseG {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.ViolatesEnumeratedTerrorismOffense o c) :
    Proving.Terrorism.RicoPredicateActUnderClauseG (gActionO o) (gComplaint c) :=
  ⟨gcorr_g5_enum h⟩

end Proving.USC.T18.Ch113B.Wmd.GoldenBridge
