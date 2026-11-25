









































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T20.Structure.Predicates
import Proving.USC.T21.Structure.Predicates
import Proving.USC.T28.Structure.Predicates
import Proving.USC.T31.Structure.Predicates

namespace Proving.USC.Common



















def edgeKindTagT20 : Proving.USC.T20.Structure.EdgeKind → String
  | .Incorporates => "Incorporates"
  | .SubjectTo => "SubjectTo"
  | .Notwithstanding => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings => "Savings"
  | .LexSpecialis => "LexSpecialis"



def mapRefT20 (r : Proving.USC.T20.Structure.Ref) : StructRef :=
  ⟨r.source, r.target, edgeKindTagT20 r.kind⟩

axiom guard_targetResolves_T20 (r : Proving.USC.T20.Structure.Ref) (c : ComplaintText) : Prop

axiom bridge_referencedSectionExists_T20_to_common
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T20.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRefT20 r) c
axiom bridge_incorporationHonored_T20_to_common
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T20 r c →
    Proving.USC.T20.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRefT20 r) c
axiom bridge_exceptionApplies_T20_to_common
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T20 r c →
    Proving.USC.T20.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRefT20 r) c
axiom bridge_overrideTriggered_T20_to_common
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T20 r c →
    Proving.USC.T20.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRefT20 r) c
axiom bridge_savingsPreserved_T20_to_common
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T20 r c →
    Proving.USC.T20.Structure.SavingsPreserved r c →
    StructuralReferenceCoheres (mapRefT20 r) c

theorem reidentify_referencedSectionExists_T20_clean
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T20.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRefT20 r) c :=
  bridge_referencedSectionExists_T20_to_common h
theorem reidentify_incorporationHonored_T20_modulo_guard
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T20 r c)
    (h : Proving.USC.T20.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRefT20 r) c :=
  bridge_incorporationHonored_T20_to_common guard h
theorem reidentify_exceptionApplies_T20_modulo_guard
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T20 r c)
    (h : Proving.USC.T20.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRefT20 r) c :=
  bridge_exceptionApplies_T20_to_common guard h
theorem reidentify_overrideTriggered_T20_modulo_guard
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T20 r c)
    (h : Proving.USC.T20.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRefT20 r) c :=
  bridge_overrideTriggered_T20_to_common guard h
theorem reidentify_savingsPreserved_T20_modulo_guard
    {r : Proving.USC.T20.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T20 r c)
    (h : Proving.USC.T20.Structure.SavingsPreserved r c) :
    StructuralReferenceCoheres (mapRefT20 r) c :=
  bridge_savingsPreserved_T20_to_common guard h



def edgeKindTagT21 : Proving.USC.T21.Structure.EdgeKind → String
  | .Incorporates => "Incorporates"
  | .SubjectTo => "SubjectTo"
  | .Notwithstanding => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings => "Savings"
  | .LexSpecialis => "LexSpecialis"

def mapRefT21 (r : Proving.USC.T21.Structure.Ref) : StructRef :=
  ⟨r.source, r.target, edgeKindTagT21 r.kind⟩

axiom guard_targetResolves_T21 (r : Proving.USC.T21.Structure.Ref) (c : ComplaintText) : Prop

axiom bridge_referencedSectionExists_T21_to_common
    {r : Proving.USC.T21.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T21.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRefT21 r) c
axiom bridge_incorporationHonored_T21_to_common
    {r : Proving.USC.T21.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T21 r c →
    Proving.USC.T21.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRefT21 r) c
axiom bridge_exceptionApplies_T21_to_common
    {r : Proving.USC.T21.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T21 r c →
    Proving.USC.T21.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRefT21 r) c
axiom bridge_overrideTriggered_T21_to_common
    {r : Proving.USC.T21.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T21 r c →
    Proving.USC.T21.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRefT21 r) c

theorem reidentify_referencedSectionExists_T21_clean
    {r : Proving.USC.T21.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T21.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRefT21 r) c :=
  bridge_referencedSectionExists_T21_to_common h
theorem reidentify_incorporationHonored_T21_modulo_guard
    {r : Proving.USC.T21.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T21 r c)
    (h : Proving.USC.T21.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRefT21 r) c :=
  bridge_incorporationHonored_T21_to_common guard h
theorem reidentify_exceptionApplies_T21_modulo_guard
    {r : Proving.USC.T21.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T21 r c)
    (h : Proving.USC.T21.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRefT21 r) c :=
  bridge_exceptionApplies_T21_to_common guard h
theorem reidentify_overrideTriggered_T21_modulo_guard
    {r : Proving.USC.T21.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T21 r c)
    (h : Proving.USC.T21.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRefT21 r) c :=
  bridge_overrideTriggered_T21_to_common guard h



def edgeKindTagT28 : Proving.USC.T28.Structure.EdgeKind → String
  | .Incorporates => "Incorporates"
  | .SubjectTo => "SubjectTo"
  | .Notwithstanding => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings => "Savings"
  | .LexSpecialis => "LexSpecialis"

def mapRefT28 (r : Proving.USC.T28.Structure.Ref) : StructRef :=
  ⟨r.source, r.target, edgeKindTagT28 r.kind⟩

axiom guard_targetResolves_T28 (r : Proving.USC.T28.Structure.Ref) (c : ComplaintText) : Prop

axiom bridge_referencedSectionExists_T28_to_common
    {r : Proving.USC.T28.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T28.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRefT28 r) c
axiom bridge_incorporationHonored_T28_to_common
    {r : Proving.USC.T28.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T28 r c →
    Proving.USC.T28.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRefT28 r) c

theorem reidentify_referencedSectionExists_T28_clean
    {r : Proving.USC.T28.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T28.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRefT28 r) c :=
  bridge_referencedSectionExists_T28_to_common h
theorem reidentify_incorporationHonored_T28_modulo_guard
    {r : Proving.USC.T28.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T28 r c)
    (h : Proving.USC.T28.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRefT28 r) c :=
  bridge_incorporationHonored_T28_to_common guard h



def edgeKindTagT31 : Proving.USC.T31.Structure.EdgeKind → String
  | .Incorporates => "Incorporates"
  | .SubjectTo => "SubjectTo"
  | .Notwithstanding => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings => "Savings"
  | .LexSpecialis => "LexSpecialis"

def mapRefT31 (r : Proving.USC.T31.Structure.Ref) : StructRef :=
  ⟨r.source, r.target, edgeKindTagT31 r.kind⟩

axiom guard_targetResolves_T31 (r : Proving.USC.T31.Structure.Ref) (c : ComplaintText) : Prop

axiom bridge_referencedSectionExists_T31_to_common
    {r : Proving.USC.T31.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T31.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRefT31 r) c
axiom bridge_incorporationHonored_T31_to_common
    {r : Proving.USC.T31.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T31 r c →
    Proving.USC.T31.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRefT31 r) c
axiom bridge_exceptionApplies_T31_to_common
    {r : Proving.USC.T31.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T31 r c →
    Proving.USC.T31.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRefT31 r) c
axiom bridge_savingsPreserved_T31_to_common
    {r : Proving.USC.T31.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T31 r c →
    Proving.USC.T31.Structure.SavingsPreserved r c →
    StructuralReferenceCoheres (mapRefT31 r) c

theorem reidentify_referencedSectionExists_T31_clean
    {r : Proving.USC.T31.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T31.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRefT31 r) c :=
  bridge_referencedSectionExists_T31_to_common h
theorem reidentify_incorporationHonored_T31_modulo_guard
    {r : Proving.USC.T31.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T31 r c)
    (h : Proving.USC.T31.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRefT31 r) c :=
  bridge_incorporationHonored_T31_to_common guard h
theorem reidentify_exceptionApplies_T31_modulo_guard
    {r : Proving.USC.T31.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T31 r c)
    (h : Proving.USC.T31.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRefT31 r) c :=
  bridge_exceptionApplies_T31_to_common guard h
theorem reidentify_savingsPreserved_T31_modulo_guard
    {r : Proving.USC.T31.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T31 r c)
    (h : Proving.USC.T31.Structure.SavingsPreserved r c) :
    StructuralReferenceCoheres (mapRefT31 r) c :=
  bridge_savingsPreserved_T31_to_common guard h

end Proving.USC.Common
