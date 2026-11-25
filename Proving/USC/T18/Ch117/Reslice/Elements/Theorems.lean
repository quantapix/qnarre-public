









import Proving.USC.T18.Ch117.Reslice.Elements.Types
import Proving.USC.T18.Ch117.Reslice.Elements.Predicates
import Proving.USC.T18.Ch117.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Elements

open Proving.USC.Common




theorem baseOffense2421A_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText}
    (hCommerce : UsesInterstateCommerceFacilityOrAffectsCommerce p c)
    (hService : IsInteractiveComputerService s c)
    (hConduct : OwnManageOperateRoute p s c)
    (hIntent : IntentToPromoteOrFacilitateProstitution p c) :
    BaseOffense2421A p s c :=
  ⟨hCommerce, hService, hConduct, hIntent⟩


theorem section2421Aa_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText}
    (hBase : BaseOffense2421A p s c)
    (hNoDefense : ¬ ProstitutionLegalInTargetedJurisdiction p c) :
    Section2421Aa p s c :=
  ⟨hBase, hNoDefense⟩



theorem facilitatesProstitutionOfFiveOrMore_of_count {p : Person} {c : ComplaintText}
    (h : 5 ≤ PersonsWhoseProstitutionPromotedOrFacilitated p c) :
    FacilitatesProstitutionOfFiveOrMore p c := h


theorem fiveOrMorePersonsRoute_intro {p : Person} {c : ComplaintText}
    (hCount : FacilitatesProstitutionOfFiveOrMore p c)
    (hNoDefense : ¬ ProstitutionLegalInTargetedJurisdiction p c) :
    FiveOrMorePersonsRoute p c :=
  ⟨hCount, hNoDefense⟩


theorem recklessDisregardRoute_intro {p : Person} {c : ComplaintText}
    (hContribution : ConductContributedToSexTrafficking p c)
    (hRecklessness : ActsInRecklessDisregardOfTraffickingContribution p c) :
    RecklessDisregardRoute p c :=
  ⟨hContribution, hRecklessness⟩


theorem section2421Ab_intro {p : Person} {s : InteractiveComputerService}
    {c : ComplaintText}
    (hBase : BaseOffense2421A p s c)
    (hAggravating : AggravatingRoute2421A p c) :
    Section2421Ab p s c :=
  ⟨hBase, hAggravating⟩


theorem validSection2421ACivilClaim_intro {pl : Person} {p : Person}
    {s : InteractiveComputerService} {c : ComplaintText}
    (hViolation : Section2421Ab p s c)
    (hInjury : PlaintiffInjuredByViolation pl c)
    (hCausation : ProximateCause pl c)
    (hTimely : WithinLimitations pl c) :
    ValidSection2421ACivilClaim pl p s c :=
  ⟨hViolation, hInjury, hCausation, hTimely⟩


theorem section2421ARestitutionMandate_intro {p : Person}
    {s : InteractiveComputerService} {c : ComplaintText}
    (hBase : BaseOffense2421A p s c)
    (hReckless : RecklessDisregardRoute p c)
    (hScope : RestitutionScopeConsistentWithSection2327b p c) :
    Section2421ARestitutionMandate p s c :=
  ⟨hBase, hReckless, hScope⟩





theorem commercialSexActRoute_intro {d : Person} {v : Person} {c : ComplaintText}
    (hAct : CommercialSexActWithPersonUnder18 d v c)
    (hNoAgeBelief : ¬ ReasonableBeliefPersonAttainedAge18 d v c) :
    CommercialSexActRoute d v c :=
  ⟨hAct, hNoAgeBelief⟩



theorem engagesInIllicitSexualConduct_of_route {d : Person} {v : Person}
    {c : ComplaintText} (h : IllicitSexualConductRoute d v c) :
    EngagesInIllicitSexualConduct d v c := h


theorem section2423a_intro {d : Person} {v : Person} {c : ComplaintText}
    (hTransports : KnowinglyTransportsIndividual d v c)
    (hMinor : IndividualHasNotAttainedAge18 v c)
    (hNexus : TransportationNexus d c)
    (hIntent : TransportationIntent d c)
    (hTiming : IntentExistedAtTimeOfTransportationOrTravel d c) :
    Section2423a d v c :=
  ⟨hTransports, hMinor, hNexus, hIntent, hTiming⟩


theorem foreignCommerceTravelByCovered_intro {d : Person} {c : ComplaintText}
    (hCovered : IsCitizenOrLawfulPermanentResident d c)
    (hTravels : TravelsInForeignCommerce d c) :
    ForeignCommerceTravelByCovered d c :=
  ⟨hCovered, hTravels⟩


theorem section2423b_intro {d : Person} {c : ComplaintText}
    (hNexus : TravelNexus2423b d c)
    (hIntent : IntentToEngageInIllicitSexualConduct d c)
    (hTiming : IntentExistedAtTimeOfTransportationOrTravel d c) :
    Section2423b d c :=
  ⟨hNexus, hIntent, hTiming⟩


theorem section2423c_intro {d : Person} {v : Person} {c : ComplaintText}
    (hCovered : IsCitizenOrLawfulPermanentResident d c)
    (hPresence : ForeignPresence2423c d c)
    (hConduct : EngagesInIllicitSexualConduct d v c) :
    Section2423c d v c :=
  ⟨hCovered, hPresence, hConduct⟩


theorem section2423d_intro {d : Person} {o : Entity} {c : ComplaintText}
    (hCovered : IsCitizenOrLawfulPermanentResident d c)
    (hRole : IsOfficerDirectorEmployeeOrAgentOfOrganization d o c)
    (hOrgCommerce : EngagedInInterstateCommerce o c)
    (hMails : UsesMailsOrInterstateInstrumentality d c)
    (hConnection : ConnectionOrAffiliationWithOrganization d o c)
    (hAct : CommitsActInFurtheranceOfIllicitSexualConduct d c) :
    Section2423d d o c :=
  ⟨hCovered, hRole, hOrgCommerce, hMails, hConnection, hAct⟩


theorem section2423e_intro {d : Person} {t : Person} {c : ComplaintText}
    (hPurpose : ActsForCommercialAdvantageOrPrivateFinancialGain d c)
    (hConduct : FacilitationRoute2423e d t c)
    (hKnowsTravel : KnowsTravelerTravelsInInterstateOrForeignCommerce d t c)
    (hKnowsIntent : KnowsTravelerIntendsIllicitSexualConduct d t c) :
    Section2423e d t c :=
  ⟨hPurpose, hConduct, hKnowsTravel, hKnowsIntent⟩




#check (Proving.USC.Common.Person : Type)
#check (Proving.USC.Common.Entity : Type)
#check (Proving.USC.Common.ComplaintText : Type)
#check @Proving.USC.T18.Ch117.Reslice.Elements.Section2421Ab
#check @Proving.USC.T18.Ch117.Reslice.Elements.ValidSection2423Charge
#print axioms section2423a_intro
#print axioms validSection2421ACivilClaim_intro

end Proving.USC.T18.Ch117.Reslice.Elements
