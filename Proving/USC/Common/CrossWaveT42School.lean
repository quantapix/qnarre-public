


























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.SchoolDesegregation.Elements.Predicates
import Proving.USC.T42.SchoolDesegregation.Deontic.Predicates
import Proving.USC.T42.SchoolDesegregation.Ontology.Predicates
import Proving.USC.T42.SchoolDesegregation.Procedure.Predicates
import Proving.USC.T42.SchoolDesegregation.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT42School

open Proving.USC.Common


























axiom bridge_rightToSue_iff_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.SchoolDesegregation.Elements.HasRightToSueForPublicEducationDiscrimination p c ↔
    HasPrivateRightOfAction p c




axiom bridge_preservesPrivateRight_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.SchoolDesegregation.Ontology.PreservesPrivateRight p c →
    HasPrivateRightOfAction p c




axiom bridge_privateRightOfSuitPreserved_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.SchoolDesegregation.Procedure.PrivateRightOfSuitPreserved p c →
    HasPrivateRightOfAction p c




axiom bridge_personSuesForRelief_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.SchoolDesegregation.Deontic.PersonSuesForRelief p c →
    HasPrivateRightOfAction p c

theorem collapse_P1a_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.SchoolDesegregation.Elements.HasRightToSueForPublicEducationDiscrimination p c) :
    HasPrivateRightOfAction p c :=
  (bridge_rightToSue_iff_common).mp h

theorem collapse_P1a_clean_rev
    {p : Person} {c : ComplaintText}
    (h : HasPrivateRightOfAction p c) :
    Proving.USC.T42.SchoolDesegregation.Elements.HasRightToSueForPublicEducationDiscrimination p c :=
  (bridge_rightToSue_iff_common).mpr h

theorem collapse_P1c_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.SchoolDesegregation.Ontology.PreservesPrivateRight p c) :
    HasPrivateRightOfAction p c :=
  bridge_preservesPrivateRight_to_common h

theorem collapse_P1d_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.SchoolDesegregation.Procedure.PrivateRightOfSuitPreserved p c) :
    HasPrivateRightOfAction p c :=
  bridge_privateRightOfSuitPreserved_to_common h

theorem collapse_P1b_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.SchoolDesegregation.Deontic.PersonSuesForRelief p c) :
    HasPrivateRightOfAction p c :=
  bridge_personSuesForRelief_to_common h

















axiom mapRef_T42School : Proving.USC.T42.SchoolDesegregation.Structure.Ref → StructRef





axiom guard_targetResolves (r : Proving.USC.T42.SchoolDesegregation.Structure.Ref) (c : ComplaintText) : Prop



axiom bridge_referencedSectionExists_to_common
    {r : Proving.USC.T42.SchoolDesegregation.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.SchoolDesegregation.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T42School r) c




axiom bridge_incorporationHonored_to_common
    {r : Proving.USC.T42.SchoolDesegregation.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.SchoolDesegregation.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T42School r) c




axiom bridge_savingsClausePreserved_to_common
    {r : Proving.USC.T42.SchoolDesegregation.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.SchoolDesegregation.Structure.SavingsClausePreserved r c →
    StructuralReferenceCoheres (mapRef_T42School r) c

theorem collapse_S1_clean
    {r : Proving.USC.T42.SchoolDesegregation.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.SchoolDesegregation.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T42School r) c :=
  bridge_referencedSectionExists_to_common h

theorem collapse_S2_modulo_guard
    {r : Proving.USC.T42.SchoolDesegregation.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.SchoolDesegregation.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T42School r) c :=
  bridge_incorporationHonored_to_common guard h

theorem collapse_S3_modulo_guard
    {r : Proving.USC.T42.SchoolDesegregation.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.SchoolDesegregation.Structure.SavingsClausePreserved r c) :
    StructuralReferenceCoheres (mapRef_T42School r) c :=
  bridge_savingsClausePreserved_to_common guard h

end Proving.USC.Common.CrossWaveT42School
