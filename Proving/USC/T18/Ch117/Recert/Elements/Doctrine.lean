import Proving.USC.Common.Tactic
import Proving.USC.T18.Ch117.Recert.Elements.Statute

set_option autoImplicit false











namespace Proving.USC.T18.Ch117.Recert.Elements

open Proving.USC.Common




@[grind →] theorem fiveOrMore_of_count {d : Person} {c : ComplaintText} {n : Nat}
    (hCount : ProstitutedPersonCount d c = n) (hGe : 5 ≤ n) :
    PromotesOrFacilitatesFiveOrMore d c := by
  unfold PromotesOrFacilitatesFiveOrMore
  omega


@[grind →] theorem underEighteen_of_age {v : Person} {c : ComplaintText} {n : Nat}
    (hAge : VictimAgeYears v c = n) (hLt : n < 18) : UnderEighteen v c := by
  unfold UnderEighteen
  omega



@[grind →] theorem commerceNexus_of_facility {d : Person} {c : ComplaintText}
    (h : UsesFacilityOrMeansOfInterstateCommerce d c) : CommerceNexus2421A d c :=
  .facility h

@[grind →] theorem commerceNexus_of_affecting {d : Person} {c : ComplaintText}
    (h : ConductInOrAffectingInterstateCommerce d c) : CommerceNexus2421A d c :=
  .affecting h

@[grind →] theorem attemptToOperateIcs_of_leaves {d : Person}
    {s : InteractiveComputerService} {c : ComplaintText}
    (h1 : IntentToOwnManageOrOperateIcs d s c)
    (h2 : TakesSubstantialStepTowardIcsOperation d s c) : AttemptToOperateIcs d s c :=
  ⟨h1, h2⟩

@[grind →] theorem icsOperationRoute_of_operates {d : Person}
    {s : InteractiveComputerService} {c : ComplaintText}
    (h : OwnsManagesOrOperatesIcs d s c) : IcsOperationRoute d s c :=
  .operates h

@[grind →] theorem icsOperationRoute_of_attempt {d : Person}
    {s : InteractiveComputerService} {c : ComplaintText}
    (h : AttemptToOperateIcs d s c) : IcsOperationRoute d s c :=
  .attempts h

@[grind →] theorem icsOperationRoute_of_conspiracy {d : Person}
    {s : InteractiveComputerService} {c : ComplaintText}
    (h : ConspiracyToOperateIcs d s c) : IcsOperationRoute d s c :=
  .conspires h

@[grind →] theorem fiveOrMoreRoute_of_leaves {d : Person} {c : ComplaintText}
    (h1 : PromotesOrFacilitatesProstitutionOfAnother d c)
    (h2 : PromotesOrFacilitatesFiveOrMore d c)
    (h3 : ¬ DefenseProstitutionLegalInTargetedJurisdiction d c) : FiveOrMoreRoute d c :=
  ⟨h1, h2, h3⟩

@[grind →] theorem recklessDisregardRoute_of_leaves {d : Person} {c : ComplaintText}
    (h1 : ConductContributedToSexTrafficking d c) (h2 : ActsInRecklessDisregard d c) :
    RecklessDisregardRoute d c :=
  ⟨h1, h2⟩

@[grind →] theorem aggravator_of_fiveOrMore {d : Person} {c : ComplaintText}
    (h : FiveOrMoreRoute d c) : Aggravator2421Ab d c :=
  .fiveOrMore h

@[grind →] theorem aggravator_of_recklessDisregard {d : Person} {c : ComplaintText}
    (h : RecklessDisregardRoute d c) : Aggravator2421Ab d c :=
  .recklessDisregard h



@[grind →] theorem sexualActRoute_of_leaves {d : Person} {v : Person}
    {c : ComplaintText} (h1 : SexualActUnderSection2246 d v c)
    (h2 : UnderEighteen v c)
    (h3 : WouldViolateChapter109AInSpecialMaritimeJurisdiction d v c) :
    SexualActRoute d v c :=
  ⟨h1, h2, h3⟩

@[grind →] theorem commercialSexActRoute_of_leaves {d : Person} {v : Person}
    {c : ComplaintText} (h1 : CommercialSexActUnderSection1591 d v c)
    (h2 : UnderEighteen v c)
    (h3 : ¬ DefenseReasonableBeliefVictimAttainedEighteen d v c) :
    CommercialSexActRoute d v c :=
  ⟨h1, h2, h3⟩

@[grind →] theorem illicitSexualConduct_of_sexualAct {d : Person} {v : Person}
    {c : ComplaintText} (h : SexualActRoute d v c) : IllicitSexualConduct d v c :=
  .sexualAct h

@[grind →] theorem illicitSexualConduct_of_commercialSexAct {d : Person} {v : Person}
    {c : ComplaintText} (h : CommercialSexActRoute d v c) : IllicitSexualConduct d v c :=
  .commercialSexAct h

@[grind →] theorem illicitSexualConduct_of_childPornography {d : Person} {v : Person}
    {c : ComplaintText} (h : ProducesChildPornographyUnderSection2256 d v c) :
    IllicitSexualConduct d v c :=
  .childPornography h



@[grind →] theorem transportJurisdiction_of_commerce {t : Travel} {c : ComplaintText}
    (h : TransportationInInterstateOrForeignCommerce t c) :
    TransportJurisdiction2423a t c :=
  .commerce h

@[grind →] theorem transportJurisdiction_of_territory {t : Travel} {c : ComplaintText}
    (h : TransportationWithinTerritoryOrPossession t c) :
    TransportJurisdiction2423a t c :=
  .territory h

@[grind →] theorem unlawfulPurpose_of_prostitution {d : Person} {v : Person}
    {c : ComplaintText} (h : IntentThatIndividualEngageInProstitution d v c) :
    UnlawfulPurpose2423a d v c :=
  .prostitution h

@[grind →] theorem unlawfulPurpose_of_chargeableSexualActivity {d : Person}
    {v : Person} {c : ComplaintText}
    (h : IntentThatIndividualEngageInChargeableSexualActivity d v c) :
    UnlawfulPurpose2423a d v c :=
  .chargeableSexualActivity h

@[grind →] theorem foreignCommerceTravelByCitizen_of_leaves {d : Person} {t : Travel}
    {c : ComplaintText} (h1 : IsUnitedStatesCitizenOrLawfulPermanentResident d c)
    (h2 : TravelsInForeignCommerce d t c) : ForeignCommerceTravelByCitizen d t c :=
  ⟨h1, h2⟩

@[grind →] theorem travelPredicate_of_interstate {d : Person} {t : Travel}
    {c : ComplaintText} (h : TravelsInInterstateCommerce d t c) :
    TravelPredicate2423b d t c :=
  .interstate h

@[grind →] theorem travelPredicate_of_intoUnitedStates {d : Person} {t : Travel}
    {c : ComplaintText} (h : TravelsIntoTheUnitedStates d t c) :
    TravelPredicate2423b d t c :=
  .intoUnitedStates h

@[grind →] theorem travelPredicate_of_citizenForeign {d : Person} {t : Travel}
    {c : ComplaintText} (h : ForeignCommerceTravelByCitizen d t c) :
    TravelPredicate2423b d t c :=
  .citizenForeign h

@[grind →] theorem foreignNexus_of_travels {d : Person} {t : Travel}
    {c : ComplaintText} (h : TravelsInForeignCommerce d t c) :
    ForeignNexus2423c d t c :=
  .travels h






theorem foreignNexus_of_resides {d : Person} {t : Travel}
    {c : ComplaintText} (h : ResidesInForeignCountry d c) : ForeignNexus2423c d t c :=
  .resides h



@[grind →] theorem attemptToViolate2423_of_leaves {d : Person} {c : ComplaintText}
    (h1 : IntentToCommitSection2423Offense d c)
    (h2 : TakesSubstantialStepTowardSection2423Offense d c) :
    AttemptToViolate2423 d c :=
  ⟨h1, h2⟩

@[grind →] theorem section2423f_of_attempt {d : Person} {c : ComplaintText}
    (h : AttemptToViolate2423 d c) : Section2423f d c :=
  .attempt h

@[grind →] theorem section2423f_of_conspiracy {d : Person} {c : ComplaintText}
    (h : ConspiracyToViolate2423 d c) : Section2423f d c :=
  .conspiracy h



example {d : Person} {v : Person} {c : ComplaintText} {n : Nat}
    (h1 : CommercialSexActUnderSection1591 d v c) (h2 : VictimAgeYears v c = n)
    (h3 : n < 18) (h4 : ¬ DefenseReasonableBeliefVictimAttainedEighteen d v c) :
    EngagesInIllicitSexualConduct d v c := by
  prove_element

example {d : Person} {c : ComplaintText} {n : Nat}
    (h1 : PromotesOrFacilitatesProstitutionOfAnother d c)
    (h2 : ProstitutedPersonCount d c = n) (h3 : 5 ≤ n)
    (h4 : ¬ DefenseProstitutionLegalInTargetedJurisdiction d c) :
    Aggravator2421Ab d c := by
  prove_element

example {d : Person} {s : InteractiveComputerService} {c : ComplaintText}
    (h1 : IntentToOwnManageOrOperateIcs d s c)
    (h2 : TakesSubstantialStepTowardIcsOperation d s c) : IcsOperationRoute d s c := by
  prove_element

example {d : Person} {t : Travel} {c : ComplaintText}
    (h1 : IsUnitedStatesCitizenOrLawfulPermanentResident d c)
    (h2 : TravelsInForeignCommerce d t c) : TravelPredicate2423b d t c := by
  prove_element

end Proving.USC.T18.Ch117.Recert.Elements
