





import Proving.USC.T18.Ch117.Recert.Deontic.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Deontic

open Proving.USC.Common





theorem prohibitionViolated2421Aa_intro
    {p : Person} {s : InteractiveComputerService} {j : Jurisdiction} {c : ComplaintText}
    (hAddressee : AddresseeOperatesInteractiveComputerService p s c)
    (hCondition : ConditionInterstateCommerceNexus p c)
    (hMensRea : MensReaIntentToPromoteOrFacilitateProstitution p c)
    (hAct : ActOwnManageOperateOrAttemptService p s c)
    (hNoDefence : ¬ EscapeProstitutionLegalInTargetedJurisdiction p j c) :
    ProhibitionViolated2421Aa p s j c :=
  ⟨⟨hAddressee, hCondition, hMensRea⟩, hAct, hNoDefence⟩




theorem aggravator2421AbFiveOrMore_intro
    {p : Person} {j : Jurisdiction} {c : ComplaintText}
    (hAct : ActFacilitateProstitutionOfFiveOrMorePersons p c)
    (hNoDefence : ¬ EscapeProstitutionLegalInTargetedJurisdiction p j c) :
    Aggravator2421Ab p j c :=
  Aggravator2421Ab.fiveOrMorePersons hAct hNoDefence



theorem aggravator2421AbRecklessDisregard_intro
    {p : Person} {j : Jurisdiction} {c : ComplaintText}
    (hMensRea : MensReaRecklessDisregardOfSexTraffickingContribution p c) :
    Aggravator2421Ab p j c :=
  Aggravator2421Ab.recklessDisregardOfSexTrafficking hMensRea


theorem prohibitionViolated2421Ab_intro
    {p : Person} {s : InteractiveComputerService} {j : Jurisdiction} {c : ComplaintText}
    (hAddressee : AddresseeOperatesInteractiveComputerService p s c)
    (hCondition : ConditionInterstateCommerceNexus p c)
    (hMensRea : MensReaIntentToPromoteOrFacilitateProstitution p c)
    (hAct : ActOwnManageOperateOrAttemptService p s c)
    (hAggravator : Aggravator2421Ab p j c) :
    ProhibitionViolated2421Ab p s j c :=
  ⟨⟨hAddressee, hCondition, hMensRea⟩, hAct, hAggravator⟩





theorem permission2421Ac_intro
    {v p : Person} {s : InteractiveComputerService} {j : Jurisdiction} {c : ComplaintText}
    (hAddressee : AddresseeInjuredByViolationOf2421Ab v c)
    (hViolation : ProhibitionViolated2421Ab p s j c)
    (hCondition : ConditionInjuryByReasonOfViolation v p c)
    (hForum : ConditionAppropriateUnitedStatesDistrictCourtForum c) :
    Permission2421Ac v p s j c :=
  ⟨hAddressee, hViolation, hCondition, hForum⟩


theorem permissionExercised2421Ac_intro
    {v p : Person} {s : InteractiveComputerService} {j : Jurisdiction} {c : ComplaintText}
    (hPermission : Permission2421Ac v p s j c)
    (hAct : ActRecoverDamagesAndAttorneyFees v c) :
    PermissionExercised2421Ac v p s j c :=
  ⟨hPermission, hAct⟩





theorem obligationDischarged2421Ad_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeSentencingCourt ct c)
    (hCondition : ConditionViolationOfSubsection2421Ab2 p c)
    (hAct : ActOrderRestitutionConsistentWith2327b ct p c) :
    ObligationDischarged2421Ad ct p c :=
  ⟨⟨hAddressee, hCondition⟩, hAct⟩



theorem obligationBreached2421Ad_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeSentencingCourt ct c)
    (hCondition : ConditionViolationOfSubsection2421Ab2 p c)
    (hNoAct : ¬ ActOrderRestitutionConsistentWith2327b ct p c) :
    ObligationBreached2421Ad ct p c :=
  ⟨⟨hAddressee, hCondition⟩, hNoAct⟩





theorem prohibitionViolated2423a_intro
    {p m : Person} {c : ComplaintText}
    (hAddressee : AddresseeAnyPerson p c)
    (hMinority : ConditionIndividualUnderAgeOfEighteen m c)
    (hChannel : ConditionTransportationInInterstateForeignOrTerritorialCommerce p m c)
    (hMensRea : MensReaIntentThatIndividualEngageInProhibitedSexualActivity p m c)
    (hTemporal : DefIntentAtTimeOfTransportationOrTravel p c)
    (hAct : ActTransportIndividual p m c) :
    ProhibitionViolated2423a p m c :=
  ⟨⟨hAddressee, hMinority, hChannel, hMensRea, hTemporal⟩, hAct⟩





theorem addressee2423bAnyTraveler_intro
    {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeAnyPerson p c)
    (hChannel : ConditionTravelInInterstateCommerceOrIntoUnitedStates p c) :
    Addressee2423b p c :=
  Addressee2423b.anyTraveler hAddressee hChannel



theorem addressee2423bCitizenAbroad_intro
    {p : Person} {c : ComplaintText}
    (hAddressee : AddresseeCitizenOrLawfulPermanentResident p c)
    (hChannel : ConditionTravelInForeignCommerce p c) :
    Addressee2423b p c :=
  Addressee2423b.citizenOrResidentAbroad hAddressee hChannel



theorem prohibitionViolated2423b_intro
    {p : Person} {c : ComplaintText}
    (hAddressee : Addressee2423b p c)
    (hMensRea : MensReaIntentToEngageInIllicitSexualConduct p c)
    (hTemporal : DefIntentAtTimeOfTransportationOrTravel p c)
    (hAct : ActTravel p c) :
    ProhibitionViolated2423b p c :=
  ⟨⟨hAddressee, hMensRea, hTemporal⟩, hAct⟩





theorem illicitSexualConductCommercialSexAct_intro
    {p o : Person} {c : ComplaintText}
    (hConduct : DefIllicitSexualConductCommercialSexActWithMinor p o c)
    (hNoDefence : ¬ EscapeReasonableBeliefPersonHadAttainedEighteen p o c) :
    IllicitSexualConduct p o c :=
  IllicitSexualConduct.commercialSexActWithMinor hConduct hNoDefence



theorem prohibitionViolated2423c_intro
    {p o : Person} {c : ComplaintText}
    (hAddressee : AddresseeCitizenOrLawfulPermanentResident p c)
    (hCondition : ConditionTravelInForeignCommerceOrResidesInForeignCountry p c)
    (hConduct : IllicitSexualConduct p o c) :
    ProhibitionViolated2423c p o c :=
  ⟨⟨hAddressee, hCondition⟩, hConduct⟩





theorem prohibitionViolated2423d_intro
    {p : Person} {e : Entity} {c : ComplaintText}
    (hAddressee : AddresseeCitizenOrLawfulPermanentResident p c)
    (hRole : ConditionOfficerDirectorEmployeeOrAgentOfOrganization p e c)
    (hCommerce : ConditionOrganizationAffectsInterstateOrForeignCommerce e c)
    (hUse : ActUseMailsOrInstrumentalityThroughOrganizationalConnection p e c)
    (hFurtherance : ActInFurtheranceOfIllicitSexualConductThroughOrganizationalConnection p e c) :
    ProhibitionViolated2423d p e c :=
  ⟨⟨hAddressee, hRole, hCommerce⟩, hUse, hFurtherance⟩





theorem prohibitionViolated2423e_intro
    {p t : Person} {c : ComplaintText}
    (hAddressee : AddresseeAnyPerson p c)
    (hCondition : ConditionTravelerTravelsInCommerceWithIllicitIntent t c)
    (hGain : MensReaForCommercialAdvantageOrPrivateFinancialGain p c)
    (hKnowledge : MensReaKnowledgeOfTravelersIllicitPurpose p t c)
    (hAct : ActArrangeInduceProcureOrFacilitateTravel p t c) :
    ProhibitionViolated2423e p t c :=
  ⟨⟨hAddressee, hCondition, hGain, hKnowledge⟩, hAct⟩





theorem prohibitionViolated2423f_intro
    {p : Person} {sub : Subsection2423} {c : ComplaintText}
    (hAddressee : AddresseeAnyPerson p c)
    (hAct : ActAttemptOrConspireToViolateSubsection2423 p sub c) :
    ProhibitionViolated2423f p sub c :=
  ⟨⟨hAddressee⟩, hAct⟩

end Proving.USC.T18.Ch117.Recert.Deontic
