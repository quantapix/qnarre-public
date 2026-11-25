import Proving.USC.T18.Ch77.Part2.Structure.Types
import Proving.USC.T18.Ch77.Part2.Structure.Predicates

set_option autoImplicit false














namespace Proving.USC.T18.Ch77.Part2.Structure

open Proving.USC.Common









inductive AgeKnowledgeProofPath (c : ComplaintText) : Prop where


  | scienterAsWritten :
      ¬ ExceptionApplies edge_1591a_exceptAsProvided_1591c c →
      IncorporationHonored edge_1591a_incorporates_1591e3 c →
      AgeKnowledgeProofPath c



  | observationOverride :
      ExceptionApplies edge_1591a_exceptAsProvided_1591c c →
      ExceptionHonored edge_1591a_exceptAsProvided_1591c c →
      OverrideTriggered edge_1591c_lexSpecialis_1591a1 c →
      AgeKnowledgeProofPath c





structure Coherent1591 (c : ComplaintText) : Prop where

  refsExist : ∀ r ∈ edges1591, ReferencedSectionExists r c

  internalRefsResolve : ∀ r ∈ internalEdges1591, SubsectionReferenceResolves r c

  incorporationsHonored : ∀ r ∈ incorporationEdges1591, IncorporationHonored r c

  exceptionsHonored :
    ∀ r ∈ exceptionEdges1591, ExceptionApplies r c → ExceptionHonored r c

  overridesHonored :
    ∀ r ∈ overrideEdges1591, OverrideTriggered r c → IncorporationHonored r c

  definitionsUsed : ∀ t ∈ definedTerms1591, DefinedTermIsUsed t c

  ageProofPath : AgeKnowledgeProofPath c

  noDanglingRefs : danglingReferenceCount c = 0




structure ExternalRefsResolve1591 (c : ComplaintText) : Prop where

  targetsExist : ∀ r ∈ externalEdges1591, ReferencedSectionExists r c

  honored : ∀ r ∈ externalEdges1591, IncorporationHonored r c

end Proving.USC.T18.Ch77.Part2.Structure
