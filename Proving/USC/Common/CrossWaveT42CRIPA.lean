











































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.CRIPA.Structure.Predicates
import Proving.USC.T42.CRIPA.Elements.Predicates
import Proving.USC.T42.TitleVIIDef.Deontic.Predicates
import Proving.USC.T42.TitleVII.Elements.Predicates

namespace Proving.USC.Common.CrossWaveT42CRIPA

open Proving.USC.Common














axiom mapRef_T42CRIPA : Proving.USC.T42.CRIPA.Structure.Ref → StructRef
axiom guard_targetResolves
    (r : Proving.USC.T42.CRIPA.Structure.Ref) (c : ComplaintText) : Prop



axiom bridge_referencedSectionExists_to_common
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.CRIPA.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c



axiom bridge_incorporationHonored_to_common
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.CRIPA.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c




axiom bridge_exceptionApplies_to_common
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.CRIPA.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c




axiom bridge_overrideTriggered_to_common
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.CRIPA.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c




axiom bridge_savingsClauseRespected_to_common
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.CRIPA.Structure.SavingsClauseRespected r c →
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c

theorem collapse_referencedSectionExists
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.CRIPA.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c :=
  bridge_referencedSectionExists_to_common h

theorem collapse_incorporationHonored_modulo_guard
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.CRIPA.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c :=
  bridge_incorporationHonored_to_common guard h

theorem collapse_exceptionApplies_modulo_guard
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.CRIPA.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c :=
  bridge_exceptionApplies_to_common guard h

theorem collapse_overrideTriggered_modulo_guard
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.CRIPA.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c :=
  bridge_overrideTriggered_to_common guard h

theorem collapse_savingsClauseRespected_modulo_guard
    {r : Proving.USC.T42.CRIPA.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.CRIPA.Structure.SavingsClauseRespected r c) :
    StructuralReferenceCoheres (mapRef_T42CRIPA r) c :=
  bridge_savingsClauseRespected_to_common guard h










axiom corr_reportedConditions_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T42.CRIPA.Elements.ReportedConditions p c →
    EngagedInProtectedConduct p c

axiom corr_protectedActivityOccurred_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVIIDef.Deontic.ProtectedActivityOccurred p c →
    EngagedInProtectedConduct p c

axiom corr_engagedInProtectedActivity_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVII.Elements.EngagedInProtectedActivity p c →
    EngagedInProtectedConduct p c



theorem collapse_reportedConditions_to
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.CRIPA.Elements.ReportedConditions p c) :
    EngagedInProtectedConduct p c :=
  corr_reportedConditions_to_common h



theorem collapse_w1_protectedActivityOccurred_to
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVIIDef.Deontic.ProtectedActivityOccurred p c) :
    EngagedInProtectedConduct p c :=
  corr_protectedActivityOccurred_to_common h



theorem collapse_w2_engagedInProtectedActivity_to
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVII.Elements.EngagedInProtectedActivity p c) :
    EngagedInProtectedConduct p c :=
  corr_engagedInProtectedActivity_to_common h

end Proving.USC.Common.CrossWaveT42CRIPA
