














































import Proving.USC.T18.Ch77Tail.Ontology.Predicates
import Proving.USC.T22.Ontology.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT22

open Proving.USC.Common














axiom corr_t18_severeFormVictim_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch77Tail.Ontology.IsSevereFormOfTraffickingVictim p c
      ↔ IsSevereFormOfTraffickingVictim p c



axiom corr_t22_severeFormVictim_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T22.Ontology.IsVictimOfSevereFormOfTrafficking p c
      ↔ IsSevereFormOfTraffickingVictim p c



theorem collapse_t18_severeFormVictim {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch77Tail.Ontology.IsSevereFormOfTraffickingVictim p c) :
    IsSevereFormOfTraffickingVictim p c :=
  corr_t18_severeFormVictim_iff.mp h



theorem collapse_t22_severeFormVictim {p : Person} {c : ComplaintText}
    (h : Proving.USC.T22.Ontology.IsVictimOfSevereFormOfTrafficking p c) :
    IsSevereFormOfTraffickingVictim p c :=
  corr_t22_severeFormVictim_iff.mp h




theorem agree_severeFormVictim_witnesses {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch77Tail.Ontology.IsSevereFormOfTraffickingVictim p c
      ↔ Proving.USC.T22.Ontology.IsVictimOfSevereFormOfTrafficking p c :=
  Iff.trans corr_t18_severeFormVictim_iff corr_t22_severeFormVictim_iff.symm












theorem discharge_gap_severeFormVictim1592 {p : Person} {c : ComplaintText}
    (h : IsSevereFormOfTraffickingVictim p c) :
    Proving.USC.T18.Ch77Tail.Ontology.IsSevereFormOfTraffickingVictim p c :=
  corr_t18_severeFormVictim_iff.mpr h




theorem lift_s1592_from_s7102 {p : Person} {c : ComplaintText}
    (h : Proving.USC.T22.Ontology.IsVictimOfSevereFormOfTrafficking p c) :
    Proving.USC.T18.Ch77Tail.Ontology.IsSevereFormOfTraffickingVictim p c :=
  discharge_gap_severeFormVictim1592 (collapse_t22_severeFormVictim h)

end Proving.USC.Common.CrossWaveT22
