import Proving.USC.T18.Ch117.Recert.Elements.Statute

set_option autoImplicit false









namespace Proving.USC.T18.Ch117.Recert.Elements

open Proving.USC.Common



theorem commerceNexus2421A_intro_facility {d : Person} {c : ComplaintText}
    (h : UsesFacilityOrMeansOfInterstateCommerce d c) : CommerceNexus2421A d c :=
  .facility h

theorem commerceNexus2421A_intro_affecting {d : Person} {c : ComplaintText}
    (h : ConductInOrAffectingInterstateCommerce d c) : CommerceNexus2421A d c :=
  .affecting h

theorem attemptToOperateIcs_intro {d : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hIntent : IntentToOwnManageOrOperateIcs d s c)
    (hStep : TakesSubstantialStepTowardIcsOperation d s c) :
    AttemptToOperateIcs d s c :=
  ⟨hIntent, hStep⟩

theorem conspiracyToOperateIcs_intro {d : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (ag : Agreement) (hAgree : AgreementAmongTwoOrMore ag c)
    (hObject : AgreedObjectIsIcsOperation d s c) : ConspiracyToOperateIcs d s c :=
  ⟨ag, hAgree, hObject⟩

theorem icsOperationRoute_intro_operates {d : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (h : OwnsManagesOrOperatesIcs d s c) :
    IcsOperationRoute d s c :=
  .operates h

theorem icsOperationRoute_intro_attempts {d : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (h : AttemptToOperateIcs d s c) : IcsOperationRoute d s c :=
  .attempts h

theorem icsOperationRoute_intro_conspires {d : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (h : ConspiracyToOperateIcs d s c) : IcsOperationRoute d s c :=
  .conspires h

theorem section2421Aa_intro {d : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hCommerce : CommerceNexus2421A d c)
    (hService : IsInteractiveComputerService s c)
    (hOperation : IcsOperationRoute d s c)
    (hIntent : IntentToPromoteOrFacilitateProstitution d c)
    (hNoDefense : ¬ DefenseProstitutionLegalInTargetedJurisdiction d c) :
    Section2421Aa d s c :=
  ⟨hCommerce, hService, hOperation, hIntent, hNoDefense⟩



theorem fiveOrMoreRoute_intro {d : Person} {c : ComplaintText}
    (hPromotes : PromotesOrFacilitatesProstitutionOfAnother d c)
    (hCount : PromotesOrFacilitatesFiveOrMore d c)
    (hNoDefense : ¬ DefenseProstitutionLegalInTargetedJurisdiction d c) :
    FiveOrMoreRoute d c :=
  ⟨hPromotes, hCount, hNoDefense⟩

theorem recklessDisregardRoute_intro {d : Person} {c : ComplaintText}
    (hContribution : ConductContributedToSexTrafficking d c)
    (hReckless : ActsInRecklessDisregard d c) : RecklessDisregardRoute d c :=
  ⟨hContribution, hReckless⟩

theorem aggravator2421Ab_intro_fiveOrMore {d : Person} {c : ComplaintText}
    (h : FiveOrMoreRoute d c) : Aggravator2421Ab d c :=
  .fiveOrMore h

theorem aggravator2421Ab_intro_recklessDisregard {d : Person} {c : ComplaintText}
    (h : RecklessDisregardRoute d c) : Aggravator2421Ab d c :=
  .recklessDisregard h

theorem section2421Ab_intro {d : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hCommerce : CommerceNexus2421A d c)
    (hService : IsInteractiveComputerService s c)
    (hOperation : IcsOperationRoute d s c)
    (hIntent : IntentToPromoteOrFacilitateProstitution d c)
    (hAggravator : Aggravator2421Ab d c) : Section2421Ab d s c :=
  ⟨hCommerce, hService, hOperation, hIntent, hAggravator⟩

theorem validSection2421AcClaim_intro {pl : Person} {d : Person}
    {s : InteractiveComputerService} {c : ComplaintText}
    (hViolation : Section2421Ab d s c) (hInjury : PlaintiffInjuredByViolation pl c)
    (hCausation : ProximateCause pl c) (hTimeliness : WithinLimitations pl c)
    (hForum : BroughtInUnitedStatesDistrictCourt c) :
    ValidSection2421AcClaim pl d s c :=
  ⟨hViolation, hInjury, hCausation, hTimeliness, hForum⟩

theorem section2421Ad_intro {d : Person} {s : InteractiveComputerService}
    {c : ComplaintText} (hViolation : Section2421Ab d s c)
    (hReckless : RecklessDisregardRoute d c) : Section2421Ad d s c :=
  ⟨hViolation, hReckless⟩



theorem sexualActRoute_intro {d : Person} {v : Person} {c : ComplaintText}
    (hAct : SexualActUnderSection2246 d v c) (hMinor : UnderEighteen v c)
    (hChapter109A : WouldViolateChapter109AInSpecialMaritimeJurisdiction d v c) :
    SexualActRoute d v c :=
  ⟨hAct, hMinor, hChapter109A⟩

theorem commercialSexActRoute_intro {d : Person} {v : Person} {c : ComplaintText}
    (hAct : CommercialSexActUnderSection1591 d v c) (hMinor : UnderEighteen v c)
    (hNoDefense : ¬ DefenseReasonableBeliefVictimAttainedEighteen d v c) :
    CommercialSexActRoute d v c :=
  ⟨hAct, hMinor, hNoDefense⟩

theorem illicitSexualConduct_intro_sexualAct {d : Person} {v : Person}
    {c : ComplaintText} (h : SexualActRoute d v c) : IllicitSexualConduct d v c :=
  .sexualAct h

theorem illicitSexualConduct_intro_commercialSexAct {d : Person} {v : Person}
    {c : ComplaintText} (h : CommercialSexActRoute d v c) :
    IllicitSexualConduct d v c :=
  .commercialSexAct h

theorem illicitSexualConduct_intro_childPornography {d : Person} {v : Person}
    {c : ComplaintText} (h : ProducesChildPornographyUnderSection2256 d v c) :
    IllicitSexualConduct d v c :=
  .childPornography h



theorem transportJurisdiction2423a_intro_commerce {t : Travel} {c : ComplaintText}
    (h : TransportationInInterstateOrForeignCommerce t c) :
    TransportJurisdiction2423a t c :=
  .commerce h

theorem transportJurisdiction2423a_intro_territory {t : Travel} {c : ComplaintText}
    (h : TransportationWithinTerritoryOrPossession t c) :
    TransportJurisdiction2423a t c :=
  .territory h

theorem unlawfulPurpose2423a_intro_prostitution {d : Person} {v : Person}
    {c : ComplaintText} (h : IntentThatIndividualEngageInProstitution d v c) :
    UnlawfulPurpose2423a d v c :=
  .prostitution h

theorem unlawfulPurpose2423a_intro_chargeableSexualActivity {d : Person} {v : Person}
    {c : ComplaintText}
    (h : IntentThatIndividualEngageInChargeableSexualActivity d v c) :
    UnlawfulPurpose2423a d v c :=
  .chargeableSexualActivity h

theorem section2423a_intro {d : Person} {v : Person} {t : Travel} {c : ComplaintText}
    (hTransport : TransportsIndividual d v t c) (hKnowledge : ActedWithScienter d c)
    (hMinor : UnderEighteen v c) (hJurisdiction : TransportJurisdiction2423a t c)
    (hPurpose : UnlawfulPurpose2423a d v c)
    (hTiming : IntentExistedAtTimeOfTravel d c) : Section2423a d v t c :=
  ⟨hTransport, hKnowledge, hMinor, hJurisdiction, hPurpose, hTiming⟩

theorem foreignCommerceTravelByCitizen_intro {d : Person} {t : Travel}
    {c : ComplaintText} (hStatus : IsUnitedStatesCitizenOrLawfulPermanentResident d c)
    (hTravel : TravelsInForeignCommerce d t c) :
    ForeignCommerceTravelByCitizen d t c :=
  ⟨hStatus, hTravel⟩

theorem travelPredicate2423b_intro_interstate {d : Person} {t : Travel}
    {c : ComplaintText} (h : TravelsInInterstateCommerce d t c) :
    TravelPredicate2423b d t c :=
  .interstate h

theorem travelPredicate2423b_intro_intoUnitedStates {d : Person} {t : Travel}
    {c : ComplaintText} (h : TravelsIntoTheUnitedStates d t c) :
    TravelPredicate2423b d t c :=
  .intoUnitedStates h

theorem travelPredicate2423b_intro_citizenForeign {d : Person} {t : Travel}
    {c : ComplaintText} (h : ForeignCommerceTravelByCitizen d t c) :
    TravelPredicate2423b d t c :=
  .citizenForeign h

theorem section2423b_intro {d : Person} {t : Travel} {c : ComplaintText}
    (hTravel : TravelPredicate2423b d t c)
    (hIntent : IntentToEngageInIllicitSexualConduct d c)
    (hTiming : IntentExistedAtTimeOfTravel d c) : Section2423b d t c :=
  ⟨hTravel, hIntent, hTiming⟩

theorem foreignNexus2423c_intro_travels {d : Person} {t : Travel} {c : ComplaintText}
    (h : TravelsInForeignCommerce d t c) : ForeignNexus2423c d t c :=
  .travels h

theorem foreignNexus2423c_intro_resides {d : Person} {t : Travel} {c : ComplaintText}
    (h : ResidesInForeignCountry d c) : ForeignNexus2423c d t c :=
  .resides h

theorem section2423c_intro {d : Person} {v : Person} {t : Travel} {c : ComplaintText}
    (hStatus : IsUnitedStatesCitizenOrLawfulPermanentResident d c)
    (hNexus : ForeignNexus2423c d t c)
    (hConduct : EngagesInIllicitSexualConduct d v c) : Section2423c d v t c :=
  ⟨hStatus, hNexus, hConduct⟩

theorem section2423d_intro {d : Person} {o : Entity} {c : ComplaintText}
    (hStatus : IsUnitedStatesCitizenOrLawfulPermanentResident d c)
    (hRole : IsOfficerDirectorEmployeeOrAgent d o c)
    (hCommerce : EngagedInInterstateCommerce o c)
    (hMails : UsesMailsOrInstrumentalityThroughOrganization d o c)
    (hFurtherance : CommitsActInFurtheranceOfIllicitSexualConduct d o c) :
    Section2423d d o c :=
  ⟨hStatus, hRole, hCommerce, hMails, hFurtherance⟩

theorem section2423e_intro {d : Person} {v : Person} {t : Travel} {c : ComplaintText}
    (hGain : ForCommercialAdvantageOrPrivateFinancialGain d c)
    (hFacilitation : ArrangesInducesProcuresOrFacilitatesTravel d v t c)
    (hKnowledge : KnowsTravelerTravelsInInterstateOrForeignCommerce d t c)
    (hTravelerIntent : TravelerIntendsIllicitSexualConduct v c) :
    Section2423e d v t c :=
  ⟨hGain, hFacilitation, hKnowledge, hTravelerIntent⟩

theorem attemptToViolate2423_intro {d : Person} {c : ComplaintText}
    (hIntent : IntentToCommitSection2423Offense d c)
    (hStep : TakesSubstantialStepTowardSection2423Offense d c) :
    AttemptToViolate2423 d c :=
  ⟨hIntent, hStep⟩

theorem conspiracyToViolate2423_intro {d : Person} {c : ComplaintText}
    (ag : Agreement) (hAgree : AgreementAmongTwoOrMore ag c)
    (hIntent : IntentToCommitSection2423Offense d c) :
    ConspiracyToViolate2423 d c :=
  ⟨ag, hAgree, hIntent⟩

theorem section2423f_intro_attempt {d : Person} {c : ComplaintText}
    (h : AttemptToViolate2423 d c) : Section2423f d c :=
  .attempt h

theorem section2423f_intro_conspiracy {d : Person} {c : ComplaintText}
    (h : ConspiracyToViolate2423 d c) : Section2423f d c :=
  .conspiracy h

end Proving.USC.T18.Ch117.Recert.Elements
