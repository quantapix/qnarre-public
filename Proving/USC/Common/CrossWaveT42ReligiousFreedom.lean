


















































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.ReligiousFreedom.Elements.Predicates
import Proving.USC.T42.ReligiousFreedom.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT42ReligiousFreedom

open Proving.USC.Common




















axiom bridge_onBasisOfRCN_to_common
    {p : Person} {d : Proving.USC.T42.ReligiousFreedom.Elements.PlacementDecision}
    {c : ComplaintText} :
    Proving.USC.T42.ReligiousFreedom.Elements.OnBasisOfRaceColorNationalOrigin p d c →
    OnProtectedGround p c

theorem collapse_P1_clean
    {p : Person} {d : Proving.USC.T42.ReligiousFreedom.Elements.PlacementDecision}
    {c : ComplaintText}
    (h : Proving.USC.T42.ReligiousFreedom.Elements.OnBasisOfRaceColorNationalOrigin p d c) :
    OnProtectedGround p c :=
  bridge_onBasisOfRCN_to_common h


























axiom mapRef_T42RF : Proving.USC.T42.ReligiousFreedom.Structure.Ref → StructRef






axiom guard_targetResolves
    (r : Proving.USC.T42.ReligiousFreedom.Structure.Ref) (c : ComplaintText) : Prop




axiom bridge_referencedSectionExists_to_common
    {r : Proving.USC.T42.ReligiousFreedom.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.ReligiousFreedom.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T42RF r) c





axiom bridge_incorporationHonored_to_common
    {r : Proving.USC.T42.ReligiousFreedom.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.ReligiousFreedom.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T42RF r) c




axiom bridge_overrideTriggered_to_common
    {r : Proving.USC.T42.ReligiousFreedom.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.ReligiousFreedom.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T42RF r) c




axiom bridge_savingsHonored_to_common
    {r : Proving.USC.T42.ReligiousFreedom.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.ReligiousFreedom.Structure.SavingsHonored r c →
    StructuralReferenceCoheres (mapRef_T42RF r) c

theorem collapse_S3_clean
    {r : Proving.USC.T42.ReligiousFreedom.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.ReligiousFreedom.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T42RF r) c :=
  bridge_referencedSectionExists_to_common h

theorem collapse_S4_modulo_guard
    {r : Proving.USC.T42.ReligiousFreedom.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.ReligiousFreedom.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T42RF r) c :=
  bridge_incorporationHonored_to_common guard h

theorem collapse_S5_modulo_guard
    {r : Proving.USC.T42.ReligiousFreedom.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.ReligiousFreedom.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T42RF r) c :=
  bridge_overrideTriggered_to_common guard h

theorem collapse_S6_modulo_guard
    {r : Proving.USC.T42.ReligiousFreedom.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.ReligiousFreedom.Structure.SavingsHonored r c) :
    StructuralReferenceCoheres (mapRef_T42RF r) c :=
  bridge_savingsHonored_to_common guard h

end Proving.USC.Common.CrossWaveT42ReligiousFreedom
