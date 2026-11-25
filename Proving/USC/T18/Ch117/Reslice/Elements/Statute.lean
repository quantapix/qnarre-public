















import Proving.USC.T18.Ch117.Reslice.Elements.Types
import Proving.USC.T18.Ch117.Reslice.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Elements

open Proving.USC.Common





inductive OwnManageOperateRoute (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  | owns      (h : OwnsInteractiveComputerService p s c)
  | manages   (h : ManagesInteractiveComputerService p s c)
  | operates  (h : OperatesInteractiveComputerService p s c)
  | conspires (h : ConspiresToOwnManageOrOperateService p s c)
  | attempts  (h : AttemptsToOwnManageOrOperateService p s c)




structure BaseOffense2421A (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  commerce : UsesInterstateCommerceFacilityOrAffectsCommerce p c
  service  : IsInteractiveComputerService s c
  conduct  : OwnManageOperateRoute p s c
  intent   : IntentToPromoteOrFacilitateProstitution p c



structure Section2421Aa (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  base              : BaseOffense2421A p s c
  noLegalityDefense : ¬ ProstitutionLegalInTargetedJurisdiction p c



def FacilitatesProstitutionOfFiveOrMore (p : Person) (c : ComplaintText) : Prop :=
  5 ≤ PersonsWhoseProstitutionPromotedOrFacilitated p c



structure FiveOrMorePersonsRoute (p : Person) (c : ComplaintText) : Prop where
  count             : FacilitatesProstitutionOfFiveOrMore p c
  noLegalityDefense : ¬ ProstitutionLegalInTargetedJurisdiction p c





structure RecklessDisregardRoute (p : Person) (c : ComplaintText) : Prop where
  contribution : ConductContributedToSexTrafficking p c
  recklessness : ActsInRecklessDisregardOfTraffickingContribution p c


inductive AggravatingRoute2421A (p : Person) (c : ComplaintText) : Prop where
  | fiveOrMore        (h : FiveOrMorePersonsRoute p c)
  | recklessDisregard (h : RecklessDisregardRoute p c)



structure Section2421Ab (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  base        : BaseOffense2421A p s c
  aggravating : AggravatingRoute2421A p c





structure ValidSection2421ACivilClaim (pl : Person) (p : Person)
    (s : InteractiveComputerService) (c : ComplaintText) : Prop where
  violation : Section2421Ab p s c
  injury    : PlaintiffInjuredByViolation pl c
  causation : ProximateCause pl c
  timely    : WithinLimitations pl c




structure Section2421ARestitutionMandate (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  base          : BaseOffense2421A p s c
  recklessRoute : RecklessDisregardRoute p c
  scope         : RestitutionScopeConsistentWithSection2327b p c


inductive ValidSection2421ACharge (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  | promotion  (h : Section2421Aa p s c)
  | aggravated (h : Section2421Ab p s c)





structure CommercialSexActRoute (d : Person) (v : Person) (c : ComplaintText) : Prop where
  act         : CommercialSexActWithPersonUnder18 d v c
  noAgeBelief : ¬ ReasonableBeliefPersonAttainedAge18 d v c


inductive IllicitSexualConductRoute (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | sexualAct         (h : SexualActWithPersonUnder18ViolatingChapter109A d v c)
  | commercialSexAct  (h : CommercialSexActRoute d v c)
  | childPornography  (h : ProducesChildPornography d c)



abbrev EngagesInIllicitSexualConduct (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  IllicitSexualConductRoute d v c


inductive TransportationNexus (d : Person) (c : ComplaintText) : Prop where
  | commerce  (h : TransportationInInterstateOrForeignCommerce d c)
  | territory (h : TransportationInCommonwealthTerritoryOrPossession d c)




inductive TransportationIntent (d : Person) (c : ComplaintText) : Prop where
  | prostitution              (h : IntentIndividualEngageInProstitution d c)
  | chargeableSexualActivity  (h : IntentIndividualEngageInChargeableSexualActivity d c)



structure Section2423a (d : Person) (v : Person) (c : ComplaintText) : Prop where
  transports   : KnowinglyTransportsIndividual d v c
  minor        : IndividualHasNotAttainedAge18 v c
  nexus        : TransportationNexus d c
  intent       : TransportationIntent d c
  intentTiming : IntentExistedAtTimeOfTransportationOrTravel d c



structure ForeignCommerceTravelByCovered (d : Person) (c : ComplaintText) : Prop where
  covered : IsCitizenOrLawfulPermanentResident d c
  travels : TravelsInForeignCommerce d c


inductive TravelNexus2423b (d : Person) (c : ComplaintText) : Prop where
  | interstate      (h : TravelsInInterstateCommerce d c)
  | intoUnitedStates (h : TravelsIntoTheUnitedStates d c)
  | foreignByCovered (h : ForeignCommerceTravelByCovered d c)



structure Section2423b (d : Person) (c : ComplaintText) : Prop where
  nexus        : TravelNexus2423b d c
  intent       : IntentToEngageInIllicitSexualConduct d c
  intentTiming : IntentExistedAtTimeOfTransportationOrTravel d c



inductive ForeignPresence2423c (d : Person) (c : ComplaintText) : Prop where
  | travels (h : TravelsInForeignCommerce d c)
  | resides (h : ResidesInForeignCountry d c)



structure Section2423c (d : Person) (v : Person) (c : ComplaintText) : Prop where
  covered  : IsCitizenOrLawfulPermanentResident d c
  presence : ForeignPresence2423c d c
  conduct  : EngagesInIllicitSexualConduct d v c




structure Section2423d (d : Person) (o : Entity) (c : ComplaintText) : Prop where
  covered          : IsCitizenOrLawfulPermanentResident d c
  role             : IsOfficerDirectorEmployeeOrAgentOfOrganization d o c
  orgCommerce      : EngagedInInterstateCommerce o c
  useOfMails       : UsesMailsOrInterstateInstrumentality d c
  throughConnection : ConnectionOrAffiliationWithOrganization d o c
  actInFurtherance : CommitsActInFurtheranceOfIllicitSexualConduct d c


inductive FacilitationRoute2423e (d : Person) (t : Person) (c : ComplaintText) : Prop where
  | arranges    (h : ArrangesTravel d t c)
  | induces     (h : InducesTravel d t c)
  | procures    (h : ProcuresTravel d t c)
  | facilitates (h : FacilitatesTravel d t c)



structure Section2423e (d : Person) (t : Person) (c : ComplaintText) : Prop where
  purpose     : ActsForCommercialAdvantageOrPrivateFinancialGain d c
  conduct     : FacilitationRoute2423e d t c
  knowsTravel : KnowsTravelerTravelsInInterstateOrForeignCommerce d t c
  knowsIntent : KnowsTravelerIntendsIllicitSexualConduct d t c



inductive Section2423f (d : Person) (c : ComplaintText) : Prop where
  | attempt    (h : AttemptsToViolateSection2423 d c)
  | conspiracy (h : ConspiresToViolateSection2423 d c)


inductive ValidSection2423Charge (d : Person) (v : Person) (t : Person) (o : Entity)
    (c : ComplaintText) : Prop where
  | transportation      (h : Section2423a d v c)
  | travelWithIntent    (h : Section2423b d c)
  | engagingAbroad      (h : Section2423c d v c)
  | organizational      (h : Section2423d d o c)
  | facilitationForGain (h : Section2423e d t c)
  | attemptOrConspiracy (h : Section2423f d c)

end Proving.USC.T18.Ch117.Reslice.Elements
