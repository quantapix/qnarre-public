
















































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch31

open Proving.USC.Common








namespace Ch31Structure


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving DecidableEq, Repr


structure Ref where
  source : String
  target : String
  kind   : EdgeKind


axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop

axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop

axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

axiom SavingsClauseHonored (r : Ref) (c : ComplaintText) : Prop

end Ch31Structure

namespace Ch31Elements


axiom IntentToConvertToOwnUse (p : Person) (c : ComplaintText) : Prop

axiom ActsWillfully (p : Person) (c : ComplaintText) : Prop

end Ch31Elements

namespace Ch31Evidentiary


inductive Bearer
  | Plaintiff
  | Defendant
  | Government
  deriving DecidableEq


inductive Standard
  | Preponderance
  | ClearAndConvincing
  | BeyondReasonableDoubt
  deriving DecidableEq


axiom BurdenCarried (b : Bearer) (s : Standard) (c : ComplaintText) : Prop

end Ch31Evidentiary



















def kindTag_ch31 : Ch31Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch31 (r : Ch31Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch31 r.kind }


axiom guard_targetResolves_ch31 (r : Ch31Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch31_referencedExists_to_common
    {r : Ch31Structure.Ref} {c : ComplaintText} :
    Ch31Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch31 r) c
axiom corr_ch31_incorporationHonored_to_common
    {r : Ch31Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch31 r c →
    Ch31Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch31 r) c
axiom corr_ch31_overrideTriggered_to_common
    {r : Ch31Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch31 r c →
    Ch31Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T18Ch31 r) c
axiom corr_ch31_savingsHonored_to_common
    {r : Ch31Structure.Ref} {c : ComplaintText} :
    Ch31Structure.SavingsClauseHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch31 r) c


theorem collapse_ch31_referencedExists
    {r : Ch31Structure.Ref} {c : ComplaintText}
    (h : Ch31Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch31 r) c :=
  corr_ch31_referencedExists_to_common h


theorem collapse_ch31_incorporationHonored_modulo_guard
    {r : Ch31Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch31 r c)
    (h : Ch31Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch31 r) c :=
  corr_ch31_incorporationHonored_to_common hg h


theorem collapse_ch31_overrideTriggered_modulo_guard
    {r : Ch31Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch31 r c)
    (h : Ch31Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T18Ch31 r) c :=
  corr_ch31_overrideTriggered_to_common hg h


theorem collapse_ch31_savingsHonored
    {r : Ch31Structure.Ref} {c : ComplaintText}
    (h : Ch31Structure.SavingsClauseHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch31 r) c :=
  corr_ch31_savingsHonored_to_common h











axiom corr_ch31_intentConvert_to_scienter
    {p : Person} {c : ComplaintText} :
    Ch31Elements.IntentToConvertToOwnUse p c → ActedWithScienter p c
axiom corr_ch31_actsWillfully_to_scienter
    {p : Person} {c : ComplaintText} :
    Ch31Elements.ActsWillfully p c → ActedWithScienter p c


theorem collapse_ch31_intentConvert
    {p : Person} {c : ComplaintText}
    (h : Ch31Elements.IntentToConvertToOwnUse p c) :
    ActedWithScienter p c :=
  corr_ch31_intentConvert_to_scienter h


theorem collapse_ch31_actsWillfully
    {p : Person} {c : ComplaintText}
    (h : Ch31Elements.ActsWillfully p c) :
    ActedWithScienter p c :=
  corr_ch31_actsWillfully_to_scienter h









def mapBearer_ch31 : Ch31Evidentiary.Bearer → Bearer
  | .Plaintiff => .Plaintiff | .Defendant => .Defendant | .Government => .Government
def mapStd_ch31 : Ch31Evidentiary.Standard → Standard
  | .Preponderance => .Preponderance | .ClearAndConvincing => .ClearAndConvincing
  | .BeyondReasonableDoubt => .BeyondReasonableDoubt

axiom bridge_burdenCarried_ch31_iff
    {b : Ch31Evidentiary.Bearer} {s : Ch31Evidentiary.Standard} {c : ComplaintText} :
    Ch31Evidentiary.BurdenCarried b s c ↔ BurdenCarried (mapBearer_ch31 b) (mapStd_ch31 s) c


theorem collapse_ch31_burdenCarried_iff
    {b : Ch31Evidentiary.Bearer} {s : Ch31Evidentiary.Standard} {c : ComplaintText} :
    Ch31Evidentiary.BurdenCarried b s c ↔ BurdenCarried (mapBearer_ch31 b) (mapStd_ch31 s) c :=
  bridge_burdenCarried_ch31_iff

end Proving.USC.Common.CrossWaveT18Ch31
