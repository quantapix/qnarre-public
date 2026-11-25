import Proving.USC.T18.Ch117.Recert.Elements.Predicates

set_option autoImplicit false










namespace Proving.USC.T18.Ch117.Recert.Elements

open Proving.USC.Common




inductive CommerceNexus2421A (d : Person) (c : ComplaintText) : Prop where
  | facility (h : UsesFacilityOrMeansOfInterstateCommerce d c)
  | affecting (h : ConductInOrAffectingInterstateCommerce d c)





abbrev EngagedInInterstateCommerce2421A (d : Person) (c : ComplaintText) : Prop :=
  CommerceNexus2421A d c


structure AttemptToOperateIcs (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  intent : IntentToOwnManageOrOperateIcs d s c
  substantialStep : TakesSubstantialStepTowardIcsOperation d s c



def ConspiracyToOperateIcs (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop :=
  ∃ ag : Agreement, AgreementAmongTwoOrMore ag c ∧ AgreedObjectIsIcsOperation d s c



inductive IcsOperationRoute (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  | operates (h : OwnsManagesOrOperatesIcs d s c)
  | attempts (h : AttemptToOperateIcs d s c)
  | conspires (h : ConspiracyToOperateIcs d s c)




structure Section2421Aa (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  commerce : CommerceNexus2421A d c
  service : IsInteractiveComputerService s c
  operation : IcsOperationRoute d s c
  intent : IntentToPromoteOrFacilitateProstitution d c
  noJurisdictionalLegalityDefense : ¬ DefenseProstitutionLegalInTargetedJurisdiction d c





def PromotesOrFacilitatesFiveOrMore (d : Person) (c : ComplaintText) : Prop :=
  5 ≤ ProstitutedPersonCount d c



structure FiveOrMoreRoute (d : Person) (c : ComplaintText) : Prop where
  promotes : PromotesOrFacilitatesProstitutionOfAnother d c
  fiveOrMore : PromotesOrFacilitatesFiveOrMore d c
  noJurisdictionalLegalityDefense : ¬ DefenseProstitutionLegalInTargetedJurisdiction d c




structure RecklessDisregardRoute (d : Person) (c : ComplaintText) : Prop where
  contribution : ConductContributedToSexTrafficking d c
  recklessness : ActsInRecklessDisregard d c


inductive Aggravator2421Ab (d : Person) (c : ComplaintText) : Prop where
  | fiveOrMore (h : FiveOrMoreRoute d c)
  | recklessDisregard (h : RecklessDisregardRoute d c)


structure Section2421Ab (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  commerce : CommerceNexus2421A d c
  service : IsInteractiveComputerService s c
  operation : IcsOperationRoute d s c
  intent : IntentToPromoteOrFacilitateProstitution d c
  aggravator : Aggravator2421Ab d c






structure ValidSection2421AcClaim (pl : Person) (d : Person)
    (s : InteractiveComputerService) (c : ComplaintText) : Prop where
  violation : Section2421Ab d s c
  injury : PlaintiffInjuredByViolation pl c
  causation : ProximateCause pl c
  timeliness : WithinLimitations pl c
  forum : BroughtInUnitedStatesDistrictCourt c





structure Section2421Ad (d : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  violation : Section2421Ab d s c
  viaRecklessDisregard : RecklessDisregardRoute d c





def UnderEighteen (v : Person) (c : ComplaintText) : Prop :=
  VictimAgeYears v c < 18


structure SexualActRoute (d : Person) (v : Person) (c : ComplaintText) : Prop where
  sexualAct : SexualActUnderSection2246 d v c
  minor : UnderEighteen v c
  chapter109A : WouldViolateChapter109AInSpecialMaritimeJurisdiction d v c




structure CommercialSexActRoute (d : Person) (v : Person) (c : ComplaintText) : Prop where
  commercialSexAct : CommercialSexActUnderSection1591 d v c
  minor : UnderEighteen v c
  noReasonableBeliefDefense : ¬ DefenseReasonableBeliefVictimAttainedEighteen d v c


inductive IllicitSexualConduct (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | sexualAct (h : SexualActRoute d v c)
  | commercialSexAct (h : CommercialSexActRoute d v c)
  | childPornography (h : ProducesChildPornographyUnderSection2256 d v c)



abbrev EngagesInIllicitSexualConduct (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  IllicitSexualConduct d v c




inductive TransportJurisdiction2423a (t : Travel) (c : ComplaintText) : Prop where
  | commerce (h : TransportationInInterstateOrForeignCommerce t c)
  | territory (h : TransportationWithinTerritoryOrPossession t c)


inductive UnlawfulPurpose2423a (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | prostitution (h : IntentThatIndividualEngageInProstitution d v c)
  | chargeableSexualActivity (h : IntentThatIndividualEngageInChargeableSexualActivity d v c)



structure Section2423a (d : Person) (v : Person) (t : Travel)
    (c : ComplaintText) : Prop where
  transportation : TransportsIndividual d v t c
  knowledge : ActedWithScienter d c
  minor : UnderEighteen v c
  jurisdiction : TransportJurisdiction2423a t c
  purpose : UnlawfulPurpose2423a d v c
  contemporaneousIntent : IntentExistedAtTimeOfTravel d c



structure ForeignCommerceTravelByCitizen (d : Person) (t : Travel)
    (c : ComplaintText) : Prop where
  status : IsUnitedStatesCitizenOrLawfulPermanentResident d c
  travel : TravelsInForeignCommerce d t c


inductive TravelPredicate2423b (d : Person) (t : Travel) (c : ComplaintText) : Prop where
  | interstate (h : TravelsInInterstateCommerce d t c)
  | intoUnitedStates (h : TravelsIntoTheUnitedStates d t c)
  | citizenForeign (h : ForeignCommerceTravelByCitizen d t c)


structure Section2423b (d : Person) (t : Travel) (c : ComplaintText) : Prop where
  travel : TravelPredicate2423b d t c
  intent : IntentToEngageInIllicitSexualConduct d c
  contemporaneousIntent : IntentExistedAtTimeOfTravel d c



inductive ForeignNexus2423c (d : Person) (t : Travel) (c : ComplaintText) : Prop where
  | travels (h : TravelsInForeignCommerce d t c)
  | resides (h : ResidesInForeignCountry d c)



structure Section2423c (d : Person) (v : Person) (t : Travel)
    (c : ComplaintText) : Prop where
  status : IsUnitedStatesCitizenOrLawfulPermanentResident d c
  nexus : ForeignNexus2423c d t c
  conduct : EngagesInIllicitSexualConduct d v c





structure Section2423d (d : Person) (o : Entity) (c : ComplaintText) : Prop where
  status : IsUnitedStatesCitizenOrLawfulPermanentResident d c
  role : IsOfficerDirectorEmployeeOrAgent d o c
  organizationCommerce : EngagedInInterstateCommerce o c
  useOfMailsOrInstrumentality : UsesMailsOrInstrumentalityThroughOrganization d o c
  furtherance : CommitsActInFurtheranceOfIllicitSexualConduct d o c


structure Section2423e (d : Person) (v : Person) (t : Travel)
    (c : ComplaintText) : Prop where
  commercialPurpose : ForCommercialAdvantageOrPrivateFinancialGain d c
  facilitation : ArrangesInducesProcuresOrFacilitatesTravel d v t c
  knowledgeOfTravel : KnowsTravelerTravelsInInterstateOrForeignCommerce d t c
  travelerIntent : TravelerIntendsIllicitSexualConduct v c


structure AttemptToViolate2423 (d : Person) (c : ComplaintText) : Prop where
  intent : IntentToCommitSection2423Offense d c
  substantialStep : TakesSubstantialStepTowardSection2423Offense d c



def ConspiracyToViolate2423 (d : Person) (c : ComplaintText) : Prop :=
  ∃ ag : Agreement, AgreementAmongTwoOrMore ag c ∧ IntentToCommitSection2423Offense d c



inductive Section2423f (d : Person) (c : ComplaintText) : Prop where
  | attempt (h : AttemptToViolate2423 d c)
  | conspiracy (h : ConspiracyToViolate2423 d c)

end Proving.USC.T18.Ch117.Recert.Elements
