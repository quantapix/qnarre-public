


























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Statute
import Proving.Terrorism.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.GoldenBridge

open Proving.USC.Common







axiom gPerson : Person → Proving.Terrorism.Person
axiom gComplaint : ComplaintText → Proving.Terrorism.ComplaintText
axiom gWeapon : Elements.Weapon → Proving.Terrorism.Weapon



axiom gAction : Elements.Offense → Proving.Terrorism.Action





axiom corr_isWmd {w : Elements.Weapon} {c : ComplaintText} :
    Elements.WeaponOfMassDestruction2332aC2 w c →
    Proving.Terrorism.IsWeaponOfMassDestruction (gWeapon w) (gComplaint c)




axiom corr_withoutAuthority {p : Person} {o : Elements.Offense}
    {c : ComplaintText} :
    ¬ Elements.HasLawfulAuthority p o c →
    Proving.Terrorism.WithoutLawfulAuthority (gPerson p) (gAction o) (gComplaint c)




axiom corr_conduct {p : Person} {w : Elements.Weapon} {ag : Agreement}
    {o : Elements.Offense} {c : ComplaintText} :
    Elements.WmdConductMode p w ag c →
    Proving.Terrorism.UsesThreatensAttemptsOrConspiresToUse (gPerson p)
      (gWeapon w) (gAction o) (gComplaint c)



axiom corr_a1 {o : Elements.Offense} {t : Elements.Target} {c : ComplaintText} :
    Elements.NationalAbroadTarget t c →
    Proving.Terrorism.AgainstUsNationalOutsideUs (gAction o) (gComplaint c)





axiom corr_a2_target {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText} :
    Elements.TargetIsPersonOrPropertyWithinUnitedStates t c →
    Proving.Terrorism.AgainstPersonOrPropertyWithinUs (gAction o) (gComplaint c)





axiom corr_a2_commerce {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText} :
    Elements.Section2332aCommerceHook o t c →
    Proving.Terrorism.InterstateOrForeignCommerceNexus (gAction o) (gComplaint c)


axiom corr_a3 {o : Elements.Offense} {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsUnitedStatesProperty t c →
    Proving.Terrorism.AgainstUnitedStatesProperty (gAction o) (gComplaint c)


axiom corr_a4 {o : Elements.Offense} {t : Elements.Target} {c : ComplaintText} :
    Elements.TargetIsForeignGovernmentPropertyWithinUnitedStates t c →
    Proving.Terrorism.AgainstForeignGovernmentPropertyWithinUs (gAction o)
      (gComplaint c)


axiom corr_isNational {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates p c →
    Proving.Terrorism.IsNationalOfUnitedStates (gPerson p) (gComplaint c)


axiom corr_outsideUs {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurredOutsideUnitedStates o c →
    Proving.Terrorism.ConductOutsideUnitedStates (gAction o) (gComplaint c)





theorem target_candidate_implies_golden {o : Elements.Offense}
    {t : Elements.Target} {c : ComplaintText}
    (h : Elements.Section2332aTargetCircumstance o t c) :
    Proving.Terrorism.Section2332aTarget (gAction o) (gComplaint c) :=
  match h with
  | .nationalAbroad hn => .viaUsNationalAbroad (corr_a1 (o := o) hn)
  | .domesticWithCommerceHook hd =>
      .viaWithinUsAndCommerce (corr_a2_target (o := o) hd.withinUnitedStates)
        (corr_a2_commerce hd.commerceHook)
  | .unitedStatesProperty hu => .viaUnitedStatesProperty (corr_a3 (o := o) hu)
  | .foreignGovernmentProperty hf =>
      .viaForeignGovernmentProperty (corr_a4 (o := o) hf)






theorem s2332aA_candidate_implies_golden {p : Person} {w : Elements.Weapon}
    {ag : Agreement} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText}
    (h : Elements.Section2332aA p w ag o t c) :
    Proving.Terrorism.Section2332aSubsecA (gPerson p) (gWeapon w) (gAction o)
      (gComplaint c) :=
  ⟨corr_isWmd h.weapon, corr_withoutAuthority h.lawfulAuthorityAbsent,
   corr_conduct (o := o) h.conduct, target_candidate_implies_golden h.targetCircumstance⟩





theorem s2332aB_candidate_implies_golden {p : Person} {w : Elements.Weapon}
    {ag : Agreement} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332aB p w ag o c) :
    Proving.Terrorism.Section2332aSubsecB (gPerson p) (gWeapon w) (gAction o)
      (gComplaint c) :=
  ⟨corr_isWmd h.weapon, corr_isNational h.nationalOfUnitedStates,
   corr_withoutAuthority h.lawfulAuthorityAbsent, corr_conduct (o := o) h.conduct,
   corr_outsideUs h.outsideUnitedStates⟩



theorem s2332a_candidate_implies_golden {p : Person} {w : Elements.Weapon}
    {ag : Agreement} {o : Elements.Offense} {t : Elements.Target}
    {c : ComplaintText}
    (h : Elements.Section2332aViolation p w ag o t c) :
    Proving.Terrorism.ValidTerrorismClaim (gPerson p) (gComplaint c) :=
  match h with
  | .subsectionA ha =>
      .viaSection2332aSubsecA (gWeapon w) (gAction o)
        (s2332aA_candidate_implies_golden ha)
  | .subsectionB hb =>
      .viaSection2332aSubsecB (gWeapon w) (gAction o)
        (s2332aB_candidate_implies_golden hb)






axiom corr_transcending {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductTranscendingNationalBoundaries o c →
    Proving.Terrorism.ConductTranscendingNationalBoundaries (gAction o)
      (gComplaint c)



axiom corr_circumstance {o : Elements.Offense} {c : ComplaintText} :
    Elements.Section2332bCircumstance o c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c)





axiom corr_personRoute {p v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.Section2332bPersonRoute p v c →
    Proving.Terrorism.ViolentActAgainstPersonWithinUs (gPerson p) (gAction o)
      (gComplaint c)






axiom corr_propertyRoute {p : Person} {pr : Elements.PropertyItem}
    {o : Elements.Offense} {c : ComplaintText} :
    Elements.Section2332bPropertyRoute p pr c →
    Proving.Terrorism.PropertyHarmCreatingRiskOfSeriousBodilyInjury (gPerson p)
      (gAction o) (gComplaint c)


axiom corr_inViolation {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesLawOfStateOrUnitedStates o c →
    Proving.Terrorism.InViolationOfStateOrFederalLaw (gAction o) (gComplaint c)



axiom corr_inchoate {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.Section2332bInchoateMode p o c →
    Proving.Terrorism.ThreatensAttemptsOrConspiresUnderSection2332b (gPerson p)
      (gAction o) (gComplaint c)



theorem conduct_candidate_implies_golden {p v : Person}
    {pr : Elements.PropertyItem} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bProhibitedConduct p v pr c) :
    Proving.Terrorism.Section2332bConduct (gPerson p) (gAction o) (gComplaint c) :=
  match h with
  | .againstPerson hp => .viaViolenceAgainstPerson (corr_personRoute (o := o) hp)
  | .againstProperty hq => .viaPropertyHarm (corr_propertyRoute (o := o) hq)




theorem s2332bA1_candidate_implies_golden {p v : Person}
    {pr : Elements.PropertyItem} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bA1 p v pr o c) :
    Proving.Terrorism.Section2332bSubsecA1 (gPerson p) (gAction o) (gComplaint c) :=
  ⟨corr_transcending h.transcendsNationalBoundaries,
   corr_circumstance h.circumstance,
   conduct_candidate_implies_golden h.conduct,
   corr_inViolation h.violatesStateOrFederalLaw⟩








theorem s2332bA2_candidate_implies_golden {p : Person} {o : Elements.Offense}
    {c : ComplaintText} (h : Elements.Section2332bA2 p o c) :
    Proving.Terrorism.Section2332bSubsecA2 (gPerson p) (gAction o) (gComplaint c) :=
  ⟨corr_transcending h.transcendsNationalBoundaries,
   corr_circumstance h.circumstance,
   corr_inchoate h.mode⟩


theorem s2332b_candidate_implies_golden {p v : Person}
    {pr : Elements.PropertyItem} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section2332bOffense p v pr o c) :
    Proving.Terrorism.ValidTerrorismClaim (gPerson p) (gComplaint c) :=
  match h with
  | .substantive h1 =>
      .viaSection2332bSubsecA1 (gAction o) (s2332bA1_candidate_implies_golden h1)
  | .inchoate h2 =>
      .viaSection2332bSubsecA2 (gAction o) (s2332bA2_candidate_implies_golden h2)










axiom corr_g5_motive {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToInfluenceOrRetaliateAgainstGovernment o c →
    Proving.Terrorism.CalculatedToInfluenceOrRetaliateAgainstGovernment (gAction o)
      (gComplaint c)



axiom corr_g5_enumerated {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsEnumeratedTerrorismOffense o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense (gAction o) (gComplaint c)





theorem s2332b_g5_candidate_implies_golden {o : Elements.Offense}
    {c : ComplaintText} (h : Elements.FederalCrimeOfTerrorism o c) :
    Proving.Terrorism.FederalCrimeOfTerrorism (gAction o) (gComplaint c) :=
  ⟨corr_g5_motive h.calculatedToInfluenceGovernment,
   corr_g5_enumerated h.enumeratedOffense⟩









theorem s2332b_g1961G_candidate_implies_golden {o : Elements.Offense}
    {c : ComplaintText} (h : Elements.IsEnumeratedTerrorismOffense o c) :
    Proving.Terrorism.RicoPredicateActUnderClauseG (gAction o) (gComplaint c) :=
  ⟨corr_g5_enumerated h⟩

end Proving.USC.T18.Ch113B.Wmd.Part3.GoldenBridge
