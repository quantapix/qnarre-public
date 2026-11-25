














import Proving.Trafficking.Statute

namespace Proving.Trafficking



theorem section1590SubsecA_intro
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (hKnowingly : ActedKnowingly defendant a c)
    (hConduct   : RecruitsHarborsTransportsProvidesOrObtains defendant victim a c)
    (hLabor     : ForLaborOrServices victim a c)
    (hChapter   : InViolationOfChapterSeventySeven a c)
    : Section1590SubsecA defendant victim a c :=
  { knowingly := hKnowingly
    conduct := hConduct
    forLabor := hLabor
    chapterPredicate := hChapter }

theorem section1590SubsecB_intro
    {defendant : Person} {a : Action} {c : ComplaintText}
    (hKnowingly : ActedKnowingly defendant a c)
    (hObstructs : ObstructsEnforcementOfSection1590 defendant a c)
    : Section1590SubsecB defendant a c :=
  { knowingly := hKnowingly
    obstructs := hObstructs }








theorem section1591Conduct_ofRecruitment
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (hJurisdiction : InterstateCommerceOrSpecialJurisdiction a c)
    (hConduct      : RecruitsEnticesHarborsAdvertisesOrSolicits defendant victim a c)
    : Section1591Conduct defendant victim a c :=
  Section1591Conduct.viaRecruitment hJurisdiction hConduct

theorem section1591Conduct_ofVentureBenefit
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (hBenefit : BenefitsFromParticipationInVenture defendant a c)
    (hVenture : VentureEngagedInSection1591a1Act a c)
    : Section1591Conduct defendant victim a c :=
  Section1591Conduct.viaVentureBenefit hBenefit hVenture







theorem section1591MensRea_ofCoercion
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (hMens  : KnewOrRecklesslyDisregardedCoerciveMeans defendant victim a c)
    (hMeans : CoerciveMeansWillBeUsed victim a c)
    : Section1591MensRea defendant victim a c :=
  Section1591MensRea.viaCoercion hMens hMeans

theorem section1591MensRea_ofKnownMinority
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (hMens : KnewOrRecklesslyDisregardedThatPersonWasMinor defendant victim c)
    (hAge  : PersonHasNotAttainedAgeEighteen victim c)
    : Section1591MensRea defendant victim a c :=
  Section1591MensRea.viaKnownMinority hMens hAge




theorem section1591MensRea_ofObservedMinority
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (hObserve : ReasonableOpportunityToObservePerson defendant victim c)
    (hAge     : PersonHasNotAttainedAgeEighteen victim c)
    : Section1591MensRea defendant victim a c :=
  Section1591MensRea.viaObservedMinority hObserve hAge

theorem section1591SubsecA_intro
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (hKnowingly     : ActedKnowingly defendant a c)
    (hConduct       : Section1591Conduct defendant victim a c)
    (hMensRea       : Section1591MensRea defendant victim a c)
    (hCommercialSex : WillBeCausedToEngageInCommercialSexAct victim a c)
    : Section1591SubsecA defendant victim a c :=
  { knowingly := hKnowingly
    conduct := hConduct
    mensRea := hMensRea
    commercialSex := hCommercialSex }

theorem section1591SubsecD_intro
    {defendant : Person} {a : Action} {c : ComplaintText}
    (hKnowingly : ActedKnowingly defendant a c)
    (hObstructs : ObstructsEnforcementOfSection1591 defendant a c)
    : Section1591SubsecD defendant a c :=
  { knowingly := hKnowingly
    obstructs := hObstructs }






theorem section1592Purpose_ofInCourseOfViolation
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (h : InCourseOfEnumeratedTraffickingViolation a c)
    : Section1592Purpose defendant victim a c :=
  Section1592Purpose.viaInCourseOfViolation h

theorem section1592Purpose_ofIntentToViolate
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (h : WithIntentToViolateEnumeratedTraffickingSection defendant a c)
    : Section1592Purpose defendant victim a c :=
  Section1592Purpose.viaIntentToViolate h

theorem section1592Purpose_ofRestrictingLiberty
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (hRestrict  : ToPreventOrRestrictLibertyToMoveOrTravel defendant victim a c)
    (hAuthority : WithoutLawfulAuthority defendant a c)
    (hMaintain  : InOrderToMaintainLaborOrServices victim a c)
    (hVictim    : IsVictimOfSevereFormOfTrafficking victim c)
    : Section1592Purpose defendant victim a c :=
  Section1592Purpose.viaRestrictingLiberty hRestrict hAuthority hMaintain hVictim

theorem section1592SubsecA_intro
    {defendant victim : Person} {d : Document}
    {a : Action} {c : ComplaintText}
    (hKnowingly   : ActedKnowingly defendant a c)
    (hConduct     : DestroysConcealsRemovesConfiscatesOrPossesses defendant d a c)
    (hIsDocument  : IsPassportOrGovernmentIdentificationDocument d c)
    (hOfAnother   : DocumentOfAnotherPerson d victim c)
    (hPurpose     : Section1592Purpose defendant victim a c)
    (hNotExcluded : Section1592bVictimExclusionInapplicable defendant a c)
    : Section1592SubsecA defendant victim d a c :=
  { knowingly := hKnowingly
    conduct := hConduct
    isDocument := hIsDocument
    ofAnother := hOfAnother
    purpose := hPurpose
    notExcluded := hNotExcluded }

theorem section1592SubsecC_intro
    {defendant : Person} {a : Action} {c : ComplaintText}
    (hKnowingly : ActedKnowingly defendant a c)
    (hObstructs : ObstructsEnforcementOfSection1592 defendant a c)
    : Section1592SubsecC defendant a c :=
  { knowingly := hKnowingly
    obstructs := hObstructs }



theorem validTraffickingClaim_ofSection1590SubsecA
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (h : Section1590SubsecA defendant victim a c)
    : ValidTraffickingClaim defendant c :=
  ValidTraffickingClaim.viaSection1590SubsecA victim a h

theorem validTraffickingClaim_ofSection1590SubsecB
    {defendant : Person} {a : Action} {c : ComplaintText}
    (h : Section1590SubsecB defendant a c)
    : ValidTraffickingClaim defendant c :=
  ValidTraffickingClaim.viaSection1590SubsecB a h

theorem validTraffickingClaim_ofSection1591SubsecA
    {defendant victim : Person} {a : Action} {c : ComplaintText}
    (h : Section1591SubsecA defendant victim a c)
    : ValidTraffickingClaim defendant c :=
  ValidTraffickingClaim.viaSection1591SubsecA victim a h

theorem validTraffickingClaim_ofSection1591SubsecD
    {defendant : Person} {a : Action} {c : ComplaintText}
    (h : Section1591SubsecD defendant a c)
    : ValidTraffickingClaim defendant c :=
  ValidTraffickingClaim.viaSection1591SubsecD a h

theorem validTraffickingClaim_ofSection1592SubsecA
    {defendant victim : Person} {d : Document}
    {a : Action} {c : ComplaintText}
    (h : Section1592SubsecA defendant victim d a c)
    : ValidTraffickingClaim defendant c :=
  ValidTraffickingClaim.viaSection1592SubsecA victim d a h

theorem validTraffickingClaim_ofSection1592SubsecC
    {defendant : Person} {a : Action} {c : ComplaintText}
    (h : Section1592SubsecC defendant a c)
    : ValidTraffickingClaim defendant c :=
  ValidTraffickingClaim.viaSection1592SubsecC a h







theorem ricoPredicateActUnderClauseB_intro
    {defendant : Person} {c : ComplaintText}
    (h : ValidTraffickingClaim defendant c)
    : RicoPredicateActUnderClauseB defendant c :=
  { indictable := h }

end Proving.Trafficking
