





























import Proving.USC.Common.Types
import Proving.USC.T18.Ch11.Elements.Statute
import Proving.USC.T18.Ch11.Deontic.Statute
import Proving.USC.T18.Ch11.Ontology.Statute
import Proving.USC.T18.Ch11.Procedure.Statute
import Proving.USC.T18.Ch11.Structure.Statute

namespace Proving.USC.T18.Ch11.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch11



axiom mapPersonO : Person → Ontology.Person
axiom mapMatterO : Elements.Matter → Ontology.Matter
axiom mapEntityO : Elements.Entity → Ontology.Entity






axiom corr_s201b_ed {p o : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section201b1_Bribery p o t m c → Deontic.Prohibition201BriberyViolated p c
axiom corr_s201c_ed {p o : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section201c1_Gratuity p o t m c → Deontic.Prohibition201GratuityViolated p c
axiom corr_s203_ed {p : Person} {c : ComplaintText} :
    Elements.Section203a_Receiver p c → Deontic.Prohibition203Violated p c
axiom corr_s204_ed {p : Person} {c : ComplaintText} :
    Elements.Section204 p c → Deontic.Prohibition204Violated p c
axiom corr_s205_ed {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section205a1_Claim p m c → Deontic.Prohibition205Violated p c
axiom corr_s207_ed {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section207a1_Permanent p m c → Deontic.Prohibition207Violated p c
axiom corr_s208_ed {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section208a p m c → Deontic.Prohibition208Violated p c
axiom corr_s209_ed {p : Person} {t : Elements.Thing} {c : ComplaintText} :
    Elements.Section209a_Receiver p t c → Deontic.Prohibition209Violated p c
axiom corr_s210_ed {p : Person} {t : Elements.Thing} {c : ComplaintText} :
    Elements.Section210 p t c → Deontic.Prohibition210Violated p c
axiom corr_s211_ed {p : Person} {t : Elements.Thing} {c : ComplaintText} :
    Elements.Section211 p t c → Deontic.Prohibition211Violated p c
axiom corr_s212_ed {p : Person} {i : Elements.Institution} {c : ComplaintText} :
    Elements.Section212 p i c → Deontic.Prohibition212Violated p c
axiom corr_s213_ed {p : Person} {c : ComplaintText} :
    Elements.Section213 p c → Deontic.Prohibition213Violated p c
axiom corr_s214_ed {p : Person} {t : Elements.Thing} {c : ComplaintText} :
    Elements.Section214 p t c → Deontic.Prohibition214Violated p c
axiom corr_s215_ed {p : Person} {t : Elements.Thing} {i : Elements.Institution} {c : ComplaintText} :
    Elements.Section215a1_Giver p t i c → Deontic.Prohibition215Violated p c
axiom corr_s217_ed {p : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section217 p t m c → Deontic.Prohibition217Violated p c
axiom corr_s219_ed {p : Person} {c : ComplaintText} :
    Elements.Section219 p c → Deontic.Prohibition219Violated p c
axiom corr_s220_ed {p : Person} {t : Elements.Thing} {e : Elements.Entity} {c : ComplaintText} :
    Elements.Section220a1_Solicit p t e c → Deontic.Prohibition220Violated p c
axiom corr_s224_ed {p : Person} {e : Elements.Entity} {c : ComplaintText} :
    Elements.Section224 p e c → Deontic.Prohibition224Violated p c
axiom corr_s225_ed {p : Person} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.Section225 p e c → Deontic.Prohibition225Violated p c
axiom corr_s226_ed {p : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section226a1_Giver p t m c → Deontic.Prohibition226Violated p c
axiom corr_s227_ed {p : Person} {e : Elements.Entity} {c : ComplaintText} :
    Elements.Section227 p e c → Deontic.Prohibition227Violated p c

theorem s201b_elements_implies_deontic {p o t m c}
    (h : Elements.Section201b1_Bribery p o t m c) : Deontic.Prohibition201BriberyViolated p c :=
  corr_s201b_ed h
theorem s201c_elements_implies_deontic {p o t m c}
    (h : Elements.Section201c1_Gratuity p o t m c) : Deontic.Prohibition201GratuityViolated p c :=
  corr_s201c_ed h
theorem s203_elements_implies_deontic {p c}
    (h : Elements.Section203a_Receiver p c) : Deontic.Prohibition203Violated p c := corr_s203_ed h
theorem s204_elements_implies_deontic {p c}
    (h : Elements.Section204 p c) : Deontic.Prohibition204Violated p c := corr_s204_ed h
theorem s205_elements_implies_deontic {p m c}
    (h : Elements.Section205a1_Claim p m c) : Deontic.Prohibition205Violated p c := corr_s205_ed h
theorem s207_elements_implies_deontic {p m c}
    (h : Elements.Section207a1_Permanent p m c) : Deontic.Prohibition207Violated p c := corr_s207_ed h
theorem s208_elements_implies_deontic {p m c}
    (h : Elements.Section208a p m c) : Deontic.Prohibition208Violated p c := corr_s208_ed h
theorem s209_elements_implies_deontic {p t c}
    (h : Elements.Section209a_Receiver p t c) : Deontic.Prohibition209Violated p c := corr_s209_ed h
theorem s210_elements_implies_deontic {p t c}
    (h : Elements.Section210 p t c) : Deontic.Prohibition210Violated p c := corr_s210_ed h
theorem s211_elements_implies_deontic {p t c}
    (h : Elements.Section211 p t c) : Deontic.Prohibition211Violated p c := corr_s211_ed h
theorem s212_elements_implies_deontic {p i c}
    (h : Elements.Section212 p i c) : Deontic.Prohibition212Violated p c := corr_s212_ed h
theorem s213_elements_implies_deontic {p c}
    (h : Elements.Section213 p c) : Deontic.Prohibition213Violated p c := corr_s213_ed h
theorem s214_elements_implies_deontic {p t c}
    (h : Elements.Section214 p t c) : Deontic.Prohibition214Violated p c := corr_s214_ed h
theorem s215_elements_implies_deontic {p t i c}
    (h : Elements.Section215a1_Giver p t i c) : Deontic.Prohibition215Violated p c := corr_s215_ed h
theorem s217_elements_implies_deontic {p t m c}
    (h : Elements.Section217 p t m c) : Deontic.Prohibition217Violated p c := corr_s217_ed h
theorem s219_elements_implies_deontic {p c}
    (h : Elements.Section219 p c) : Deontic.Prohibition219Violated p c := corr_s219_ed h
theorem s220_elements_implies_deontic {p t e c}
    (h : Elements.Section220a1_Solicit p t e c) : Deontic.Prohibition220Violated p c := corr_s220_ed h
theorem s224_elements_implies_deontic {p e c}
    (h : Elements.Section224 p e c) : Deontic.Prohibition224Violated p c := corr_s224_ed h
theorem s225_elements_implies_deontic {p e c}
    (h : Elements.Section225 p e c) : Deontic.Prohibition225Violated p c := corr_s225_ed h
theorem s226_elements_implies_deontic {p t m c}
    (h : Elements.Section226a1_Giver p t m c) : Deontic.Prohibition226Violated p c := corr_s226_ed h
theorem s227_elements_implies_deontic {p e c}
    (h : Elements.Section227 p e c) : Deontic.Prohibition227Violated p c := corr_s227_ed h



axiom corr_s201_eo {p o : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section201b1_Bribery p o t m c → Ontology.OfficialActMembership (mapMatterO m) (mapPersonO o) c
axiom corr_s220_eo {p : Person} {t : Elements.Thing} {e : Elements.Entity} {c : ComplaintText} :
    Elements.Section220a1_Solicit p t e c → Ontology.ReferralTargetDefn (mapEntityO e) c
axiom corr_s227_eo {p : Person} {e : Elements.Entity} {c : ComplaintText} :
    Elements.Section227 p e c → Ontology.CoveredGovernmentPersonDefn (mapPersonO p) c

theorem s201_elements_implies_ontology {p o t m c}
    (h : Elements.Section201b1_Bribery p o t m c) :
    Ontology.OfficialActMembership (mapMatterO m) (mapPersonO o) c := corr_s201_eo h
theorem s220_elements_implies_ontology {p t e c}
    (h : Elements.Section220a1_Solicit p t e c) :
    Ontology.ReferralTargetDefn (mapEntityO e) c := corr_s220_eo h
theorem s227_elements_implies_ontology {p e c}
    (h : Elements.Section227 p e c) :
    Ontology.CoveredGovernmentPersonDefn (mapPersonO p) c := corr_s227_eo h



axiom corr_s207_ep {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section207a1_Permanent p m c → Procedure.PermanentRepresentationBar p c
axiom corr_s208_ep {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section208a p m c → Procedure.ConflictOfInterestViolation p c
axiom corr_s216_ep {p : Person} {c : ComplaintText} :
    Elements.Section216b_CivilAction p c → Procedure.CivilPenaltyLiability p c
axiom corr_s218_ep {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section218_Recovery p m c → Procedure.RecoveryByUnitedStates p c
axiom corr_s225_ep {p : Person} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.Section225 p e c → Procedure.ContinuingFinancialCrimesEnterprise p c

theorem s207_elements_implies_procedure {p m c}
    (h : Elements.Section207a1_Permanent p m c) : Procedure.PermanentRepresentationBar p c :=
  corr_s207_ep h
theorem s208_elements_implies_procedure {p m c}
    (h : Elements.Section208a p m c) : Procedure.ConflictOfInterestViolation p c := corr_s208_ep h
theorem s216_elements_implies_procedure {p c}
    (h : Elements.Section216b_CivilAction p c) : Procedure.CivilPenaltyLiability p c := corr_s216_ep h
theorem s218_elements_implies_procedure {p m c}
    (h : Elements.Section218_Recovery p m c) : Procedure.RecoveryByUnitedStates p c := corr_s218_ep h
theorem s225_elements_implies_procedure {p e c}
    (h : Elements.Section225 p e c) : Procedure.ContinuingFinancialCrimesEnterprise p c :=
  corr_s225_ep h



axiom corr_s201_es {p o : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section201b1_Bribery p o t m c → Structure.Coherent201 c
axiom corr_s203_es {p : Person} {c : ComplaintText} :
    Elements.Section203a_Receiver p c → Structure.Coherent203 c
axiom corr_s204_es {p : Person} {c : ComplaintText} :
    Elements.Section204 p c → Structure.Coherent204 c
axiom corr_s205_es {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section205a1_Claim p m c → Structure.Coherent205 c
axiom corr_s207_es {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section207a1_Permanent p m c → Structure.Coherent207 c
axiom corr_s208_es {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section208a p m c → Structure.Coherent208 c
axiom corr_s209_es {p : Person} {t : Elements.Thing} {c : ComplaintText} :
    Elements.Section209a_Receiver p t c → Structure.Coherent209 c
axiom corr_s213_es {p : Person} {c : ComplaintText} :
    Elements.Section213 p c → Structure.Coherent213 c
axiom corr_s216_es {p : Person} {c : ComplaintText} :
    Elements.Section216b_CivilAction p c → Structure.Coherent216 c
axiom corr_s217_es {p : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section217 p t m c → Structure.Coherent217 c
axiom corr_s218_es {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section218_Recovery p m c → Structure.Coherent218 c
axiom corr_s219_es {p : Person} {c : ComplaintText} :
    Elements.Section219 p c → Structure.Coherent219 c
axiom corr_s220_es {p : Person} {t : Elements.Thing} {e : Elements.Entity} {c : ComplaintText} :
    Elements.Section220a1_Solicit p t e c → Structure.Coherent220 c
axiom corr_s225_es {p : Person} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.Section225 p e c → Structure.Coherent225 c
axiom corr_s226_es {p : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section226a1_Giver p t m c → Structure.Coherent226 c
axiom corr_s227_es {p : Person} {e : Elements.Entity} {c : ComplaintText} :
    Elements.Section227 p e c → Structure.Coherent227 c

theorem s201_elements_implies_structure {p o t m c}
    (h : Elements.Section201b1_Bribery p o t m c) : Structure.Coherent201 c := corr_s201_es h
theorem s203_elements_implies_structure {p c}
    (h : Elements.Section203a_Receiver p c) : Structure.Coherent203 c := corr_s203_es h
theorem s204_elements_implies_structure {p c}
    (h : Elements.Section204 p c) : Structure.Coherent204 c := corr_s204_es h
theorem s205_elements_implies_structure {p m c}
    (h : Elements.Section205a1_Claim p m c) : Structure.Coherent205 c := corr_s205_es h
theorem s207_elements_implies_structure {p m c}
    (h : Elements.Section207a1_Permanent p m c) : Structure.Coherent207 c := corr_s207_es h
theorem s208_elements_implies_structure {p m c}
    (h : Elements.Section208a p m c) : Structure.Coherent208 c := corr_s208_es h
theorem s209_elements_implies_structure {p t c}
    (h : Elements.Section209a_Receiver p t c) : Structure.Coherent209 c := corr_s209_es h
theorem s213_elements_implies_structure {p c}
    (h : Elements.Section213 p c) : Structure.Coherent213 c := corr_s213_es h
theorem s216_elements_implies_structure {p c}
    (h : Elements.Section216b_CivilAction p c) : Structure.Coherent216 c := corr_s216_es h
theorem s217_elements_implies_structure {p t m c}
    (h : Elements.Section217 p t m c) : Structure.Coherent217 c := corr_s217_es h
theorem s218_elements_implies_structure {p m c}
    (h : Elements.Section218_Recovery p m c) : Structure.Coherent218 c := corr_s218_es h
theorem s219_elements_implies_structure {p c}
    (h : Elements.Section219 p c) : Structure.Coherent219 c := corr_s219_es h
theorem s220_elements_implies_structure {p t e c}
    (h : Elements.Section220a1_Solicit p t e c) : Structure.Coherent220 c := corr_s220_es h
theorem s225_elements_implies_structure {p e c}
    (h : Elements.Section225 p e c) : Structure.Coherent225 c := corr_s225_es h
theorem s226_elements_implies_structure {p t m c}
    (h : Elements.Section226a1_Giver p t m c) : Structure.Coherent226 c := corr_s226_es h
theorem s227_elements_implies_structure {p e c}
    (h : Elements.Section227 p e c) : Structure.Coherent227 c := corr_s227_es h







axiom corr_s202_os {op : Ontology.Person} {c : ComplaintText} :
    Ontology.SpecialGovtEmployeeMembership op c → Structure.Coherent202 c
axiom corr_s202_os_moc {op : Ontology.Person} {c : ComplaintText} :
    Ontology.MemberOfCongressDefn op c → Structure.Coherent202 c
axiom corr_s202_ps {p : Person} {c : ComplaintText} :
    Procedure.IsSpecialGovernmentEmployee p c → Structure.Coherent202 c

theorem s202_ontology_implies_structure {op c}
    (h : Ontology.SpecialGovtEmployeeMembership op c) : Structure.Coherent202 c := corr_s202_os h
theorem s202_ontologyMoC_implies_structure {op c}
    (h : Ontology.MemberOfCongressDefn op c) : Structure.Coherent202 c := corr_s202_os_moc h
theorem s202_procedure_implies_structure {p : Person} {c : ComplaintText}
    (h : Procedure.IsSpecialGovernmentEmployee p c) : Structure.Coherent202 c := corr_s202_ps h


axiom corr_s206_ds {p : Person} {c : ComplaintText} :
    Deontic.Permission206 p c → Structure.Coherent206 c

theorem s206_deontic_implies_structure {p c}
    (h : Deontic.Permission206 p c) : Structure.Coherent206 c := corr_s206_ds h

end Proving.USC.T18.Ch11.Bridge
