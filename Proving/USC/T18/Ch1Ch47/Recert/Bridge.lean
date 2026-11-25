













































import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert.Elements.Statute
import Proving.USC.T18.Ch1Ch47.Recert.Deontic.Statute
import Proving.USC.T18.Ch1Ch47.Recert.Ontology.Statute
import Proving.USC.T18.Ch1Ch47.Recert.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch1Ch47.Recert









axiom eoLocus : Elements.Locus → Ontology.Locus

axiom eoInstitution : Elements.Institution → Ontology.Institution

axiom eoProperty : Elements.Property → Ontology.Property



axiom eoRepresentation : Person → Elements.Property → Ontology.Representation


axiom opLocus : Ontology.Locus → Procedure.Locus

axiom opChargeOfLocus : Ontology.Locus → Procedure.Charge

axiom opChargeOfOffense : Ontology.Offense → Procedure.Charge


axiom pdPlace : Procedure.Locus → Deontic.Place

axiom pdCourt : Procedure.Tribunal → Deontic.Court


axiom odInstitution : Ontology.Institution → Deontic.Institution


axiom deProperty : Deontic.Property → Elements.Property

axiom dpProperty : Deontic.Property → Procedure.Property


axiom dpRepresentation : Deontic.Property → Procedure.OfficialRepresentation

axiom epProperty : Elements.Property → Procedure.Property


axiom epRepresentation : Person → Elements.Property → Procedure.OfficialRepresentation

axiom opProperty : Ontology.Property → Procedure.Property

axiom opRepresentation : Ontology.Representation → Procedure.OfficialRepresentation


axiom oeCourt : Ontology.Court → Elements.Court

axiom epTribunal : Elements.Court → Procedure.Tribunal


axiom edOffense : Elements.Offense → Deontic.Offense

axiom edProgram : Elements.HealthProgram → Deontic.HealthCareBenefitProgram

axiom doOffense : Deontic.Offense → Ontology.Offense

axiom doProgram : Deontic.HealthCareBenefitProgram → Ontology.BenefitProgram





axiom chargeOf : Person → ComplaintText → Procedure.Charge

axiom documentOfCharge : Procedure.Charge → Procedure.IdentificationDocument

axiom implementOfCharge : Procedure.Charge → Procedure.DocumentMakingImplement







axiom corr_s7_highSeas {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsHighSeasOrAdmiraltyWaters l c →
    Ontology.IsHighSeasOrUnitedStatesVesselWaters (eoLocus l) c
axiom corr_s7_usVessel {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsUnitedStatesConnectedVessel l c →
    Elements.VesselWithinAdmiraltyOutsideStateJurisdiction l c →
    Ontology.IsHighSeasOrUnitedStatesVesselWaters (eoLocus l) c
axiom corr_s7_greatLakes {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsUnitedStatesRegisteredVessel l c →
    Elements.OnGreatLakesOrSaintLawrenceBoundary l c →
    Ontology.IsGreatLakesRegisteredVessel (eoLocus l) c
axiom corr_s7_reservedLand {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsLandReservedOrAcquiredForUnitedStates l c →
    Elements.UnderExclusiveOrConcurrentUnitedStatesJurisdiction l c →
    Ontology.IsFederalEnclaveOrReservedLands (eoLocus l) c
axiom corr_s7_purchased {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsPlacePurchasedWithStateConsentForNeedfulBuilding l c →
    Ontology.IsFederalEnclaveOrReservedLands (eoLocus l) c
axiom corr_s7_guano {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsGuanoIslandAppertainingToUnitedStates l c →
    Ontology.IsGuanoIslandAppertainingToUnitedStates (eoLocus l) c
axiom corr_s7_aircraft {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsUnitedStatesConnectedAircraft l c →
    Elements.AircraftInFlightOverAdmiraltyWaters l c →
    Ontology.IsUnitedStatesAircraftInFlight (eoLocus l) c
axiom corr_s7_space {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsUnitedStatesRegisteredSpaceVehicle l c →
    Elements.SpaceVehicleInFlight l c →
    Ontology.IsUnitedStatesRegisteredSpaceVehicleInFlight (eoLocus l) c
axiom corr_s7_outside {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsPlaceOutsideJurisdictionOfAnyNation l c →
    Ontology.IsPlaceOutsideJurisdictionOfAnyNation (eoLocus l) c
axiom corr_s7_foreignVessel {l : Elements.Locus} {c : ComplaintText} :
    Elements.PermittedByInternationalLaw l c →
    Elements.IsForeignVesselOnScheduledUnitedStatesVoyage l c →
    Ontology.IsForeignVesselOnScheduledUnitedStatesVoyage (eoLocus l) c
axiom corr_s7_mission {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsUnitedStatesMissionPremisesAbroad l c →
    Ontology.IsUnitedStatesMissionPremisesInForeignState (eoLocus l) c
axiom corr_s7_residence {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsUnitedStatesPersonnelResidenceAbroad l c →
    Ontology.IsUnitedStatesMissionResidenceInForeignState (eoLocus l) c


axiom corr_s7_nexus {l : Elements.Locus} {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseByOrAgainstUnitedStatesNational o c →
    Ontology.OffenseByOrAgainstNationalOfTheUnitedStates (eoLocus l) c



axiom corr_s7_3261a {l : Elements.Locus} {p : Person} {c : ComplaintText} :
    Ontology.OffenseCommittedByPersonDescribedInSection3261a (eoLocus l) c →
    Elements.OffenseCommittedByPersonDescribedInSection3261a p c



theorem s7_elements_implies_ontology
    {l : Elements.Locus} {o : Elements.Offense} {p : Person} {c : ComplaintText}
    (h : Elements.SpecialMaritimeTerritorialJurisdiction l o p c) :
    Ontology.SpecialMaritimeTerritorialJurisdictionCase (eoLocus l) c :=
  match h with
  | .highSeas hx => .highSeasOrUnitedStatesVessel (corr_s7_highSeas hx)
  | .unitedStatesVessel hv hs => .highSeasOrUnitedStatesVessel (corr_s7_usVessel hv hs)
  | .greatLakesVessel hr hs => .greatLakesVessel (corr_s7_greatLakes hr hs)
  | .reservedLand hl hj => .federalEnclave (corr_s7_reservedLand hl hj)
  | .purchasedWithConsent hx => .federalEnclave (corr_s7_purchased hx)
  | .guanoIsland hx => .guanoIsland (corr_s7_guano hx)
  | .unitedStatesAircraft ha hs => .unitedStatesAircraft (corr_s7_aircraft ha hs)
  | .spaceVehicle hr hf => .spaceVehicle (corr_s7_space hr hf)
  | .outsideAnyNation hs hn => .placeOutsideAnyNation (corr_s7_outside hs) (corr_s7_nexus hn)
  | .foreignVessel hi hv hn =>
      .foreignVesselScheduledVoyage (corr_s7_foreignVessel hi hv) (corr_s7_nexus hn)
  | .diplomaticPremises hp hn _ hesc =>
      match hp with
      | .mission hm =>
          .missionPremisesAbroad (corr_s7_mission hm) (corr_s7_nexus hn)
            (fun hx => hesc (corr_s7_3261a hx))
      | .residence hr =>
          .missionResidenceAbroad (corr_s7_residence hr) (corr_s7_nexus hn)
            (fun hx => hesc (corr_s7_3261a hx))



axiom corr_s7p_highSeas {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsHighSeasOrUnitedStatesVesselWaters l c →
    Procedure.SitusHighSeasOrUnitedStatesVessel (opLocus l) c
axiom corr_s7p_greatLakes {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsGreatLakesRegisteredVessel l c → Procedure.SitusGreatLakesVessel (opLocus l) c
axiom corr_s7p_enclave {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsFederalEnclaveOrReservedLands l c → Procedure.SitusFederalEnclave (opLocus l) c
axiom corr_s7p_guano {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsGuanoIslandAppertainingToUnitedStates l c →
    Procedure.SitusGuanoIsland (opLocus l) c
axiom corr_s7p_aircraft {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsUnitedStatesAircraftInFlight l c →
    Procedure.SitusUnitedStatesAircraftInFlight (opLocus l) c
axiom corr_s7p_space {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsUnitedStatesRegisteredSpaceVehicleInFlight l c →
    Procedure.SitusUnitedStatesSpaceVehicleInFlight (opLocus l) c
axiom corr_s7p_outside {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsPlaceOutsideJurisdictionOfAnyNation l c →
    Procedure.SitusOutsideJurisdictionOfAnyNation (opLocus l) c
axiom corr_s7p_foreignVessel {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsForeignVesselOnScheduledUnitedStatesVoyage l c →
    Procedure.SitusForeignVesselOnScheduledUnitedStatesVoyage (opLocus l) c
axiom corr_s7p_missionPremises {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsUnitedStatesMissionPremisesInForeignState l c →
    Procedure.SitusUnitedStatesMissionPremisesOrResidence (opLocus l) c
axiom corr_s7p_missionResidence {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.IsUnitedStatesMissionResidenceInForeignState l c →
    Procedure.SitusUnitedStatesMissionPremisesOrResidence (opLocus l) c
axiom corr_s7p_nexus {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.OffenseByOrAgainstNationalOfTheUnitedStates l c →
    Procedure.OffenseByOrAgainstUnitedStatesNational (opChargeOfLocus l) c
axiom corr_s7p_3261a {l : Ontology.Locus} {c : ComplaintText} :
    Procedure.CoveredBySection3261a (opChargeOfLocus l) c →
    Ontology.OffenseCommittedByPersonDescribedInSection3261a l c


theorem s7_ontology_implies_procedure {l : Ontology.Locus} {c : ComplaintText}
    (h : Ontology.SpecialMaritimeTerritorialJurisdictionCase l c) :
    Procedure.SpecialMaritimeAndTerritorialJurisdiction (opLocus l) (opChargeOfLocus l) c :=
  match h with
  | .highSeasOrUnitedStatesVessel hx => .highSeasOrUnitedStatesVessel (corr_s7p_highSeas hx)
  | .greatLakesVessel hx => .greatLakesVessel (corr_s7p_greatLakes hx)
  | .federalEnclave hx => .federalEnclave (corr_s7p_enclave hx)
  | .guanoIsland hx => .guanoIsland (corr_s7p_guano hx)
  | .unitedStatesAircraft hx => .unitedStatesAircraft (corr_s7p_aircraft hx)
  | .spaceVehicle hx => .unitedStatesSpaceVehicle (corr_s7p_space hx)
  | .placeOutsideAnyNation hx hn => .outsideAnyNation (corr_s7p_outside hx) (corr_s7p_nexus hn)
  | .foreignVesselScheduledVoyage hx hn =>
      .foreignVesselUnitedStatesVoyage (corr_s7p_foreignVessel hx) (corr_s7p_nexus hn)
  | .missionPremisesAbroad hx hn hesc =>
      .unitedStatesMissionPremises (corr_s7p_missionPremises hx) (corr_s7p_nexus hn)
        (fun hy => hesc (corr_s7p_3261a hy))
  | .missionResidenceAbroad hx hn hesc =>
      .unitedStatesMissionPremises (corr_s7p_missionResidence hx) (corr_s7p_nexus hn)
        (fun hy => hesc (corr_s7p_3261a hy))








axiom corr_s7d {l : Procedure.Locus} {ch : Procedure.Charge} {c : ComplaintText} :
    Procedure.SpecialMaritimeAndTerritorialJurisdiction l ch c →
    Deontic.WithinSpecialMaritimeAndTerritorialJurisdiction (pdPlace l) c


theorem s7_procedure_implies_deontic
    {l : Procedure.Locus} {ch : Procedure.Charge} {c : ComplaintText}
    (h : Procedure.SpecialMaritimeAndTerritorialJurisdiction l ch c) :
    Deontic.SpecialMaritimeAndTerritorialJurisdiction (pdPlace l) c :=
  corr_s7d h




theorem s7_elements_implies_procedure
    {l : Elements.Locus} {o : Elements.Offense} {p : Person} {c : ComplaintText}
    (h : Elements.SpecialMaritimeTerritorialJurisdiction l o p c) :
    Procedure.SpecialMaritimeAndTerritorialJurisdiction
      (opLocus (eoLocus l)) (opChargeOfLocus (eoLocus l)) c :=
  s7_ontology_implies_procedure (s7_elements_implies_ontology h)


theorem s7_ontology_implies_deontic {l : Ontology.Locus} {c : ComplaintText}
    (h : Ontology.SpecialMaritimeTerritorialJurisdictionCase l c) :
    Deontic.SpecialMaritimeAndTerritorialJurisdiction (pdPlace (opLocus l)) c :=
  s7_procedure_implies_deontic (s7_ontology_implies_procedure h)


theorem s7_elements_implies_deontic
    {l : Elements.Locus} {o : Elements.Offense} {p : Person} {c : ComplaintText}
    (h : Elements.SpecialMaritimeTerritorialJurisdiction l o p c) :
    Deontic.SpecialMaritimeAndTerritorialJurisdiction (pdPlace (opLocus (eoLocus l))) c :=
  s7_ontology_implies_deontic (s7_elements_implies_ontology h)





axiom corr_s20_1 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsInsuredDepositoryInstitution i c →
    Ontology.IsInsuredDepositoryInstitution (eoInstitution i) c
axiom corr_s20_2 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsInsuredCreditUnion i c → Ontology.IsFederallyInsuredCreditUnion (eoInstitution i) c
axiom corr_s20_3 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalHomeLoanBankOrMember i c →
    Ontology.IsFederalHomeLoanBankOrMember (eoInstitution i) c
axiom corr_s20_4 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFarmCreditSystemInstitution i c →
    Ontology.IsFarmCreditSystemInstitution (eoInstitution i) c
axiom corr_s20_5 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsSmallBusinessInvestmentCompany i c →
    Ontology.IsSmallBusinessInvestmentCompany (eoInstitution i) c
axiom corr_s20_6 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsDepositoryInstitutionHoldingCompany i c →
    Ontology.IsDepositoryInstitutionHoldingCompany (eoInstitution i) c
axiom corr_s20_7 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalReserveBankOrMemberBank i c →
    Ontology.IsFederalReserveBankOrMemberBank (eoInstitution i) c
axiom corr_s20_8 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsEdgeActOrganization i c →
    Ontology.IsEdgeActOrAgreementCorporation (eoInstitution i) c
axiom corr_s20_9 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsBranchOrAgencyOfForeignBank i c →
    Ontology.IsBranchOrAgencyOfForeignBank (eoInstitution i) c
axiom corr_s20_10 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsMortgageLendingBusinessOrFederallyRelatedLender i c →
    Ontology.IsMortgageLendingBusinessOrFederallyRelatedMortgageLender (eoInstitution i) c



theorem s20_elements_implies_ontology {i : Elements.Institution} {c : ComplaintText}
    (h : Elements.FinancialInstitution i c) :
    Ontology.FinancialInstitutionCase (eoInstitution i) c :=
  match h with
  | .insuredDepository hx => .insuredDepository (corr_s20_1 hx)
  | .insuredCreditUnion hx => .insuredCreditUnion (corr_s20_2 hx)
  | .homeLoanBank hx => .homeLoanBank (corr_s20_3 hx)
  | .farmCredit hx => .farmCredit (corr_s20_4 hx)
  | .smallBusinessInvestment hx => .sbic (corr_s20_5 hx)
  | .holdingCompany hx => .holdingCompany (corr_s20_6 hx)
  | .federalReserve hx => .federalReserve (corr_s20_7 hx)
  | .edgeActOrganization hx => .edgeActCorporation (corr_s20_8 hx)
  | .foreignBankBranch hx => .foreignBankBranch (corr_s20_9 hx)
  | .mortgageLender hx => .mortgageLender (corr_s20_10 hx)



axiom corr_s20_deontic {i : Ontology.Institution} {c : ComplaintText} :
    Ontology.FinancialInstitutionCase i c → Deontic.IsFinancialInstitution (odInstitution i) c


theorem s20_ontology_implies_deontic {i : Ontology.Institution} {c : ComplaintText}
    (h : Ontology.FinancialInstitutionCase i c) :
    Deontic.FinancialInstitution20 (odInstitution i) c :=
  corr_s20_deontic h


theorem s20_elements_implies_deontic {i : Elements.Institution} {c : ComplaintText}
    (h : Elements.FinancialInstitution i c) :
    Deontic.FinancialInstitution20 (odInstitution (eoInstitution i)) c :=
  s20_ontology_implies_deontic (s20_elements_implies_ontology h)







axiom corr_s21_character {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.PropertyOfProscribedCharacter pr c →
    Elements.PropertyOfStolenOrCounterfeitCharacter (deProperty pr) c
axiom corr_s21_knowledge {p : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.KnewPropertyOfProscribedCharacter p pr c →
    Elements.DefendantKnewPropertyCharacter p (deProperty pr) c
axiom corr_s21_asToNature
    {officer subject : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.RepresentationAsToNatureOfPropertyMade officer subject pr c →
    Elements.RepresentationAsToNatureOfProperty subject (deProperty pr) c
axiom corr_s21_byOfficer
    {officer subject : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.IsFederalLawEnforcementOfficer officer c →
    Deontic.RepresentationAsToNatureOfPropertyMade officer subject pr c →
    Elements.RepresentationByFederalLawEnforcementOfficer subject (deProperty pr) c
axiom corr_s21_atDirection
    {officer subject : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.ActedAtDirectionOrWithApprovalOfFederalLawEnforcementOfficer officer c →
    Deontic.RepresentationAsToNatureOfPropertyMade officer subject pr c →
    Elements.RepresentationAtDirectionOrApprovalOfFederalOfficer subject (deProperty pr) c
axiom corr_s21_belief {subject : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.BelievedPropertyOfProscribedCharacterAfterRepresentation subject pr c →
    Elements.DefendantBelievedPropertyOfSuchCharacter subject (deProperty pr) c
axiom corr_s21_causation {subject : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.BelievedPropertyOfProscribedCharacterAfterRepresentation subject pr c →
    Elements.BeliefResultedFromOfficialRepresentation subject (deProperty pr) c



theorem s21_deontic_implies_elements
    {officer subject : Person} {pr : Deontic.Property} {o : Deontic.Offense}
    {c : ComplaintText}
    (h : Deontic.Section21ElementsProvenOrSubstituted officer subject pr o c) :
    Elements.StolenOrCounterfeitNatureElement subject (deProperty pr) c :=
  match h with
  | Or.inl hd => .actual ⟨corr_s21_character hd.1, corr_s21_knowledge hd.2⟩
  | Or.inr hs =>
      .byOfficialRepresentation
        ⟨⟨corr_s21_asToNature hs.2.1.2,
          match hs.2.1.1 with
          | Or.inl ho => .byFederalOfficer (corr_s21_byOfficer ho hs.2.1.2)
          | Or.inr ho => .atOfficerDirection (corr_s21_atDirection ho hs.2.1.2)⟩,
         corr_s21_belief hs.2.2,
         corr_s21_causation hs.2.2⟩



axiom corr_s21o_character {pr : Elements.Property} {c : ComplaintText} :
    Elements.PropertyOfStolenOrCounterfeitCharacter pr c →
    Ontology.PropertyOfProscribedCharacter (eoProperty pr) c
axiom corr_s21o_knowledge {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.DefendantKnewPropertyCharacter p pr c →
    Ontology.DefendantKnewProscribedCharacter (eoProperty pr) c
axiom corr_s21o_isOfficial {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.OfficialRepresentation p pr c →
    Ontology.IsOfficialRepresentation (eoRepresentation p pr) c
axiom corr_s21o_concerns {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.OfficialRepresentation p pr c →
    Ontology.RepresentationConcernsProperty (eoRepresentation p pr) (eoProperty pr) c
axiom corr_s21o_belief {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.DefendantBelievedPropertyOfSuchCharacter p pr c →
    Elements.BeliefResultedFromOfficialRepresentation p pr c →
    Ontology.BelievedPropertyOfProscribedCharacter (eoProperty pr) (eoRepresentation p pr) c


theorem s21_elements_implies_ontology
    {p : Person} {pr : Elements.Property} {c : ComplaintText}
    (h : Elements.StolenOrCounterfeitNatureElement p pr c) :
    Ontology.StolenOrCounterfeitNatureElement (eoProperty pr) c :=
  match h with
  | .actual hd => .direct (corr_s21o_character hd.character) (corr_s21o_knowledge hd.knowledge)
  | .byOfficialRepresentation hs =>
      .byOfficialRepresentation (eoRepresentation p pr)
        (corr_s21o_isOfficial hs.representation)
        (corr_s21o_concerns hs.representation)
        (corr_s21o_belief hs.belief hs.causation)


theorem s21_deontic_implies_ontology
    {officer subject : Person} {pr : Deontic.Property} {o : Deontic.Offense}
    {c : ComplaintText}
    (h : Deontic.Section21ElementsProvenOrSubstituted officer subject pr o c) :
    Ontology.StolenOrCounterfeitNatureElement (eoProperty (deProperty pr)) c :=
  s21_elements_implies_ontology (s21_deontic_implies_elements h)









axiom corr_s21p_characterElement
    {o : Deontic.Offense} {pr : Deontic.Property} {el : Procedure.Element}
    {ch : Procedure.Charge} {c : ComplaintText} :
    Deontic.OffenseHasStolenOrCounterfeitCharacterElements o c →
    Procedure.ElementIsStolenOrCounterfeitCharacter el (dpProperty pr) ch c
axiom corr_s21p_knowledgeElement
    {o : Deontic.Offense} {el : Procedure.Element} {ch : Procedure.Charge}
    {c : ComplaintText} :
    Deontic.OffenseHasStolenOrCounterfeitCharacterElements o c →
    Procedure.ElementIsDefendantKnowledgeOfCharacter el ch c
axiom corr_s21p_representation
    {officer subject : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.RepresentationAsToNatureOfPropertyMade officer subject pr c →
    Procedure.OfficialRepresentationAsToNatureOfProperty
      (dpRepresentation pr) (dpProperty pr) c
axiom corr_s21p_byOfficer {officer : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.IsFederalLawEnforcementOfficer officer c →
    Procedure.RepresentationByFederalLawEnforcementOfficer (dpRepresentation pr) c
axiom corr_s21p_atDirection {officer : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.ActedAtDirectionOrWithApprovalOfFederalLawEnforcementOfficer officer c →
    Procedure.RepresentationAtDirectionOrApprovalOfOfficer (dpRepresentation pr) c
axiom corr_s21p_belief {subject : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.BelievedPropertyOfProscribedCharacterAfterRepresentation subject pr c →
    Procedure.DefendantBelievedPropertyOfSuchCharacter subject (dpProperty pr) c
axiom corr_s21p_causation {subject : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.BelievedPropertyOfProscribedCharacterAfterRepresentation subject pr c →
    Procedure.BeliefFollowedFromRepresentation subject (dpRepresentation pr) c



theorem s21_deontic_implies_procedure
    {officer subject : Person} {pr : Deontic.Property} {o : Deontic.Offense}
    {c : ComplaintText} (el : Procedure.Element) (ch : Procedure.Charge)
    (h : Deontic.Permission21aExercised officer subject pr o c) :
    Procedure.Section21ProofRoute subject (dpProperty pr) el (dpRepresentation pr) ch c :=
  { characterElement := corr_s21p_characterElement h.1.condition
    knowledgeElement := corr_s21p_knowledgeElement h.1.condition
    representation   := corr_s21p_representation h.2.1.2
    official         :=
      match h.2.1.1 with
      | Or.inl ho => .byOfficer (corr_s21p_byOfficer ho)
      | Or.inr ho => .atDirection (corr_s21p_atDirection ho)
    belief           := corr_s21p_belief h.2.2
    causedByRep      := corr_s21p_causation h.2.2 }








axiom corr_s21ep_representation {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.OfficialRepresentation p pr c →
    Procedure.OfficialRepresentationAsToNatureOfProperty
      (epRepresentation p pr) (epProperty pr) c
axiom corr_s21ep_byOfficer {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.RepresentationByFederalLawEnforcementOfficer p pr c →
    Procedure.RepresentationByFederalLawEnforcementOfficer (epRepresentation p pr) c
axiom corr_s21ep_atDirection {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.RepresentationAtDirectionOrApprovalOfFederalOfficer p pr c →
    Procedure.RepresentationAtDirectionOrApprovalOfOfficer (epRepresentation p pr) c
axiom corr_s21ep_belief {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.DefendantBelievedPropertyOfSuchCharacter p pr c →
    Procedure.DefendantBelievedPropertyOfSuchCharacter p (epProperty pr) c
axiom corr_s21ep_causation {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.BeliefResultedFromOfficialRepresentation p pr c →
    Procedure.BeliefFollowedFromRepresentation p (epRepresentation p pr) c



theorem s21_elements_implies_procedure_modulo_gaps
    {p : Person} {pr : Elements.Property} {c : ComplaintText}
    (el : Procedure.Element) (ch : Procedure.Charge)
    (h : Elements.Section21RepresentationRoute p pr c)
    (gap_s21_character_element_in_issue :
      Procedure.ElementIsStolenOrCounterfeitCharacter el (epProperty pr) ch c)
    (gap_s21_knowledge_element_in_issue :
      Procedure.ElementIsDefendantKnowledgeOfCharacter el ch c) :
    Procedure.Section21ProofRoute p (epProperty pr) el (epRepresentation p pr) ch c :=
  { characterElement := gap_s21_character_element_in_issue
    knowledgeElement := gap_s21_knowledge_element_in_issue
    representation   := corr_s21ep_representation h.representation
    official         :=
      match h.representation.source with
      | .byFederalOfficer ho => .byOfficer (corr_s21ep_byOfficer ho)
      | .atOfficerDirection ho => .atDirection (corr_s21ep_atDirection ho)
    belief           := corr_s21ep_belief h.belief
    causedByRep      := corr_s21ep_causation h.causation }

axiom corr_s21op_representation
    {r : Ontology.Representation} {pr : Ontology.Property} {c : ComplaintText} :
    Ontology.IsOfficialRepresentation r c →
    Ontology.RepresentationConcernsProperty r pr c →
    Procedure.OfficialRepresentationAsToNatureOfProperty
      (opRepresentation r) (opProperty pr) c
axiom corr_s21op_official {r : Ontology.Representation} {c : ComplaintText} :
    Ontology.IsOfficialRepresentation r c →
    Procedure.RepresentationByFederalLawEnforcementOfficer (opRepresentation r) c
axiom corr_s21op_belief
    {p : Person} {r : Ontology.Representation} {pr : Ontology.Property}
    {c : ComplaintText} :
    Ontology.BelievedPropertyOfProscribedCharacter pr r c →
    Procedure.DefendantBelievedPropertyOfSuchCharacter p (opProperty pr) c
axiom corr_s21op_causation
    {p : Person} {r : Ontology.Representation} {pr : Ontology.Property}
    {c : ComplaintText} :
    Ontology.BelievedPropertyOfProscribedCharacter pr r c →
    Procedure.BeliefFollowedFromRepresentation p (opRepresentation r) c




theorem s21_ontology_implies_procedure_modulo_gaps
    {p : Person} {pr : Ontology.Property} {r : Ontology.Representation}
    {c : ComplaintText} (el : Procedure.Element) (ch : Procedure.Charge)
    (hOfficial : Ontology.IsOfficialRepresentation r c)
    (hConcerns : Ontology.RepresentationConcernsProperty r pr c)
    (hBelief : Ontology.BelievedPropertyOfProscribedCharacter pr r c)
    (gap_s21_character_element_in_issue :
      Procedure.ElementIsStolenOrCounterfeitCharacter el (opProperty pr) ch c)
    (gap_s21_knowledge_element_in_issue :
      Procedure.ElementIsDefendantKnowledgeOfCharacter el ch c) :
    Procedure.Section21ProofRoute p (opProperty pr) el (opRepresentation r) ch c :=
  { characterElement := gap_s21_character_element_in_issue
    knowledgeElement := gap_s21_knowledge_element_in_issue
    representation   := corr_s21op_representation hOfficial hConcerns
    official         := .byOfficer (corr_s21op_official hOfficial)
    belief           := corr_s21op_belief hBelief
    causedByRep      := corr_s21op_causation hBelief }





axiom corr_s23_guam {ct : Ontology.Court} {c : ComplaintText} :
    Ontology.IsDistrictCourtOfGuam ct c → Elements.IsDistrictCourtOfGuam (oeCourt ct) c
axiom corr_s23_nmi {ct : Ontology.Court} {c : ComplaintText} :
    Ontology.IsDistrictCourtForTheNorthernMarianaIslands ct c →
    Elements.IsDistrictCourtForNorthernMarianaIslands (oeCourt ct) c
axiom corr_s23_vi {ct : Ontology.Court} {c : ComplaintText} :
    Ontology.IsDistrictCourtOfTheVirginIslands ct c →
    Elements.IsDistrictCourtOfVirginIslands (oeCourt ct) c



axiom corr_s23_proviso_eo {ct : Ontology.Court} {c : ComplaintText} :
    Elements.OtherwiseExpresslyProvidedInProvision c →
    Ontology.ExpresslyProvidedOtherwise ct c


theorem s23_ontology_implies_elements {ct : Ontology.Court} {c : ComplaintText}
    (h : Ontology.CourtOfTheUnitedStatesMembership ct c) :
    Elements.CourtOfTheUnitedStatesElement (oeCourt ct) c :=
  { notOtherwiseProvided := fun hx => h.notDisplaced (corr_s23_proviso_eo hx)
    isCourt :=
      match h.enumerated with
      | .guam hx => .guam (corr_s23_guam hx)
      | .northernMarianaIslands hx => .northernMarianaIslands (corr_s23_nmi hx)
      | .virginIslands hx => .virginIslands (corr_s23_vi hx) }

axiom corr_s23p_guam {ct : Elements.Court} {c : ComplaintText} :
    Elements.IsDistrictCourtOfGuam ct c →
    Procedure.IsListedTerritorialDistrictCourt (epTribunal ct) c
axiom corr_s23p_nmi {ct : Elements.Court} {c : ComplaintText} :
    Elements.IsDistrictCourtForNorthernMarianaIslands ct c →
    Procedure.IsListedTerritorialDistrictCourt (epTribunal ct) c
axiom corr_s23p_vi {ct : Elements.Court} {c : ComplaintText} :
    Elements.IsDistrictCourtOfVirginIslands ct c →
    Procedure.IsListedTerritorialDistrictCourt (epTribunal ct) c


axiom corr_s23p_ordinary {ct : Elements.Court} {c : ComplaintText} :
    Elements.IsCourtOfTheUnitedStatesApartFromSection23 ct c →
    Procedure.IsOtherCourtOfTheUnitedStates (epTribunal ct) c
axiom corr_s23p_proviso {t : Procedure.Tribunal} {ch : Procedure.Charge} {c : ComplaintText} :
    Procedure.ExpresslyProvidedOtherwise t ch c →
    Elements.OtherwiseExpresslyProvidedInProvision c


theorem s23_elements_implies_procedure {ct : Elements.Court} {c : ComplaintText}
    (ch : Procedure.Charge) (h : Elements.CourtOfTheUnitedStatesElement ct c) :
    Procedure.CourtOfTheUnitedStates (epTribunal ct) ch c :=
  { within :=
      match h.isCourt with
      | .guam hx => .listedTerritorial (corr_s23p_guam hx)
      | .northernMarianaIslands hx => .listedTerritorial (corr_s23p_nmi hx)
      | .virginIslands hx => .listedTerritorial (corr_s23p_vi hx)
      | .apartFromSection23 hx => .ordinarySense (corr_s23p_ordinary hx)
    noContraryProvision := fun hx => h.notOtherwiseProvided (corr_s23p_proviso hx) }

axiom corr_s23d_member {t : Procedure.Tribunal} {ch : Procedure.Charge} {c : ComplaintText} :
    Procedure.CourtWithinSection23 t c → Deontic.IsCourtOfTheUnitedStates (pdCourt t) c
axiom corr_s23d_proviso {t : Procedure.Tribunal} {ch : Procedure.Charge} {c : ComplaintText} :
    Deontic.ExpresslyProvidedOtherwise c → Procedure.ExpresslyProvidedOtherwise t ch c


theorem s23_procedure_implies_deontic
    {t : Procedure.Tribunal} {ch : Procedure.Charge} {c : ComplaintText}
    (h : Procedure.CourtOfTheUnitedStates t ch c) :
    Deontic.CourtOfTheUnitedStates23 (pdCourt t) c :=
  ⟨corr_s23d_member (ch := ch) h.within,
   fun hx => h.noContraryProvision (corr_s23d_proviso (t := t) (ch := ch) hx)⟩


theorem s23_ontology_implies_procedure {ct : Ontology.Court} {c : ComplaintText}
    (ch : Procedure.Charge) (h : Ontology.CourtOfTheUnitedStatesMembership ct c) :
    Procedure.CourtOfTheUnitedStates (epTribunal (oeCourt ct)) ch c :=
  s23_elements_implies_procedure ch (s23_ontology_implies_elements h)


theorem s23_elements_implies_deontic {ct : Elements.Court} {c : ComplaintText}
    (ch : Procedure.Charge) (h : Elements.CourtOfTheUnitedStatesElement ct c) :
    Deontic.CourtOfTheUnitedStates23 (pdCourt (epTribunal ct)) c :=
  s23_procedure_implies_deontic (s23_elements_implies_procedure ch h)


theorem s23_ontology_implies_deontic {ct : Ontology.Court} {c : ComplaintText}
    (ch : Procedure.Charge) (h : Ontology.CourtOfTheUnitedStatesMembership ct c) :
    Deontic.CourtOfTheUnitedStates23 (pdCourt (epTribunal (oeCourt ct))) c :=
  s23_elements_implies_deontic ch (s23_ontology_implies_elements h)





axiom corr_s24_voc {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsViolationOrCriminalConspiracyToViolate o c →
    Deontic.ViolationOrConspiracyToViolate p (edOffense o) c
axiom corr_s24_core {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsEnumeratedCoreHealthCareProvision o c →
    Deontic.ViolationOfEnumeratedCoreHealthCareStatute (edOffense o) c
axiom corr_s24_general {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsEnumeratedGeneralFraudProvision o c →
    Deontic.ViolationOfEnumeratedGeneralFraudStatute (edOffense o) c



axiom corr_s24_program {hp : Elements.HealthProgram} {c : ComplaintText} :
    Elements.HealthCareBenefitProgram hp c →
    Deontic.IsHealthCareBenefitProgram (edProgram hp) c
axiom corr_s24_relates
    {o : Elements.Offense} {hp : Elements.HealthProgram} {c : ComplaintText} :
    Elements.RelatesToHealthCareBenefitProgram o c →
    Deontic.RelatesToHealthCareBenefitProgram (edOffense o) (edProgram hp) c


theorem s24_elements_implies_deontic
    {p : Person} {o : Elements.Offense} {hp : Elements.HealthProgram} {c : ComplaintText}
    (h : Elements.FederalHealthCareOffense o c)
    (hProgram : Elements.HealthCareBenefitProgram hp c) :
    Deontic.FederalHealthCareOffense24 p (edOffense o) (edProgram hp) c :=
  match h with
  | .core hc =>
      Or.inl ⟨corr_s24_voc hc.violationOrConspiracy, corr_s24_core hc.enumerated⟩
  | .relatedToProgram hr =>
      Or.inr ⟨corr_s24_voc hr.violationOrConspiracy,
              corr_s24_general hr.enumerated,
              corr_s24_program hProgram,
              corr_s24_relates hr.relatedness⟩

axiom corr_s24o_core {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolationOfEnumeratedCoreHealthCareStatute o c →
    Ontology.ViolatesEnumeratedHealthCareStatute (doOffense o) c
axiom corr_s24o_general {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolationOfEnumeratedGeneralFraudStatute o c →
    Ontology.ViolatesEnumeratedGeneralFraudStatute (doOffense o) c
axiom corr_s24o_program {hp : Deontic.HealthCareBenefitProgram} {c : ComplaintText} :
    Deontic.IsHealthCareBenefitProgram hp c →
    Ontology.IsHealthCareBenefitProgram (doProgram hp) c
axiom corr_s24o_relates
    {o : Deontic.Offense} {hp : Deontic.HealthCareBenefitProgram} {c : ComplaintText} :
    Deontic.RelatesToHealthCareBenefitProgram o hp c →
    Ontology.RelatesToHealthCareBenefitProgram (doOffense o) (doProgram hp) c
axiom corr_s24o_memberCore {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolationOfEnumeratedCoreHealthCareStatute o c →
    Ontology.IsFederalHealthCareOffense (doOffense o) c
axiom corr_s24o_memberGeneral
    {o : Deontic.Offense} {hp : Deontic.HealthCareBenefitProgram} {c : ComplaintText} :
    Deontic.ViolationOfEnumeratedGeneralFraudStatute o c →
    Deontic.RelatesToHealthCareBenefitProgram o hp c →
    Ontology.IsFederalHealthCareOffense (doOffense o) c


theorem s24_deontic_implies_ontology
    {p : Person} {o : Deontic.Offense} {hp : Deontic.HealthCareBenefitProgram}
    {c : ComplaintText}
    (h : Deontic.FederalHealthCareOffense24 p o hp c) :
    Ontology.FederalHealthCareOffenseMembership (doOffense o) (doProgram hp) c :=
  match h with
  | Or.inl hc =>
      { enumerated := .enumeratedHealthCareStatute (corr_s24o_core hc.2)
        member := corr_s24o_memberCore hc.2 }
  | Or.inr hg =>
      { enumerated :=
          .generalStatuteRelatedToProgram (corr_s24o_general hg.2.1)
            (corr_s24o_program hg.2.2.1) (corr_s24o_relates hg.2.2.2)
        member := corr_s24o_memberGeneral hg.2.1 hg.2.2.2 }

axiom corr_s24p_core {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.ViolatesEnumeratedHealthCareStatute o c →
    Procedure.ViolationOfEnumeratedHealthCareStatute (opChargeOfOffense o) c
axiom corr_s24p_general {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.ViolatesEnumeratedGeneralFraudStatute o c →
    Procedure.ViolationOfEnumeratedGeneralFraudStatute (opChargeOfOffense o) c
axiom corr_s24p_relates
    {o : Ontology.Offense} {b : Ontology.BenefitProgram} {c : ComplaintText} :
    Ontology.RelatesToHealthCareBenefitProgram o b c →
    Procedure.RelatesToHealthCareBenefitProgram (opChargeOfOffense o) c



axiom corr_s24p_member {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.IsFederalHealthCareOffense o c →
    Procedure.ChargedStatuteWithinSection24 (opChargeOfOffense o) c
axiom corr_s24p_conspiracy {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.IsCriminalConspiracyToViolate o c →
    Procedure.IsCriminalConspiracyToViolate (opChargeOfOffense o) c


theorem s24_ontology_implies_procedure
    {o : Ontology.Offense} {b : Ontology.BenefitProgram} {c : ComplaintText}
    (h : Ontology.FederalHealthCareOffenseMembership o b c) :
    Procedure.FederalHealthCareOffense (opChargeOfOffense o) c :=
  match h.enumerated with
  | .enumeratedHealthCareStatute hx => .directViolation (Or.inl (corr_s24p_core hx))
  | .generalStatuteRelatedToProgram hg _ hr =>
      .directViolation (Or.inr ⟨corr_s24p_general hg, corr_s24p_relates hr⟩)
  | .criminalConspiracy hx =>
      .conspiracy (corr_s24p_member h.member) (corr_s24p_conspiracy hx)


theorem s24_elements_implies_ontology
    {p : Person} {o : Elements.Offense} {hp : Elements.HealthProgram} {c : ComplaintText}
    (h : Elements.FederalHealthCareOffense o c)
    (hProgram : Elements.HealthCareBenefitProgram hp c) :
    Ontology.FederalHealthCareOffenseMembership
      (doOffense (edOffense o)) (doProgram (edProgram hp)) c :=
  s24_deontic_implies_ontology (s24_elements_implies_deontic (p := p) h hProgram)


theorem s24_elements_implies_procedure
    {p : Person} {o : Elements.Offense} {hp : Elements.HealthProgram} {c : ComplaintText}
    (h : Elements.FederalHealthCareOffense o c)
    (hProgram : Elements.HealthCareBenefitProgram hp c) :
    Procedure.FederalHealthCareOffense (opChargeOfOffense (doOffense (edOffense o))) c :=
  s24_ontology_implies_procedure (s24_elements_implies_ontology (p := p) h hProgram)


theorem s24_deontic_implies_procedure
    {p : Person} {o : Deontic.Offense} {hp : Deontic.HealthCareBenefitProgram}
    {c : ComplaintText}
    (h : Deontic.FederalHealthCareOffense24 p o hp c) :
    Procedure.FederalHealthCareOffense (opChargeOfOffense (doOffense o)) c :=
  s24_ontology_implies_procedure (s24_deontic_implies_ontology h)







axiom corr_1028_addressee
    {p : Person} {d : Elements.IdDocument} {af : Elements.AuthFeature}
    {impl : Elements.DocMakingImplement} {m : Elements.MeansOfIdentification}
    {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1028Offense p d af impl m act c → Deontic.AddresseeWhoever1028 p c

axiom corr_1028_act1 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1028a1 p act c → Deontic.Act1028a1 p c
axiom corr_1028_act2 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1028a2 p act c → Deontic.Act1028a2 p c
axiom corr_1028_act3 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1028a3 p act c → Deontic.Act1028a3 p c
axiom corr_1028_act4 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1028a4 p act c → Deontic.Act1028a4 p c
axiom corr_1028_act5 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1028a5 p act c → Deontic.Act1028a5 p c
axiom corr_1028_act6
    {p : Person} {d : Elements.IdDocument} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1028a6 p d act c → Deontic.Act1028a6 p c
axiom corr_1028_act7
    {p : Person} {m : Elements.MeansOfIdentification} {act : Elements.Conduct}
    {c : ComplaintText} :
    Elements.Section1028a7 p m act c → Deontic.Act1028a7 p c
axiom corr_1028_act8
    {p : Person} {af : Elements.AuthFeature} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1028a8 p af act c → Deontic.Act1028a8 p c

axiom corr_1028c_doc {d : Elements.IdDocument} {c : ComplaintText} :
    Elements.DocumentIsOrAppearsUnitedStatesOrSpecialEventIssued d c →
    ∃ it : Deontic.IdentificationItem,
      Deontic.ItemIsOrAppearsIssuedByUnitedStatesOrSponsoringEntity it c
axiom corr_1028c_impl {impl : Elements.DocMakingImplement} {c : ComplaintText} :
    Elements.ImplementDesignedOrSuitedForSuchDocument impl c →
    ∃ im : Deontic.DocumentMakingImplement,
      Deontic.ImplementDesignedOrSuitedForMakingSuchDocument im c
axiom corr_1028c_a4 {p : Person} {c : ComplaintText} :
    Elements.OffenseChargedUnderSubsectionA4 c → Deontic.Act1028a4 p c
axiom corr_commerce_ed {act : Elements.Conduct} {c : ComplaintText} :
    Elements.AffectsInterstateOrForeignCommerce act c →
    Deontic.AffectsInterstateOrForeignCommerce c
axiom corr_1028c_mail {act : Elements.Conduct} {c : ComplaintText} :
    Elements.TransportedInTheMailDuringConduct act c →
    Deontic.TransportedInTheMailInCourseOfProhibitedConduct c



axiom corr_exempt_de {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Deontic.LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c →
    Elements.LawfullyAuthorizedInvestigativeActivity act c

private theorem s1028_act
    {p : Person} {d : Elements.IdDocument} {af : Elements.AuthFeature}
    {impl : Elements.DocMakingImplement} {m : Elements.MeansOfIdentification}
    {act : Elements.Conduct} {c : ComplaintText}
    (h : Elements.Section1028Theory p d af impl m act c) :
    Deontic.ProhibitedAct1028a p c :=
  match h with
  | .produce hx => Or.inl (corr_1028_act1 hx)
  | .transfer hx => Or.inr (Or.inl (corr_1028_act2 hx))
  | .possessFiveOrMore hx => Or.inr (Or.inr (Or.inl (corr_1028_act3 hx)))
  | .possessToDefraudUnitedStates hx => Or.inr (Or.inr (Or.inr (Or.inl (corr_1028_act4 hx))))
  | .implementOrFeature hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (corr_1028_act5 hx)))))
  | .possessFederalDocument hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (corr_1028_act6 hx))))))
  | .meansOfIdentification hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (corr_1028_act7 hx)))))))
  | .traffickingFeatures hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (corr_1028_act8 hx)))))))

private theorem s1028_circ
    {p : Person} {d : Elements.IdDocument} {impl : Elements.DocMakingImplement}
    {act : Elements.Conduct} {c : ComplaintText}
    (h : Elements.Section1028Circumstance d impl act c) :
    Deontic.Circumstance1028c p c :=
  match h with
  | .federalOrSpecialEventDocument hx => Or.inl (corr_1028c_doc hx)
  | .implementSuited hx => Or.inr (Or.inl (corr_1028c_impl hx))
  | .subsectionA4Offense hx => Or.inr (Or.inr (Or.inl (corr_1028c_a4 hx)))
  | .affectsCommerce hx => Or.inr (Or.inr (Or.inr (Or.inl (corr_commerce_ed hx))))
  | .mailTransport hx => Or.inr (Or.inr (Or.inr (Or.inr (corr_1028c_mail hx))))



theorem s1028_elements_implies_deontic
    {p : Person} {d : Elements.IdDocument} {af : Elements.AuthFeature}
    {impl : Elements.DocMakingImplement} {m : Elements.MeansOfIdentification}
    {act : Elements.Conduct} {c : ComplaintText}
    (h : Elements.Section1028Offense p d af impl m act c) :
    Deontic.Prohibition1028aViolated p c :=
  ⟨⟨corr_1028_addressee h, s1028_circ h.circumstance⟩,
   s1028_act h.theory,
   fun hx => h.notExemptActivity (corr_exempt_de hx)⟩



axiom corr_1028p_act1 {p : Person} {c : ComplaintText} :
    Deontic.Act1028a1 p c →
    Procedure.OffenseUnderIdentificationParagraph .p1 p (chargeOf p c) c
axiom corr_1028p_act2 {p : Person} {c : ComplaintText} :
    Deontic.Act1028a2 p c →
    Procedure.OffenseUnderIdentificationParagraph .p2 p (chargeOf p c) c
axiom corr_1028p_act3 {p : Person} {c : ComplaintText} :
    Deontic.Act1028a3 p c →
    Procedure.OffenseUnderIdentificationParagraph .p3 p (chargeOf p c) c
axiom corr_1028p_act4 {p : Person} {c : ComplaintText} :
    Deontic.Act1028a4 p c →
    Procedure.OffenseUnderIdentificationParagraph .p4 p (chargeOf p c) c
axiom corr_1028p_act5 {p : Person} {c : ComplaintText} :
    Deontic.Act1028a5 p c →
    Procedure.OffenseUnderIdentificationParagraph .p5 p (chargeOf p c) c
axiom corr_1028p_act6 {p : Person} {c : ComplaintText} :
    Deontic.Act1028a6 p c →
    Procedure.OffenseUnderIdentificationParagraph .p6 p (chargeOf p c) c
axiom corr_1028p_act7 {p : Person} {c : ComplaintText} :
    Deontic.Act1028a7 p c →
    Procedure.OffenseUnderIdentificationParagraph .p7 p (chargeOf p c) c
axiom corr_1028p_act8 {p : Person} {c : ComplaintText} :
    Deontic.Act1028a8 p c →
    Procedure.OffenseUnderIdentificationParagraph .p8 p (chargeOf p c) c

axiom corr_1028pc_doc {it : Deontic.IdentificationItem} {ch : Procedure.Charge}
    {c : ComplaintText} :
    Deontic.ItemIsOrAppearsIssuedByUnitedStatesOrSponsoringEntity it c →
    Procedure.DocumentAppearsIssuedByUnitedStatesOrSponsoringEntity (documentOfCharge ch) c
axiom corr_1028pc_impl {im : Deontic.DocumentMakingImplement} {ch : Procedure.Charge}
    {c : ComplaintText} :
    Deontic.ImplementDesignedOrSuitedForMakingSuchDocument im c →
    Procedure.ImplementSuitedForMakingUnitedStatesDocument (implementOfCharge ch) c
axiom corr_commerce_dp {p : Person} {c : ComplaintText} :
    Deontic.AffectsInterstateOrForeignCommerce c →
    Procedure.AffectsInterstateOrForeignCommerce (chargeOf p c) c
axiom corr_1028pc_mail {p : Person} {c : ComplaintText} :
    Deontic.TransportedInTheMailInCourseOfProhibitedConduct c →
    Procedure.ItemTransportedInTheMail (chargeOf p c) c
axiom corr_exempt_pd {p : Person} {c : ComplaintText} :
    Procedure.LawfullyAuthorizedInvestigativeOrProtectiveActivity (chargeOf p c) c →
    Deontic.LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c

private theorem s1028p_conduct {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitedAct1028a p c) :
    ∃ pgh : Procedure.Paragraph1028a,
      Procedure.OffenseUnderIdentificationParagraph pgh p (chargeOf p c) c :=
  match h with
  | Or.inl hx => ⟨.p1, corr_1028p_act1 hx⟩
  | Or.inr (Or.inl hx) => ⟨.p2, corr_1028p_act2 hx⟩
  | Or.inr (Or.inr (Or.inl hx)) => ⟨.p3, corr_1028p_act3 hx⟩
  | Or.inr (Or.inr (Or.inr (Or.inl hx))) => ⟨.p4, corr_1028p_act4 hx⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hx)))) => ⟨.p5, corr_1028p_act5 hx⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hx))))) => ⟨.p6, corr_1028p_act6 hx⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hx)))))) =>
      ⟨.p7, corr_1028p_act7 hx⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr hx)))))) =>
      ⟨.p8, corr_1028p_act8 hx⟩














theorem s1028_deontic_implies_procedure_modulo_gaps {p : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1028aViolated p c)
    (gap_1028e_chapter224 : ¬ Procedure.ActivityAuthorizedUnderChapter224 (chargeOf p c) c) :
    ∃ pgh : Procedure.Paragraph1028a,
      Procedure.Section1028Offense pgh p (chargeOf p c)
        (documentOfCharge (chargeOf p c)) (implementOfCharge (chargeOf p c)) c :=
  have notExempt : ¬ Procedure.Section1028Exempt (chargeOf p c) c :=
    fun he =>
      match he with
      | Or.inl h1 => h.2.2 (corr_exempt_pd h1)
      | Or.inr h2 => gap_1028e_chapter224 h2
  have uniform :
      (∀ pgh : Procedure.Paragraph1028a,
        Procedure.Section1028Circumstance pgh (chargeOf p c)
          (documentOfCharge (chargeOf p c)) (implementOfCharge (chargeOf p c)) c) →
      ∃ pgh : Procedure.Paragraph1028a,
        Procedure.Section1028Offense pgh p (chargeOf p c)
          (documentOfCharge (chargeOf p c)) (implementOfCharge (chargeOf p c)) c :=
    fun hc =>
      match s1028p_conduct h.2.1 with
      | ⟨pgh, hcond⟩ => ⟨pgh, ⟨hcond, hc pgh, notExempt⟩⟩
  match h.1.condition with
  | Or.inl hit =>
      uniform (fun _ =>
        match hit with
        | ⟨_, hx⟩ => .unitedStatesDocument (corr_1028pc_doc (ch := chargeOf p c) hx))
  | Or.inr (Or.inl him) =>
      uniform (fun _ =>
        match him with
        | ⟨_, hx⟩ => .implementSuited (corr_1028pc_impl (ch := chargeOf p c) hx))
  | Or.inr (Or.inr (Or.inl ha4)) =>
      ⟨.p4, ⟨corr_1028p_act4 ha4, .defraudUnitedStates rfl, notExempt⟩⟩
  | Or.inr (Or.inr (Or.inr (Or.inl hcom))) =>
      uniform (fun _ => .commerce (Or.inr (corr_commerce_dp hcom)))
  | Or.inr (Or.inr (Or.inr (Or.inr hmail))) =>
      uniform (fun _ => .mailed (corr_1028pc_mail hmail))


theorem s1028_elements_implies_procedure_modulo_gaps
    {p : Person} {d : Elements.IdDocument} {af : Elements.AuthFeature}
    {impl : Elements.DocMakingImplement} {m : Elements.MeansOfIdentification}
    {act : Elements.Conduct} {c : ComplaintText}
    (h : Elements.Section1028Offense p d af impl m act c)
    (gap_1028e_chapter224 : ¬ Procedure.ActivityAuthorizedUnderChapter224 (chargeOf p c) c) :
    ∃ pgh : Procedure.Paragraph1028a,
      Procedure.Section1028Offense pgh p (chargeOf p c)
        (documentOfCharge (chargeOf p c)) (implementOfCharge (chargeOf p c)) c :=
  s1028_deontic_implies_procedure_modulo_gaps
    (s1028_elements_implies_deontic h) gap_1028e_chapter224





axiom corr_1029_addressee
    {p : Person} {dme : Elements.DeviceMakingEquipment} {ti : Elements.TelecomInstrument}
    {sr : Elements.ScanningReceiver} {hw : Elements.TelecomConfigurable}
    {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1029Offense p dme ti sr hw act c → Deontic.AddresseeWhoever1029 p c

axiom corr_1029_act1 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1029a1 p act c → Deontic.Act1029a1 p c
axiom corr_1029_act2 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1029a2 p act c → Deontic.Act1029a2 p c
axiom corr_1029_act3 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1029a3 p act c → Deontic.Act1029a3 p c
axiom corr_1029_act4
    {p : Person} {dme : Elements.DeviceMakingEquipment} {act : Elements.Conduct}
    {c : ComplaintText} :
    Elements.Section1029a4 p dme act c → Deontic.Act1029a4 p c
axiom corr_1029_act5 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1029a5 p act c → Deontic.Act1029a5 p c
axiom corr_1029_act6 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1029a6 p act c → Deontic.Act1029a6 p c
axiom corr_1029_act7
    {p : Person} {ti : Elements.TelecomInstrument} {act : Elements.Conduct}
    {c : ComplaintText} :
    Elements.Section1029a7 p ti act c → Deontic.Act1029a7 p c
axiom corr_1029_act8
    {p : Person} {sr : Elements.ScanningReceiver} {act : Elements.Conduct}
    {c : ComplaintText} :
    Elements.Section1029a8 p sr act c → Deontic.Act1029a8 p c
axiom corr_1029_act9
    {p : Person} {hw : Elements.TelecomConfigurable} {act : Elements.Conduct}
    {c : ComplaintText} :
    Elements.Section1029a9 p hw act c → Deontic.Act1029a9 p c
axiom corr_1029_act10 {p : Person} {act : Elements.Conduct} {c : ComplaintText} :
    Elements.Section1029a10 p act c → Deontic.Act1029a10 p c

private theorem s1029_act
    {p : Person} {dme : Elements.DeviceMakingEquipment} {ti : Elements.TelecomInstrument}
    {sr : Elements.ScanningReceiver} {hw : Elements.TelecomConfigurable}
    {act : Elements.Conduct} {c : ComplaintText}
    (h : Elements.Section1029Theory p dme ti sr hw act c) :
    Deontic.ProhibitedAct1029a p c :=
  match h with
  | .counterfeitDevices hx => Or.inl (corr_1029_act1 hx)
  | .unauthorizedDevices hx => Or.inr (Or.inl (corr_1029_act2 hx))
  | .possessFifteenOrMore hx => Or.inr (Or.inr (Or.inl (corr_1029_act3 hx)))
  | .deviceMakingEquipment hx => Or.inr (Or.inr (Or.inr (Or.inl (corr_1029_act4 hx))))
  | .transactionsWithAnothersDevices hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (corr_1029_act5 hx)))))
  | .solicitation hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (corr_1029_act6 hx))))))
  | .telecomInstrument hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (corr_1029_act7 hx)))))))
  | .scanningReceiver hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
        (corr_1029_act8 hx))))))))
  | .telecomHardwareOrSoftware hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
        (corr_1029_act9 hx)))))))))
  | .presentmentOfRecords hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
        (corr_1029_act10 hx)))))))))



theorem s1029_elements_implies_deontic
    {p : Person} {dme : Elements.DeviceMakingEquipment} {ti : Elements.TelecomInstrument}
    {sr : Elements.ScanningReceiver} {hw : Elements.TelecomConfigurable}
    {act : Elements.Conduct} {c : ComplaintText}
    (h : Elements.Section1029Offense p dme ti sr hw act c) :
    Deontic.Prohibition1029aViolated p c :=
  ⟨⟨corr_1029_addressee h, corr_commerce_ed h.commerce⟩,
   s1029_act h.theory,
   fun hx => h.notExemptActivity (corr_exempt_de hx)⟩



axiom corr_1029p_act1 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a1 p c → Procedure.OffenseUnderAccessDeviceParagraph .p1 p (chargeOf p c) c
axiom corr_1029p_act2 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a2 p c → Procedure.OffenseUnderAccessDeviceParagraph .p2 p (chargeOf p c) c
axiom corr_1029p_act3 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a3 p c → Procedure.OffenseUnderAccessDeviceParagraph .p3 p (chargeOf p c) c
axiom corr_1029p_act4 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a4 p c → Procedure.OffenseUnderAccessDeviceParagraph .p4 p (chargeOf p c) c
axiom corr_1029p_act5 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a5 p c → Procedure.OffenseUnderAccessDeviceParagraph .p5 p (chargeOf p c) c
axiom corr_1029p_act6 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a6 p c → Procedure.OffenseUnderAccessDeviceParagraph .p6 p (chargeOf p c) c
axiom corr_1029p_act7 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a7 p c → Procedure.OffenseUnderAccessDeviceParagraph .p7 p (chargeOf p c) c
axiom corr_1029p_act8 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a8 p c → Procedure.OffenseUnderAccessDeviceParagraph .p8 p (chargeOf p c) c
axiom corr_1029p_act9 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a9 p c → Procedure.OffenseUnderAccessDeviceParagraph .p9 p (chargeOf p c) c
axiom corr_1029p_act10 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a10 p c → Procedure.OffenseUnderAccessDeviceParagraph .p10 p (chargeOf p c) c





axiom corr_1029p_thr2 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a2 p c → Procedure.Paragraph1029Threshold .p2 (chargeOf p c) c
axiom corr_1029p_thr3 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a3 p c → Procedure.Paragraph1029Threshold .p3 (chargeOf p c) c
axiom corr_1029p_thr5 {p : Person} {c : ComplaintText} :
    Deontic.Act1029a5 p c → Procedure.Paragraph1029Threshold .p5 (chargeOf p c) c

axiom corr_exempt1029_pd {p : Person} {c : ComplaintText} :
    Procedure.LawfullyAuthorizedInvestigativeOrProtectiveActivity (chargeOf p c) c →
    Deontic.LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c













theorem s1029_deontic_implies_procedure_modulo_gaps {p : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1029aViolated p c)
    (gap_1029f_chapter224 : ¬ Procedure.ActivityAuthorizedUnderChapter224 (chargeOf p c) c)
    (gap_1029g1_carrier_carveout :
      ¬ Procedure.CarrierProtectiveCarveOut1029 .p9 p (chargeOf p c) c) :
    ∃ pgh : Procedure.Paragraph1029a,
      Procedure.Section1029Offense pgh p (chargeOf p c) c :=
  have notExempt : ¬ Procedure.Section1029Exempt (chargeOf p c) c :=
    fun he =>
      match he with
      | Or.inl h1 => h.2.2 (corr_exempt1029_pd h1)
      | Or.inr h2 => gap_1029f_chapter224 h2
  have commerce : Procedure.AffectsInterstateOrForeignCommerce (chargeOf p c) c :=
    corr_commerce_dp h.1.condition
  match h.2.1 with
  | Or.inl hx =>
      ⟨.p1, ⟨corr_1029p_act1 hx, True.intro, commerce, notExempt,
             fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩
  | Or.inr (Or.inl hx) =>
      ⟨.p2, ⟨corr_1029p_act2 hx, corr_1029p_thr2 hx, commerce, notExempt,
             fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩
  | Or.inr (Or.inr (Or.inl hx)) =>
      ⟨.p3, ⟨corr_1029p_act3 hx, corr_1029p_thr3 hx, commerce, notExempt,
             fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩
  | Or.inr (Or.inr (Or.inr (Or.inl hx))) =>
      ⟨.p4, ⟨corr_1029p_act4 hx, True.intro, commerce, notExempt,
             fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hx)))) =>
      ⟨.p5, ⟨corr_1029p_act5 hx, corr_1029p_thr5 hx, commerce, notExempt,
             fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hx))))) =>
      ⟨.p6, ⟨corr_1029p_act6 hx, True.intro, commerce, notExempt,
             fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hx)))))) =>
      ⟨.p7, ⟨corr_1029p_act7 hx, True.intro, commerce, notExempt,
             fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hx))))))) =>
      ⟨.p8, ⟨corr_1029p_act8 hx, True.intro, commerce, notExempt,
             fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hx)))))))) =>
      ⟨.p9, ⟨corr_1029p_act9 hx, True.intro, commerce, notExempt,
             gap_1029g1_carrier_carveout⟩⟩
  | Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr hx)))))))) =>
      ⟨.p10, ⟨corr_1029p_act10 hx, True.intro, commerce, notExempt,
              fun hc => Procedure.Paragraph1029a.noConfusion hc.1⟩⟩


theorem s1029_elements_implies_procedure_modulo_gaps
    {p : Person} {dme : Elements.DeviceMakingEquipment} {ti : Elements.TelecomInstrument}
    {sr : Elements.ScanningReceiver} {hw : Elements.TelecomConfigurable}
    {act : Elements.Conduct} {c : ComplaintText}
    (h : Elements.Section1029Offense p dme ti sr hw act c)
    (gap_1029f_chapter224 : ¬ Procedure.ActivityAuthorizedUnderChapter224 (chargeOf p c) c)
    (gap_1029g1_carrier_carveout :
      ¬ Procedure.CarrierProtectiveCarveOut1029 .p9 p (chargeOf p c) c) :
    ∃ pgh : Procedure.Paragraph1029a,
      Procedure.Section1029Offense pgh p (chargeOf p c) c :=
  s1029_deontic_implies_procedure_modulo_gaps
    (s1029_elements_implies_deontic h) gap_1029f_chapter224 gap_1029g1_carrier_carveout

end Proving.USC.T18.Ch1Ch47.Recert.Bridge
