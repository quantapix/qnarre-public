



































































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch113Counterfeiting

open Proving.USC.Common






namespace Ch113Elements

axiom WithinMaritimeOrAircraftJurisdiction (c : ComplaintText) : Prop

axiom UsedInterstateCommerceFacility (c : ComplaintText) : Prop
end Ch113Elements

namespace Ch113Procedure

axiom ClaimAccrued2318 (p : Person) (c : ComplaintText) : Prop

axiom WithinThreeYearWindow2318 (p : Person) (c : ComplaintText) : Prop
end Ch113Procedure

namespace Ch113Structure

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
end Ch113Structure






axiom corr_maritimeAircraft_to_common {c : ComplaintText} :
    Ch113Elements.WithinMaritimeOrAircraftJurisdiction c → FederalJurisdictionalNexus c
axiom corr_commerceFacility_to_common {c : ComplaintText} :
    Ch113Elements.UsedInterstateCommerceFacility c → FederalJurisdictionalNexus c


theorem collapse_maritimeAircraft {c : ComplaintText}
    (h : Ch113Elements.WithinMaritimeOrAircraftJurisdiction c) :
    FederalJurisdictionalNexus c :=
  corr_maritimeAircraft_to_common h


theorem collapse_commerceFacility {c : ComplaintText}
    (h : Ch113Elements.UsedInterstateCommerceFacility c) :
    FederalJurisdictionalNexus c :=
  corr_commerceFacility_to_common h





axiom corr_threeYearWindow_to_common {p : Person} {c : ComplaintText} :
    Ch113Procedure.WithinThreeYearWindow2318 p c → WithinLimitations p c


axiom guard_filedWithinWindow (p : Person) (c : ComplaintText) : Prop

axiom corr_claimAccrued_to_common {p : Person} {c : ComplaintText} :
    guard_filedWithinWindow p c → Ch113Procedure.ClaimAccrued2318 p c → WithinLimitations p c


theorem collapse_threeYearWindow {p : Person} {c : ComplaintText}
    (h : Ch113Procedure.WithinThreeYearWindow2318 p c) :
    WithinLimitations p c :=
  corr_threeYearWindow_to_common h


theorem collapse_claimAccrued_modulo_guard {p : Person} {c : ComplaintText}
    (hg : guard_filedWithinWindow p c)
    (h : Ch113Procedure.ClaimAccrued2318 p c) :
    WithinLimitations p c :=
  corr_claimAccrued_to_common hg h







def kindTag_ch113c : Ch113Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_ch113c (r : Ch113Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch113c r.kind }


axiom guard_targetResolves_ch113c (r : Ch113Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch113c_referencedExists_to_common
    {r : Ch113Structure.Ref} {c : ComplaintText} :
    Ch113Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_ch113c r) c
axiom corr_ch113c_incorporationHonored_to_common
    {r : Ch113Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch113c r c →
    Ch113Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_ch113c r) c
axiom corr_ch113c_exceptionApplies_to_common
    {r : Ch113Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch113c r c →
    Ch113Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_ch113c r) c


theorem collapse_ch113c_referencedExists
    {r : Ch113Structure.Ref} {c : ComplaintText}
    (h : Ch113Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_ch113c r) c :=
  corr_ch113c_referencedExists_to_common h


theorem collapse_ch113c_incorporationHonored_modulo_guard
    {r : Ch113Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch113c r c)
    (h : Ch113Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_ch113c r) c :=
  corr_ch113c_incorporationHonored_to_common hg h


theorem collapse_ch113c_exceptionApplies_modulo_guard
    {r : Ch113Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch113c r c)
    (h : Ch113Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_ch113c r) c :=
  corr_ch113c_exceptionApplies_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch113Counterfeiting
