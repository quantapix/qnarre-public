































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.TitleVIIEnf.Elements.Predicates
import Proving.USC.T42.TitleVIIEnf.Procedure.Predicates
import Proving.USC.T42.TitleVIIEnf.Remedy.Predicates
import Proving.USC.T42.TitleVIIEnf.Sanction.Predicates
import Proving.USC.T42.TitleVIIEnf.Evidentiary.Predicates
import Proving.USC.T42.TitleVIIEnf.Structure.Predicates

namespace Proving.USC.Common.CollapseT42TitleVIIEnf

open Proving.USC.Common










axiom mapChargeE  : Proving.USC.T42.TitleVIIEnf.Elements.Charge → Person
axiom mapChargeP  : Proving.USC.T42.TitleVIIEnf.Procedure.Charge → Person
axiom mapAction   : Proving.USC.T42.TitleVIIEnf.Procedure.CivilAction → Person


axiom guard_window {R : Type} (r : R) (c : ComplaintText) : Prop


axiom bridge_elemChargeTimely_to_common
    {ch : Proving.USC.T42.TitleVIIEnf.Elements.Charge} {c : ComplaintText} :
    guard_window ch c →
    Proving.USC.T42.TitleVIIEnf.Elements.ChargeTimelyFiled ch c →
    WithinLimitations (mapChargeE ch) c

axiom bridge_elemSuitTimely_to_common
    {p : Person} {c : ComplaintText} :
    guard_window p c →
    Proving.USC.T42.TitleVIIEnf.Elements.SuitTimelyFiled p c → WithinLimitations p c

axiom bridge_elemFedSuitTimely_to_common
    {p : Person} {c : ComplaintText} :
    guard_window p c →
    Proving.USC.T42.TitleVIIEnf.Elements.FederalSuitTimelyFiled p c → WithinLimitations p c

axiom bridge_procChargeWindow_to_common
    {ch : Proving.USC.T42.TitleVIIEnf.Procedure.Charge} {c : ComplaintText} :
    guard_window ch c →
    Proving.USC.T42.TitleVIIEnf.Procedure.WithinChargeFilingWindow ch c →
    WithinLimitations (mapChargeP ch) c

axiom bridge_procSuitWindow_to_common
    {act : Proving.USC.T42.TitleVIIEnf.Procedure.CivilAction} {c : ComplaintText} :
    guard_window act c →
    Proving.USC.T42.TitleVIIEnf.Procedure.WithinNinetyDaySuitWindow act c →
    WithinLimitations (mapAction act) c

theorem collapse_lim_elemCharge_modulo_window
    {ch : Proving.USC.T42.TitleVIIEnf.Elements.Charge} {c : ComplaintText}
    (g : guard_window ch c)
    (h : Proving.USC.T42.TitleVIIEnf.Elements.ChargeTimelyFiled ch c) :
    WithinLimitations (mapChargeE ch) c :=
  bridge_elemChargeTimely_to_common g h
theorem collapse_lim_elemSuit_modulo_window
    {p : Person} {c : ComplaintText}
    (g : guard_window p c)
    (h : Proving.USC.T42.TitleVIIEnf.Elements.SuitTimelyFiled p c) : WithinLimitations p c :=
  bridge_elemSuitTimely_to_common g h
theorem collapse_lim_elemFedSuit_modulo_window
    {p : Person} {c : ComplaintText}
    (g : guard_window p c)
    (h : Proving.USC.T42.TitleVIIEnf.Elements.FederalSuitTimelyFiled p c) : WithinLimitations p c :=
  bridge_elemFedSuitTimely_to_common g h
theorem collapse_lim_procChargeWindow_modulo_window
    {ch : Proving.USC.T42.TitleVIIEnf.Procedure.Charge} {c : ComplaintText}
    (g : guard_window ch c)
    (h : Proving.USC.T42.TitleVIIEnf.Procedure.WithinChargeFilingWindow ch c) :
    WithinLimitations (mapChargeP ch) c :=
  bridge_procChargeWindow_to_common g h
theorem collapse_lim_procSuitWindow_modulo_window
    {act : Proving.USC.T42.TitleVIIEnf.Procedure.CivilAction} {c : ComplaintText}
    (g : guard_window act c)
    (h : Proving.USC.T42.TitleVIIEnf.Procedure.WithinNinetyDaySuitWindow act c) :
    WithinLimitations (mapAction act) c :=
  bridge_procSuitWindow_to_common g h








axiom bridge_venueProper_to_common
    {act : Proving.USC.T42.TitleVIIEnf.Procedure.CivilAction} {c : ComplaintText} :
    Proving.USC.T42.TitleVIIEnf.Procedure.VenueProper act c → VenueNexus (mapAction act) c

theorem collapse_venue_proc_arity_reconciled
    {act : Proving.USC.T42.TitleVIIEnf.Procedure.CivilAction} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVIIEnf.Procedure.VenueProper act c) : VenueNexus (mapAction act) c :=
  bridge_venueProper_to_common h











axiom mapRef : Proving.USC.T42.TitleVIIEnf.Structure.Ref → StructRef
axiom guard_targetResolves (r : Proving.USC.T42.TitleVIIEnf.Structure.Ref) (c : ComplaintText) : Prop

axiom bridge_refExists_to_common
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.TitleVIIEnf.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef r) c
axiom bridge_incorpHonored_to_common
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.TitleVIIEnf.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef r) c
axiom bridge_constraintSat_to_common
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.TitleVIIEnf.Structure.ConstraintSatisfied r c →
    StructuralReferenceCoheres (mapRef r) c
axiom bridge_exceptionApplies_to_common
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.TitleVIIEnf.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef r) c
axiom bridge_overrideTriggered_to_common
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.TitleVIIEnf.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef r) c
axiom bridge_savingsHonored_to_common
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.TitleVIIEnf.Structure.SavingsHonored r c →
    StructuralReferenceCoheres (mapRef r) c

theorem collapse_struct_refExists_clean
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVIIEnf.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef r) c :=
  bridge_refExists_to_common h
theorem collapse_struct_incorp_modulo_guard
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText}
    (g : guard_targetResolves r c)
    (h : Proving.USC.T42.TitleVIIEnf.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef r) c :=
  bridge_incorpHonored_to_common g h
theorem collapse_struct_constraint_modulo_guard
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText}
    (g : guard_targetResolves r c)
    (h : Proving.USC.T42.TitleVIIEnf.Structure.ConstraintSatisfied r c) :
    StructuralReferenceCoheres (mapRef r) c :=
  bridge_constraintSat_to_common g h
theorem collapse_struct_exception_modulo_guard
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText}
    (g : guard_targetResolves r c)
    (h : Proving.USC.T42.TitleVIIEnf.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef r) c :=
  bridge_exceptionApplies_to_common g h
theorem collapse_struct_override_modulo_guard
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText}
    (g : guard_targetResolves r c)
    (h : Proving.USC.T42.TitleVIIEnf.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef r) c :=
  bridge_overrideTriggered_to_common g h
theorem collapse_struct_savings_modulo_guard
    {r : Proving.USC.T42.TitleVIIEnf.Structure.Ref} {c : ComplaintText}
    (g : guard_targetResolves r c)
    (h : Proving.USC.T42.TitleVIIEnf.Structure.SavingsHonored r c) :
    StructuralReferenceCoheres (mapRef r) c :=
  bridge_savingsHonored_to_common g h








axiom bridge_respondentGovt_iff_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVIIEnf.Remedy.RespondentIsGovernment p c ↔ DefendantIsSovereign p c

theorem collapse_sovereign_iff
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVIIEnf.Remedy.RespondentIsGovernment p c ↔ DefendantIsSovereign p c :=
  bridge_respondentGovt_iff_common








axiom bridge_sanctionSought_iff_common
    {s : Sanction} {c : ComplaintText} :
    Proving.USC.T42.TitleVIIEnf.Sanction.SanctionSought s c ↔ SanctionSought s c

theorem collapse_sanction_iff
    {s : Sanction} {c : ComplaintText} :
    Proving.USC.T42.TitleVIIEnf.Sanction.SanctionSought s c ↔ SanctionSought s c :=
  bridge_sanctionSought_iff_common












axiom mapBearer : Proving.USC.T42.TitleVIIEnf.Evidentiary.Bearer → Bearer




def mapStd : Proving.USC.T42.TitleVIIEnf.Evidentiary.Standard → Standard
  | .Preponderance         => .Preponderance
  | .ClearAndConvincing    => .ClearAndConvincing
  | .BeyondReasonableDoubt => .BeyondReasonableDoubt
  | .ReasonableCause       => .ReasonableCause

axiom bridge_burdenCarried_to_common
    {b : Proving.USC.T42.TitleVIIEnf.Evidentiary.Bearer}
    {s : Proving.USC.T42.TitleVIIEnf.Evidentiary.Standard} {c : ComplaintText} :
    Proving.USC.T42.TitleVIIEnf.Evidentiary.BurdenCarried b s c →
    BurdenCarried (mapBearer b) (mapStd s) c

theorem collapse_burden_mapped
    {b : Proving.USC.T42.TitleVIIEnf.Evidentiary.Bearer}
    {s : Proving.USC.T42.TitleVIIEnf.Evidentiary.Standard} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVIIEnf.Evidentiary.BurdenCarried b s c) :
    BurdenCarried (mapBearer b) (mapStd s) c :=
  bridge_burdenCarried_to_common h




theorem collapse_burden_reasonableCause
    {b : Proving.USC.T42.TitleVIIEnf.Evidentiary.Bearer} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVIIEnf.Evidentiary.BurdenCarried b .ReasonableCause c) :
    BurdenCarried (mapBearer b) Standard.ReasonableCause c :=
  bridge_burdenCarried_to_common h

end Proving.USC.Common.CollapseT42TitleVIIEnf
