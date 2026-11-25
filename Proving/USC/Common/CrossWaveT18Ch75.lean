












































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch75.Scienter.Predicates
import Proving.USC.T18.Ch75.Deontic.Predicates
import Proving.USC.T18.Ch75.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch75

open Proving.USC.Common





















axiom corr_mentalState_to_common {p : Person} {rung : MentalState} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Scienter.MentalStateProven p rung c → MentalStateProven p rung c
axiom corr_common_to_mentalState {p : Person} {rung : MentalState} {c : ComplaintText} :
    MentalStateProven p rung c → Proving.USC.T18.Ch75.Scienter.MentalStateProven p rung c


theorem collapse_mentalStateProven_iff {p : Person} {rung : MentalState} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Scienter.MentalStateProven p rung c ↔ MentalStateProven p rung c :=
  Iff.intro corr_mentalState_to_common corr_common_to_mentalState












axiom corr_conditionMet1542_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Deontic.ConditionMet1542 p c → ActedWithScienter p c
axiom corr_conditionMet1543_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Deontic.ConditionMet1543 p c → ActedWithScienter p c
axiom corr_conditionMet1544_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Deontic.ConditionMet1544 p c → ActedWithScienter p c
axiom corr_conditionMet1546_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Deontic.ConditionMet1546 p c → ActedWithScienter p c


theorem collapse_conditionMet1542 {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch75.Deontic.ConditionMet1542 p c) : ActedWithScienter p c :=
  corr_conditionMet1542_to_common h

theorem collapse_conditionMet1543 {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch75.Deontic.ConditionMet1543 p c) : ActedWithScienter p c :=
  corr_conditionMet1543_to_common h

theorem collapse_conditionMet1544 {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch75.Deontic.ConditionMet1544 p c) : ActedWithScienter p c :=
  corr_conditionMet1544_to_common h

theorem collapse_conditionMet1546 {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch75.Deontic.ConditionMet1546 p c) : ActedWithScienter p c :=
  corr_conditionMet1546_to_common h















def kindTag_ch75 : Proving.USC.T18.Ch75.Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch75 (r : Proving.USC.T18.Ch75.Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch75 r.kind }


axiom guard_targetResolves_ch75 (r : Proving.USC.T18.Ch75.Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch75_referencedExists_to_common
    {r : Proving.USC.T18.Ch75.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch75 r) c
axiom corr_ch75_incorporationHonored_to_common
    {r : Proving.USC.T18.Ch75.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch75 r c →
    Proving.USC.T18.Ch75.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch75 r) c


theorem collapse_ch75_referencedExists
    {r : Proving.USC.T18.Ch75.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T18.Ch75.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch75 r) c :=
  corr_ch75_referencedExists_to_common h


theorem collapse_ch75_incorporationHonored_modulo_guard
    {r : Proving.USC.T18.Ch75.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch75 r c)
    (h : Proving.USC.T18.Ch75.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch75 r) c :=
  corr_ch75_incorporationHonored_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch75
