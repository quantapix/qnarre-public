import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Tail.Structure.Types
import Proving.USC.T42.Ch21Tail.Structure.Predicates
import Proving.USC.T42.Ch21Tail.Structure.Statute

set_option autoImplicit false








namespace Proving.USC.T42.Ch21Tail.Structure

open Proving.USC.Common


theorem subchapterViolationReferenceResolved_viaConditionWithinScope_intro
    {c : ComplaintText}
    (hScope : ReportedConditionWithinSubchapterScope c) :
    SubchapterViolationReferenceResolved c :=
  .viaConditionWithinScope hScope


theorem subchapterViolationReferenceResolved_viaPotentialApplication_intro
    {c : ComplaintText}
    (hHonored : IncorporationHonored edge1997dIncorporatesSubchapter c) :
    SubchapterViolationReferenceResolved c :=
  .viaPotentialApplication hHonored


theorem coherent1997d_intro
    {c : ComplaintText}
    (hExists : ReferencedSectionExists edge1997dIncorporatesSubchapter c)
    (hResolved : SubchapterViolationReferenceResolved c) :
    Coherent1997d c :=
  ⟨hExists, hResolved⟩


theorem coherent1997g_intro
    {inst : Entity} {c : ComplaintText}
    (hCoverageSource : ReferencedSectionExists edge1997gIncorporatesSubchapterCoverage c)
    (hCovered : InstitutionCoveredBySubchapter inst c)
    (hRights : ConstitutionalOrFederalRightsReferenceResolves c)
    (hLitigationExists : ReferencedSectionExists edge1997gIncorporatesSubchapterLitigation c)
    (hLitigationHonored : IncorporationHonored edge1997gIncorporatesSubchapterLitigation c)
    (hSavings : SavingsClausePreserved edge1997gSavingsNoFundRedirection c) :
    Coherent1997g inst c :=
  ⟨hCoverageSource, hCovered, hRights, hLitigationExists, hLitigationHonored, hSavings⟩


theorem ch21TailReferencesResolve_intro
    {inst : Entity} {c : ComplaintText}
    (h1997d : Coherent1997d c)
    (h1997g : Coherent1997g inst c) :
    Ch21TailReferencesResolve inst c :=
  ⟨h1997d, h1997g⟩

end Proving.USC.T42.Ch21Tail.Structure
