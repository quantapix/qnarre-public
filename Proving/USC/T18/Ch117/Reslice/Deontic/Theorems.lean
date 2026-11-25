





import Proving.USC.T18.Ch117.Reslice.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Deontic

open Proving.USC.Common



theorem prohibition2421AaViolated_intro
    {p : Person} {s : InteractiveComputerService} {c : ComplaintText}
    (hAddr : OwnsManagesOrOperatesInteractiveComputerService p s c)
    (hCond : UsesFacilityOrMeansOfInterstateOrForeignCommerce p c)
    (hAct : IntentToPromoteOrFacilitateProstitutionOfAnother p s c) :
    Prohibition2421AaViolated p s c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition2421AbViolated_intro
    {p : Person} {s : InteractiveComputerService} {c : ComplaintText}
    (hAddr : OwnsManagesOrOperatesInteractiveComputerService p s c)
    (hCond : UsesFacilityOrMeansOfInterstateOrForeignCommerce p c)
    (hIntent : IntentToPromoteOrFacilitateProstitutionOfAnother p s c)
    (hAgg : Aggravator2421Ab p c) :
    Prohibition2421AbViolated p s c :=
  ⟨⟨⟨hAddr, hCond⟩, hIntent⟩, hAgg⟩


theorem aggravator2421Ab_fiveOrMore_intro
    {p : Person} {c : ComplaintText}
    (h : PromotesOrFacilitatesProstitutionOfFiveOrMorePersons p c) :
    Aggravator2421Ab p c :=
  Aggravator2421Ab.fiveOrMorePersons h


theorem aggravator2421Ab_recklessDisregard_intro
    {p : Person} {c : ComplaintText}
    (h : ActsInRecklessDisregardOfContributionToSexTrafficking p c) :
    Aggravator2421Ab p c :=
  Aggravator2421Ab.recklessDisregardOfSexTrafficking h


theorem affirmativeDefense2421Ae_intro
    {p : Person} {c : ComplaintText} (j : TargetedJurisdiction)
    (h : ProstitutionLegalInTargetedJurisdiction p j c) :
    AffirmativeDefense2421Ae p c :=
  ⟨j, h⟩


theorem prohibition2421AaLiable_intro
    {p : Person} {s : InteractiveComputerService} {c : ComplaintText}
    (hViol : Prohibition2421AaViolated p s c)
    (hNoDefense : ¬ AffirmativeDefense2421Ae p c) :
    Prohibition2421AaLiable p s c :=
  ⟨hViol, hNoDefense⟩



theorem prohibition2421Ab1Liable_intro
    {p : Person} {s : InteractiveComputerService} {c : ComplaintText}
    (hNorm : Prohibition2421Ab p s c)
    (hFive : PromotesOrFacilitatesProstitutionOfFiveOrMorePersons p c)
    (hNoDefense : ¬ AffirmativeDefense2421Ae p c) :
    Prohibition2421Ab1Liable p s c :=
  ⟨hNorm, hFive, hNoDefense⟩


theorem permission2421AcAvailable_intro
    {v : Person} {p : Person} {ct : UnitedStatesDistrictCourt} {c : ComplaintText}
    (hInjury : InjuredByReasonOfViolation v p c)
    (hForum : ForumIsAppropriateUnitedStatesDistrictCourt ct c) :
    Permission2421AcAvailable v p ct c :=
  ⟨hInjury, hForum⟩



theorem obligation2421AdBreached_intro
    {ct : UnitedStatesDistrictCourt} {p : Person} {c : ComplaintText}
    (hCond : ViolationOfSubsection2421Ab2Established p c)
    (hNoAct : ¬ CourtOrderedRestitution ct p c) :
    Obligation2421AdBreached ct p c :=
  ⟨⟨hCond⟩, hNoAct⟩


theorem obligation2421AdDischarged_intro
    {ct : UnitedStatesDistrictCourt} {p : Person} {c : ComplaintText}
    (hCond : ViolationOfSubsection2421Ab2Established p c)
    (hAct : CourtOrderedRestitution ct p c) :
    Obligation2421AdDischarged ct p c :=
  ⟨⟨hCond⟩, hAct⟩


theorem illicitSexualConduct_sexualActWithMinor_intro
    {p : Person} {v : Person} {c : ComplaintText}
    (h : SexualActWithPersonUnderEighteenViolatingChapter109A p v c) :
    IllicitSexualConduct p v c :=
  IllicitSexualConduct.sexualActWithMinor h


theorem illicitSexualConduct_commercialSexActWithMinor_intro
    {p : Person} {v : Person} {c : ComplaintText}
    (h : CommercialSexActWithPersonUnderEighteen p v c) :
    IllicitSexualConduct p v c :=
  IllicitSexualConduct.commercialSexActWithMinor h


theorem illicitSexualConduct_productionOfChildPornography_intro
    {p : Person} {v : Person} {c : ComplaintText}
    (h : ProducesChildPornography p v c) :
    IllicitSexualConduct p v c :=
  IllicitSexualConduct.productionOfChildPornography h


theorem prohibition2423aViolated_intro
    {p : Person} {v : Person} {c : ComplaintText}
    (hMinor : IndividualHasNotAttainedAgeOfEighteen v c)
    (hIntent : IntentThatIndividualEngageInProstitutionOrCriminalSexualActivity p v c)
    (hAct : KnowinglyTransportsIndividualInCoveredCommerce p v c) :
    Prohibition2423aViolated p v c :=
  ⟨⟨hMinor, hIntent⟩, hAct⟩


theorem prohibition2423bViolated_intro
    {p : Person} {c : ComplaintText}
    (hIntent : IntentToEngageInIllicitSexualConduct p c)
    (hAct : TravelsInCoveredCommerce p c) :
    Prohibition2423bViolated p c :=
  ⟨⟨hIntent⟩, hAct⟩


theorem prohibition2423cViolated_intro
    {p : Person} {v : Person} {c : ComplaintText}
    (hAddr : IsUnitedStatesCitizenOrLawfulPermanentResident p c)
    (hCond : TravelsInForeignCommerceOrResidesInForeignCountry p c)
    (hAct : IllicitSexualConduct p v c) :
    Prohibition2423cViolated p v c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition2423cLiable_intro
    {p : Person} {v : Person} {c : ComplaintText}
    (hViol : Prohibition2423cViolated p v c)
    (hNoDefense : ¬ Defense2423i p v c) :
    Prohibition2423cLiable p v c :=
  ⟨hViol, hNoDefense⟩


theorem prohibition2423dViolated_intro
    {p : Person} {o : CoveredOrganization} {c : ComplaintText}
    (hAddr : IsUnitedStatesCitizenOrLawfulPermanentResident p c)
    (hAffil : IsOfficerDirectorEmployeeOrAgentOfCoveredOrganization p o c)
    (hUse : UsesMailsOrInterstateInstrumentalityThroughOrganization p o c)
    (hFurther : CommitsActInFurtheranceOfIllicitSexualConductThroughOrganization p o c) :
    Prohibition2423dViolated p o c :=
  ⟨⟨hAddr, hAffil⟩, hUse, hFurther⟩


theorem prohibition2423eViolated_intro
    {p : Person} {t : Person} {c : ComplaintText}
    (hPurpose : ForCommercialAdvantageOrPrivateFinancialGain p c)
    (hKnow : KnowsTravelerTravelsWithIntentToEngageInIllicitSexualConduct p t c)
    (hAct : ArrangesInducesProcuresOrFacilitatesTravel p t c) :
    Prohibition2423eViolated p t c :=
  ⟨⟨hPurpose, hKnow⟩, hAct⟩


theorem prohibition2423fViolated_intro
    {p : Person} {s : Subsection2423} {c : ComplaintText}
    (hAct : AttemptsOrConspiresToViolateSubsection p s c) :
    Prohibition2423fViolated p s c :=
  ⟨hAct⟩

end Proving.USC.T18.Ch117.Reslice.Deontic
