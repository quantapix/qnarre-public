import Proving.USC.T18.Ch77.Part2.Structure.Types
import Proving.USC.T18.Ch77.Part2.Structure.Predicates
import Proving.USC.T18.Ch77.Part2.Structure.Statute

set_option autoImplicit false







namespace Proving.USC.T18.Ch77.Part2.Structure

open Proving.USC.Common


theorem coherent1591_intro {c : ComplaintText}
    (hRefs : ∀ r ∈ edges1591, ReferencedSectionExists r c)
    (hInternal : ∀ r ∈ internalEdges1591, SubsectionReferenceResolves r c)
    (hInc : ∀ r ∈ incorporationEdges1591, IncorporationHonored r c)
    (hExc : ∀ r ∈ exceptionEdges1591, ExceptionApplies r c → ExceptionHonored r c)
    (hOvr : ∀ r ∈ overrideEdges1591, OverrideTriggered r c → IncorporationHonored r c)
    (hDefs : ∀ t ∈ definedTerms1591, DefinedTermIsUsed t c)
    (hAge : AgeKnowledgeProofPath c)
    (hNoDangle : danglingReferenceCount c = 0)
    : Coherent1591 c :=
  { refsExist := hRefs
  , internalRefsResolve := hInternal
  , incorporationsHonored := hInc
  , exceptionsHonored := hExc
  , overridesHonored := hOvr
  , definitionsUsed := hDefs
  , ageProofPath := hAge
  , noDanglingRefs := hNoDangle }


theorem ageKnowledgeProofPath_scienterAsWritten_intro {c : ComplaintText}
    (hNoCarve : ¬ ExceptionApplies edge_1591a_exceptAsProvided_1591c c)
    (hCsa : IncorporationHonored edge_1591a_incorporates_1591e3 c)
    : AgeKnowledgeProofPath c :=
  .scienterAsWritten hNoCarve hCsa


theorem ageKnowledgeProofPath_observationOverride_intro {c : ComplaintText}
    (hApplies : ExceptionApplies edge_1591a_exceptAsProvided_1591c c)
    (hHonored : ExceptionHonored edge_1591a_exceptAsProvided_1591c c)
    (hOverride : OverrideTriggered edge_1591c_lexSpecialis_1591a1 c)
    : AgeKnowledgeProofPath c :=
  .observationOverride hApplies hHonored hOverride


theorem externalRefsResolve1591_intro {c : ComplaintText}
    (hExists : ∀ r ∈ externalEdges1591, ReferencedSectionExists r c)
    (hHonored : ∀ r ∈ externalEdges1591, IncorporationHonored r c)
    : ExternalRefsResolve1591 c :=
  { targetsExist := hExists, honored := hHonored }




theorem coherent1591_externalRefsResolve {c : ComplaintText}
    (h : Coherent1591 c)
    (hSubEdges : ∀ r ∈ externalEdges1591, r ∈ edges1591)
    (hSubInc : ∀ r ∈ externalEdges1591, r ∈ incorporationEdges1591)
    : ExternalRefsResolve1591 c :=
  { targetsExist := fun r hr => h.refsExist r (hSubEdges r hr)
  , honored := fun r hr => h.incorporationsHonored r (hSubInc r hr) }

end Proving.USC.T18.Ch77.Part2.Structure
