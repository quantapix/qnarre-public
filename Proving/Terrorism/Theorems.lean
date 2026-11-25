














import Proving.Terrorism.Statute

namespace Proving.Terrorism







theorem section2332aTarget_ofUsNationalAbroad
    {a : Action} {c : ComplaintText}
    (h : AgainstUsNationalOutsideUs a c)
    : Section2332aTarget a c :=
  Section2332aTarget.viaUsNationalAbroad h

theorem section2332aTarget_ofWithinUsAndCommerce
    {a : Action} {c : ComplaintText}
    (hTarget   : AgainstPersonOrPropertyWithinUs a c)
    (hCommerce : InterstateOrForeignCommerceNexus a c)
    : Section2332aTarget a c :=
  Section2332aTarget.viaWithinUsAndCommerce hTarget hCommerce

theorem section2332aTarget_ofUnitedStatesProperty
    {a : Action} {c : ComplaintText}
    (h : AgainstUnitedStatesProperty a c)
    : Section2332aTarget a c :=
  Section2332aTarget.viaUnitedStatesProperty h

theorem section2332aTarget_ofForeignGovernmentProperty
    {a : Action} {c : ComplaintText}
    (h : AgainstForeignGovernmentPropertyWithinUs a c)
    : Section2332aTarget a c :=
  Section2332aTarget.viaForeignGovernmentProperty h



theorem section2332aSubsecA_intro
    {defendant : Person} {w : Weapon}
    {a : Action} {c : ComplaintText}
    (hWmd       : IsWeaponOfMassDestruction w c)
    (hAuthority : WithoutLawfulAuthority defendant a c)
    (hConduct   : UsesThreatensAttemptsOrConspiresToUse defendant w a c)
    (hTarget    : Section2332aTarget a c)
    : Section2332aSubsecA defendant w a c :=
  { isWmd := hWmd
    withoutAuthority := hAuthority
    conduct := hConduct
    target := hTarget }

theorem section2332aSubsecB_intro
    {defendant : Person} {w : Weapon}
    {a : Action} {c : ComplaintText}
    (hWmd       : IsWeaponOfMassDestruction w c)
    (hNational  : IsNationalOfUnitedStates defendant c)
    (hAuthority : WithoutLawfulAuthority defendant a c)
    (hConduct   : UsesThreatensAttemptsOrConspiresToUse defendant w a c)
    (hOutside   : ConductOutsideUnitedStates a c)
    : Section2332aSubsecB defendant w a c :=
  { isWmd := hWmd
    isUsNational := hNational
    withoutAuthority := hAuthority
    conduct := hConduct
    outsideUs := hOutside }

theorem section2332bConduct_ofViolenceAgainstPerson
    {defendant : Person} {a : Action} {c : ComplaintText}
    (h : ViolentActAgainstPersonWithinUs defendant a c)
    : Section2332bConduct defendant a c :=
  Section2332bConduct.viaViolenceAgainstPerson h

theorem section2332bConduct_ofPropertyHarm
    {defendant : Person} {a : Action} {c : ComplaintText}
    (h : PropertyHarmCreatingRiskOfSeriousBodilyInjury defendant a c)
    : Section2332bConduct defendant a c :=
  Section2332bConduct.viaPropertyHarm h

theorem section2332bSubsecA1_intro
    {defendant : Person} {a : Action} {c : ComplaintText}
    (hTranscending : ConductTranscendingNationalBoundaries a c)
    (hCircumstance : JurisdictionalCircumstanceExists a c)
    (hConduct      : Section2332bConduct defendant a c)
    (hViolation    : InViolationOfStateOrFederalLaw a c)
    : Section2332bSubsecA1 defendant a c :=
  { transcending := hTranscending
    circumstance := hCircumstance
    conduct := hConduct
    inViolation := hViolation }

theorem section2332bSubsecA2_intro
    {defendant : Person} {a : Action} {c : ComplaintText}
    (hTranscending : ConductTranscendingNationalBoundaries a c)
    (hCircumstance : JurisdictionalCircumstanceExists a c)
    (hInchoate     : ThreatensAttemptsOrConspiresUnderSection2332b defendant a c)
    : Section2332bSubsecA2 defendant a c :=
  { transcending := hTranscending
    circumstance := hCircumstance
    inchoate := hInchoate }



theorem federalCrimeOfTerrorism_intro
    {a : Action} {c : ComplaintText}
    (hMotive     : CalculatedToInfluenceOrRetaliateAgainstGovernment a c)
    (hEnumerated : ViolatesEnumeratedTerrorismOffense a c)
    : FederalCrimeOfTerrorism a c :=
  { motive := hMotive
    enumerated := hEnumerated }

theorem ricoPredicateActUnderClauseG_intro
    {a : Action} {c : ComplaintText}
    (hEnumerated : ViolatesEnumeratedTerrorismOffense a c)
    : RicoPredicateActUnderClauseG a c :=
  { enumerated := hEnumerated }







theorem ricoPredicateActUnderClauseG_ofFederalCrimeOfTerrorism
    {a : Action} {c : ComplaintText}
    (h : FederalCrimeOfTerrorism a c)
    : RicoPredicateActUnderClauseG a c :=
  { enumerated := h.enumerated }



theorem validTerrorism_ofSection2332aSubsecA
    {defendant : Person} {w : Weapon}
    {a : Action} {c : ComplaintText}
    (h : Section2332aSubsecA defendant w a c)
    : ValidTerrorismClaim defendant c :=
  ValidTerrorismClaim.viaSection2332aSubsecA w a h

theorem validTerrorism_ofSection2332aSubsecB
    {defendant : Person} {w : Weapon}
    {a : Action} {c : ComplaintText}
    (h : Section2332aSubsecB defendant w a c)
    : ValidTerrorismClaim defendant c :=
  ValidTerrorismClaim.viaSection2332aSubsecB w a h

theorem validTerrorism_ofSection2332bSubsecA1
    {defendant : Person} {a : Action} {c : ComplaintText}
    (h : Section2332bSubsecA1 defendant a c)
    : ValidTerrorismClaim defendant c :=
  ValidTerrorismClaim.viaSection2332bSubsecA1 a h

theorem validTerrorism_ofSection2332bSubsecA2
    {defendant : Person} {a : Action} {c : ComplaintText}
    (h : Section2332bSubsecA2 defendant a c)
    : ValidTerrorismClaim defendant c :=
  ValidTerrorismClaim.viaSection2332bSubsecA2 a h

end Proving.Terrorism
