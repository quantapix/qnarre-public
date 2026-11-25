






















































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.ADA.Elements.Predicates
import Proving.USC.T42.ADA.Deontic.Predicates
import Proving.USC.T42.ADA.Ontology.Predicates
import Proving.USC.T42.ADA.Structure.Predicates
import Proving.USC.T42.TitleVII.Ontology.Predicates
import Proving.USC.T42.TitleVIIDef.Ontology.Predicates





namespace Proving.USC.Common.CrossWaveT42ADA

open Proving.USC.Common






















axiom mapPI_T42ADA : Proving.USC.T42.ADA.Deontic.ProtectedIndividual → Person



axiom corr_engagedInProtectedActivityADA_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Elements.EngagedInProtectedActivityADA p c →
    EngagedInProtectedConduct p c





axiom corr_conditionMet12203a_to_common
    {i : Proving.USC.T42.ADA.Deontic.ProtectedIndividual} {c : ComplaintText} :
    Proving.USC.T42.ADA.Deontic.ConditionMet12203a i c →
    EngagedInProtectedConduct (mapPI_T42ADA i) c


theorem collapse_engagedInProtectedActivityADA_to
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Elements.EngagedInProtectedActivityADA p c) :
    EngagedInProtectedConduct p c :=
  corr_engagedInProtectedActivityADA_to_common h


theorem collapse_conditionMet12203a_to
    {i : Proving.USC.T42.ADA.Deontic.ProtectedIndividual} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Deontic.ConditionMet12203a i c) :
    EngagedInProtectedConduct (mapPI_T42ADA i) c :=
  corr_conditionMet12203a_to_common h














axiom mapRef_T42ADA : Proving.USC.T42.ADA.Structure.Ref → StructRef
axiom guard_targetResolves
    (r : Proving.USC.T42.ADA.Structure.Ref) (c : ComplaintText) : Prop



axiom bridge_referencedSectionExists_to_common
    {r : Proving.USC.T42.ADA.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.ADA.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T42ADA r) c




axiom bridge_incorporationHonored_to_common
    {r : Proving.USC.T42.ADA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.ADA.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T42ADA r) c




axiom bridge_subjectionSatisfied_to_common
    {r : Proving.USC.T42.ADA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.ADA.Structure.SubjectionSatisfied r c →
    StructuralReferenceCoheres (mapRef_T42ADA r) c

theorem collapse_referencedSectionExists
    {r : Proving.USC.T42.ADA.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T42ADA r) c :=
  bridge_referencedSectionExists_to_common h

theorem collapse_incorporationHonored_modulo_guard
    {r : Proving.USC.T42.ADA.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.ADA.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T42ADA r) c :=
  bridge_incorporationHonored_to_common guard h

theorem collapse_subjectionSatisfied_modulo_guard
    {r : Proving.USC.T42.ADA.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.ADA.Structure.SubjectionSatisfied r c) :
    StructuralReferenceCoheres (mapRef_T42ADA r) c :=
  bridge_subjectionSatisfied_to_common guard h















axiom mapEmployer_T42VII : Proving.USC.T42.TitleVII.Ontology.Employer → Person



axiom mint_isEmployerADA_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Ontology.IsEmployer p c ↔ IsEmployer p c



axiom mint_isEmployerT42VII_to {e : Proving.USC.T42.TitleVII.Ontology.Employer}
    {c : ComplaintText} :
    Proving.USC.T42.TitleVII.Ontology.IsEmployer e c →
    IsEmployer (mapEmployer_T42VII e) c


theorem mint_w1_isEmployerADA_to
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Ontology.IsEmployer p c) :
    IsEmployer p c :=
  (mint_isEmployerADA_iff).mp h


theorem mint_w2_isEmployerT42VII_to
    {e : Proving.USC.T42.TitleVII.Ontology.Employer} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVII.Ontology.IsEmployer e c) :
    IsEmployer (mapEmployer_T42VII e) c :=
  mint_isEmployerT42VII_to h

end Proving.USC.Common.CrossWaveT42ADA
