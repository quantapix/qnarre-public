


























































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch25.Elements.Predicates
import Proving.USC.T18.Ch25.Deontic.Predicates
import Proving.USC.T18.Ch25.Procedure.Predicates
import Proving.USC.T18.Ch25.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch25

open Proving.USC.Common






















axiom corr_ch25_elemIntentToDefraud_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch25.Elements.ActsWithIntentToDefraud p c → ActedWithScienter p c
axiom corr_ch25_deonticIntentToDefraud_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch25.Deontic.IntentToDefraud p c → ActedWithScienter p c


theorem collapse_ch25_elemIntentToDefraud {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch25.Elements.ActsWithIntentToDefraud p c) : ActedWithScienter p c :=
  corr_ch25_elemIntentToDefraud_to_common h

theorem collapse_ch25_deonticIntentToDefraud {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch25.Deontic.IntentToDefraud p c) : ActedWithScienter p c :=
  corr_ch25_deonticIntentToDefraud_to_common h













axiom corr_ch25_withinLimits_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch25.Procedure.WithinLimitationsPeriod p c → WithinLimitations p c
axiom corr_ch25_common_to_withinLimits {p : Person} {c : ComplaintText} :
    WithinLimitations p c → Proving.USC.T18.Ch25.Procedure.WithinLimitationsPeriod p c


theorem collapse_ch25_withinLimitations_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch25.Procedure.WithinLimitationsPeriod p c ↔ WithinLimitations p c :=
  Iff.intro corr_ch25_withinLimits_to_common corr_ch25_common_to_withinLimits


















def kindTag_ch25 : Proving.USC.T18.Ch25.Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch25 (r : Proving.USC.T18.Ch25.Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch25 r.kind }


axiom guard_targetResolves_ch25 (r : Proving.USC.T18.Ch25.Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch25_referencedExists_to_common
    {r : Proving.USC.T18.Ch25.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T18.Ch25.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch25 r) c
axiom corr_ch25_incorporationHonored_to_common
    {r : Proving.USC.T18.Ch25.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch25 r c →
    Proving.USC.T18.Ch25.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch25 r) c


theorem collapse_ch25_referencedExists
    {r : Proving.USC.T18.Ch25.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T18.Ch25.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch25 r) c :=
  corr_ch25_referencedExists_to_common h


theorem collapse_ch25_incorporationHonored_modulo_guard
    {r : Proving.USC.T18.Ch25.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch25 r c)
    (h : Proving.USC.T18.Ch25.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch25 r) c :=
  corr_ch25_incorporationHonored_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch25
