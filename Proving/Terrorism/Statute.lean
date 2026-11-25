













import Proving.Terrorism.Predicates

namespace Proving.Terrorism













inductive Section2332aTarget (a : Action) (c : ComplaintText) : Prop where
  | viaUsNationalAbroad
      (h : AgainstUsNationalOutsideUs a c) :
      Section2332aTarget a c
  | viaWithinUsAndCommerce
      (hTarget : AgainstPersonOrPropertyWithinUs a c)
      (hCommerce : InterstateOrForeignCommerceNexus a c) :
      Section2332aTarget a c
  | viaUnitedStatesProperty
      (h : AgainstUnitedStatesProperty a c) :
      Section2332aTarget a c
  | viaForeignGovernmentProperty
      (h : AgainstForeignGovernmentPropertyWithinUs a c) :
      Section2332aTarget a c






structure Section2332aSubsecA
    (defendant : Person) (w : Weapon)
    (a : Action) (c : ComplaintText) : Prop where
  isWmd            : IsWeaponOfMassDestruction w c
  withoutAuthority : WithoutLawfulAuthority defendant a c
  conduct          : UsesThreatensAttemptsOrConspiresToUse defendant w a c
  target           : Section2332aTarget a c










structure Section2332aSubsecB
    (defendant : Person) (w : Weapon)
    (a : Action) (c : ComplaintText) : Prop where
  isWmd            : IsWeaponOfMassDestruction w c
  isUsNational     : IsNationalOfUnitedStates defendant c
  withoutAuthority : WithoutLawfulAuthority defendant a c
  conduct          : UsesThreatensAttemptsOrConspiresToUse defendant w a c
  outsideUs        : ConductOutsideUnitedStates a c







inductive Section2332bConduct
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop where
  | viaViolenceAgainstPerson
      (h : ViolentActAgainstPersonWithinUs defendant a c) :
      Section2332bConduct defendant a c
  | viaPropertyHarm
      (h : PropertyHarmCreatingRiskOfSeriousBodilyInjury defendant a c) :
      Section2332bConduct defendant a c




structure Section2332bSubsecA1
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop where
  transcending  : ConductTranscendingNationalBoundaries a c
  circumstance  : JurisdictionalCircumstanceExists a c
  conduct       : Section2332bConduct defendant a c
  inViolation   : InViolationOfStateOrFederalLaw a c










structure Section2332bSubsecA2
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop where
  transcending : ConductTranscendingNationalBoundaries a c
  circumstance : JurisdictionalCircumstanceExists a c
  inchoate     : ThreatensAttemptsOrConspiresUnderSection2332b defendant a c











structure FederalCrimeOfTerrorism (a : Action) (c : ComplaintText) : Prop where
  motive     : CalculatedToInfluenceOrRetaliateAgainstGovernment a c
  enumerated : ViolatesEnumeratedTerrorismOffense a c












structure RicoPredicateActUnderClauseG
    (a : Action) (c : ComplaintText) : Prop where
  enumerated : ViolatesEnumeratedTerrorismOffense a c







inductive ValidTerrorismClaim
    (defendant : Person) (c : ComplaintText) : Prop where
  | viaSection2332aSubsecA
      (w : Weapon) (a : Action)
      (h : Section2332aSubsecA defendant w a c) :
      ValidTerrorismClaim defendant c
  | viaSection2332aSubsecB
      (w : Weapon) (a : Action)
      (h : Section2332aSubsecB defendant w a c) :
      ValidTerrorismClaim defendant c
  | viaSection2332bSubsecA1
      (a : Action)
      (h : Section2332bSubsecA1 defendant a c) :
      ValidTerrorismClaim defendant c
  | viaSection2332bSubsecA2
      (a : Action)
      (h : Section2332bSubsecA2 defendant a c) :
      ValidTerrorismClaim defendant c

end Proving.Terrorism
