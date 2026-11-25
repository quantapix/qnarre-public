














import Proving.Trafficking.Predicates

namespace Proving.Trafficking










structure Section1590SubsecA
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop where
  knowingly       : ActedKnowingly defendant a c
  conduct         : RecruitsHarborsTransportsProvidesOrObtains defendant victim a c
  forLabor        : ForLaborOrServices victim a c
  chapterPredicate : InViolationOfChapterSeventySeven a c
















































structure Section1590SubsecB
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly defendant a c
  obstructs : ObstructsEnforcementOfSection1590 defendant a c



















inductive Section1591Conduct
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop where
  | viaRecruitment
      (hJurisdiction : InterstateCommerceOrSpecialJurisdiction a c)
      (hConduct      : RecruitsEnticesHarborsAdvertisesOrSolicits defendant victim a c) :
      Section1591Conduct defendant victim a c
  | viaVentureBenefit
      (hBenefit : BenefitsFromParticipationInVenture defendant a c)
      (hVenture : VentureEngagedInSection1591a1Act a c) :
      Section1591Conduct defendant victim a c










inductive Section1591MensRea
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop where
  | viaCoercion
      (hMens  : KnewOrRecklesslyDisregardedCoerciveMeans defendant victim a c)
      (hMeans : CoerciveMeansWillBeUsed victim a c) :
      Section1591MensRea defendant victim a c
  | viaKnownMinority
      (hMens : KnewOrRecklesslyDisregardedThatPersonWasMinor defendant victim c)
      (hAge  : PersonHasNotAttainedAgeEighteen victim c) :
      Section1591MensRea defendant victim a c
  | viaObservedMinority
      (hObserve : ReasonableOpportunityToObservePerson defendant victim c)
      (hAge     : PersonHasNotAttainedAgeEighteen victim c) :
      Section1591MensRea defendant victim a c








structure Section1591SubsecA
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop where
  knowingly     : ActedKnowingly defendant a c
  conduct       : Section1591Conduct defendant victim a c
  mensRea       : Section1591MensRea defendant victim a c
  commercialSex : WillBeCausedToEngageInCommercialSexAct victim a c









structure Section1591SubsecD
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly defendant a c
  obstructs : ObstructsEnforcementOfSection1591 defendant a c









inductive Section1592Purpose
    (defendant : Person) (victim : Person)
    (a : Action) (c : ComplaintText) : Prop where
  | viaInCourseOfViolation
      (h : InCourseOfEnumeratedTraffickingViolation a c) :
      Section1592Purpose defendant victim a c
  | viaIntentToViolate
      (h : WithIntentToViolateEnumeratedTraffickingSection defendant a c) :
      Section1592Purpose defendant victim a c
  | viaRestrictingLiberty
      (hRestrict  : ToPreventOrRestrictLibertyToMoveOrTravel defendant victim a c)
      (hAuthority : WithoutLawfulAuthority defendant a c)
      (hMaintain  : InOrderToMaintainLaborOrServices victim a c)
      (hVictim    : IsVictimOfSevereFormOfTrafficking victim c) :
      Section1592Purpose defendant victim a c











structure Section1592SubsecA
    (defendant : Person) (victim : Person) (d : Document)
    (a : Action) (c : ComplaintText) : Prop where
  knowingly   : ActedKnowingly defendant a c
  conduct     : DestroysConcealsRemovesConfiscatesOrPossesses defendant d a c
  isDocument  : IsPassportOrGovernmentIdentificationDocument d c
  ofAnother   : DocumentOfAnotherPerson d victim c
  purpose     : Section1592Purpose defendant victim a c
  notExcluded : Section1592bVictimExclusionInapplicable defendant a c







structure Section1592SubsecC
    (defendant : Person) (a : Action) (c : ComplaintText) : Prop where
  knowingly : ActedKnowingly defendant a c
  obstructs : ObstructsEnforcementOfSection1592 defendant a c







inductive ValidTraffickingClaim
    (defendant : Person) (c : ComplaintText) : Prop where
  | viaSection1590SubsecA
      (victim : Person) (a : Action)
      (h : Section1590SubsecA defendant victim a c) :
      ValidTraffickingClaim defendant c
  | viaSection1590SubsecB
      (a : Action)
      (h : Section1590SubsecB defendant a c) :
      ValidTraffickingClaim defendant c
  | viaSection1591SubsecA
      (victim : Person) (a : Action)
      (h : Section1591SubsecA defendant victim a c) :
      ValidTraffickingClaim defendant c
  | viaSection1591SubsecD
      (a : Action)
      (h : Section1591SubsecD defendant a c) :
      ValidTraffickingClaim defendant c
  | viaSection1592SubsecA
      (victim : Person) (d : Document) (a : Action)
      (h : Section1592SubsecA defendant victim d a c) :
      ValidTraffickingClaim defendant c
  | viaSection1592SubsecC
      (a : Action)
      (h : Section1592SubsecC defendant a c) :
      ValidTraffickingClaim defendant c



























structure RicoPredicateActUnderClauseB
    (defendant : Person) (c : ComplaintText) : Prop where
  indictable : ValidTraffickingClaim defendant c

end Proving.Trafficking
