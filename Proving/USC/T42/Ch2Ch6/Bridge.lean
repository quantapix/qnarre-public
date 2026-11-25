


































import Proving.USC.T42.Ch2Ch6.Elements.Theorems
import Proving.USC.T42.Ch2Ch6.Deontic.Theorems
import Proving.USC.T42.Ch2Ch6.Ontology.Theorems
import Proving.USC.T42.Ch2Ch6.Procedure.Theorems
import Proving.USC.T42.Ch2Ch6.Structure.Theorems

namespace Proving.USC.T42.Ch2Ch6Bridge

open Proving.USC.Common
open Proving.USC.T42.Ch2Ch6.Elements









axiom corr_88_engaged {v : Vessel} {c : ComplaintText} :
    StateHealthLawProhibitsPortEntry v c → Proving.USC.T42.Ch2Ch6.Deontic.StateLawRestrictsPortEntry88 c
axiom corr_88_grant {cg : Cargo} {c : ComplaintText} :
    UnladingUnderCustomsSupervision cg c → Proving.USC.T42.Ch2Ch6.Deontic.GrantsUnladingPermit88 c



theorem s88_elements_implies_deontic {v : Vessel} {cg : Cargo} {c : ComplaintText}
    (h : Section88 v cg c) : Proving.USC.T42.Ch2Ch6.Deontic.Power88Exercised c :=
  ⟨⟨corr_88_engaged h.barredFromPort⟩, corr_88_grant h.supervised⟩

axiom corr_88_prohibited {v : Vessel} {c : ComplaintText} :
    StateHealthLawProhibitsPortEntry v c → Proving.USC.T42.Ch2Ch6.Procedure.StateHealthLawProhibitsPort c
axiom corr_88_reported {cg : Cargo} {c : ComplaintText} :
    WholeCargoReportedToCollector cg c → Proving.USC.T42.Ch2Ch6.Procedure.CargoReportMade c
axiom corr_88_warranted {cg : Cargo} {c : ComplaintText} :
    UnladingUnderCustomsSupervision cg c → Proving.USC.T42.Ch2Ch6.Procedure.UnladingWarrantGranted c
axiom corr_88_supervised {cg : Cargo} {c : ComplaintText} :
    UnladingUnderCustomsSupervision cg c → Proving.USC.T42.Ch2Ch6.Procedure.UnladingUnderSupervision c


theorem s88_elements_implies_procedure {v : Vessel} {cg : Cargo} {c : ComplaintText}
    (h : Section88 v cg c) : Proving.USC.T42.Ch2Ch6.Procedure.LawfulQuarantineDischarge c :=
  ⟨corr_88_prohibited h.barredFromPort, corr_88_reported h.cargoReported,
   corr_88_warranted h.supervised, corr_88_supervised h.supervised⟩




axiom corr_89_engaged {v : Vessel} {c : ComplaintText} :
    VesselSubjectToQuarantine v c → Proving.USC.T42.Ch2Ch6.Deontic.RevenueSafetyRequiresWarehouse89 c
axiom corr_89_erected {w : Warehouse} {c : ComplaintText} :
    WarehousesErectedUnderPresidentialOrder w c → Proving.USC.T42.Ch2Ch6.Deontic.WarehousesErected89 c



theorem s89_elements_implies_deontic {v : Vessel} {w : Warehouse} {c : ComplaintText}
    (h : Section89 v w c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Obligation89 c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Obligation89Breached c :=
  ⟨⟨corr_89_engaged h.quarantined⟩, fun hb => hb.2 (corr_89_erected h.erected)⟩

axiom corr_89_vessel {v : Vessel} {v' : Proving.USC.T42.Ch2Ch6.Ontology.Vessel} {c : ComplaintText} :
    VesselSubjectToQuarantine v c → Proving.USC.T42.Ch2Ch6.Ontology.IsVesselSubjectToQuarantine v' c
axiom corr_89_warehouse {w : Warehouse} {w' : Proving.USC.T42.Ch2Ch6.Ontology.Warehouse} {c : ComplaintText} :
    WarehousesErectedUnderPresidentialOrder w c → Proving.USC.T42.Ch2Ch6.Ontology.IsQuarantineWarehouse w' c



theorem s89_elements_implies_ontology
    {v : Vessel} {w : Warehouse} {v' : Proving.USC.T42.Ch2Ch6.Ontology.Vessel}
    {w' : Proving.USC.T42.Ch2Ch6.Ontology.Warehouse} {c : ComplaintText}
    (h : Section89 v w c) : Proving.USC.T42.Ch2Ch6.Ontology.QuarantineWarehouseMembership w' v' c :=
  ⟨corr_89_vessel h.quarantined, corr_89_warehouse h.erected⟩




axiom corr_90_engaged {cg : Cargo} {c : ComplaintText} :
    CargoUnladenUnderSections88And89 cg c → Proving.USC.T42.Ch2Ch6.Deontic.CargoUnladenElsewhere90 c
axiom corr_90_deposited_D {cg : Cargo} {w : Warehouse} {c : ComplaintText} :
    ArticlesDepositedInDesignatedWarehouse cg w c → Proving.USC.T42.Ch2Ch6.Deontic.CargoArticlesDeposited90 c


theorem s90_elements_implies_deontic {cg : Cargo} {w : Warehouse} {c : ComplaintText}
    (h : Section90 cg w c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Obligation90 c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Obligation90Breached c :=
  ⟨⟨corr_90_engaged h.unladen⟩, fun hb => hb.2 (corr_90_deposited_D h.deposited)⟩

axiom corr_90_unladen {cg : Cargo} {c : ComplaintText} :
    CargoUnladenUnderSections88And89 cg c → Proving.USC.T42.Ch2Ch6.Procedure.CargoUnladenElsewhere c
axiom corr_90_deposited_P {cg : Cargo} {w : Warehouse} {c : ComplaintText} :
    ArticlesDepositedInDesignatedWarehouse cg w c → Proving.USC.T42.Ch2Ch6.Procedure.ArticlesDepositedInDesignatedWarehouse c
axiom corr_90_joint {cg : Cargo} {c : ComplaintText} :
    HeldInJointCustody cg c → Proving.USC.T42.Ch2Ch6.Procedure.JointCustodyMaintained c
axiom corr_90_removable {cg : Cargo} {c : ComplaintText} :
    RemovableWithoutContraveningHealthLaws cg c → Proving.USC.T42.Ch2Ch6.Procedure.SafelyRemovableWithoutContravening c
axiom corr_90_duties {cg : Cargo} {c : ComplaintText} :
    EnteredAndDutiesPaidWithStorage cg c → Proving.USC.T42.Ch2Ch6.Procedure.DutiesPaid c
axiom corr_90_storage {cg : Cargo} {c : ComplaintText} :
    EnteredAndDutiesPaidWithStorage cg c → Proving.USC.T42.Ch2Ch6.Procedure.StorageRatePaid c
axiom corr_90_permit {cg : Cargo} {c : ComplaintText} :
    EnteredAndDutiesPaidWithStorage cg c → Proving.USC.T42.Ch2Ch6.Procedure.RemovalPermitGranted c




theorem s90_elements_implies_procedure {cg : Cargo} {w : Warehouse} {c : ComplaintText}
    (h : Section90 cg w c) : Proving.USC.T42.Ch2Ch6.Procedure.LawfulWarehouseRemoval c :=
  ⟨corr_90_unladen h.unladen, corr_90_deposited_P h.deposited, corr_90_joint h.jointCustody,
   corr_90_removable h.removable, corr_90_duties h.dutiesPaid, corr_90_storage h.dutiesPaid,
   corr_90_permit h.dutiesPaid⟩

axiom corr_90_incorp88 {cg : Cargo} {c : ComplaintText} :
    CargoUnladenUnderSections88And89 cg c →
    Proving.USC.T42.Ch2Ch6.Structure.IncorporationHonored Proving.USC.T42.Ch2Ch6.Structure.edge_90_incorporates_88 c
axiom corr_90_incorp89 {cg : Cargo} {c : ComplaintText} :
    CargoUnladenUnderSections88And89 cg c →
    Proving.USC.T42.Ch2Ch6.Structure.IncorporationHonored Proving.USC.T42.Ch2Ch6.Structure.edge_90_incorporates_89 c



theorem s90_elements_implies_structure {cg : Cargo} {w : Warehouse} {c : ComplaintText}
    (h : Section90 cg w c) : Proving.USC.T42.Ch2Ch6.Structure.Coherent90 c :=
  ⟨corr_90_incorp88 h.unladen, corr_90_incorp89 h.unladen⟩




axiom corr_91_engaged {v : Vessel} {c : ComplaintText} :
    ConformityToQuarantineRequiresExtension v c → Proving.USC.T42.Ch2Ch6.Deontic.ConformityRequiresExtension91 c
axiom corr_91_noUnlading {cg : Cargo} {c : ComplaintText} :
    NoUnladingExceptAsAllowed cg c → ¬ Proving.USC.T42.Ch2Ch6.Deontic.CargoUnladenOtherwiseThanAllowed91 c



theorem s91_elements_implies_deontic {v : Vessel} {cg : Cargo} {c : ComplaintText}
    (h : Section91 v cg c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Power91 c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Prohibition91Violated c :=
  ⟨⟨corr_91_engaged h.conformityNeeds⟩, fun hv => (corr_91_noUnlading h.noUnlading) hv.2⟩

axiom corr_91_conformity {v : Vessel} {c : ComplaintText} :
    ConformityToQuarantineRequiresExtension v c → Proving.USC.T42.Ch2Ch6.Procedure.ConformityRequiresExtension c
axiom corr_91_unladingOk {cg : Cargo} {c : ComplaintText} :
    NoUnladingExceptAsAllowed cg c → Proving.USC.T42.Ch2Ch6.Procedure.UnladingOnlyAsPermitted c





theorem s91_elements_implies_procedure_modulo_gaps {v : Vessel} {cg : Cargo} {c : ComplaintText}
    (h : Section91 v cg c)
    (gap_extension_granted : Proving.USC.T42.Ch2Ch6.Procedure.EntryTimeExtensionGranted c)
    (gap_within_window : Proving.USC.T42.Ch2Ch6.Procedure.WithinExtendedEntryWindow c) :
    Proving.USC.T42.Ch2Ch6.Procedure.TimelyExtendedEntry c :=
  ⟨corr_91_conformity h.conformityNeeds, gap_extension_granted, gap_within_window,
   corr_91_unladingOk h.noUnlading⟩

axiom corr_91_incorp88 {cg : Cargo} {c : ComplaintText} :
    NoUnladingExceptAsAllowed cg c →
    Proving.USC.T42.Ch2Ch6.Structure.IncorporationHonored Proving.USC.T42.Ch2Ch6.Structure.edge_91_incorporates_88 c
axiom corr_91_incorp90 {cg : Cargo} {c : ComplaintText} :
    NoUnladingExceptAsAllowed cg c →
    Proving.USC.T42.Ch2Ch6.Structure.IncorporationHonored Proving.USC.T42.Ch2Ch6.Structure.edge_91_incorporates_90 c



theorem s91_elements_implies_structure {v : Vessel} {cg : Cargo} {c : ComplaintText}
    (h : Section91 v cg c) : Proving.USC.T42.Ch2Ch6.Structure.Coherent91 c :=
  ⟨corr_91_incorp88 h.noUnlading, corr_91_incorp90 h.noUnlading⟩




axiom corr_97_engaged {v : Vessel} {c : ComplaintText} :
    StateHealthLawEstablishesQuarantine v c → Proving.USC.T42.Ch2Ch6.Deontic.StateQuarantineRespectingVessel97 c
axiom corr_97_observes {o : Officer} {c : ComplaintText} :
    ObservesAndAidsHealthLaws o c → Proving.USC.T42.Ch2Ch6.Deontic.USOfficerObservesAndAidsHealthLaws97 c


theorem s97_elements_implies_deontic {v : Vessel} {o : Officer} {c : ComplaintText}
    (h : Section97 v o c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Obligation97 c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Obligation97Breached c :=
  ⟨⟨corr_97_engaged h.quarantineEstab⟩, fun hb => hb.2 (corr_97_observes h.observesAndAids)⟩

axiom corr_97_established {v : Vessel} {c : ComplaintText} :
    StateHealthLawEstablishesQuarantine v c → Proving.USC.T42.Ch2Ch6.Procedure.StateQuarantineEstablished c
axiom corr_97_observedAid {o : Officer} {c : ComplaintText} :
    ObservesAndAidsHealthLaws o c → Proving.USC.T42.Ch2Ch6.Procedure.OfficersObserveAndAidQuarantine c


theorem s97_elements_implies_procedure {v : Vessel} {o : Officer} {c : ComplaintText}
    (h : Section97 v o c) : Proving.USC.T42.Ch2Ch6.Procedure.QuarantineObservedByOfficers c :=
  ⟨corr_97_established h.quarantineEstab, corr_97_observedAid h.observesAndAids⟩

axiom corr_97_savings {c : ComplaintText} :
    NoStateTonnageDutyWithoutCongressConsent c →
    Proving.USC.T42.Ch2Ch6.Structure.SavingsClausePreserved Proving.USC.T42.Ch2Ch6.Structure.edge_97_savings_rs58 c



theorem s97_elements_implies_structure {c : ComplaintText}
    (h : Section97Proviso c) : Proving.USC.T42.Ch2Ch6.Structure.Coherent97 c :=
  ⟨corr_97_savings h.noTonnageDuty⟩




axiom corr_98_engaged {c : ComplaintText} :
    RequestBySecretaryHHS c → Proving.USC.T42.Ch2Ch6.Deontic.HHSRequestsSpareNavyVessels98 c
axiom corr_98_places {v : Vessel} {c : ComplaintText} :
    PlacedGratuitouslyForTemporaryQuarantine v c → Proving.USC.T42.Ch2Ch6.Deontic.PlacesVesselsAtQuarantineDisposal98 c


theorem s98_elements_implies_deontic {v : Vessel} {c : ComplaintText}
    (h : Section98 v c) : Proving.USC.T42.Ch2Ch6.Deontic.Power98Exercised c :=
  ⟨⟨corr_98_engaged h.hhsRequest⟩, corr_98_places h.gratuitous⟩

axiom corr_98_requested {c : ComplaintText} :
    RequestBySecretaryHHS c → Proving.USC.T42.Ch2Ch6.Procedure.QuarantineAuthorityRequest c
axiom corr_98_placed {v : Vessel} {c : ComplaintText} :
    PlacedGratuitouslyForTemporaryQuarantine v c → Proving.USC.T42.Ch2Ch6.Procedure.NavyVesselPlacedAtDisposal c


theorem s98_elements_implies_procedure {v : Vessel} {c : ComplaintText}
    (h : Section98 v c) : Proving.USC.T42.Ch2Ch6.Procedure.QuarantineVesselProvided c :=
  ⟨corr_98_requested h.hhsRequest, corr_98_placed h.gratuitous⟩




axiom corr_112_epidemic {c : ComplaintText} :
    ContagiousOrEpidemicDiseasePrevalent c → Proving.USC.T42.Ch2Ch6.Deontic.EpidemicEndangersOfficersAtPort112 c
axiom corr_112_directs {o : Officer} {c : ComplaintText} :
    RemovalToConvenientPlaceNearDistrict o c → Proving.USC.T42.Ch2Ch6.Deontic.DirectsRemovalOfRevenueOfficers112 c
axiom corr_112_directed {o : Officer} {c : ComplaintText} :
    RemovalToConvenientPlaceNearDistrict o c → Proving.USC.T42.Ch2Ch6.Deontic.RemovalOfOfficersDirected112 c
axiom corr_112_notice {c : ComplaintText} :
    PublicNoticeGiven c → Proving.USC.T42.Ch2Ch6.Deontic.PublicNoticeOfRemovalGiven112 c



theorem s112_elements_implies_deontic {o : Officer} {c : ComplaintText}
    (h : Section112 o c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Power112Exercised c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Obligation112Breached c :=
  ⟨⟨⟨corr_112_epidemic h.epidemic⟩, corr_112_directs h.removed⟩,
   fun hb => hb.2 (corr_112_notice h.publicNotice)⟩

axiom corr_112_near {c : ComplaintText} :
    ContagiousOrEpidemicDiseasePrevalent c → Proving.USC.T42.Ch2Ch6.Procedure.EpidemicNearPort c
axiom corr_112_removalDirected {o : Officer} {c : ComplaintText} :
    RemovalToConvenientPlaceNearDistrict o c → Proving.USC.T42.Ch2Ch6.Procedure.RevenueOfficerRemovalDirected c
axiom corr_112_noticeP {c : ComplaintText} :
    PublicNoticeGiven c → Proving.USC.T42.Ch2Ch6.Procedure.PublicNoticeGiven c


theorem s112_elements_implies_procedure {o : Officer} {c : ComplaintText}
    (h : Section112 o c) : Proving.USC.T42.Ch2Ch6.Procedure.LawfulRevenueOfficerRemoval c :=
  ⟨corr_112_near h.epidemic, corr_112_removalDirected h.removed, corr_112_noticeP h.publicNotice⟩








axiom corr_191_bound {b : Bureau} {c : ComplaintText} :
    ChildrensBureauEstablishedInHHS b c → Proving.USC.T42.Ch2Ch6.Deontic.DepartmentBoundToEstablishBureau191 c
axiom corr_191_established {b : Bureau} {c : ComplaintText} :
    ChildrensBureauEstablishedInHHS b c → Proving.USC.T42.Ch2Ch6.Deontic.ChildrensBureauEstablished191 c


theorem s191_elements_implies_deontic {b : Bureau} {c : ComplaintText}
    (h : Section191 b c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Obligation191 c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Obligation191Breached c :=
  ⟨⟨corr_191_bound h.established⟩, fun hb => hb.2 (corr_191_established h.established)⟩

axiom corr_191_bureau {b : Bureau} {b' : Proving.USC.T42.Ch2Ch6.Ontology.ChildrensBureau} {c : ComplaintText} :
    ChildrensBureauEstablishedInHHS b c → Proving.USC.T42.Ch2Ch6.Ontology.IsChildrensBureau b' c



theorem s191_elements_implies_ontology
    {b : Bureau} {b' : Proving.USC.T42.Ch2Ch6.Ontology.ChildrensBureau} {c : ComplaintText}
    (h : Section191 b c) : Proving.USC.T42.Ch2Ch6.Ontology.ChildrensBureauDef b' c :=
  ⟨corr_191_bureau h.established⟩



axiom corr_192_bound {b : Bureau} {c : ComplaintText} :
    BureauInvestigatesAndReportsChildWelfare b c → Proving.USC.T42.Ch2Ch6.Deontic.BureauBoundToInvestigate192 c
axiom corr_192_investigates {b : Bureau} {c : ComplaintText} :
    BureauInvestigatesAndReportsChildWelfare b c → Proving.USC.T42.Ch2Ch6.Deontic.InvestigatesAndReportsChildWelfare192 c
axiom corr_192_noentry {o : Official} {c : ComplaintText} :
    NoEntryOverFamilyObjection o c → ¬ Proving.USC.T42.Ch2Ch6.Deontic.BureauOfficialEntersFamilyResidence192 c



theorem s192_elements_implies_deontic {p : Person} {b : Bureau} {o : Official} {c : ComplaintText}
    (h : Section192 p b o c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Obligation192 c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Obligation192Breached c
      ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Prohibition192Violated c :=
  ⟨⟨corr_192_bound h.investigates⟩,
   fun hb => hb.2 (corr_192_investigates h.investigates),
   fun hv => (corr_192_noentry h.noFamilyEntry) hv.2⟩

axiom corr_192_appointed {p : Person} {c : ComplaintText} :
    ChiefAppointedByPresidentWithSenateConsent p c → Proving.USC.T42.Ch2Ch6.Procedure.AppointedWithSenateAdviceAndConsent c
axiom corr_192_investigatedP {b : Bureau} {c : ComplaintText} :
    BureauInvestigatesAndReportsChildWelfare b c → Proving.USC.T42.Ch2Ch6.Procedure.BureauInvestigatedWelfare c
axiom corr_192_reportedP {b : Bureau} {c : ComplaintText} :
    BureauInvestigatesAndReportsChildWelfare b c → Proving.USC.T42.Ch2Ch6.Procedure.ReportedToSecretary c





theorem s192_elements_implies_procedure {p : Person} {b : Bureau} {o : Official} {c : ComplaintText}
    (h : Section192 p b o c) :
    Proving.USC.T42.Ch2Ch6.Procedure.ChiefAppointment c ∧ Proving.USC.T42.Ch2Ch6.Procedure.BureauReportingComplete c :=
  ⟨⟨corr_192_appointed h.chiefAppointed⟩,
   ⟨corr_192_investigatedP h.investigates, corr_192_reportedP h.investigates⟩⟩

axiom corr_192_chief {p : Person} {c : ComplaintText} :
    ChiefAppointedByPresidentWithSenateConsent p c → Proving.USC.T42.Ch2Ch6.Ontology.IsBureauChief p c
axiom corr_192_bureauO {b : Bureau} {b' : Proving.USC.T42.Ch2Ch6.Ontology.ChildrensBureau} {c : ComplaintText} :
    BureauInvestigatesAndReportsChildWelfare b c → Proving.USC.T42.Ch2Ch6.Ontology.IsChildrensBureau b' c



theorem s192_elements_implies_ontology
    {p : Person} {b : Bureau} {o : Official} {b' : Proving.USC.T42.Ch2Ch6.Ontology.ChildrensBureau} {c : ComplaintText}
    (h : Section192 p b o c) : Proving.USC.T42.Ch2Ch6.Ontology.BureauChiefMembership p b' c :=
  ⟨corr_192_bureauO h.investigates, corr_192_chief h.chiefAppointed⟩

axiom corr_192_exists {b : Bureau} {c : ComplaintText} :
    BureauInvestigatesAndReportsChildWelfare b c →
    Proving.USC.T42.Ch2Ch6.Structure.ReferencedSectionExists Proving.USC.T42.Ch2Ch6.Structure.edge_192_incorporates_191 c
axiom corr_192_incorp {b : Bureau} {c : ComplaintText} :
    BureauInvestigatesAndReportsChildWelfare b c →
    Proving.USC.T42.Ch2Ch6.Structure.IncorporationHonored Proving.USC.T42.Ch2Ch6.Structure.edge_192_incorporates_191 c



theorem s192_elements_implies_structure {p : Person} {b : Bureau} {o : Official} {c : ComplaintText}
    (h : Section192 p b o c) : Proving.USC.T42.Ch2Ch6.Structure.Coherent192 c :=
  ⟨corr_192_exists h.investigates, corr_192_incorp h.investigates⟩




axiom corr_193_bound {p : Person} {c : ComplaintText} :
    AssistantChiefAppointedBySecretary p c → Proving.USC.T42.Ch2Ch6.Deontic.SecretaryBoundToAppointAssistant193 c
axiom corr_193_appointed {p : Person} {c : ComplaintText} :
    AssistantChiefAppointedBySecretary p c → Proving.USC.T42.Ch2Ch6.Deontic.AssistantChiefAppointed193 c


theorem s193_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Section193 p c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Obligation193 c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Obligation193Breached c :=
  ⟨⟨corr_193_bound h.assistantAppointed⟩, fun hb => hb.2 (corr_193_appointed h.assistantAppointed)⟩

axiom corr_193_appointedP {p : Person} {c : ComplaintText} :
    AssistantChiefAppointedBySecretary p c → Proving.USC.T42.Ch2Ch6.Procedure.AssistantChiefAppointed c


theorem s193_elements_implies_procedure {p : Person} {c : ComplaintText}
    (h : Section193 p c) : Proving.USC.T42.Ch2Ch6.Procedure.AssistantChiefAppointment c :=
  ⟨corr_193_appointedP h.assistantAppointed⟩

axiom corr_193_assistantO {p : Person} {c : ComplaintText} :
    AssistantChiefAppointedBySecretary p c → Proving.USC.T42.Ch2Ch6.Ontology.IsAssistantChief p c
axiom corr_193_bureauO {p : Person} {b' : Proving.USC.T42.Ch2Ch6.Ontology.ChildrensBureau} {c : ComplaintText} :
    AssistantChiefAppointedBySecretary p c → Proving.USC.T42.Ch2Ch6.Ontology.IsChildrensBureau b' c



theorem s193_elements_implies_ontology
    {p : Person} {b' : Proving.USC.T42.Ch2Ch6.Ontology.ChildrensBureau} {c : ComplaintText}
    (h : Section193 p c) : Proving.USC.T42.Ch2Ch6.Ontology.AssistantChiefMembership p b' c :=
  ⟨corr_193_bureauO h.assistantAppointed, corr_193_assistantO h.assistantAppointed⟩

axiom corr_193_incorp {p : Person} {c : ComplaintText} :
    AssistantChiefAppointedBySecretary p c →
    Proving.USC.T42.Ch2Ch6.Structure.IncorporationHonored Proving.USC.T42.Ch2Ch6.Structure.edge_193_incorporates_191 c


theorem s193_elements_implies_structure {p : Person} {c : ComplaintText}
    (h : Section193 p c) : Proving.USC.T42.Ch2Ch6.Structure.Coherent193 c :=
  ⟨corr_193_incorp h.assistantAppointed⟩




axiom corr_194_bound {b : Bureau} {c : ComplaintText} :
    QuartersFurnishedForBureau b c → Proving.USC.T42.Ch2Ch6.Deontic.SecretaryBoundToFurnishQuarters194 c
axiom corr_194_furnished_D {b : Bureau} {c : ComplaintText} :
    QuartersFurnishedForBureau b c → Proving.USC.T42.Ch2Ch6.Deontic.QuartersFurnished194 c
axiom corr_194_cap_D {n : Nat} {c : ComplaintText} :
    AnnualRentalIs n c → n ≤ 2000 → Proving.USC.T42.Ch2Ch6.Deontic.RentalWithinCap194 c



theorem s194_elements_implies_deontic {b : Bureau} {n : Nat} {c : ComplaintText}
    (h : Section194 b n c) :
    Proving.USC.T42.Ch2Ch6.Deontic.Obligation194 c ∧ ¬ Proving.USC.T42.Ch2Ch6.Deontic.Obligation194Breached c
      ∧ Proving.USC.T42.Ch2Ch6.Deontic.RentalWithinCap194 c :=
  ⟨⟨corr_194_bound h.quarters⟩,
   fun hb => hb.2 (corr_194_furnished_D h.quarters),
   corr_194_cap_D h.rental h.withinCap⟩

axiom corr_194_furnished_P {b : Bureau} {c : ComplaintText} :
    QuartersFurnishedForBureau b c → Proving.USC.T42.Ch2Ch6.Procedure.QuartersFurnished c
axiom corr_194_cap_P {n : Nat} {c : ComplaintText} :
    AnnualRentalIs n c → n ≤ 2000 → Proving.USC.T42.Ch2Ch6.Procedure.RentalWithinStatutoryCap c



theorem s194_elements_implies_procedure {b : Bureau} {n : Nat} {c : ComplaintText}
    (h : Section194 b n c) : Proving.USC.T42.Ch2Ch6.Procedure.LawfulQuartersProvision c :=
  ⟨corr_194_furnished_P h.quarters, corr_194_cap_P h.rental h.withinCap⟩



theorem s194_elements_implies_ontology {b : Bureau} {n : Nat} {c : ComplaintText}
    (h : Section194 b n c) : Proving.USC.T42.Ch2Ch6.Ontology.WithinRentalCap n :=
  h.withinCap

axiom corr_194_incorp {b : Bureau} {c : ComplaintText} :
    QuartersFurnishedForBureau b c →
    Proving.USC.T42.Ch2Ch6.Structure.IncorporationHonored Proving.USC.T42.Ch2Ch6.Structure.edge_194_incorporates_191 c


theorem s194_elements_implies_structure {b : Bureau} {n : Nat} {c : ComplaintText}
    (h : Section194 b n c) : Proving.USC.T42.Ch2Ch6.Structure.Coherent194 c :=
  ⟨corr_194_incorp h.quarters⟩

end Proving.USC.T42.Ch2Ch6Bridge
