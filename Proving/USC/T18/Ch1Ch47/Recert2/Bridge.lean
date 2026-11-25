






















import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Statute
import Proving.USC.T18.Ch1Ch47.Recert2.Deontic.Statute
import Proving.USC.T18.Ch1Ch47.Recert2.Ontology.Statute
import Proving.USC.T18.Ch1Ch47.Recert2.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.Bridge

open Proving.USC.Common







axiom locusEO : Elements.Locus → Ontology.Locus
axiom locusEP : Elements.Locus → Procedure.OffenseLocus
axiom locusED : Elements.Locus → Deontic.Locus
axiom locusPO : Procedure.OffenseLocus → Ontology.Locus

axiom offenceEO : Elements.Offense → Ontology.Offense
axiom offenceEP : Elements.Offense → Procedure.Offense
axiom offenceED : Elements.Offense → Deontic.OffenseInstance
axiom offencePO : Procedure.Offense → Ontology.Offense
axiom offenceDO : Deontic.OffenseInstance → Ontology.Offense
axiom offenceDP : Deontic.OffenseInstance → Procedure.Offense

axiom instED : Elements.Institution → Deontic.Institution
axiom instEC : Elements.Institution → Entity

axiom propEO : Elements.Property → Ontology.PropertyItem
axiom propEP : Elements.Property → Procedure.Property
axiom propED : Elements.Property → Deontic.Property
axiom propDO : Deontic.Property → Ontology.PropertyItem
axiom propDP : Deontic.Property → Procedure.Property
axiom propPO : Procedure.Property → Ontology.PropertyItem
axiom propPE : Procedure.Property → Elements.Property

axiom programEO : Elements.HealthCareProgram → Ontology.BenefitProgram
axiom offencePD : Procedure.Offense → Deontic.OffenseInstance

axiom courtEO : Elements.Tribunal → Ontology.Court
axiom courtEP : Elements.Tribunal → Procedure.Court
axiom courtED : Elements.Tribunal → Deontic.Court
axiom courtPD : Procedure.Court → Deontic.Court
axiom courtPO : Procedure.Court → Ontology.Court

axiom docED : Elements.Document → Deontic.IdentificationObject
axiom deviceED : Elements.AccessDevice → Deontic.AccessDevice
axiom equipED : Elements.Equipment → Deontic.AccessDevice












axiom nationalOfE : Elements.Offense → Person
axiom nationalOfP : Procedure.Offense → Person
axiom programOfE : Elements.Offense → Ontology.BenefitProgram
axiom programOfP : Procedure.Offense → Ontology.BenefitProgram
axiom programOfD : Deontic.OffenseInstance → Ontology.BenefitProgram







axiom reprOfE : Person → Elements.Property → Ontology.Representation
axiom reprOfEP : Person → Elements.Property → Procedure.OfficialRepresentation
axiom reprOfD : Person → Deontic.Property → Ontology.Representation
axiom reprDP : Person → Deontic.Property → Procedure.OfficialRepresentation
axiom reprPO : Procedure.OfficialRepresentation → Ontology.Representation












axiom OffenderOfE (p : Person) (o : Elements.Offense) (c : ComplaintText) : Prop



axiom Section1028ChargeE
    (p : Person) (d : Elements.Document) (m : Elements.MeansOfIdentification)
    (o : Elements.Offense) (c : ComplaintText) : Prop


axiom Section1029ChargeE
    (p : Person) (ad : Elements.AccessDevice) (eq : Elements.Equipment)
    (o : Elements.Offense) (c : ComplaintText) : Prop


axiom Section1028ChargeD
    (p : Person) (d : Deontic.IdentificationObject) (o : Deontic.OffenseInstance)
    (c : ComplaintText) : Prop


axiom Section1029ChargeD
    (p : Person) (dv : Deontic.AccessDevice) (o : Deontic.OffenseInstance)
    (c : ComplaintText) : Prop











namespace S7

axiom corr_EO_highSeas {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsHighSeas l c → Ontology.IsHighSeasOrUsAdmiraltyWatersOrUsVessel (locusEO l) c
axiom corr_EO_waters {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Waters l c → Ontology.IsHighSeasOrUsAdmiraltyWatersOrUsVessel (locusEO l) c
axiom corr_EO_vessel {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Vessel l c → Ontology.IsHighSeasOrUsAdmiraltyWatersOrUsVessel (locusEO l) c
axiom corr_EO_greatLakes {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph2 l c → Ontology.IsGreatLakesUsRegisteredVessel (locusEO l) c
axiom corr_EO_reserved {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7ReservedLand l c → Ontology.IsUsReservedOrAcquiredLands (locusEO l) c
axiom corr_EO_purchased {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsPlacePurchasedWithStateConsentForNeedfulBuilding l c →
    Ontology.IsUsReservedOrAcquiredLands (locusEO l) c
axiom corr_EO_guano {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph4 l c → Ontology.IsGuanoIslandAppertainingToUnitedStates (locusEO l) c
axiom corr_EO_aircraft {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph5 l c → Ontology.IsUsAircraftInFlightOverAdmiraltyWaters (locusEO l) c
axiom corr_EO_space {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph6 l c → Ontology.IsUsRegisteredSpaceVehicleInFlight (locusEO l) c
axiom corr_EO_outside {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsPlaceOutsideJurisdictionOfAnyNation l c →
    Ontology.IsPlaceOutsideJurisdictionOfAnyNation (locusEO l) c
axiom corr_EO_foreignVessel {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsForeignVesselOnVoyageScheduledToOrFromUnitedStates l c →
    Ontology.IsForeignVesselOnScheduledUsVoyage (locusEO l) c
axiom corr_EO_mission {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7MissionPlace l c →
    Ontology.IsUsMissionPremisesOrResidenceInForeignState (locusEO l) c




axiom corr_EO_nationalIs {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsOffenseByOrAgainstNationalOfTheUnitedStates o c →
    Ontology.IsNationalOfTheUnitedStates (nationalOfE o) c
axiom corr_EO_byOrAgainst {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsOffenseByOrAgainstNationalOfTheUnitedStates o c →
    Ontology.OffenseIsByOrAgainstPerson (offenceEO o) (nationalOfE o) c


axiom corr_E_para9_offender {p : Person} {l : Elements.Locus} {o : Elements.Offense}
    {c : ComplaintText} : Elements.Smtj7Paragraph9 p l o c → OffenderOfE p o c



axiom corr_EO_meja {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    OffenderOfE p o c →
    Ontology.OffenseCommittedByPersonDescribedInSection3261a (offenceEO o) c →
    Elements.OffenderDescribedInSection3261a p c


theorem s7_elements_implies_ontology
    {p : Person} {l : Elements.Locus} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.SpecialMaritimeAndTerritorialJurisdiction p l o c) :
    Ontology.SpecialMaritimeTerritorialJurisdictionCase (locusEO l) (nationalOfE o) (offenceEO o) c :=
  match h with
  | .highSeasOrVessel h1 =>
      match h1 with
      | .highSeas hh => .highSeasOrUsVessel (corr_EO_highSeas hh)
      | .otherWaters hw => .highSeasOrUsVessel (corr_EO_waters hw)
      | .vessel hv => .highSeasOrUsVessel (corr_EO_vessel hv)
  | .greatLakesVessel h2 => .greatLakesVessel (corr_EO_greatLakes h2)
  | .federalEnclave h3 =>
      match h3 with
      | .reserved hr => .reservedOrAcquiredLands (corr_EO_reserved hr)
      | .purchasedWithConsent hp => .reservedOrAcquiredLands (corr_EO_purchased hp)
  | .guanoIsland h4 => .guanoIsland (corr_EO_guano h4)
  | .aircraft h5 => .usAircraftInFlight (corr_EO_aircraft h5)
  | .spaceVehicle h6 => .spaceVehicleInFlight (corr_EO_space h6)
  | .placeOutsideAnyNation h7 =>
      .outsideAnyNation (corr_EO_outside h7.outsideAnyNation)
        (corr_EO_nationalIs h7.nationalNexus) (corr_EO_byOrAgainst h7.nationalNexus)
  | .foreignVessel h8 =>
      .foreignVesselScheduledUsVoyage (corr_EO_foreignVessel h8.foreignVessel)
        (corr_EO_nationalIs h8.nationalNexus) (corr_EO_byOrAgainst h8.nationalNexus)
  | .missionPremises h9 =>
      .usMissionPremisesAbroad (corr_EO_mission h9.place)
        (corr_EO_nationalIs h9.nationalNexus) (corr_EO_byOrAgainst h9.nationalNexus)
        (fun hm => h9.notSection3261aOffender
          (corr_EO_meja (corr_E_para9_offender h9) hm))



axiom corr_EP_highSeas {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph1 l c → Procedure.LocusHighSeasOrUnitedStatesVessel (locusEP l) c
axiom corr_EP_greatLakes {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph2 l c → Procedure.LocusGreatLakesRegisteredVessel (locusEP l) c
axiom corr_EP_enclave {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph3 l c →
    Procedure.LocusLandsReservedOrAcquiredForUnitedStates (locusEP l) c
axiom corr_EP_guano {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph4 l c → Procedure.LocusGuanoIsland (locusEP l) c
axiom corr_EP_aircraft {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph5 l c → Procedure.LocusUnitedStatesAircraftInFlight (locusEP l) c




axiom corr_EP_space {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7Paragraph6 l c → Procedure.Section7Para6InFlight (locusEP l) c
axiom corr_EP_outside {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsPlaceOutsideJurisdictionOfAnyNation l c →
    Procedure.LocusOutsideJurisdictionOfAnyNation (locusEP l) c
axiom corr_EP_foreignVessel {l : Elements.Locus} {c : ComplaintText} :
    Elements.IsForeignVesselOnVoyageScheduledToOrFromUnitedStates l c →
    Procedure.LocusForeignVesselOnScheduledUnitedStatesVoyage (locusEP l) c
axiom corr_EP_mission {l : Elements.Locus} {c : ComplaintText} :
    Elements.Smtj7MissionPlace l c →
    Procedure.LocusUnitedStatesMissionPremisesOrResidenceAbroad (locusEP l) c
axiom corr_EP_national {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsOffenseByOrAgainstNationalOfTheUnitedStates o c →
    Procedure.OffenseByOrAgainstNationalOfTheUnitedStates (offenceEP o) c
axiom corr_EP_meja {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    OffenderOfE p o c →
    Procedure.OffenderIsPersonDescribedInSection3261a (offenceEP o) c →
    Elements.OffenderDescribedInSection3261a p c
axiom corr_EP_treaty {l : Elements.Locus} {o : Elements.Offense} {c : ComplaintText} :
    Elements.Smtj7MissionPlace l c →
    Procedure.ConflictingTreatyOrInternationalAgreementGoverns (offenceEP o) c →
    Elements.ConflictsWithTreatyOrInternationalAgreement l o c



theorem s7_elements_implies_procedure
    {p : Person} {l : Elements.Locus} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.SpecialMaritimeAndTerritorialJurisdiction p l o c) :
    Procedure.Section7SmtjLocus (locusEP l) (offenceEP o) c :=
  match h with
  | .highSeasOrVessel h1 => .highSeasOrUnitedStatesVessel (corr_EP_highSeas h1)
  | .greatLakesVessel h2 => .greatLakesVessel (corr_EP_greatLakes h2)
  | .federalEnclave h3 => .federalEnclave (corr_EP_enclave h3)
  | .guanoIsland h4 => .guanoIsland (corr_EP_guano h4)
  | .aircraft h5 => .unitedStatesAircraftInFlight (corr_EP_aircraft h5)
  | .spaceVehicle h6 => .unitedStatesSpaceVehicleInFlight (corr_EP_space h6)
  | .placeOutsideAnyNation h7 =>
      .outsideAnyNation (corr_EP_outside h7.outsideAnyNation) (corr_EP_national h7.nationalNexus)
  | .foreignVessel h8 =>
      .foreignVesselScheduledUnitedStatesVoyage (corr_EP_foreignVessel h8.foreignVessel)
        (corr_EP_national h8.nationalNexus)
  | .missionPremises h9 =>
      .unitedStatesMissionAbroad (corr_EP_mission h9.place) (corr_EP_national h9.nationalNexus)
        (fun hm => h9.notSection3261aOffender
          (corr_EP_meja (corr_E_para9_offender h9) hm))
        (fun ht => h9.noTreatyConflict (corr_EP_treaty h9.place ht))







axiom corr_PO_highSeas {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.LocusHighSeasOrUnitedStatesVessel l c →
    Ontology.IsHighSeasOrUsAdmiraltyWatersOrUsVessel (locusPO l) c
axiom corr_PO_greatLakes {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.LocusGreatLakesRegisteredVessel l c →
    Ontology.IsGreatLakesUsRegisteredVessel (locusPO l) c
axiom corr_PO_enclave {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.LocusLandsReservedOrAcquiredForUnitedStates l c →
    Ontology.IsUsReservedOrAcquiredLands (locusPO l) c
axiom corr_PO_guano {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.LocusGuanoIsland l c → Ontology.IsGuanoIslandAppertainingToUnitedStates (locusPO l) c
axiom corr_PO_aircraft {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.LocusUnitedStatesAircraftInFlight l c →
    Ontology.IsUsAircraftInFlightOverAdmiraltyWaters (locusPO l) c
axiom corr_PO_space {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.Section7Para6InFlight l c → Ontology.IsUsRegisteredSpaceVehicleInFlight (locusPO l) c
axiom corr_PO_outside {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.LocusOutsideJurisdictionOfAnyNation l c →
    Ontology.IsPlaceOutsideJurisdictionOfAnyNation (locusPO l) c
axiom corr_PO_foreignVessel {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.LocusForeignVesselOnScheduledUnitedStatesVoyage l c →
    Ontology.IsForeignVesselOnScheduledUsVoyage (locusPO l) c
axiom corr_PO_mission {l : Procedure.OffenseLocus} {c : ComplaintText} :
    Procedure.LocusUnitedStatesMissionPremisesOrResidenceAbroad l c →
    Ontology.IsUsMissionPremisesOrResidenceInForeignState (locusPO l) c
axiom corr_PO_nationalIs {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.OffenseByOrAgainstNationalOfTheUnitedStates o c →
    Ontology.IsNationalOfTheUnitedStates (nationalOfP o) c
axiom corr_PO_byOrAgainst {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.OffenseByOrAgainstNationalOfTheUnitedStates o c →
    Ontology.OffenseIsByOrAgainstPerson (offencePO o) (nationalOfP o) c
axiom corr_PO_meja {o : Procedure.Offense} {c : ComplaintText} :
    Ontology.OffenseCommittedByPersonDescribedInSection3261a (offencePO o) c →
    Procedure.OffenderIsPersonDescribedInSection3261a o c


theorem s7_procedure_implies_ontology
    {l : Procedure.OffenseLocus} {o : Procedure.Offense} {c : ComplaintText}
    (h : Procedure.Section7SmtjLocus l o c) :
    Ontology.SpecialMaritimeTerritorialJurisdictionCase (locusPO l) (nationalOfP o) (offencePO o) c :=
  match h with
  | .highSeasOrUnitedStatesVessel h1 => .highSeasOrUsVessel (corr_PO_highSeas h1)
  | .greatLakesVessel h2 => .greatLakesVessel (corr_PO_greatLakes h2)
  | .federalEnclave h3 => .reservedOrAcquiredLands (corr_PO_enclave h3)
  | .guanoIsland h4 => .guanoIsland (corr_PO_guano h4)
  | .unitedStatesAircraftInFlight h5 => .usAircraftInFlight (corr_PO_aircraft h5)
  | .unitedStatesSpaceVehicleInFlight h6 => .spaceVehicleInFlight (corr_PO_space h6)
  | .outsideAnyNation h7 hn =>
      .outsideAnyNation (corr_PO_outside h7) (corr_PO_nationalIs hn) (corr_PO_byOrAgainst hn)
  | .foreignVesselScheduledUnitedStatesVoyage h8 hn =>
      .foreignVesselScheduledUsVoyage (corr_PO_foreignVessel h8) (corr_PO_nationalIs hn)
        (corr_PO_byOrAgainst hn)
  | .unitedStatesMissionAbroad h9 hn hMeja _ =>
      .usMissionPremisesAbroad (corr_PO_mission h9) (corr_PO_nationalIs hn)
        (corr_PO_byOrAgainst hn) (fun hm => hMeja (corr_PO_meja hm))








axiom corr_ED_within {p : Person} {l : Elements.Locus} {o : Elements.Offense}
    {c : ComplaintText} :
    Elements.SpecialMaritimeAndTerritorialJurisdiction p l o c →
    Deontic.LocusWithinSMTJ (locusED l) c


theorem s7_elements_implies_deontic_enumeration
    {p : Person} {l : Elements.Locus} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.SpecialMaritimeAndTerritorialJurisdiction p l o c) :
    Deontic.Definition7 (locusED l) c :=
  ⟨corr_ED_within h⟩

end S7









namespace S20

axiom corr_EO_insured {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsInsuredDepositoryInstitution i c →
    Ontology.IsInsuredDepositoryInstitution (instEC i) c
axiom corr_EO_creditUnion {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsCreditUnionWithInsuredAccounts i c →
    Ontology.IsNcusifInsuredCreditUnion (instEC i) c
axiom corr_EO_homeLoan {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalHomeLoanBankOrMember i c →
    Ontology.IsFederalHomeLoanBankOrSystemMember (instEC i) c
axiom corr_EO_farmCredit {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFarmCreditSystemInstitution i c →
    Ontology.IsFarmCreditSystemInstitution (instEC i) c
axiom corr_EO_sbic {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsSmallBusinessInvestmentCompany i c →
    Ontology.IsSmallBusinessInvestmentCompany (instEC i) c
axiom corr_EO_holding {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsDepositoryInstitutionHoldingCompany i c →
    Ontology.IsDepositoryInstitutionHoldingCompany (instEC i) c
axiom corr_EO_reserve {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalReserveBankOrMemberBank i c →
    Ontology.IsFederalReserveBankOrMemberBank (instEC i) c
axiom corr_EO_edge {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsOrganizationOperatingUnderFederalReserveActSection25 i c →
    Ontology.IsEdgeActOrAgreementCorporation (instEC i) c
axiom corr_EO_foreignBank {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsBranchOrAgencyOfForeignBank i c →
    Ontology.IsBranchOrAgencyOfForeignBank (instEC i) c
axiom corr_EO_mortgage {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsMortgageLendingBusinessOrFederallyRelatedMortgageLender i c →
    Ontology.IsMortgageLendingBusinessOrFederallyRelatedMortgageLender (instEC i) c



theorem s20_elements_implies_ontology
    {i : Elements.Institution} {c : ComplaintText}
    (h : Elements.FinancialInstitution i c) :
    Ontology.FinancialInstitutionCase (instEC i) c :=
  match h with
  | .insuredDepository x => .insuredDepositoryInstitution (corr_EO_insured x)
  | .creditUnion x => .insuredCreditUnion (corr_EO_creditUnion x)
  | .homeLoanBank x => .homeLoanBankOrMember (corr_EO_homeLoan x)
  | .farmCredit x => .farmCreditSystemInstitution (corr_EO_farmCredit x)
  | .sbic x => .smallBusinessInvestmentCompany (corr_EO_sbic x)
  | .holdingCompany x => .depositoryInstitutionHoldingCompany (corr_EO_holding x)
  | .reserveBank x => .federalReserveBankOrMemberBank (corr_EO_reserve x)
  | .edgeActOrganization x => .edgeActOrAgreementCorporation (corr_EO_edge x)
  | .foreignBankBranch x => .branchOrAgencyOfForeignBank (corr_EO_foreignBank x)
  | .mortgageLender x => .mortgageLendingBusiness (corr_EO_mortgage x)



axiom corr_ED_member {i : Elements.Institution} {c : ComplaintText} :
    Elements.FinancialInstitution i c → Deontic.IsFinancialInstitution (instED i) c


theorem s20_elements_implies_deontic_enumeration
    {i : Elements.Institution} {c : ComplaintText}
    (h : Elements.FinancialInstitution i c) : Deontic.Definition20 (instED i) c :=
  ⟨corr_ED_member h⟩

end S20



















namespace S21

axiom corr_EO_actualCharacter {pr : Elements.Property} {c : ComplaintText} :
    Elements.PropertyOfProscribedCharacter pr c →
    Ontology.HasStolenOrCounterfeitCharacter (propEO pr) c
axiom corr_EO_knowledge {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.DefendantKnewPropertyOfProscribedCharacter p pr c →
    Ontology.DefendantKnewStolenOrCounterfeitCharacter p (propEO pr) c
axiom corr_EO_representation {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.OfficialRepresentation p pr c →
    Ontology.IsOfficialRepresentation (reprOfE p pr) c
axiom corr_EO_belief {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.DefendantBelievedPropertyOfProscribedCharacter p pr c →
    Ontology.DefendantBelievedStolenOrCounterfeitCharacter p (propEO pr) c


theorem s21_elements_implies_ontology
    {p : Person} {pr : Elements.Property} {c : ComplaintText}
    (h : Elements.StolenOrCounterfeitNatureElement p pr c) :
    Ontology.StolenOrCounterfeitNatureElement p (propEO pr) (reprOfE p pr) c :=
  match h with
  | .actual ha =>
      .actualCharacterAndKnowledge (corr_EO_actualCharacter ha.character)
        (corr_EO_knowledge ha.knowledge)
  | .officialRepresentation ho =>
      .beliefAfterOfficialRepresentation (corr_EO_representation ho.representation)
        (corr_EO_belief ho.belief)







axiom corr_PE_representation {p : Person} {pr : Procedure.Property}
    {r : Procedure.OfficialRepresentation} {c : ComplaintText} :
    Procedure.Section21OfficialRepresentation r c →
    Procedure.RepresentationConcernedNatureOfProperty r pr c →
    Elements.OfficialRepresentation p (propPE pr) c
axiom corr_PE_belief {p : Person} {pr : Procedure.Property} {c : ComplaintText} :
    Procedure.DefendantBelievedPropertyOfProscribedCharacter p pr c →
    Elements.DefendantBelievedPropertyOfProscribedCharacter p (propPE pr) c
axiom corr_PE_sequence {p : Person} {pr : Procedure.Property}
    {r : Procedure.OfficialRepresentation} {c : ComplaintText} :
    Procedure.Section21BeliefLinkedToRepresentation r p c →
    Procedure.RepresentationConcernedNatureOfProperty r pr c →
    Elements.BeliefFollowedOfficialRepresentation p (propPE pr) c


theorem s21_procedure_implies_elements
    {p : Person} {pr : Procedure.Property} {r : Procedure.OfficialRepresentation}
    {o : Procedure.Offense} {c : ComplaintText}
    (h : Procedure.Section21AlternativeProofOfCharacter p pr r o c) :
    Elements.StolenOrCounterfeitNatureElement p (propPE pr) c :=
  .officialRepresentation
    ⟨corr_PE_representation h.official h.asToProperty, corr_PE_belief h.believed,
     corr_PE_sequence h.linked h.asToProperty⟩



axiom corr_PO_representation {r : Procedure.OfficialRepresentation} {c : ComplaintText} :
    Procedure.Section21OfficialRepresentation r c → Ontology.IsOfficialRepresentation (reprPO r) c
axiom corr_PO_belief {p : Person} {pr : Procedure.Property} {c : ComplaintText} :
    Procedure.DefendantBelievedPropertyOfProscribedCharacter p pr c →
    Ontology.DefendantBelievedStolenOrCounterfeitCharacter p (propPO pr) c


theorem s21_procedure_implies_ontology
    {p : Person} {pr : Procedure.Property} {r : Procedure.OfficialRepresentation}
    {o : Procedure.Offense} {c : ComplaintText}
    (h : Procedure.Section21AlternativeProofOfCharacter p pr r o c) :
    Ontology.StolenOrCounterfeitNatureElement p (propPO pr) (reprPO r) c :=
  .beliefAfterOfficialRepresentation (corr_PO_representation h.official)
    (corr_PO_belief h.believed)



axiom corr_DO_representation {d : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.OfficialRepresentationMade d pr c →
    Ontology.IsOfficialRepresentation (reprOfD d pr) c
axiom corr_DO_belief {d : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.DefendantBelievedPropertyOfSuchCharacter d pr c →
    Ontology.DefendantBelievedStolenOrCounterfeitCharacter d (propDO pr) c


theorem s21_deontic_implies_ontology
    {g d : Person} {pr : Deontic.Property} {c : ComplaintText}
    (h : Deontic.Permission21aExercised g d pr c) :
    Ontology.StolenOrCounterfeitNatureElement d (propDO pr) (reprOfD d pr) c :=
  .beliefAfterOfficialRepresentation (corr_DO_representation h.1.representation)
    (corr_DO_belief h.1.belief)







axiom corr_DP_elementAtIssue {pr : Deontic.Property} {o : Procedure.Offense}
    {c : ComplaintText} :
    Deontic.StolenOrCounterfeitNatureIsElement pr c →
    Procedure.ChargedElementRequiresProscribedCharacterAndKnowledge o c
axiom corr_DP_representation {d : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.OfficialRepresentationMade d pr c →
    Procedure.Section21OfficialRepresentation (reprDP d pr) c
axiom corr_DP_asToProperty {d : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.OfficialRepresentationMade d pr c →
    Procedure.RepresentationConcernedNatureOfProperty (reprDP d pr) (propDP pr) c
axiom corr_DP_belief {d : Person} {pr : Deontic.Property} {c : ComplaintText} :
    Deontic.DefendantBelievedPropertyOfSuchCharacter d pr c →
    Procedure.DefendantBelievedPropertyOfProscribedCharacter d (propDP pr) c



theorem s21_deontic_implies_procedure_modulo_gaps
    {g d : Person} {pr : Deontic.Property} {o : Procedure.Offense} {c : ComplaintText}
    (gap_deontic_beliefLink :
      Procedure.Section21BeliefLinkedToRepresentation (reprDP d pr) d c)
    (h : Deontic.Permission21aExercised g d pr c) :
    Procedure.Section21AlternativeProofOfCharacter d (propDP pr) (reprDP d pr) o c :=
  ⟨corr_DP_elementAtIssue h.1.elementAtIssue, corr_DP_representation h.1.representation,
   corr_DP_asToProperty h.1.representation, corr_DP_belief h.1.belief,
   gap_deontic_beliefLink⟩







axiom corr_ED_representation {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.OfficialRepresentation p pr c → Deontic.OfficialRepresentationMade p (propED pr) c
axiom corr_ED_belief {p : Person} {pr : Elements.Property} {c : ComplaintText} :
    Elements.DefendantBelievedPropertyOfProscribedCharacter p pr c →
    Deontic.DefendantBelievedPropertyOfSuchCharacter p (propED pr) c


theorem s21_elements_implies_deontic_modulo_gaps
    {g p : Person} {pr : Elements.Property} {c : ComplaintText}
    (gap_elements_proponentAddressee : Deontic.AddresseeProponentOfProof g c)
    (gap_elements_elementAtIssue : Deontic.StolenOrCounterfeitNatureIsElement (propED pr) c)
    (gap_elements_establishedByBelief :
      Deontic.EstablishesElementByBeliefProof g p (propED pr) c)
    (h : Elements.OfficialRepresentationRoute p pr c) :
    Deontic.Permission21aExercised g p (propED pr) c :=
  ⟨⟨gap_elements_proponentAddressee, gap_elements_elementAtIssue,
    corr_ED_representation h.representation, corr_ED_belief h.belief⟩,
   gap_elements_establishedByBelief⟩

end S21












namespace S23

axiom corr_EP_territorial {t : Elements.Tribunal} {c : ComplaintText} :
    Elements.IsDistrictCourtOfGuam t c ∨ Elements.IsDistrictCourtForNorthernMarianaIslands t c ∨
      Elements.IsDistrictCourtOfTheVirginIslands t c →
    Procedure.TribunalIsTerritorialDistrictCourtNamedInSection23 (courtEP t) c
axiom corr_EP_ordinary {t : Elements.Tribunal} {c : ComplaintText} :
    Elements.IsCourtOfTheUnitedStatesUnderOrdinaryMeaning t c →
    Procedure.TribunalIsOtherwiseACourtOfTheUnitedStates (courtEP t) c
axiom corr_EP_carveOut {t : Elements.Tribunal} {c : ComplaintText} :
    Procedure.ExpressProvisionDisplacesSection23Inclusion (courtEP t) c →
    Elements.OtherwiseExpresslyProvided t c



theorem s23_elements_implies_procedure
    {t : Elements.Tribunal} {c : ComplaintText}
    (h : Elements.CourtOfTheUnitedStates t c) :
    Procedure.CourtOfTheUnitedStates (courtEP t) c :=
  ⟨match h.route with
   | .guam x => .territorialDistrictCourt (corr_EP_territorial (Or.inl x))
   | .northernMariana x => .territorialDistrictCourt (corr_EP_territorial (Or.inr (Or.inl x)))
   | .virginIslands x => .territorialDistrictCourt (corr_EP_territorial (Or.inr (Or.inr x)))
   | .ordinaryMeaning x => .otherwiseCourtOfTheUnitedStates (corr_EP_ordinary x),
   fun hd => h.notOtherwiseProvided (corr_EP_carveOut hd)⟩

axiom corr_ED_member {t : Elements.Tribunal} {c : ComplaintText} :
    Elements.CourtOfTheUnitedStatesRoute t c → Deontic.IsCourtOfTheUnitedStates (courtED t) c
axiom corr_ED_carveOut {t : Elements.Tribunal} {c : ComplaintText} :
    Deontic.OtherwiseExpresslyProvided c → Elements.OtherwiseExpresslyProvided t c


theorem s23_elements_implies_deontic
    {t : Elements.Tribunal} {c : ComplaintText}
    (h : Elements.CourtOfTheUnitedStates t c) : Deontic.Definition23 (courtED t) c :=
  ⟨corr_ED_member h.route, fun ho => h.notOtherwiseProvided (corr_ED_carveOut ho)⟩

axiom corr_PD_member {ct : Procedure.Court} {c : ComplaintText} :
    Procedure.Section23CourtBasis ct c → Deontic.IsCourtOfTheUnitedStates (courtPD ct) c
axiom corr_PD_carveOut {ct : Procedure.Court} {c : ComplaintText} :
    Deontic.OtherwiseExpresslyProvided c →
    Procedure.ExpressProvisionDisplacesSection23Inclusion ct c


theorem s23_procedure_implies_deontic
    {ct : Procedure.Court} {c : ComplaintText}
    (h : Procedure.CourtOfTheUnitedStates ct c) : Deontic.Definition23 (courtPD ct) c :=
  ⟨corr_PD_member h.basis, fun ho => h.notDisplaced (corr_PD_carveOut ho)⟩



axiom corr_EO_guam {t : Elements.Tribunal} {c : ComplaintText} :
    Elements.IsDistrictCourtOfGuam t c → Ontology.IsDistrictCourtOfGuam (courtEO t) c
axiom corr_EO_nmi {t : Elements.Tribunal} {c : ComplaintText} :
    Elements.IsDistrictCourtForNorthernMarianaIslands t c →
    Ontology.IsDistrictCourtForNorthernMarianaIslands (courtEO t) c
axiom corr_EO_vi {t : Elements.Tribunal} {c : ComplaintText} :
    Elements.IsDistrictCourtOfTheVirginIslands t c →
    Ontology.IsDistrictCourtOfVirginIslands (courtEO t) c





theorem s23_elements_implies_ontology_modulo_gaps
    {t : Elements.Tribunal} {c : ComplaintText}
    (gap_ontology_ordinaryMeaning :
      Elements.IsCourtOfTheUnitedStatesUnderOrdinaryMeaning t c →
      Ontology.CourtOfTheUnitedStatesInclusion (courtEO t) c)
    (h : Elements.CourtOfTheUnitedStates t c) :
    Ontology.CourtOfTheUnitedStatesInclusion (courtEO t) c :=
  match h.route with
  | .guam x => .districtCourtOfGuam (corr_EO_guam x)
  | .northernMariana x => .districtCourtNorthernMarianaIslands (corr_EO_nmi x)
  | .virginIslands x => .districtCourtVirginIslands (corr_EO_vi x)
  | .ordinaryMeaning x => gap_ontology_ordinaryMeaning x



axiom corr_OE_guam {ct : Ontology.Court} {t : Elements.Tribunal} {c : ComplaintText} :
    Ontology.IsDistrictCourtOfGuam ct c → ct = courtEO t → Elements.IsDistrictCourtOfGuam t c




theorem s23_ontology_implies_elements_modulo_gaps
    {t : Elements.Tribunal} {c : ComplaintText}
    (gap_ontology_carveOut : ¬ Elements.OtherwiseExpresslyProvided t c)
    (gap_ontology_route : Elements.CourtOfTheUnitedStatesRoute t c)
    (_h : Ontology.CourtOfTheUnitedStatesInclusion (courtEO t) c) :
    Elements.CourtOfTheUnitedStates t c :=
  ⟨gap_ontology_route, gap_ontology_carveOut⟩

end S23







namespace S24

axiom corr_EP_form_violation {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsCompletedViolation o c →
    Procedure.ChargedAsViolationOfObjectStatute (offenceEP o) c
axiom corr_EP_form_conspiracy {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsCriminalConspiracyToViolate o c →
    Procedure.ChargedAsCriminalConspiracyToViolateObjectStatute (offenceEP o) c
axiom corr_EP_listed1 {o : Elements.Offense} {c : ComplaintText} :
    Elements.TargetsOffenseListedInSection24a1 o c →
    Procedure.ObjectStatuteEnumeratedInSection24a1 (offenceEP o) c
axiom corr_EP_listed2 {o : Elements.Offense} {c : ComplaintText} :
    Elements.TargetsOffenseListedInSection24a2 o c →
    Procedure.ObjectStatuteEnumeratedInSection24a2 (offenceEP o) c
axiom corr_EP_related {o : Elements.Offense} {c : ComplaintText} :
    Elements.RelatesToHealthCareBenefitProgram o c →
    Procedure.ViolationOrConspiracyRelatesToHealthCareBenefitProgram (offenceEP o) c


theorem s24_elements_implies_procedure
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalHealthCareOffense o c) :
    Procedure.FederalHealthCareOffense (offenceEP o) c :=
  match h with
  | .perSe h1 =>
      .coreEnumerated
        (match h1.mode with
         | .violation x => .substantiveViolation (corr_EP_form_violation x)
         | .conspiracy x => .criminalConspiracy (corr_EP_form_conspiracy x))
        (corr_EP_listed1 h1.listed)
  | .relatedFraud h2 =>
      .generalEnumeratedAndRelated
        (match h2.mode with
         | .violation x => .substantiveViolation (corr_EP_form_violation x)
         | .conspiracy x => .criminalConspiracy (corr_EP_form_conspiracy x))
        (corr_EP_listed2 h2.listed) (corr_EP_related h2.relatedness)

axiom corr_ED_enumerated {o : Elements.Offense} {c : ComplaintText} :
    Elements.FederalHealthCareOffenseParagraph1 o c →
    Deontic.ViolationOfEnumeratedHealthCareStatute (offenceED o) c
axiom corr_ED_conditioned {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolationOrConspiracy o c → Elements.TargetsOffenseListedInSection24a2 o c →
    Deontic.ViolationOfConditionedHealthCareStatute (offenceED o) c
axiom corr_ED_related {o : Elements.Offense} {c : ComplaintText} :
    Elements.RelatesToHealthCareBenefitProgram o c →
    Deontic.RelatesToHealthCareBenefitProgram (offenceED o) c


theorem s24_elements_implies_deontic
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalHealthCareOffense o c) :
    Deontic.FederalHealthCareOffense (offenceED o) c :=
  match h with
  | .perSe h1 => .enumerated (corr_ED_enumerated h1)
  | .relatedFraud h2 =>
      .conditioned (corr_ED_conditioned h2.mode h2.listed) (corr_ED_related h2.relatedness)

axiom corr_EO_core {o : Elements.Offense} {c : ComplaintText} :
    Elements.FederalHealthCareOffenseParagraph1 o c →
    Ontology.IsCoreHealthCareStatuteViolationOrConspiracy (offenceEO o) c
axiom corr_EO_relatedStatute {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolationOrConspiracy o c → Elements.TargetsOffenseListedInSection24a2 o c →
    Ontology.IsRelatedStatuteViolationOrConspiracy (offenceEO o) c



axiom corr_EO_program {o : Elements.Offense} {c : ComplaintText} :
    Elements.RelatesToHealthCareBenefitProgram o c →
    Ontology.IsHealthCareBenefitProgram (programOfE o) c
axiom corr_EO_relatedness {o : Elements.Offense} {c : ComplaintText} :
    Elements.RelatesToHealthCareBenefitProgram o c →
    Ontology.OffenseRelatesToHealthCareBenefitProgram (offenceEO o) (programOfE o) c


theorem s24_elements_implies_ontology
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalHealthCareOffense o c) :
    Ontology.FederalHealthCareOffenseCase (offenceEO o) (programOfE o) c :=
  match h with
  | .perSe h1 => .coreStatute (corr_EO_core h1)
  | .relatedFraud h2 =>
      .relatedStatute ⟨corr_EO_relatedStatute h2.mode h2.listed, corr_EO_program h2.relatedness,
        corr_EO_relatedness h2.relatedness⟩

axiom corr_PD_enumerated {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.Section24ChargeForm o c → Procedure.ObjectStatuteEnumeratedInSection24a1 o c →
    Deontic.ViolationOfEnumeratedHealthCareStatute (offencePD o) c
axiom corr_PD_conditioned {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.Section24ChargeForm o c → Procedure.ObjectStatuteEnumeratedInSection24a2 o c →
    Deontic.ViolationOfConditionedHealthCareStatute (offencePD o) c
axiom corr_PD_related {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.ViolationOrConspiracyRelatesToHealthCareBenefitProgram o c →
    Deontic.RelatesToHealthCareBenefitProgram (offencePD o) c


theorem s24_procedure_implies_deontic
    {o : Procedure.Offense} {c : ComplaintText}
    (h : Procedure.FederalHealthCareOffense o c) :
    Deontic.FederalHealthCareOffense (offencePD o) c :=
  match h with
  | .coreEnumerated form x => .enumerated (corr_PD_enumerated form x)
  | .generalEnumeratedAndRelated form x hr =>
      .conditioned (corr_PD_conditioned form x) (corr_PD_related hr)

axiom corr_PO_core {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.Section24ChargeForm o c → Procedure.ObjectStatuteEnumeratedInSection24a1 o c →
    Ontology.IsCoreHealthCareStatuteViolationOrConspiracy (offencePO o) c
axiom corr_PO_relatedStatute {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.Section24ChargeForm o c → Procedure.ObjectStatuteEnumeratedInSection24a2 o c →
    Ontology.IsRelatedStatuteViolationOrConspiracy (offencePO o) c
axiom corr_PO_program {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.ViolationOrConspiracyRelatesToHealthCareBenefitProgram o c →
    Ontology.IsHealthCareBenefitProgram (programOfP o) c
axiom corr_PO_relatedness {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.ViolationOrConspiracyRelatesToHealthCareBenefitProgram o c →
    Ontology.OffenseRelatesToHealthCareBenefitProgram (offencePO o) (programOfP o) c


theorem s24_procedure_implies_ontology
    {o : Procedure.Offense} {c : ComplaintText}
    (h : Procedure.FederalHealthCareOffense o c) :
    Ontology.FederalHealthCareOffenseCase (offencePO o) (programOfP o) c :=
  match h with
  | .coreEnumerated form x => .coreStatute (corr_PO_core form x)
  | .generalEnumeratedAndRelated form x hr =>
      .relatedStatute ⟨corr_PO_relatedStatute form x, corr_PO_program hr,
        corr_PO_relatedness hr⟩

axiom corr_DO_core {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Deontic.ViolationOfEnumeratedHealthCareStatute o c →
    Ontology.IsCoreHealthCareStatuteViolationOrConspiracy (offenceDO o) c
axiom corr_DO_relatedStatute {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Deontic.ViolationOfConditionedHealthCareStatute o c →
    Ontology.IsRelatedStatuteViolationOrConspiracy (offenceDO o) c
axiom corr_DO_program {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Deontic.RelatesToHealthCareBenefitProgram o c →
    Ontology.IsHealthCareBenefitProgram (programOfD o) c
axiom corr_DO_relatedness {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Deontic.RelatesToHealthCareBenefitProgram o c →
    Ontology.OffenseRelatesToHealthCareBenefitProgram (offenceDO o) (programOfD o) c


theorem s24_deontic_implies_ontology
    {o : Deontic.OffenseInstance} {c : ComplaintText}
    (h : Deontic.FederalHealthCareOffense o c) :
    Ontology.FederalHealthCareOffenseCase (offenceDO o) (programOfD o) c :=
  match h with
  | .enumerated x => .coreStatute (corr_DO_core x)
  | .conditioned x hr =>
      .relatedStatute ⟨corr_DO_relatedStatute x, corr_DO_program hr, corr_DO_relatedness hr⟩



axiom corr_EO_planArm {hp : Elements.HealthCareProgram} {c : ComplaintText} :
    Elements.HealthCareBenefitPlan hp c →
    Ontology.IsPlanOrContractAffectingCommerceProvidingMedicalBenefit (programEO hp) c
axiom corr_EO_providerArm {hp : Elements.HealthCareProgram} {c : ComplaintText} :
    Elements.IsProviderOfMedicalBenefitPayableUnderPlanOrContract hp c →
    Ontology.IsProviderOfMedicalBenefitUnderPlanOrContract (programEO hp) c


theorem s24b_elements_implies_ontology
    {hp : Elements.HealthCareProgram} {c : ComplaintText}
    (h : Elements.HealthCareBenefitProgram hp c) :
    Ontology.HealthCareBenefitProgramCase (programEO hp) c :=
  match h with
  | .plan x => .planOrContract (corr_EO_planArm x)
  | .provider x => .providerInclusion (corr_EO_providerArm x)

end S24













namespace S1028

axiom corr_E_charge {p : Person} {d : Elements.Document}
    {m : Elements.MeansOfIdentification} {o : Elements.Offense} {c : ComplaintText} :
    Elements.Section1028a p d m o c → Section1028ChargeE p d m o c



axiom corr_ED_addressee {p : Person} {d : Elements.Document}
    {m : Elements.MeansOfIdentification} {o : Elements.Offense} {c : ComplaintText} :
    Section1028ChargeE p d m o c → Deontic.AddresseeAnyPerson p c



axiom corr_ED_c1_document {d : Elements.Document} {c : ComplaintText} :
    Elements.DocumentIsOrAppearsIssuedByUnitedStatesOrSpecialEventSponsor d c →
    Deontic.Circumstance1028c1 (docED d) c
axiom corr_ED_c1_implement {d : Elements.Document} {c : ComplaintText} :
    Elements.DocumentMakingImplementDesignedOrSuitedForSuchDocument d c →
    Deontic.Circumstance1028c1 (docED d) c
axiom corr_ED_c2 {p : Person} {d : Elements.Document}
    {m : Elements.MeansOfIdentification} {o : Elements.Offense} {c : ComplaintText} :
    Section1028ChargeE p d m o c → Elements.OffenseIsUnderSection1028a4 o c →
    Deontic.ProhibitedAct1028a4 p (docED d) c
axiom corr_ED_c3a {o : Elements.Offense} {c : ComplaintText} :
    Elements.ProhibitedConductAffectsInterstateOrForeignCommerce o c →
    Deontic.AffectsInterstateOrForeignCommerce (offenceED o) c
axiom corr_ED_c3b {p : Person} {d : Elements.Document}
    {m : Elements.MeansOfIdentification} {o : Elements.Offense} {c : ComplaintText} :
    Section1028ChargeE p d m o c → Elements.ItemTransportedInTheMailInCourseOfProhibitedConduct o c →
    Deontic.TransportedInMailInCourseOfConduct (docED d) (offenceED o) c

axiom corr_ED_a1 {p : Person} {d : Elements.Document} {c : ComplaintText} :
    Elements.Section1028a1 p d c → Deontic.ProhibitedAct1028a1 p (docED d) c
axiom corr_ED_a2 {p : Person} {d : Elements.Document} {c : ComplaintText} :
    Elements.Section1028a2 p d c → Deontic.ProhibitedAct1028a2 p (docED d) c
axiom corr_ED_a3 {p : Person} {d : Elements.Document} {c : ComplaintText} :
    Elements.Section1028a3 p d c → Deontic.ProhibitedAct1028a3 p (docED d) c
axiom corr_ED_a4 {p : Person} {d : Elements.Document} {c : ComplaintText} :
    Elements.Section1028a4 p d c → Deontic.ProhibitedAct1028a4 p (docED d) c
axiom corr_ED_a5 {p : Person} {d : Elements.Document} {c : ComplaintText} :
    Elements.Section1028a5 p d c → Deontic.ProhibitedAct1028a5 p (docED d) c
axiom corr_ED_a6 {p : Person} {d : Elements.Document} {c : ComplaintText} :
    Elements.Section1028a6 p d c → Deontic.ProhibitedAct1028a6 p (docED d) c



axiom corr_ED_a7 {p : Person} {d : Elements.Document}
    {m : Elements.MeansOfIdentification} {o : Elements.Offense} {c : ComplaintText} :
    Section1028ChargeE p d m o c → Elements.Section1028a7 p m c →
    Deontic.ProhibitedAct1028a7 p (docED d) c
axiom corr_ED_a8 {p : Person} {d : Elements.Document} {c : ComplaintText} :
    Elements.Section1028a8 p d c → Deontic.ProhibitedAct1028a8 p (docED d) c


axiom corr_ED_exempt {p : Person} {c : ComplaintText} :
    Deontic.ExemptAuthorizedLawEnforcementActivity p c →
    Elements.LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c




theorem s1028_elements_implies_deontic
    {p : Person} {d : Elements.Document} {m : Elements.MeansOfIdentification}
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section1028a p d m o c) :
    Deontic.Prohibition1028aViolated p (docED d) (offenceED o) c :=
  ⟨⟨corr_ED_addressee (corr_E_charge h),
    match h.circumstance with
    | .federalOrSpecialEventDocument x => .federalAuthority (corr_ED_c1_document x)
    | .implementForSuchDocument x => .federalAuthority (corr_ED_c1_implement x)
    | .defraudUnitedStatesOffense x => .offenseUnderA4 (corr_ED_c2 (corr_E_charge h) x)
    | .commerce x => .commerce (corr_ED_c3a x)
    | .mails x => .mails (corr_ED_c3b (corr_E_charge h) x)⟩,
   (match h.conduct with
    | .produces x => .produce (corr_ED_a1 x)
    | .transfers x => .transferStolen (corr_ED_a2 x)
    | .possessesFiveOrMore x => .possessFiveOrMore (corr_ED_a3 x)
    | .possessesToDefraudUnitedStates x => .possessToDefraudUS (corr_ED_a4 x)
    | .documentMakingImplement x => .implement (corr_ED_a5 x)
    | .possessesStolenFederalDocument x => .possessUSDocument (corr_ED_a6 x)
    | .meansOfIdentification x => .meansOfIdentification (corr_ED_a7 (corr_E_charge h) x)
    | .trafficsAuthenticationFeatures x => .traffickingFeatures (corr_ED_a8 x)),
   fun he => h.notExemptActivity (corr_ED_exempt he)⟩



axiom corr_EP_charged {p : Person} {d : Elements.Document}
    {m : Elements.MeansOfIdentification} {o : Elements.Offense} {c : ComplaintText} :
    Section1028ChargeE p d m o c → Procedure.ChargedUnderSection1028a (offenceEP o) c
axiom corr_EP_c1 {d : Elements.Document} {o : Elements.Offense} {c : ComplaintText} :
    Elements.DocumentIsOrAppearsIssuedByUnitedStatesOrSpecialEventSponsor d c →
    Procedure.IdentificationItemAppearsIssuedByUnitedStatesOrSpecialEventSponsor
      (offenceEP o) c
axiom corr_EP_c1impl {d : Elements.Document} {o : Elements.Offense} {c : ComplaintText} :
    Elements.DocumentMakingImplementDesignedOrSuitedForSuchDocument d c →
    Procedure.IdentificationItemAppearsIssuedByUnitedStatesOrSpecialEventSponsor
      (offenceEP o) c
axiom corr_EP_c2 {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseIsUnderSection1028a4 o c →
    Procedure.ChargedUnderSection1028aParagraph (offenceEP o) 4 c
axiom corr_EP_c3a {o : Elements.Offense} {c : ComplaintText} :
    Elements.ProhibitedConductAffectsInterstateOrForeignCommerce o c →
    Procedure.AffectsInterstateOrForeignCommerce (offenceEP o) c
axiom corr_EP_c3b {o : Elements.Offense} {c : ComplaintText} :
    Elements.ItemTransportedInTheMailInCourseOfProhibitedConduct o c →
    Procedure.ItemTransportedInMailInCourseOfProhibitedConduct (offenceEP o) c


axiom corr_EP_exempt {p : Person} {d : Elements.Document}
    {m : Elements.MeansOfIdentification} {o : Elements.Offense} {c : ComplaintText} :
    Section1028ChargeE p d m o c → Procedure.Section1028Exemption (offenceEP o) c →
    Elements.LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c


theorem s1028_elements_implies_procedure
    {p : Person} {d : Elements.Document} {m : Elements.MeansOfIdentification}
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section1028a p d m o c) :
    Procedure.Section1028ProsecutionGate (offenceEP o) c :=
  ⟨corr_EP_charged (corr_E_charge h),
   (match h.circumstance with
    | .federalOrSpecialEventDocument x => .unitedStatesOrSponsorIssued (corr_EP_c1 x)
    | .implementForSuchDocument x => .unitedStatesOrSponsorIssued (corr_EP_c1impl x)
    | .defraudUnitedStatesOffense x => .subsectionA4Offense (corr_EP_c2 x)
    | .commerce x => .interstateOrForeignCommerce (corr_EP_c3a x)
    | .mails x => .mailTransport (corr_EP_c3b x)),
   fun hx => h.notExemptActivity (corr_EP_exempt (corr_E_charge h) hx)⟩



axiom corr_D_charge {p : Person} {d : Deontic.IdentificationObject}
    {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Deontic.Prohibition1028aViolated p d o c → Section1028ChargeD p d o c
axiom corr_DP_charged {p : Person} {d : Deontic.IdentificationObject}
    {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Section1028ChargeD p d o c → Procedure.ChargedUnderSection1028a (offenceDP o) c
axiom corr_DP_c1 {d : Deontic.IdentificationObject} {o : Deontic.OffenseInstance}
    {c : ComplaintText} :
    Deontic.Circumstance1028c1 d c →
    Procedure.IdentificationItemAppearsIssuedByUnitedStatesOrSpecialEventSponsor
      (offenceDP o) c
axiom corr_DP_c2 {p : Person} {d : Deontic.IdentificationObject}
    {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Deontic.ProhibitedAct1028a4 p d c →
    Procedure.ChargedUnderSection1028aParagraph (offenceDP o) 4 c
axiom corr_DP_c3a {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Deontic.AffectsInterstateOrForeignCommerce o c →
    Procedure.AffectsInterstateOrForeignCommerce (offenceDP o) c
axiom corr_DP_c3b {d : Deontic.IdentificationObject} {o : Deontic.OffenseInstance}
    {c : ComplaintText} :
    Deontic.TransportedInMailInCourseOfConduct d o c →
    Procedure.ItemTransportedInMailInCourseOfProhibitedConduct (offenceDP o) c
axiom corr_DP_exempt {p : Person} {d : Deontic.IdentificationObject}
    {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Section1028ChargeD p d o c → Procedure.Section1028Exemption (offenceDP o) c →
    Deontic.ExemptAuthorizedLawEnforcementActivity p c


theorem s1028_deontic_implies_procedure
    {p : Person} {d : Deontic.IdentificationObject} {o : Deontic.OffenseInstance}
    {c : ComplaintText}
    (h : Deontic.Prohibition1028aViolated p d o c) :
    Procedure.Section1028ProsecutionGate (offenceDP o) c :=
  ⟨corr_DP_charged (corr_D_charge h),
   (match h.1.circumstance with
    | .federalAuthority x => .unitedStatesOrSponsorIssued (corr_DP_c1 x)
    | .offenseUnderA4 x => .subsectionA4Offense (corr_DP_c2 x)
    | .commerce x => .interstateOrForeignCommerce (corr_DP_c3a x)
    | .mails x => .mailTransport (corr_DP_c3b x)),
   fun hx => h.2.2 (corr_DP_exempt (corr_D_charge h) hx)⟩



def s1028_tierA_pairwise_discharge : Prop :=
  (∀ {p d m o c}, Elements.Section1028a p d m o c →
      Deontic.Prohibition1028aViolated p (docED d) (offenceED o) c)
  ∧ (∀ {p d m o c}, Elements.Section1028a p d m o c →
      Procedure.Section1028ProsecutionGate (offenceEP o) c)
  ∧ (∀ {p d o c}, Deontic.Prohibition1028aViolated p d o c →
      Procedure.Section1028ProsecutionGate (offenceDP o) c)

theorem s1028_tierA : s1028_tierA_pairwise_discharge :=
  ⟨fun h => s1028_elements_implies_deontic h,
   fun h => s1028_elements_implies_procedure h,
   fun h => s1028_deontic_implies_procedure h⟩

end S1028












namespace S1029

axiom corr_E_charge {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Elements.Section1029a p ad eq o c → Section1029ChargeE p ad eq o c

axiom corr_ED_addressee {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Section1029ChargeE p ad eq o c → Deontic.AddresseeAnyPerson p c
axiom corr_ED_commerce {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseAffectsInterstateOrForeignCommerce o c →
    Deontic.AffectsInterstateOrForeignCommerce (offenceED o) c
axiom corr_ED_a1 {p : Person} {ad : Elements.AccessDevice} {c : ComplaintText} :
    Elements.Section1029a1 p ad c → Deontic.ProhibitedAct1029a1 p (deviceED ad) c
axiom corr_ED_a2 {p : Person} {ad : Elements.AccessDevice} {c : ComplaintText} :
    Elements.Section1029a2 p ad c → Deontic.ProhibitedAct1029a2 p (deviceED ad) c
axiom corr_ED_a3 {p : Person} {ad : Elements.AccessDevice} {c : ComplaintText} :
    Elements.Section1029a3 p ad c → Deontic.ProhibitedAct1029a3 p (deviceED ad) c



axiom corr_ED_a4 {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Section1029ChargeE p ad eq o c → Elements.Section1029a4 p eq c →
    Deontic.ProhibitedAct1029a4 p (deviceED ad) c
axiom corr_ED_a5 {p : Person} {ad : Elements.AccessDevice} {c : ComplaintText} :
    Elements.Section1029a5 p ad c → Deontic.ProhibitedAct1029a5 p (deviceED ad) c
axiom corr_ED_a6 {p : Person} {ad : Elements.AccessDevice} {c : ComplaintText} :
    Elements.Section1029a6 p ad c → Deontic.ProhibitedAct1029a6 p (deviceED ad) c
axiom corr_ED_a7 {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Section1029ChargeE p ad eq o c → Elements.Section1029a7 p eq c →
    Deontic.ProhibitedAct1029a7 p (deviceED ad) c
axiom corr_ED_a8 {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Section1029ChargeE p ad eq o c → Elements.Section1029a8 p eq c →
    Deontic.ProhibitedAct1029a8 p (deviceED ad) c
axiom corr_ED_a9 {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Section1029ChargeE p ad eq o c → Elements.Section1029a9 p eq c →
    Deontic.ProhibitedAct1029a9 p (deviceED ad) c
axiom corr_ED_a10 {p : Person} {ad : Elements.AccessDevice} {c : ComplaintText} :
    Elements.Section1029a10 p ad c → Deontic.ProhibitedAct1029a10 p (deviceED ad) c


axiom corr_ED_exempt {p : Person} {c : ComplaintText} :
    Deontic.ExemptAuthorizedLawEnforcementActivity p c →
    Elements.LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c



theorem s1029_elements_implies_deontic
    {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section1029a p ad eq o c) :
    Deontic.Prohibition1029aViolated p (deviceED ad) (offenceED o) c :=
  ⟨⟨corr_ED_addressee (corr_E_charge h), corr_ED_commerce h.commerce⟩,
   (match h.conduct with
    | .counterfeitDevices x => .counterfeitDevice (corr_ED_a1 x)
    | .unauthorizedDevices x => .unauthorizedThreshold (corr_ED_a2 x)
    | .fifteenOrMoreDevices x => .fifteenOrMore (corr_ED_a3 x)
    | .deviceMakingEquipment x => .deviceMakingEquipment (corr_ED_a4 (corr_E_charge h) x)
    | .transactionsOnAnothersDevice x => .transactionsAnothers (corr_ED_a5 x)
    | .solicitation x => .solicitation (corr_ED_a6 x)
    | .modifiedInstrument x => .modifiedInstrument (corr_ED_a7 (corr_E_charge h) x)
    | .scanningReceiver x => .scanningReceiver (corr_ED_a8 (corr_E_charge h) x)
    | .cloningHardwareOrSoftware x => .configuredHardware (corr_ED_a9 (corr_E_charge h) x)
    | .presentmentOfRecords x => .causedPresentment (corr_ED_a10 x)),
   fun he => h.notExemptActivity (corr_ED_exempt he)⟩



axiom corr_EP_charged {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Section1029ChargeE p ad eq o c → Procedure.ChargedUnderSection1029a (offenceEP o) c
axiom corr_EP_commerce {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseAffectsInterstateOrForeignCommerce o c →
    Procedure.AffectsInterstateOrForeignCommerce (offenceEP o) c
axiom corr_EP_exempt {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Section1029ChargeE p ad eq o c → Procedure.Section1029Exemption (offenceEP o) c →
    Elements.LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c


theorem s1029_elements_implies_procedure
    {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.Section1029a p ad eq o c) :
    Procedure.Section1029ProsecutionGate (offenceEP o) c :=
  ⟨corr_EP_charged (corr_E_charge h), corr_EP_commerce h.commerce,
   fun hx => h.notExemptActivity (corr_EP_exempt (corr_E_charge h) hx)⟩



axiom corr_D_charge {p : Person} {dv : Deontic.AccessDevice} {o : Deontic.OffenseInstance}
    {c : ComplaintText} :
    Deontic.Prohibition1029aViolated p dv o c → Section1029ChargeD p dv o c
axiom corr_DP_charged {p : Person} {dv : Deontic.AccessDevice} {o : Deontic.OffenseInstance}
    {c : ComplaintText} :
    Section1029ChargeD p dv o c → Procedure.ChargedUnderSection1029a (offenceDP o) c
axiom corr_DP_commerce {o : Deontic.OffenseInstance} {c : ComplaintText} :
    Deontic.AffectsInterstateOrForeignCommerce o c →
    Procedure.AffectsInterstateOrForeignCommerce (offenceDP o) c
axiom corr_DP_exempt {p : Person} {dv : Deontic.AccessDevice} {o : Deontic.OffenseInstance}
    {c : ComplaintText} :
    Section1029ChargeD p dv o c → Procedure.Section1029Exemption (offenceDP o) c →
    Deontic.ExemptAuthorizedLawEnforcementActivity p c


theorem s1029_deontic_implies_procedure
    {p : Person} {dv : Deontic.AccessDevice} {o : Deontic.OffenseInstance}
    {c : ComplaintText}
    (h : Deontic.Prohibition1029aViolated p dv o c) :
    Procedure.Section1029ProsecutionGate (offenceDP o) c :=
  ⟨corr_DP_charged (corr_D_charge h), corr_DP_commerce h.1.condition,
   fun hx => h.2.2 (corr_DP_exempt (corr_D_charge h) hx)⟩


def s1029_tierA_pairwise_discharge : Prop :=
  (∀ {p ad eq o c}, Elements.Section1029a p ad eq o c →
      Deontic.Prohibition1029aViolated p (deviceED ad) (offenceED o) c)
  ∧ (∀ {p ad eq o c}, Elements.Section1029a p ad eq o c →
      Procedure.Section1029ProsecutionGate (offenceEP o) c)
  ∧ (∀ {p dv o c}, Deontic.Prohibition1029aViolated p dv o c →
      Procedure.Section1029ProsecutionGate (offenceDP o) c)

theorem s1029_tierA : s1029_tierA_pairwise_discharge :=
  ⟨fun h => s1029_elements_implies_deontic h,
   fun h => s1029_elements_implies_procedure h,
   fun h => s1029_deontic_implies_procedure h⟩









axiom corr_EP_a9_gate {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText} :
    Section1029ChargeE p ad eq o c → Procedure.Section1029ProsecutionGate (offenceEP o) c
axiom corr_EP_a9_carrier {p : Person} {eq : Elements.Equipment} {o : Elements.Offense}
    {c : ComplaintText} :
    Procedure.Section1029g1CarrierException p (offenceEP o) c →
    Elements.CarrierProtectionExemption p eq c



theorem s1029a9_elements_implies_procedure_modulo_gaps
    {p : Person} {ad : Elements.AccessDevice} {eq : Elements.Equipment}
    {o : Elements.Offense} {c : ComplaintText}
    (gap_elements_researchDefence :
      ¬ Procedure.Section1029g2AffirmativeDefense p (offenceEP o) c)
    (hCharge : Section1029ChargeE p ad eq o c)
    (h : Elements.Section1029a9 p eq c) :
    Procedure.Section1029Punishable p (offenceEP o) c :=
  ⟨corr_EP_a9_gate hCharge,
   fun hx => h.notCarrierProtection (corr_EP_a9_carrier hx),
   gap_elements_researchDefence⟩

end S1029

end Proving.USC.T18.Ch1Ch47.Recert2.Bridge
