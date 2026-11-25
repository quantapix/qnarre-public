



























import Proving.USC.T18.PredicateDefs.Elements.Theorems
import Proving.USC.T18.PredicateDefs.Deontic.Theorems
import Proving.USC.T18.PredicateDefs.Ontology.Theorems
import Proving.USC.T18.PredicateDefs.Procedure.Theorems
import Proving.USC.T18.PredicateDefs.Structure.Theorems

namespace Proving.USC.T18.PredicateDefs.Bridge

open Proving.USC.Common













axiom corr20_obj_E_O : Elements.Institution → Ontology.FinancialInstitution

axiom corr20_obj_E_D : Elements.Institution → Deontic.DefinedObject

axiom corr20_obj_E_P : Elements.Institution → Entity









axiom corr20_fi_E_O {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFinancialInstitution i c →
    Ontology.IsFinancialInstitution (corr20_obj_E_O i) c

axiom corr20_fi_E_D {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFinancialInstitution i c →
    (Deontic.ClauseHasModality Deontic.Modality.Definition c ∧
     Deontic.IsFinancialInstitution (corr20_obj_E_D i) c)

axiom corr20_fi_E_P {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFinancialInstitution i c →
    Procedure.IsFinancialInstitution (corr20_obj_E_P i) c


theorem s20_elements_implies_ontology
    {i : Elements.Institution} {c : ComplaintText}
    (h : Elements.IsFinancialInstitution i c) :
    Ontology.IsFinancialInstitution (corr20_obj_E_O i) c :=
  corr20_fi_E_O h




theorem s20_elements_implies_deontic
    {i : Elements.Institution} {c : ComplaintText}
    (h : Elements.IsFinancialInstitution i c) :
    Deontic.FinancialInstitutionApplies20 (corr20_obj_E_D i) c :=
  let hd := corr20_fi_E_D h
  ⟨⟨hd.1⟩, hd.2⟩


theorem s20_elements_implies_procedure
    {i : Elements.Institution} {c : ComplaintText}
    (h : Elements.IsFinancialInstitution i c) :
    Procedure.IsFinancialInstitution (corr20_obj_E_P i) c :=
  corr20_fi_E_P h










axiom corr1346_obj_E_O : Elements.Scheme → Ontology.Scheme

axiom corr1346_obj_E_Person : Elements.Scheme → ComplaintText → Person



axiom corr1346_E_O {s : Elements.Scheme} {c : ComplaintText} :
    Elements.SchemeToDefraud1346 s c →
    Ontology.HonestServicesSchemeMembership (corr1346_obj_E_O s) c



axiom corr1346_E_D {s : Elements.Scheme} {c : ComplaintText} :
    Elements.SchemeToDefraud1346 s c →
    (Deontic.ClauseHasModality Deontic.Modality.Definition c ∧
     Deontic.DevisedSchemeToDefraud (corr1346_obj_E_Person s c) c ∧
     Deontic.DeprivesHonestServices (corr1346_obj_E_Person s c) c)


axiom corr1346_E_P {s : Elements.Scheme} {c : ComplaintText} :
    Elements.SchemeToDefraud1346 s c →
    Procedure.IsSchemeToDefraud (corr1346_obj_E_Person s c) c


theorem s1346_elements_implies_ontology
    {s : Elements.Scheme} {c : ComplaintText}
    (h : Elements.SchemeToDefraud1346 s c) :
    Ontology.HonestServicesSchemeMembership (corr1346_obj_E_O s) c :=
  corr1346_E_O h





theorem s1346_elements_implies_deontic
    {s : Elements.Scheme} {c : ComplaintText}
    (h : Elements.SchemeToDefraud1346 s c) :
    Deontic.HonestServicesApplies1346 (corr1346_obj_E_Person s c) c :=
  let hd := corr1346_E_D h
  ⟨⟨⟨hd.1⟩, hd.2.1⟩, hd.2.2⟩


theorem s1346_elements_implies_procedure
    {s : Elements.Scheme} {c : ComplaintText}
    (h : Elements.SchemeToDefraud1346 s c) :
    Procedure.IsSchemeToDefraud (corr1346_obj_E_Person s c) c :=
  corr1346_E_P h










axiom corr1515_obj_E_O : Elements.Proceeding → Ontology.OfficialProceeding

axiom corr1515_obj_E_D : Elements.Proceeding → Deontic.DefinedObject

axiom corr1515_obj_E_P : Elements.Proceeding → Procedure.OfficialProceeding


axiom corr1515_op_E_O {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.IsOfficialProceeding pr c →
    Ontology.IsOfficialProceeding (corr1515_obj_E_O pr) c

axiom corr1515_op_E_D {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.IsOfficialProceeding pr c →
    (Deontic.ClauseHasModality Deontic.Modality.Definition c ∧
     Deontic.IsOfficialProceeding (corr1515_obj_E_D pr) c)

axiom corr1515_op_E_P {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.IsOfficialProceeding pr c →
    Procedure.IsOfficialProceeding (corr1515_obj_E_P pr) c


theorem s1515_elements_implies_ontology
    {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.IsOfficialProceeding pr c) :
    Ontology.IsOfficialProceeding (corr1515_obj_E_O pr) c :=
  corr1515_op_E_O h




theorem s1515_elements_implies_deontic
    {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.IsOfficialProceeding pr c) :
    Deontic.OfficialProceedingApplies1515a (corr1515_obj_E_D pr) c :=
  corr1515_op_E_D h




theorem s1515_elements_implies_procedure
    {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.IsOfficialProceeding pr c) :
    Procedure.ProceedingIsOfficial (corr1515_obj_E_P pr) c :=
  ⟨corr1515_op_E_P h⟩













axiom corr_struct_20 {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFinancialInstitution i c → Structure.Coherent20 c


axiom corr_struct_1346 {s : Elements.Scheme} {c : ComplaintText} :
    Elements.SchemeToDefraud1346 s c → Structure.Coherent1346 c


axiom corr_struct_1515 {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.IsOfficialProceeding pr c → Structure.Coherent1515 c


theorem s20_elements_implies_structure
    {i : Elements.Institution} {c : ComplaintText}
    (h : Elements.IsFinancialInstitution i c) : Structure.Coherent20 c :=
  corr_struct_20 h

theorem s1346_elements_implies_structure
    {s : Elements.Scheme} {c : ComplaintText}
    (h : Elements.SchemeToDefraud1346 s c) : Structure.Coherent1346 c :=
  corr_struct_1346 h


theorem s1515_elements_implies_structure
    {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.IsOfficialProceeding pr c) : Structure.Coherent1515Path c :=
  .byIncorporation (corr_struct_1515 h)

end Proving.USC.T18.PredicateDefs.Bridge
