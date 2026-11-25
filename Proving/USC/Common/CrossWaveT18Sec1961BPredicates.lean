



















































import Proving.USC.Common.Predicates
import Proving.USC.Common.Types
import Proving.USC.T18.Sec1961BPredicates.Elements.Predicates
import Proving.USC.T18.Sec1961BPredicates.Deontic.Predicates
import Proving.USC.T18.Sec1961BPredicates.Scienter.Statute
import Proving.USC.T18.Sec1961BPredicates.Structure.Predicates
import Proving.USC.T18.Sec1961BPredicates.Procedure.Predicates

namespace Proving.USC.Common.CrossWaveT18Sec1961BPredicates

open Proving.USC.Common
open Proving.USC.T18.Sec1961BPredicates











axiom corr_transports_commerce {e : Entity} {prop : Elements.Property} {c : ComplaintText} :
    Elements.TransportsInInterstateCommerce prop c → EngagedInInterstateCommerce e c
axiom corr_crossedBoundary_commerce {e : Entity} {prop : Elements.Property} {c : ComplaintText} :
    Elements.CrossedStateOrUSBoundaryAfterStolen prop c → EngagedInInterstateCommerce e c
axiom corr_affectsCommerceOrMail {e : Entity} {doc : Elements.IdDocument} {c : ComplaintText} :
    Elements.AffectsInterstateCommerceOrMail doc c → EngagedInInterstateCommerce e c
axiom corr_accessDeviceCommerce {e : Entity} {d : Elements.AccessDevice} {c : ComplaintText} :
    Elements.AccessDeviceAffectsCommerce d c → EngagedInInterstateCommerce e c
axiom corr_transmitsWagerInfo {e : Entity} {w : Elements.WireComm} {c : ComplaintText} :
    Elements.TransmitsInterstateBetsOrWagerInfo w c → EngagedInInterstateCommerce e c
axiom corr_affectsCommerce_deontic {e : Entity} {c : ComplaintText} :
    Deontic.AffectsInterstateCommerce c → EngagedInInterstateCommerce e c

theorem collapse_transports_commerce {e : Entity} {prop : Elements.Property} {c : ComplaintText}
    (h : Elements.TransportsInInterstateCommerce prop c) : EngagedInInterstateCommerce e c :=
  corr_transports_commerce h
theorem collapse_crossedBoundary_commerce {e : Entity} {prop : Elements.Property} {c : ComplaintText}
    (h : Elements.CrossedStateOrUSBoundaryAfterStolen prop c) : EngagedInInterstateCommerce e c :=
  corr_crossedBoundary_commerce h
theorem collapse_affectsCommerceOrMail {e : Entity} {doc : Elements.IdDocument} {c : ComplaintText}
    (h : Elements.AffectsInterstateCommerceOrMail doc c) : EngagedInInterstateCommerce e c :=
  corr_affectsCommerceOrMail h
theorem collapse_accessDeviceCommerce {e : Entity} {d : Elements.AccessDevice} {c : ComplaintText}
    (h : Elements.AccessDeviceAffectsCommerce d c) : EngagedInInterstateCommerce e c :=
  corr_accessDeviceCommerce h
theorem collapse_transmitsWagerInfo {e : Entity} {w : Elements.WireComm} {c : ComplaintText}
    (h : Elements.TransmitsInterstateBetsOrWagerInfo w c) : EngagedInInterstateCommerce e c :=
  corr_transmitsWagerInfo h
theorem collapse_affectsCommerce_deontic {e : Entity} {c : ComplaintText}
    (h : Deontic.AffectsInterstateCommerce c) : EngagedInInterstateCommerce e c :=
  corr_affectsCommerce_deontic h








axiom corr_knowsStolen {p : Person} {prop : Elements.Property} {c : ComplaintText} :
    Elements.KnowsPropertyStolen p prop c → ActedWithScienter p c
axiom corr_unlawfulIntent {p : Person} {c : ComplaintText} :
    Elements.UnlawfulOrFraudulentIntent p c → ActedWithScienter p c
axiom corr_knowsCounterfeited {p : Person} {prop : Elements.Property} {c : ComplaintText} :
    Elements.KnowsCounterfeited p prop c → ActedWithScienter p c
axiom corr_actedKnowingly1028 {p : Person} {c : ComplaintText} :
    Elements.ActedKnowingly1028 p c → ActedWithScienter p c
axiom corr_intentToDefraud1029 {p : Person} {c : ComplaintText} :
    Elements.IntentToDefraud1029 p c → ActedWithScienter p c
axiom corr_actedKnowingly_deontic {p : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly p c → ActedWithScienter p c

theorem collapse_knowsStolen {p : Person} {prop : Elements.Property} {c : ComplaintText}
    (h : Elements.KnowsPropertyStolen p prop c) : ActedWithScienter p c := corr_knowsStolen h
theorem collapse_unlawfulIntent {p : Person} {c : ComplaintText}
    (h : Elements.UnlawfulOrFraudulentIntent p c) : ActedWithScienter p c := corr_unlawfulIntent h
theorem collapse_knowsCounterfeited {p : Person} {prop : Elements.Property} {c : ComplaintText}
    (h : Elements.KnowsCounterfeited p prop c) : ActedWithScienter p c := corr_knowsCounterfeited h
theorem collapse_actedKnowingly1028 {p : Person} {c : ComplaintText}
    (h : Elements.ActedKnowingly1028 p c) : ActedWithScienter p c := corr_actedKnowingly1028 h
theorem collapse_intentToDefraud1029 {p : Person} {c : ComplaintText}
    (h : Elements.IntentToDefraud1029 p c) : ActedWithScienter p c := corr_intentToDefraud1029 h
theorem collapse_actedKnowingly_deontic {p : Person} {c : ComplaintText}
    (h : Deontic.ActedKnowingly p c) : ActedWithScienter p c := corr_actedKnowingly_deontic h












def mapRung : Scienter.MentalState → MentalState
  | .StrictLiability => .StrictLiability
  | .Negligence      => .Negligence
  | .Recklessness    => .Recklessness
  | .Knowledge       => .Knowledge
  | .Specific        => .Specific


theorem mapRung_rank (r : Scienter.MentalState) :
    (mapRung r).rank = (match r with
      | .StrictLiability => 0 | .Negligence => 1 | .Recklessness => 2
      | .Knowledge => 3 | .Specific => 4) := by
  cases r <;> rfl



axiom corr_mentalStateProven {p : Person} {rung : Scienter.MentalState} {c : ComplaintText} :
    Scienter.MentalStateProven p rung c → MentalStateProven p (mapRung rung) c



theorem collapse_mentalStateProven {p : Person} {rung : Scienter.MentalState} {c : ComplaintText}
    (h : Scienter.MentalStateProven p rung c) : MentalStateProven p (mapRung rung) c :=
  corr_mentalStateProven h











def kindTag : Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef (r : Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag r.kind }


axiom guard_targetResolves (r : Structure.Ref) (c : ComplaintText) : Prop

axiom corr_referencedExists {r : Structure.Ref} {c : ComplaintText} :
    Structure.ReferencedSectionExists r c → StructuralReferenceCoheres (mapRef r) c
axiom corr_incorporationHonored {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c → Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef r) c
axiom corr_exceptionApplies {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c → Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef r) c
axiom corr_overrideTriggered {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c → Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef r) c
axiom corr_savingsPreserved {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c → Structure.SavingsPreserved r c →
    StructuralReferenceCoheres (mapRef r) c

theorem collapse_referencedExists {r : Structure.Ref} {c : ComplaintText}
    (h : Structure.ReferencedSectionExists r c) : StructuralReferenceCoheres (mapRef r) c :=
  corr_referencedExists h
theorem collapse_incorporationHonored_modulo_guard {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves r c) (h : Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef r) c := corr_incorporationHonored hg h
theorem collapse_exceptionApplies_modulo_guard {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves r c) (h : Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef r) c := corr_exceptionApplies hg h
theorem collapse_overrideTriggered_modulo_guard {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves r c) (h : Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef r) c := corr_overrideTriggered hg h
theorem collapse_savingsPreserved_modulo_guard {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves r c) (h : Structure.SavingsPreserved r c) :
    StructuralReferenceCoheres (mapRef r) c := corr_savingsPreserved hg h








axiom corr_federalCircumstance {c : ComplaintText} :
    Procedure.FederalCircumstanceMet c → FederalJurisdictionalNexus c

theorem collapse_federalCircumstance {c : ComplaintText}
    (h : Procedure.FederalCircumstanceMet c) : FederalJurisdictionalNexus c :=
  corr_federalCircumstance h

end Proving.USC.Common.CrossWaveT18Sec1961BPredicates
