







































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.SchoolDesegregationAid.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT42SchoolAid

open Proving.USC.Common




























axiom mapRef_T42SchoolAid :
    Proving.USC.T42.SchoolDesegregationAid.Structure.Ref → StructRef





axiom guard_targetResolves
    (r : Proving.USC.T42.SchoolDesegregationAid.Structure.Ref) (c : ComplaintText) : Prop



axiom bridge_referencedSectionExists_to_common
    {r : Proving.USC.T42.SchoolDesegregationAid.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.SchoolDesegregationAid.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T42SchoolAid r) c




axiom bridge_incorporationHonored_to_common
    {r : Proving.USC.T42.SchoolDesegregationAid.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.SchoolDesegregationAid.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T42SchoolAid r) c

theorem collapse_S1_clean
    {r : Proving.USC.T42.SchoolDesegregationAid.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.SchoolDesegregationAid.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T42SchoolAid r) c :=
  bridge_referencedSectionExists_to_common h

theorem collapse_S2_modulo_guard
    {r : Proving.USC.T42.SchoolDesegregationAid.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.SchoolDesegregationAid.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T42SchoolAid r) c :=
  bridge_incorporationHonored_to_common guard h

end Proving.USC.Common.CrossWaveT42SchoolAid
