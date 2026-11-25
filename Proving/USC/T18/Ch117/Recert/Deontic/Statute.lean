








import Proving.USC.T18.Ch117.Recert.Deontic.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Deontic

open Proving.USC.Common







inductive IllicitSexualConduct (p : Person) (o : Person) (c : ComplaintText) : Prop where


  | sexualActWithMinor (h : DefIllicitSexualConductSexualActWithMinor p o c)


  | commercialSexActWithMinor
      (h : DefIllicitSexualConductCommercialSexActWithMinor p o c)
      (hNoDefence : ¬ EscapeReasonableBeliefPersonHadAttainedEighteen p o c)

  | productionOfChildPornography (h : DefIllicitSexualConductProductionOfChildPornography p o c)




def modality2421Aa : Modality := Modality.prohibition



structure Prohibition2421Aa (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  addressee : AddresseeOperatesInteractiveComputerService p s c
  condition : ConditionInterstateCommerceNexus p c
  mensRea : MensReaIntentToPromoteOrFacilitateProstitution p c





def ProhibitionViolated2421Aa (p : Person) (s : InteractiveComputerService)
    (j : Jurisdiction) (c : ComplaintText) : Prop :=
  Prohibition2421Aa p s c ∧ ActOwnManageOperateOrAttemptService p s c ∧
    ¬ EscapeProstitutionLegalInTargetedJurisdiction p j c




def modality2421Ab : Modality := Modality.prohibition




inductive Aggravator2421Ab (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop where

  | fiveOrMorePersons
      (h : ActFacilitateProstitutionOfFiveOrMorePersons p c)
      (hNoDefence : ¬ EscapeProstitutionLegalInTargetedJurisdiction p j c)


  | recklessDisregardOfSexTrafficking
      (h : MensReaRecklessDisregardOfSexTraffickingContribution p c)



structure Prohibition2421Ab (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  addressee : AddresseeOperatesInteractiveComputerService p s c
  condition : ConditionInterstateCommerceNexus p c
  mensRea : MensReaIntentToPromoteOrFacilitateProstitution p c



def ProhibitionViolated2421Ab (p : Person) (s : InteractiveComputerService)
    (j : Jurisdiction) (c : ComplaintText) : Prop :=
  Prohibition2421Ab p s c ∧ ActOwnManageOperateOrAttemptService p s c ∧
    Aggravator2421Ab p j c




def modality2421Ac : Modality := Modality.permission





structure Permission2421Ac (v : Person) (p : Person) (s : InteractiveComputerService)
    (j : Jurisdiction) (c : ComplaintText) : Prop where
  addressee : AddresseeInjuredByViolationOf2421Ab v c
  predicateViolation : ProhibitionViolated2421Ab p s j c
  condition : ConditionInjuryByReasonOfViolation v p c
  forum : ConditionAppropriateUnitedStatesDistrictCourtForum c





def PermissionExercised2421Ac (v : Person) (p : Person) (s : InteractiveComputerService)
    (j : Jurisdiction) (c : ComplaintText) : Prop :=
  Permission2421Ac v p s j c ∧ ActRecoverDamagesAndAttorneyFees v c




def modality2421Ad : Modality := Modality.obligation



structure Obligation2421Ad (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeSentencingCourt ct c
  condition : ConditionViolationOfSubsection2421Ab2 p c



def ObligationDischarged2421Ad (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation2421Ad ct p c ∧ ActOrderRestitutionConsistentWith2327b ct p c




def ObligationBreached2421Ad (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation2421Ad ct p c ∧ ¬ ActOrderRestitutionConsistentWith2327b ct p c




def modality2423a : Modality := Modality.prohibition




structure Prohibition2423a (p : Person) (m : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  conditionMinority : ConditionIndividualUnderAgeOfEighteen m c
  conditionChannel : ConditionTransportationInInterstateForeignOrTerritorialCommerce p m c
  mensRea : MensReaIntentThatIndividualEngageInProhibitedSexualActivity p m c
  temporalIntent : DefIntentAtTimeOfTransportationOrTravel p c


def ProhibitionViolated2423a (p : Person) (m : Person) (c : ComplaintText) : Prop :=
  Prohibition2423a p m c ∧ ActTransportIndividual p m c




def modality2423b : Modality := Modality.prohibition




inductive Addressee2423b (p : Person) (c : ComplaintText) : Prop where


  | anyTraveler
      (hAddressee : AddresseeAnyPerson p c)
      (hChannel : ConditionTravelInInterstateCommerceOrIntoUnitedStates p c)


  | citizenOrResidentAbroad
      (hAddressee : AddresseeCitizenOrLawfulPermanentResident p c)
      (hChannel : ConditionTravelInForeignCommerce p c)


structure Prohibition2423b (p : Person) (c : ComplaintText) : Prop where
  addressee : Addressee2423b p c
  mensRea : MensReaIntentToEngageInIllicitSexualConduct p c
  temporalIntent : DefIntentAtTimeOfTransportationOrTravel p c


def ProhibitionViolated2423b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2423b p c ∧ ActTravel p c




def modality2423c : Modality := Modality.prohibition




structure Prohibition2423c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeCitizenOrLawfulPermanentResident p c
  condition : ConditionTravelInForeignCommerceOrResidesInForeignCountry p c




def ProhibitionViolated2423c (p : Person) (o : Person) (c : ComplaintText) : Prop :=
  Prohibition2423c p c ∧ IllicitSexualConduct p o c




def modality2423d : Modality := Modality.prohibition




structure Prohibition2423d (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeCitizenOrLawfulPermanentResident p c
  conditionRole : ConditionOfficerDirectorEmployeeOrAgentOfOrganization p e c
  conditionCommerce : ConditionOrganizationAffectsInterstateOrForeignCommerce e c





def ProhibitionViolated2423d (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition2423d p e c ∧
    ActUseMailsOrInstrumentalityThroughOrganizationalConnection p e c ∧
    ActInFurtheranceOfIllicitSexualConductThroughOrganizationalConnection p e c




def modality2423e : Modality := Modality.prohibition




structure Prohibition2423e (p : Person) (t : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : ConditionTravelerTravelsInCommerceWithIllicitIntent t c
  mensReaGain : MensReaForCommercialAdvantageOrPrivateFinancialGain p c
  mensReaKnowledge : MensReaKnowledgeOfTravelersIllicitPurpose p t c


def ProhibitionViolated2423e (p : Person) (t : Person) (c : ComplaintText) : Prop :=
  Prohibition2423e p t c ∧ ActArrangeInduceProcureOrFacilitateTravel p t c




def modality2423f : Modality := Modality.prohibition




structure Prohibition2423f (p : Person) (sub : Subsection2423) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c




def ProhibitionViolated2423f (p : Person) (sub : Subsection2423) (c : ComplaintText) : Prop :=
  Prohibition2423f p sub c ∧ ActAttemptOrConspireToViolateSubsection2423 p sub c




def modality2423g : Modality := Modality.definition


def modality2423h : Modality := Modality.definition

end Proving.USC.T18.Ch117.Recert.Deontic
