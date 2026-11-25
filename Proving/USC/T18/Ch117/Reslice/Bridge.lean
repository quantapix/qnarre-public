
































import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Reslice.Elements.Statute
import Proving.USC.T18.Ch117.Reslice.Deontic.Statute
import Proving.USC.T18.Ch117.Reslice.Scienter.Statute
import Proving.USC.T18.Ch117.Reslice.Scienter.Theorems
import Proving.USC.T18.Ch117.Reslice.Ontology.Statute
import Proving.USC.T18.Ch117.Reslice.Procedure.Statute
import Proving.Rico.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Bridge

open Proving.USC.Common








axiom icsED : Elements.InteractiveComputerService → Deontic.InteractiveComputerService
axiom icsES : Elements.InteractiveComputerService → Scienter.InteractiveComputerService
axiom icsEO : Elements.InteractiveComputerService → Ontology.InteractiveComputerService
axiom icsDS : Deontic.InteractiveComputerService → Scienter.InteractiveComputerService
axiom orgED : Entity → Deontic.CoveredOrganization


axiom orgDE : Deontic.CoveredOrganization → Entity


axiom iscE : Person → Person → ComplaintText → Scienter.IllicitSexualConduct

axiom convE : Person → ComplaintText → Scienter.Conveyance



axiom corr_ED_owns {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} : Elements.OwnsInteractiveComputerService p s c →
    Deontic.OwnsManagesOrOperatesInteractiveComputerService p (icsED s) c
axiom corr_ED_manages {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} : Elements.ManagesInteractiveComputerService p s c →
    Deontic.OwnsManagesOrOperatesInteractiveComputerService p (icsED s) c
axiom corr_ED_operates {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} : Elements.OperatesInteractiveComputerService p s c →
    Deontic.OwnsManagesOrOperatesInteractiveComputerService p (icsED s) c
axiom corr_ED_conspires {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} : Elements.ConspiresToOwnManageOrOperateService p s c →
    Deontic.OwnsManagesOrOperatesInteractiveComputerService p (icsED s) c
axiom corr_ED_attempts {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} : Elements.AttemptsToOwnManageOrOperateService p s c →
    Deontic.OwnsManagesOrOperatesInteractiveComputerService p (icsED s) c

axiom corr_ED_commerce {p : Person} {c : ComplaintText} :
    Elements.UsesInterstateCommerceFacilityOrAffectsCommerce p c →
    Deontic.UsesFacilityOrMeansOfInterstateOrForeignCommerce p c

axiom corr_ED_intent {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} : Elements.IsInteractiveComputerService s c →
    Elements.IntentToPromoteOrFacilitateProstitution p c →
    Deontic.IntentToPromoteOrFacilitateProstitutionOfAnother p (icsED s) c




axiom corr_DE_defense2421Ae {p : Person} {c : ComplaintText} :
    Deontic.AffirmativeDefense2421Ae p c →
    Elements.ProstitutionLegalInTargetedJurisdiction p c

axiom corr_ED_fiveOrMore {p : Person} {c : ComplaintText} :
    Elements.FacilitatesProstitutionOfFiveOrMore p c →
    Deontic.PromotesOrFacilitatesProstitutionOfFiveOrMorePersons p c
axiom corr_ED_reckless {p : Person} {c : ComplaintText} :
    Elements.ConductContributedToSexTrafficking p c →
    Elements.ActsInRecklessDisregardOfTraffickingContribution p c →
    Deontic.ActsInRecklessDisregardOfContributionToSexTrafficking p c


theorem edConduct {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} (h : Elements.OwnManageOperateRoute p s c) :
    Deontic.OwnsManagesOrOperatesInteractiveComputerService p (icsED s) c :=
  match h with
  | .owns h      => corr_ED_owns h
  | .manages h   => corr_ED_manages h
  | .operates h  => corr_ED_operates h
  | .conspires h => corr_ED_conspires h
  | .attempts h  => corr_ED_attempts h


theorem s2421Aa_elements_implies_deontic {p : Person}
    {s : Elements.InteractiveComputerService} {c : ComplaintText}
    (h : Elements.Section2421Aa p s c) :
    Deontic.Prohibition2421AaLiable p (icsED s) c :=
  ⟨⟨⟨edConduct h.base.conduct, corr_ED_commerce h.base.commerce⟩,
     corr_ED_intent h.base.service h.base.intent⟩,
   fun hd => h.noLegalityDefense (corr_DE_defense2421Ae hd)⟩


theorem s2421Ab_elements_implies_deontic {p : Person}
    {s : Elements.InteractiveComputerService} {c : ComplaintText}
    (h : Elements.Section2421Ab p s c) :
    Deontic.Prohibition2421AbViolated p (icsED s) c :=
  ⟨⟨⟨edConduct h.base.conduct, corr_ED_commerce h.base.commerce⟩,
     corr_ED_intent h.base.service h.base.intent⟩,
   match h.aggravating with
   | .fiveOrMore hr => .fiveOrMorePersons (corr_ED_fiveOrMore hr.count)
   | .recklessDisregard hr =>
       .recklessDisregardOfSexTrafficking
         (corr_ED_reckless hr.contribution hr.recklessness)⟩








axiom corr_ES_rung2421Aa {p : Person} {c : ComplaintText} :
    Elements.IntentToPromoteOrFacilitateProstitution p c →
    Scienter.MentalStateProven p .s2421A_a .Specific c
axiom corr_ES_rung2421AbChapeau {p : Person} {c : ComplaintText} :
    Elements.IntentToPromoteOrFacilitateProstitution p c →
    Scienter.MentalStateProven p .s2421A_bChapeau .Specific c
axiom corr_ES_rung2421Ab2 {p : Person} {c : ComplaintText} :
    Elements.ActsInRecklessDisregardOfTraffickingContribution p c →
    Scienter.MentalStateProven p .s2421A_b2 .Recklessness c
axiom corr_ES_intentObj2421A {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} : Elements.IsInteractiveComputerService s c →
    Elements.IntentToPromoteOrFacilitateProstitution p c →
    Scienter.IntentToPromoteOrFacilitateProstitution p (icsES s) c
axiom corr_SE_defense2421Ae {p : Person} {c : ComplaintText} :
    Scienter.DefenseEstablished p .jurisdictionLegality2421Ae c →
    Elements.ProstitutionLegalInTargetedJurisdiction p c


theorem s2421Aa_elements_implies_scienter {p : Person}
    {s : Elements.InteractiveComputerService} {c : ComplaintText}
    (h : Elements.Section2421Aa p s c) :
    Scienter.Culpable2421Aa p (icsES s) c :=
  ⟨⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
      Scienter.MentalState.atLeast_refl _, corr_ES_rung2421Aa h.base.intent⟩,
     corr_ES_intentObj2421A h.base.service h.base.intent⟩,
   fun hd => h.noLegalityDefense (corr_SE_defense2421Ae hd)⟩






theorem s2421Ab2_elements_implies_scienter {p : Person}
    {s : Elements.InteractiveComputerService} {c : ComplaintText}
    (hBase : Elements.BaseOffense2421A p s c)
    (hR : Elements.RecklessDisregardRoute p c) :
    Scienter.Culpable2421Ab2 p (icsES s) c :=
  ⟨⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
      Scienter.MentalState.atLeast_refl _, corr_ES_rung2421AbChapeau hBase.intent⟩,
     corr_ES_intentObj2421A hBase.service hBase.intent⟩,
   ⟨Scienter.MentalState.Recklessness, Scienter.MentalState.Recklessness, rfl,
    Scienter.MentalState.atLeast_refl _, corr_ES_rung2421Ab2 hR.recklessness⟩⟩

axiom corr_ES_rung2421Ab1 {p : Person} {c : ComplaintText} :
    Elements.FacilitatesProstitutionOfFiveOrMore p c →
    Scienter.MentalStateProven p .s2421A_b1 .StrictLiability c






theorem s2421Ab1_elements_implies_scienter {p : Person}
    {s : Elements.InteractiveComputerService} {c : ComplaintText}
    (hBase : Elements.BaseOffense2421A p s c)
    (hR : Elements.FiveOrMorePersonsRoute p c) :
    Scienter.Culpable2421Ab1 p (icsES s) c :=
  ⟨⟨⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
       Scienter.MentalState.atLeast_refl _, corr_ES_rung2421AbChapeau hBase.intent⟩,
      corr_ES_intentObj2421A hBase.service hBase.intent⟩,
     ⟨Scienter.MentalState.StrictLiability, Scienter.MentalState.StrictLiability, rfl,
      Scienter.MentalState.atLeast_refl _, corr_ES_rung2421Ab1 hR.count⟩⟩,
   fun hd => hR.noLegalityDefense (corr_SE_defense2421Ae hd)⟩



axiom corr_DS_rung2421Aa {p : Person} {s : Deontic.InteractiveComputerService}
    {c : ComplaintText} :
    Deontic.IntentToPromoteOrFacilitateProstitutionOfAnother p s c →
    Scienter.MentalStateProven p .s2421A_a .Specific c
axiom corr_DS_intentObj2421A {p : Person} {s : Deontic.InteractiveComputerService}
    {c : ComplaintText} :
    Deontic.IntentToPromoteOrFacilitateProstitutionOfAnother p s c →
    Scienter.IntentToPromoteOrFacilitateProstitution p (icsDS s) c
axiom corr_SD_defense2421Ae {p : Person} {c : ComplaintText} :
    Scienter.DefenseEstablished p .jurisdictionLegality2421Ae c →
    Deontic.AffirmativeDefense2421Ae p c


theorem s2421Aa_deontic_implies_scienter {p : Person}
    {s : Deontic.InteractiveComputerService} {c : ComplaintText}
    (h : Deontic.Prohibition2421AaLiable p s c) :
    Scienter.Culpable2421Aa p (icsDS s) c :=
  ⟨⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
      Scienter.MentalState.atLeast_refl _, corr_DS_rung2421Aa h.1.2⟩,
     corr_DS_intentObj2421A h.1.2⟩,
   fun hd => h.2 (corr_SD_defense2421Ae hd)⟩

axiom corr_DS_rung2421AbChapeau {p : Person} {s : Deontic.InteractiveComputerService}
    {c : ComplaintText} :
    Deontic.IntentToPromoteOrFacilitateProstitutionOfAnother p s c →
    Scienter.MentalStateProven p .s2421A_bChapeau .Specific c
axiom corr_DS_rung2421Ab1 {p : Person} {c : ComplaintText} :
    Deontic.PromotesOrFacilitatesProstitutionOfFiveOrMorePersons p c →
    Scienter.MentalStateProven p .s2421A_b1 .StrictLiability c


theorem s2421Ab1_deontic_implies_scienter {p : Person}
    {s : Deontic.InteractiveComputerService} {c : ComplaintText}
    (h : Deontic.Prohibition2421Ab1Liable p s c) :
    Scienter.Culpable2421Ab1 p (icsDS s) c :=
  ⟨⟨⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
       Scienter.MentalState.atLeast_refl _, corr_DS_rung2421AbChapeau h.1.intent⟩,
      corr_DS_intentObj2421A h.1.intent⟩,
     ⟨Scienter.MentalState.StrictLiability, Scienter.MentalState.StrictLiability, rfl,
      Scienter.MentalState.atLeast_refl _, corr_DS_rung2421Ab1 h.2.1⟩⟩,
   fun hd => h.2.2 (corr_SD_defense2421Ae hd)⟩



axiom corr_ED_minor {v : Person} {c : ComplaintText} :
    Elements.IndividualHasNotAttainedAge18 v c →
    Deontic.IndividualHasNotAttainedAgeOfEighteen v c
axiom corr_ED_intentProstitution {d v : Person} {c : ComplaintText} :
    Elements.IntentIndividualEngageInProstitution d c →
    Deontic.IntentThatIndividualEngageInProstitutionOrCriminalSexualActivity d v c
axiom corr_ED_intentChargeable {d v : Person} {c : ComplaintText} :
    Elements.IntentIndividualEngageInChargeableSexualActivity d c →
    Deontic.IntentThatIndividualEngageInProstitutionOrCriminalSexualActivity d v c
axiom corr_ED_transportCommerce {d v : Person} {c : ComplaintText} :
    Elements.KnowinglyTransportsIndividual d v c →
    Elements.TransportationInInterstateOrForeignCommerce d c →
    Deontic.KnowinglyTransportsIndividualInCoveredCommerce d v c
axiom corr_ED_transportTerritory {d v : Person} {c : ComplaintText} :
    Elements.KnowinglyTransportsIndividual d v c →
    Elements.TransportationInCommonwealthTerritoryOrPossession d c →
    Deontic.KnowinglyTransportsIndividualInCoveredCommerce d v c


theorem s2423a_elements_implies_deontic {d v : Person} {c : ComplaintText}
    (h : Elements.Section2423a d v c) : Deontic.Prohibition2423aViolated d v c :=
  ⟨⟨corr_ED_minor h.minor,
     match h.intent with
     | .prostitution hx => corr_ED_intentProstitution hx
     | .chargeableSexualActivity hx => corr_ED_intentChargeable hx⟩,
   match h.nexus with
   | .commerce hx => corr_ED_transportCommerce h.transports hx
   | .territory hx => corr_ED_transportTerritory h.transports hx⟩

axiom corr_ED_intentISC {d : Person} {c : ComplaintText} :
    Elements.IntentToEngageInIllicitSexualConduct d c →
    Deontic.IntentToEngageInIllicitSexualConduct d c
axiom corr_ED_travelInterstate {d : Person} {c : ComplaintText} :
    Elements.TravelsInInterstateCommerce d c → Deontic.TravelsInCoveredCommerce d c
axiom corr_ED_travelInto {d : Person} {c : ComplaintText} :
    Elements.TravelsIntoTheUnitedStates d c → Deontic.TravelsInCoveredCommerce d c
axiom corr_ED_travelForeign {d : Person} {c : ComplaintText} :
    Elements.IsCitizenOrLawfulPermanentResident d c →
    Elements.TravelsInForeignCommerce d c → Deontic.TravelsInCoveredCommerce d c


theorem s2423b_elements_implies_deontic {d : Person} {c : ComplaintText}
    (h : Elements.Section2423b d c) : Deontic.Prohibition2423bViolated d c :=
  ⟨⟨corr_ED_intentISC h.intent⟩,
   match h.nexus with
   | .interstate hx => corr_ED_travelInterstate hx
   | .intoUnitedStates hx => corr_ED_travelInto hx
   | .foreignByCovered hx => corr_ED_travelForeign hx.covered hx.travels⟩

axiom corr_ED_covered {d : Person} {c : ComplaintText} :
    Elements.IsCitizenOrLawfulPermanentResident d c →
    Deontic.IsUnitedStatesCitizenOrLawfulPermanentResident d c
axiom corr_ED_presenceTravels {d : Person} {c : ComplaintText} :
    Elements.TravelsInForeignCommerce d c →
    Deontic.TravelsInForeignCommerceOrResidesInForeignCountry d c
axiom corr_ED_presenceResides {d : Person} {c : ComplaintText} :
    Elements.ResidesInForeignCountry d c →
    Deontic.TravelsInForeignCommerceOrResidesInForeignCountry d c
axiom corr_ED_iscSexualAct {d v : Person} {c : ComplaintText} :
    Elements.SexualActWithPersonUnder18ViolatingChapter109A d v c →
    Deontic.SexualActWithPersonUnderEighteenViolatingChapter109A d v c
axiom corr_ED_iscCommercial {d v : Person} {c : ComplaintText} :
    Elements.CommercialSexActWithPersonUnder18 d v c →
    Deontic.CommercialSexActWithPersonUnderEighteen d v c
axiom corr_ED_iscChildPorn {d v : Person} {c : ComplaintText} :
    Elements.ProducesChildPornography d c → Deontic.ProducesChildPornography d v c


theorem edIllicit {d v : Person} {c : ComplaintText}
    (h : Elements.EngagesInIllicitSexualConduct d v c) :
    Deontic.IllicitSexualConduct d v c :=
  match h with
  | .sexualAct hx => .sexualActWithMinor (corr_ED_iscSexualAct hx)
  | .commercialSexAct hx => .commercialSexActWithMinor (corr_ED_iscCommercial hx.act)
  | .childPornography hx => .productionOfChildPornography (corr_ED_iscChildPorn hx)


theorem s2423c_elements_implies_deontic {d v : Person} {c : ComplaintText}
    (h : Elements.Section2423c d v c) : Deontic.Prohibition2423cViolated d v c :=
  ⟨⟨corr_ED_covered h.covered,
     match h.presence with
     | .travels hx => corr_ED_presenceTravels hx
     | .resides hx => corr_ED_presenceResides hx⟩,
   edIllicit h.conduct⟩

axiom corr_ED_orgRole {d : Person} {o : Entity} {c : ComplaintText} :
    Elements.IsOfficerDirectorEmployeeOrAgentOfOrganization d o c →
    Proving.USC.Common.EngagedInInterstateCommerce o c →
    Deontic.IsOfficerDirectorEmployeeOrAgentOfCoveredOrganization d (orgED o) c
axiom corr_ED_orgMails {d : Person} {o : Entity} {c : ComplaintText} :
    Elements.UsesMailsOrInterstateInstrumentality d c →
    Elements.ConnectionOrAffiliationWithOrganization d o c →
    Deontic.UsesMailsOrInterstateInstrumentalityThroughOrganization d (orgED o) c
axiom corr_ED_orgFurtherance {d : Person} {o : Entity} {c : ComplaintText} :
    Elements.CommitsActInFurtheranceOfIllicitSexualConduct d c →
    Elements.ConnectionOrAffiliationWithOrganization d o c →
    Deontic.CommitsActInFurtheranceOfIllicitSexualConductThroughOrganization d (orgED o) c


theorem s2423d_elements_implies_deontic {d : Person} {o : Entity} {c : ComplaintText}
    (h : Elements.Section2423d d o c) : Deontic.Prohibition2423dViolated d (orgED o) c :=
  ⟨⟨corr_ED_covered h.covered, corr_ED_orgRole h.role h.orgCommerce⟩,
   corr_ED_orgMails h.useOfMails h.throughConnection,
   corr_ED_orgFurtherance h.actInFurtherance h.throughConnection⟩

axiom corr_ED_gain {d : Person} {c : ComplaintText} :
    Elements.ActsForCommercialAdvantageOrPrivateFinancialGain d c →
    Deontic.ForCommercialAdvantageOrPrivateFinancialGain d c
axiom corr_ED_knows {d t : Person} {c : ComplaintText} :
    Elements.KnowsTravelerTravelsInInterstateOrForeignCommerce d t c →
    Elements.KnowsTravelerIntendsIllicitSexualConduct d t c →
    Deontic.KnowsTravelerTravelsWithIntentToEngageInIllicitSexualConduct d t c
axiom corr_ED_arranges {d t : Person} {c : ComplaintText} :
    Elements.ArrangesTravel d t c → Deontic.ArrangesInducesProcuresOrFacilitatesTravel d t c
axiom corr_ED_induces {d t : Person} {c : ComplaintText} :
    Elements.InducesTravel d t c → Deontic.ArrangesInducesProcuresOrFacilitatesTravel d t c
axiom corr_ED_procures {d t : Person} {c : ComplaintText} :
    Elements.ProcuresTravel d t c → Deontic.ArrangesInducesProcuresOrFacilitatesTravel d t c
axiom corr_ED_facilitates {d t : Person} {c : ComplaintText} :
    Elements.FacilitatesTravel d t c → Deontic.ArrangesInducesProcuresOrFacilitatesTravel d t c


theorem s2423e_elements_implies_deontic {d t : Person} {c : ComplaintText}
    (h : Elements.Section2423e d t c) : Deontic.Prohibition2423eViolated d t c :=
  ⟨⟨corr_ED_gain h.purpose, corr_ED_knows h.knowsTravel h.knowsIntent⟩,
   match h.conduct with
   | .arranges hx => corr_ED_arranges hx
   | .induces hx => corr_ED_induces hx
   | .procures hx => corr_ED_procures hx
   | .facilitates hx => corr_ED_facilitates hx⟩










axiom corr_ES_rung2423aTransport {d v : Person} {c : ComplaintText} :
    Elements.KnowinglyTransportsIndividual d v c →
    Scienter.MentalStateProven d .s2423_aTransport .Knowledge c
axiom corr_ES_rung2423aPurposeP {d : Person} {c : ComplaintText} :
    Elements.IntentIndividualEngageInProstitution d c →
    Scienter.MentalStateProven d .s2423_aPurpose .Specific c
axiom corr_ES_rung2423aPurposeC {d : Person} {c : ComplaintText} :
    Elements.IntentIndividualEngageInChargeableSexualActivity d c →
    Scienter.MentalStateProven d .s2423_aPurpose .Specific c
axiom corr_ES_objP2423a {d v : Person} {c : ComplaintText} :
    Elements.IntentIndividualEngageInProstitution d c →
    Scienter.IntentThatIndividualEngageInProhibitedSexualActivity d v c
axiom corr_ES_objC2423a {d v : Person} {c : ComplaintText} :
    Elements.IntentIndividualEngageInChargeableSexualActivity d c →
    Scienter.IntentThatIndividualEngageInProhibitedSexualActivity d v c
axiom corr_ES_concurrence {d : Person} {c : ComplaintText} :
    Elements.IntentExistedAtTimeOfTransportationOrTravel d c →
    Scienter.IntentConcurrentWithConveyance d (convE d c) c


theorem s2423a_elements_implies_scienter {d v : Person} {c : ComplaintText}
    (h : Elements.Section2423a d v c) :
    Scienter.Scienter2423a d v (convE d c) c :=
  ⟨⟨Scienter.MentalState.Knowledge, Scienter.MentalState.Knowledge, rfl,
     Scienter.MentalState.atLeast_refl _, corr_ES_rung2423aTransport h.transports⟩,
   (match h.intent with
    | .prostitution hx =>
        ⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
         Scienter.MentalState.atLeast_refl _, corr_ES_rung2423aPurposeP hx⟩
    | .chargeableSexualActivity hx =>
        ⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
         Scienter.MentalState.atLeast_refl _, corr_ES_rung2423aPurposeC hx⟩),
   (match h.intent with
    | .prostitution hx => corr_ES_objP2423a hx
    | .chargeableSexualActivity hx => corr_ES_objC2423a hx),
   corr_ES_concurrence h.intentTiming⟩

axiom corr_ES_rung2423b {d : Person} {c : ComplaintText} :
    Elements.IntentToEngageInIllicitSexualConduct d c →
    Scienter.MentalStateProven d .s2423_b .Specific c
axiom corr_ES_obj2423b {d : Person} {c : ComplaintText} :
    Elements.IntentToEngageInIllicitSexualConduct d c →
    Scienter.IntentToEngageInIllicitSexualConduct d (iscE d d c) c


theorem s2423b_elements_implies_scienter {d : Person} {c : ComplaintText}
    (h : Elements.Section2423b d c) :
    Scienter.Scienter2423b d (iscE d d c) (convE d c) c :=
  ⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
     Scienter.MentalState.atLeast_refl _, corr_ES_rung2423b h.intent⟩,
   corr_ES_obj2423b h.intent,
   corr_ES_concurrence h.intentTiming⟩

axiom corr_ES_rung2423c {d v : Person} {c : ComplaintText} :
    Elements.EngagesInIllicitSexualConduct d v c →
    Scienter.MentalStateProven d .s2423_c .StrictLiability c



theorem s2423c_elements_implies_scienter {d v : Person} {c : ComplaintText}
    (h : Elements.Section2423c d v c) : Scienter.Scienter2423c d c :=
  Scienter.meetsRequirement_of_strict Scienter.MentalState.StrictLiability rfl
    (corr_ES_rung2423c h.conduct)

axiom corr_ES_rung2423d {d : Person} {c : ComplaintText} :
    Elements.CommitsActInFurtheranceOfIllicitSexualConduct d c →
    Scienter.MentalStateProven d .s2423_d .Specific c
axiom corr_ES_obj2423d {d : Person} {o : Entity} {c : ComplaintText} :
    Elements.CommitsActInFurtheranceOfIllicitSexualConduct d c →
    Elements.ConnectionOrAffiliationWithOrganization d o c →
    Scienter.PurposeOfIllicitSexualConductThroughOrganization d o (iscE d d c) c


theorem s2423d_elements_implies_scienter {d : Person} {o : Entity} {c : ComplaintText}
    (h : Elements.Section2423d d o c) :
    Scienter.Scienter2423d d o (iscE d d c) c :=
  ⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
     Scienter.MentalState.atLeast_refl _, corr_ES_rung2423d h.actInFurtherance⟩,
   corr_ES_obj2423d h.actInFurtherance h.throughConnection⟩

axiom corr_ES_rung2423eGain {d : Person} {c : ComplaintText} :
    Elements.ActsForCommercialAdvantageOrPrivateFinancialGain d c →
    Scienter.MentalStateProven d .s2423_eGain .Specific c
axiom corr_ES_obj2423eGain {d : Person} {c : ComplaintText} :
    Elements.ActsForCommercialAdvantageOrPrivateFinancialGain d c →
    Scienter.PurposeOfCommercialAdvantageOrPrivateFinancialGain d c
axiom corr_ES_rung2423eKnow {d t : Person} {c : ComplaintText} :
    Elements.KnowsTravelerIntendsIllicitSexualConduct d t c →
    Scienter.MentalStateProven d .s2423_eKnowledge .Knowledge c
axiom corr_ES_obj2423eKnow {d t : Person} {c : ComplaintText} :
    Elements.KnowsTravelerIntendsIllicitSexualConduct d t c →
    Elements.KnowsTravelerTravelsInInterstateOrForeignCommerce d t c →
    Scienter.KnowledgeOfTravelersIllicitIntent d t c


theorem s2423e_elements_implies_scienter {d t : Person} {c : ComplaintText}
    (h : Elements.Section2423e d t c) : Scienter.Scienter2423e d t c :=
  ⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
     Scienter.MentalState.atLeast_refl _, corr_ES_rung2423eGain h.purpose⟩,
   corr_ES_obj2423eGain h.purpose,
   ⟨Scienter.MentalState.Knowledge, Scienter.MentalState.Knowledge, rfl,
    Scienter.MentalState.atLeast_refl _, corr_ES_rung2423eKnow h.knowsIntent⟩,
   corr_ES_obj2423eKnow h.knowsIntent h.knowsTravel⟩



axiom corr_DS_rung2423aTransport {d v : Person} {c : ComplaintText} :
    Deontic.KnowinglyTransportsIndividualInCoveredCommerce d v c →
    Scienter.MentalStateProven d .s2423_aTransport .Knowledge c
axiom corr_DS_rung2423aPurpose {d v : Person} {c : ComplaintText} :
    Deontic.IntentThatIndividualEngageInProstitutionOrCriminalSexualActivity d v c →
    Scienter.MentalStateProven d .s2423_aPurpose .Specific c
axiom corr_DS_obj2423a {d v : Person} {c : ComplaintText} :
    Deontic.IntentThatIndividualEngageInProstitutionOrCriminalSexualActivity d v c →
    Scienter.IntentThatIndividualEngageInProhibitedSexualActivity d v c









axiom corr_DS_concurrence2423a {d v : Person} {c : ComplaintText} :
    Deontic.IntentThatIndividualEngageInProstitutionOrCriminalSexualActivity d v c →
    Scienter.IntentConcurrentWithConveyance d (convE d c) c


theorem s2423a_deontic_implies_scienter {d v : Person} {c : ComplaintText}
    (h : Deontic.Prohibition2423aViolated d v c) :
    Scienter.Scienter2423a d v (convE d c) c :=
  ⟨⟨Scienter.MentalState.Knowledge, Scienter.MentalState.Knowledge, rfl,
     Scienter.MentalState.atLeast_refl _, corr_DS_rung2423aTransport h.2⟩,
   ⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
    Scienter.MentalState.atLeast_refl _, corr_DS_rung2423aPurpose h.1.intent⟩,
   corr_DS_obj2423a h.1.intent,
   corr_DS_concurrence2423a h.1.intent⟩

axiom corr_DS_rung2423b {d : Person} {c : ComplaintText} :
    Deontic.IntentToEngageInIllicitSexualConduct d c →
    Scienter.MentalStateProven d .s2423_b .Specific c
axiom corr_DS_obj2423b {d : Person} {c : ComplaintText} :
    Deontic.IntentToEngageInIllicitSexualConduct d c →
    Scienter.IntentToEngageInIllicitSexualConduct d (iscE d d c) c



axiom corr_DS_concurrence2423b {d : Person} {c : ComplaintText} :
    Deontic.IntentToEngageInIllicitSexualConduct d c →
    Scienter.IntentConcurrentWithConveyance d (convE d c) c


theorem s2423b_deontic_implies_scienter {d : Person} {c : ComplaintText}
    (h : Deontic.Prohibition2423bViolated d c) :
    Scienter.Scienter2423b d (iscE d d c) (convE d c) c :=
  ⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
     Scienter.MentalState.atLeast_refl _, corr_DS_rung2423b h.1.intent⟩,
   corr_DS_obj2423b h.1.intent,
   corr_DS_concurrence2423b h.1.intent⟩

axiom corr_DS_rung2423c {d v : Person} {c : ComplaintText} :
    Deontic.IllicitSexualConduct d v c →
    Scienter.MentalStateProven d .s2423_c .StrictLiability c


theorem s2423c_deontic_implies_scienter {d v : Person} {c : ComplaintText}
    (h : Deontic.Prohibition2423cViolated d v c) : Scienter.Scienter2423c d c :=
  Scienter.meetsRequirement_of_strict Scienter.MentalState.StrictLiability rfl
    (corr_DS_rung2423c h.2)

axiom corr_DS_rung2423d {d : Person} {o : Deontic.CoveredOrganization}
    {c : ComplaintText} :
    Deontic.CommitsActInFurtheranceOfIllicitSexualConductThroughOrganization d o c →
    Scienter.MentalStateProven d .s2423_d .Specific c
axiom corr_DS_obj2423d {d : Person} {o : Deontic.CoveredOrganization}
    {c : ComplaintText} :
    Deontic.CommitsActInFurtheranceOfIllicitSexualConductThroughOrganization d o c →
    Scienter.PurposeOfIllicitSexualConductThroughOrganization d (orgDE o) (iscE d d c) c


theorem s2423d_deontic_implies_scienter {d : Person} {o : Deontic.CoveredOrganization}
    {c : ComplaintText} (h : Deontic.Prohibition2423dViolated d o c) :
    Scienter.Scienter2423d d (orgDE o) (iscE d d c) c :=
  ⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
     Scienter.MentalState.atLeast_refl _, corr_DS_rung2423d h.2.2⟩,
   corr_DS_obj2423d h.2.2⟩

axiom corr_DS_rung2423eGain {d : Person} {c : ComplaintText} :
    Deontic.ForCommercialAdvantageOrPrivateFinancialGain d c →
    Scienter.MentalStateProven d .s2423_eGain .Specific c
axiom corr_DS_obj2423eGain {d : Person} {c : ComplaintText} :
    Deontic.ForCommercialAdvantageOrPrivateFinancialGain d c →
    Scienter.PurposeOfCommercialAdvantageOrPrivateFinancialGain d c
axiom corr_DS_rung2423eKnow {d t : Person} {c : ComplaintText} :
    Deontic.KnowsTravelerTravelsWithIntentToEngageInIllicitSexualConduct d t c →
    Scienter.MentalStateProven d .s2423_eKnowledge .Knowledge c
axiom corr_DS_obj2423eKnow {d t : Person} {c : ComplaintText} :
    Deontic.KnowsTravelerTravelsWithIntentToEngageInIllicitSexualConduct d t c →
    Scienter.KnowledgeOfTravelersIllicitIntent d t c


theorem s2423e_deontic_implies_scienter {d t : Person} {c : ComplaintText}
    (h : Deontic.Prohibition2423eViolated d t c) : Scienter.Scienter2423e d t c :=
  ⟨⟨Scienter.MentalState.Specific, Scienter.MentalState.Specific, rfl,
     Scienter.MentalState.atLeast_refl _, corr_DS_rung2423eGain h.1.purpose⟩,
   corr_DS_obj2423eGain h.1.purpose,
   ⟨Scienter.MentalState.Knowledge, Scienter.MentalState.Knowledge, rfl,
    Scienter.MentalState.atLeast_refl _, corr_DS_rung2423eKnow h.1.knowledge⟩,
   corr_DS_obj2423eKnow h.1.knowledge⟩









axiom corr_EO_citizen {d : Person} {c : ComplaintText} :
    Elements.IsCitizenOrLawfulPermanentResident d c →
    Ontology.IsUnitedStatesCitizen d c




theorem coveredTraveler_elements_implies_ontology {d : Person} {c : ComplaintText}
    (h : Elements.IsCitizenOrLawfulPermanentResident d c) :
    Ontology.CoveredTravelerMembership d c :=
  .citizen (corr_EO_citizen h)


axiom civilActionOf : Person → ComplaintText → Procedure.CivilAction
axiom districtCourtOf : Person → ComplaintText → Procedure.DistrictCourt

axiom corr_EP_violationB {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} : Elements.Section2421Ab p s c →
    Procedure.ViolationOfSubsectionB p c
axiom gap_EP_actionFiled {pl : Person} {c : ComplaintText} :
    Elements.PlaintiffInjuredByViolation pl c →
    Procedure.CivilActionFiled (civilActionOf pl c) pl c
axiom gap_EP_forum {pl : Person} {c : ComplaintText} :
    Elements.PlaintiffInjuredByViolation pl c →
    Procedure.FiledInAppropriateDistrictCourt (civilActionOf pl c)
      (districtCourtOf pl c) c
axiom corr_EP_injured {pl : Person} {c : ComplaintText} :
    Elements.PlaintiffInjuredByViolation pl c → Procedure.PersonInjured pl c
axiom corr_EP_byReason {pl p : Person} {c : ComplaintText} :
    Proving.USC.Common.ProximateCause pl c → Procedure.InjuryByReasonOfViolation pl p c







theorem s2421Ac_elements_implies_procedure_modulo_gaps {pl p : Person}
    {s : Elements.InteractiveComputerService} {c : ComplaintText}
    (h : Elements.ValidSection2421ACivilClaim pl p s c) :
    Procedure.CivilRecoveryAvailable2421Ac pl p (civilActionOf pl c)
      (districtCourtOf pl c) c :=
  ⟨corr_EP_injured h.injury, corr_EP_byReason h.causation,
   corr_EP_violationB h.violation, gap_EP_actionFiled h.injury,
   gap_EP_forum h.injury⟩














namespace Golden

open Proving.USC.T18.Ch117.Reslice
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom rackAct2423a : Person → Person → ComplaintText → Proving.Rico.Act
axiom rackAct2423b : Person → ComplaintText → Proving.Rico.Act
axiom rackAct2423c : Person → Person → ComplaintText → Proving.Rico.Act
axiom rackAct2423d : Person → Entity → ComplaintText → Proving.Rico.Act
axiom rackAct2423e : Person → Person → ComplaintText → Proving.Rico.Act

axiom corr_rack_2423a {p v : Person} {c : ComplaintText} :
    Elements.Section2423a p v c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423a p v c) (mapComplaint c)
axiom corr_rack_2423b {p : Person} {c : ComplaintText} :
    Elements.Section2423b p c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423b p c) (mapComplaint c)
axiom corr_rack_2423c {p v : Person} {c : ComplaintText} :
    Elements.Section2423c p v c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423c p v c) (mapComplaint c)
axiom corr_rack_2423d {p : Person} {o : Entity} {c : ComplaintText} :
    Elements.Section2423d p o c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423d p o c) (mapComplaint c)
axiom corr_rack_2423e {p t : Person} {c : ComplaintText} :
    Elements.Section2423e p t c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423e p t c) (mapComplaint c)


theorem s2423a_implies_racketeering {p v : Person} {c : ComplaintText}
    (h : Elements.Section2423a p v c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423a p v c) (mapComplaint c) :=
  corr_rack_2423a h

theorem s2423b_implies_racketeering {p : Person} {c : ComplaintText}
    (h : Elements.Section2423b p c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423b p c) (mapComplaint c) :=
  corr_rack_2423b h

theorem s2423c_implies_racketeering {p v : Person} {c : ComplaintText}
    (h : Elements.Section2423c p v c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423c p v c) (mapComplaint c) :=
  corr_rack_2423c h

theorem s2423d_implies_racketeering {p : Person} {o : Entity} {c : ComplaintText}
    (h : Elements.Section2423d p o c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423d p o c) (mapComplaint c) :=
  corr_rack_2423d h

theorem s2423e_implies_racketeering {p t : Person} {c : ComplaintText}
    (h : Elements.Section2423e p t c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423e p t c) (mapComplaint c) :=
  corr_rack_2423e h

end Golden



#check (Proving.USC.Common.Person : Type)
#check (Proving.USC.Common.ComplaintText : Type)
#check (Elements.InteractiveComputerService : Type)
#check (Deontic.InteractiveComputerService : Type)
#check (Scienter.InteractiveComputerService : Type)
#check @Elements.Section2421Aa
#check @Deontic.Prohibition2421AaLiable
#check @Scienter.Culpable2421Aa
#check @Proving.Rico.IsRacketeeringActivity

end Proving.USC.T18.Ch117.Reslice.Bridge
