






import Proving.USC.T18.Ch117.Reslice.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Deontic

open Proving.USC.Common








axiom OwnsManagesOrOperatesInteractiveComputerService
    (p : Person) (s : InteractiveComputerService) (c : ComplaintText) : Prop





axiom UsesFacilityOrMeansOfInterstateOrForeignCommerce
    (p : Person) (c : ComplaintText) : Prop





axiom IntentToPromoteOrFacilitateProstitutionOfAnother
    (p : Person) (s : InteractiveComputerService) (c : ComplaintText) : Prop




axiom PromotesOrFacilitatesProstitutionOfFiveOrMorePersons
    (p : Person) (c : ComplaintText) : Prop








axiom ActsInRecklessDisregardOfContributionToSexTrafficking
    (p : Person) (c : ComplaintText) : Prop






axiom ProstitutionLegalInTargetedJurisdiction
    (p : Person) (j : TargetedJurisdiction) (c : ComplaintText) : Prop




axiom InjuredByReasonOfViolation
    (v : Person) (p : Person) (c : ComplaintText) : Prop




axiom ForumIsAppropriateUnitedStatesDistrictCourt
    (ct : UnitedStatesDistrictCourt) (c : ComplaintText) : Prop




axiom ViolationOfSubsection2421Ab2Established
    (p : Person) (c : ComplaintText) : Prop






axiom CourtOrderedRestitution
    (ct : UnitedStatesDistrictCourt) (p : Person) (c : ComplaintText) : Prop







axiom KnowinglyTransportsIndividualInCoveredCommerce
    (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom IndividualHasNotAttainedAgeOfEighteen
    (v : Person) (c : ComplaintText) : Prop






axiom IntentThatIndividualEngageInProstitutionOrCriminalSexualActivity
    (p : Person) (v : Person) (c : ComplaintText) : Prop






axiom TravelsInCoveredCommerce (p : Person) (c : ComplaintText) : Prop





axiom IntentToEngageInIllicitSexualConduct (p : Person) (c : ComplaintText) : Prop





axiom IsUnitedStatesCitizenOrLawfulPermanentResident
    (p : Person) (c : ComplaintText) : Prop





axiom TravelsInForeignCommerceOrResidesInForeignCountry
    (p : Person) (c : ComplaintText) : Prop





axiom IsOfficerDirectorEmployeeOrAgentOfCoveredOrganization
    (p : Person) (o : CoveredOrganization) (c : ComplaintText) : Prop





axiom UsesMailsOrInterstateInstrumentalityThroughOrganization
    (p : Person) (o : CoveredOrganization) (c : ComplaintText) : Prop





axiom CommitsActInFurtheranceOfIllicitSexualConductThroughOrganization
    (p : Person) (o : CoveredOrganization) (c : ComplaintText) : Prop




axiom ForCommercialAdvantageOrPrivateFinancialGain
    (p : Person) (c : ComplaintText) : Prop




axiom ArrangesInducesProcuresOrFacilitatesTravel
    (p : Person) (t : Person) (c : ComplaintText) : Prop





axiom KnowsTravelerTravelsWithIntentToEngageInIllicitSexualConduct
    (p : Person) (t : Person) (c : ComplaintText) : Prop




axiom AttemptsOrConspiresToViolateSubsection
    (p : Person) (s : Subsection2423) (c : ComplaintText) : Prop






axiom SexualActWithPersonUnderEighteenViolatingChapter109A
    (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom CommercialSexActWithPersonUnderEighteen
    (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom ProducesChildPornography
    (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom ReasonableBeliefThatPersonHadAttainedEighteen
    (p : Person) (v : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Reslice.Deontic
