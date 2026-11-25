


























import Proving.USC.T22.Elements.Sub.Theorems
import Proving.USC.T22.Deontic.Sub.Theorems
import Proving.USC.T22.Ontology.Sub.Theorems
import Proving.USC.T22.Procedure.Sub.Theorems

namespace Proving.USC.T22.SubBridge

open Proving.USC.Common















axiom GovCorrEO :
  Proving.USC.T22.Elements.Sub.CountryGovernment →
  Proving.USC.T22.Ontology.Sub.Government → Prop

axiom corr_eo_prohibitPunish {eg og c} : GovCorrEO eg og →
  Proving.USC.T22.Elements.Sub.CriminalizesSevereTrafficking eg c →
  Proving.USC.T22.Ontology.Sub.ProhibitsAndPunishesTrafficking og c



axiom corr_eo_commensurate {eg og c} : GovCorrEO eg og →
  Proving.USC.T22.Elements.Sub.PrescribesGraveCrimePunishment eg c →
  Proving.USC.T22.Ontology.Sub.PrescribesCommensuratePunishment og c

axiom corr_eo_stringent {eg og c} : GovCorrEO eg og →
  Proving.USC.T22.Elements.Sub.PrescribesStringentPunishment eg c →
  Proving.USC.T22.Ontology.Sub.PrescribesStringentPunishment og c

axiom corr_eo_efforts {eg og c} : GovCorrEO eg og →
  Proving.USC.T22.Elements.Sub.MakesSeriousAndSustainedEfforts eg c →
  Proving.USC.T22.Ontology.Sub.MakesSeriousAndSustainedEfforts og c



theorem s7106_elements_implies_ontology {eg og c} (hcorr : GovCorrEO eg og)
    (h : Proving.USC.T22.Elements.Sub.Section7106 eg c) :
    Proving.USC.T22.Ontology.Sub.SatisfiesMinimumStandards og c :=
  ⟨corr_eo_prohibitPunish hcorr h.criminalizes,
   corr_eo_commensurate hcorr h.graveCrime,
   corr_eo_stringent hcorr h.stringent,
   corr_eo_efforts hcorr h.efforts⟩




axiom GovCorrOD : Proving.USC.T22.Ontology.Sub.Government → Person → Prop

axiom corr_od_prohibitPunish {og p c} : GovCorrOD og p →
  Proving.USC.T22.Ontology.Sub.ProhibitsAndPunishesTrafficking og c →
  Proving.USC.T22.Deontic.Sub.ProhibitsAndPunishesTrafficking p c



axiom corr_od_commensurate {og p c} : GovCorrOD og p →
  Proving.USC.T22.Ontology.Sub.PrescribesCommensuratePunishment og c →
  Proving.USC.T22.Deontic.Sub.PrescribesCommensuratePunishment p c

axiom corr_od_efforts {og p c} : GovCorrOD og p →
  Proving.USC.T22.Ontology.Sub.MakesSeriousAndSustainedEfforts og c →
  Proving.USC.T22.Deontic.Sub.MakesSeriousAndSustainedEfforts p c





theorem s7106_ontology_implies_deontic {og p c} (hcorr : GovCorrOD og p)
    (h : Proving.USC.T22.Ontology.Sub.SatisfiesMinimumStandards og c) :
    Proving.USC.T22.Deontic.Sub.MinimumStandardsMet p c :=
  ⟨corr_od_prohibitPunish hcorr h.prohibitPunish,
   corr_od_commensurate hcorr h.commensurate,
   corr_od_efforts hcorr h.efforts⟩











axiom corr_ep_taskForce {c} :
  Proving.USC.T22.Elements.Sub.TaskForceEstablished c →
  Proving.USC.T22.Procedure.Sub.TaskForceEstablished c

axiom corr_ep_office {c} :
  Proving.USC.T22.Elements.Sub.OfficeToMonitorEstablished c →
  Proving.USC.T22.Procedure.Sub.OfficeEstablished c

axiom corr_ep_operatingGroup {c} :
  Proving.USC.T22.Elements.Sub.SeniorPolicyOperatingGroupEstablished c →
  Proving.USC.T22.Procedure.Sub.OperatingGroupEstablished c



theorem s7103_elements_implies_procedure {c}
    (h : Proving.USC.T22.Elements.Sub.Section7103 c) :
    Proving.USC.T22.Procedure.Sub.ApparatusConstituted c :=
  ⟨corr_ep_taskForce h.taskForce,
   corr_ep_office h.office,
   corr_ep_operatingGroup h.operatingGroup⟩







axiom corr_eo7103_taskForce {tf : Entity} {c} :
  Proving.USC.T22.Elements.Sub.TaskForceEstablished c →
  Proving.USC.T22.Ontology.Sub.IsInteragencyTaskForce tf c

axiom corr_eo7103_office {office : Entity} {c} :
  Proving.USC.T22.Elements.Sub.OfficeToMonitorEstablished c →
  Proving.USC.T22.Ontology.Sub.IsOfficeToMonitorAndCombatTrafficking office c

axiom corr_eo7103_director {dir : Person} {c} :
  Proving.USC.T22.Elements.Sub.OfficeToMonitorEstablished c →
  Proving.USC.T22.Ontology.Sub.IsTraffickingOfficeDirector dir c

axiom corr_eo7103_group {grp : Entity} {c} :
  Proving.USC.T22.Elements.Sub.SeniorPolicyOperatingGroupEstablished c →
  Proving.USC.T22.Ontology.Sub.IsSeniorPolicyOperatingGroup grp c



theorem s7103_elements_implies_ontology {tf office grp : Entity} {dir : Person} {c}
    (h : Proving.USC.T22.Elements.Sub.Section7103 c) :
    Proving.USC.T22.Ontology.Sub.TraffickingApparatusInhabited tf office grp dir c :=
  ⟨corr_eo7103_taskForce h.taskForce,
   corr_eo7103_office h.office,
   corr_eo7103_director h.office,
   corr_eo7103_group h.operatingGroup⟩



axiom corr_ed7103_establishedTaskForce {p : Person} {c} :
  Proving.USC.T22.Elements.Sub.TaskForceEstablished c →
  Proving.USC.T22.Deontic.Sub.EstablishedTaskForce p c



theorem s7103_elements_implies_deontic {p : Person} {c}
    (h : Proving.USC.T22.Elements.Sub.Section7103 c) :
    Proving.USC.T22.Deontic.Sub.EstablishedTaskForce p c :=
  corr_ed7103_establishedTaskForce h.taskForce

end Proving.USC.T22.SubBridge
