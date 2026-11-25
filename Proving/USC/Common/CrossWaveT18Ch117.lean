





























































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch117

open Proving.USC.Common









namespace Ch117Structure



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

axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop

axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

end Ch117Structure

namespace Ch117Elements



axiom IntentToEngageInProscribedSexualActivity (p : Person) (c : ComplaintText) : Prop


axiom UsesInterstateCommerceFacility (p : Person) (c : ComplaintText) : Prop

end Ch117Elements

namespace Ch117Deontic



axiom IntentProstitutionOrChargeableActivity (p : Person) (c : ComplaintText) : Prop


axiom InInterstateOrForeignCommerce (p : Person) (c : ComplaintText) : Prop

end Ch117Deontic

namespace Ch117Procedure




axiom WithinLimitations (p : Person) (c : ComplaintText) : Prop

end Ch117Procedure


















axiom corr_ch117_elemViceIntent_to_common {p : Person} {c : ComplaintText} :
    Ch117Elements.IntentToEngageInProscribedSexualActivity p c → ActedWithScienter p c
axiom corr_ch117_deonticViceIntent_to_common {p : Person} {c : ComplaintText} :
    Ch117Deontic.IntentProstitutionOrChargeableActivity p c → ActedWithScienter p c


theorem collapse_ch117_elemViceIntent {p : Person} {c : ComplaintText}
    (h : Ch117Elements.IntentToEngageInProscribedSexualActivity p c) : ActedWithScienter p c :=
  corr_ch117_elemViceIntent_to_common h

theorem collapse_ch117_deonticViceIntent {p : Person} {c : ComplaintText}
    (h : Ch117Deontic.IntentProstitutionOrChargeableActivity p c) : ActedWithScienter p c :=
  corr_ch117_deonticViceIntent_to_common h

















axiom corr_ch117_usesCommerceFacility_to_common {p : Person} {c : ComplaintText} :
    Ch117Elements.UsesInterstateCommerceFacility p c → FederalJurisdictionalNexus c
axiom corr_ch117_inInterstateCommerce_to_common {p : Person} {c : ComplaintText} :
    Ch117Deontic.InInterstateOrForeignCommerce p c → FederalJurisdictionalNexus c


theorem collapse_ch117_usesCommerceFacility {p : Person} {c : ComplaintText}
    (h : Ch117Elements.UsesInterstateCommerceFacility p c) : FederalJurisdictionalNexus c :=
  corr_ch117_usesCommerceFacility_to_common h

theorem collapse_ch117_inInterstateCommerce {p : Person} {c : ComplaintText}
    (h : Ch117Deontic.InInterstateOrForeignCommerce p c) : FederalJurisdictionalNexus c :=
  corr_ch117_inInterstateCommerce_to_common h












axiom corr_ch117_withinLimits_to_common {p : Person} {c : ComplaintText} :
    Ch117Procedure.WithinLimitations p c → WithinLimitations p c
axiom corr_ch117_common_to_withinLimits {p : Person} {c : ComplaintText} :
    WithinLimitations p c → Ch117Procedure.WithinLimitations p c


theorem collapse_ch117_withinLimitations_iff {p : Person} {c : ComplaintText} :
    Ch117Procedure.WithinLimitations p c ↔ WithinLimitations p c :=
  Iff.intro corr_ch117_withinLimits_to_common corr_ch117_common_to_withinLimits






















def kindTag_ch117 : Ch117Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch117 (r : Ch117Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch117 r.kind }


axiom guard_targetResolves_ch117 (r : Ch117Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch117_referencedExists_to_common
    {r : Ch117Structure.Ref} {c : ComplaintText} :
    Ch117Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch117 r) c
axiom corr_ch117_incorporationHonored_to_common
    {r : Ch117Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch117 r c →
    Ch117Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch117 r) c
axiom corr_ch117_exceptionApplies_to_common
    {r : Ch117Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch117 r c →
    Ch117Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T18Ch117 r) c
axiom corr_ch117_overrideTriggered_to_common
    {r : Ch117Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch117 r c →
    Ch117Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T18Ch117 r) c


theorem collapse_ch117_referencedExists
    {r : Ch117Structure.Ref} {c : ComplaintText}
    (h : Ch117Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch117 r) c :=
  corr_ch117_referencedExists_to_common h

theorem collapse_ch117_incorporationHonored_modulo_guard
    {r : Ch117Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch117 r c)
    (h : Ch117Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch117 r) c :=
  corr_ch117_incorporationHonored_to_common hg h

theorem collapse_ch117_exceptionApplies_modulo_guard
    {r : Ch117Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch117 r c)
    (h : Ch117Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T18Ch117 r) c :=
  corr_ch117_exceptionApplies_to_common hg h

theorem collapse_ch117_overrideTriggered_modulo_guard
    {r : Ch117Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch117 r c)
    (h : Ch117Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T18Ch117 r) c :=
  corr_ch117_overrideTriggered_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch117
