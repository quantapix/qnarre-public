





import Proving.USC.T18.Ch117.Recert.Deontic.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Deontic

open Proving.USC.Common






axiom AddresseeOperatesInteractiveComputerService
    (p : Person) (s : InteractiveComputerService) (c : ComplaintText) : Prop




axiom ConditionInterstateCommerceNexus (p : Person) (c : ComplaintText) : Prop




axiom MensReaIntentToPromoteOrFacilitateProstitution (p : Person) (c : ComplaintText) : Prop




axiom ActOwnManageOperateOrAttemptService
    (p : Person) (s : InteractiveComputerService) (c : ComplaintText) : Prop






axiom ActFacilitateProstitutionOfFiveOrMorePersons (p : Person) (c : ComplaintText) : Prop






axiom MensReaRecklessDisregardOfSexTraffickingContribution (p : Person) (c : ComplaintText) : Prop








axiom EscapeProstitutionLegalInTargetedJurisdiction
    (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop






axiom AddresseeInjuredByViolationOf2421Ab (v : Person) (c : ComplaintText) : Prop




axiom ConditionInjuryByReasonOfViolation (v : Person) (p : Person) (c : ComplaintText) : Prop




axiom ActRecoverDamagesAndAttorneyFees (v : Person) (c : ComplaintText) : Prop




axiom ConditionAppropriateUnitedStatesDistrictCourtForum (c : ComplaintText) : Prop





axiom AddresseeSentencingCourt (ct : Court) (c : ComplaintText) : Prop




axiom ConditionViolationOfSubsection2421Ab2 (p : Person) (c : ComplaintText) : Prop






axiom ActOrderRestitutionConsistentWith2327b
    (ct : Court) (p : Person) (c : ComplaintText) : Prop






axiom AddresseeAnyPerson (p : Person) (c : ComplaintText) : Prop




axiom ConditionIndividualUnderAgeOfEighteen (m : Person) (c : ComplaintText) : Prop





axiom ConditionTransportationInInterstateForeignOrTerritorialCommerce
    (p : Person) (m : Person) (c : ComplaintText) : Prop





axiom MensReaIntentThatIndividualEngageInProhibitedSexualActivity
    (p : Person) (m : Person) (c : ComplaintText) : Prop



axiom ActTransportIndividual (p : Person) (m : Person) (c : ComplaintText) : Prop






axiom ConditionTravelInInterstateCommerceOrIntoUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom AddresseeCitizenOrLawfulPermanentResident (p : Person) (c : ComplaintText) : Prop




axiom ConditionTravelInForeignCommerce (p : Person) (c : ComplaintText) : Prop




axiom MensReaIntentToEngageInIllicitSexualConduct (p : Person) (c : ComplaintText) : Prop



axiom ActTravel (p : Person) (c : ComplaintText) : Prop







axiom ConditionTravelInForeignCommerceOrResidesInForeignCountry (p : Person) (c : ComplaintText) : Prop






axiom ConditionOfficerDirectorEmployeeOrAgentOfOrganization
    (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom ConditionOrganizationAffectsInterstateOrForeignCommerce (e : Entity) (c : ComplaintText) : Prop





axiom ActUseMailsOrInstrumentalityThroughOrganizationalConnection
    (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom ActInFurtheranceOfIllicitSexualConductThroughOrganizationalConnection
    (p : Person) (e : Entity) (c : ComplaintText) : Prop






axiom MensReaForCommercialAdvantageOrPrivateFinancialGain (p : Person) (c : ComplaintText) : Prop




axiom MensReaKnowledgeOfTravelersIllicitPurpose (p : Person) (t : Person) (c : ComplaintText) : Prop




axiom ActArrangeInduceProcureOrFacilitateTravel (p : Person) (t : Person) (c : ComplaintText) : Prop




axiom ConditionTravelerTravelsInCommerceWithIllicitIntent (t : Person) (c : ComplaintText) : Prop






axiom ActAttemptOrConspireToViolateSubsection2423
    (p : Person) (sub : Subsection2423) (c : ComplaintText) : Prop








axiom DefIllicitSexualConductSexualActWithMinor (p : Person) (o : Person) (c : ComplaintText) : Prop




axiom DefIllicitSexualConductCommercialSexActWithMinor (p : Person) (o : Person) (c : ComplaintText) : Prop




axiom DefIllicitSexualConductProductionOfChildPornography (p : Person) (o : Person) (c : ComplaintText) : Prop






axiom DefIntentAtTimeOfTransportationOrTravel (p : Person) (c : ComplaintText) : Prop








axiom EscapeReasonableBeliefPersonHadAttainedEighteen
    (p : Person) (o : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Recert.Deontic
