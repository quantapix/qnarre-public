














import Proving.USC.T18.Prohibited.Ontology.Statute
import Proving.USC.Common.Tactic

namespace Proving.USC.T18.Prohibited.Ontology

open Proving.USC.Common



@[grind →]
theorem enterpriseMembership_intro {e c}
    (hPurpose : HasCommonPurpose e c) (hRel : HasRelationships e c)
    (hLong : HasLongevity e c) : EnterpriseMembership e c :=
  ⟨hPurpose, hRel, hLong⟩



@[grind →]
theorem patternMembership_intro {pat c}
    (hMult : HasTwoOrMorePredicateActs pat c) (hRel : ActsAreRelated pat c)
    (hCont : ActsShowContinuity pat c) : PatternMembership pat c :=
  ⟨hMult, hRel, hCont⟩



theorem enterpriseMembership_derivable {e c}
    (hPurpose : HasCommonPurpose e c) (hRel : HasRelationships e c)
    (hLong : HasLongevity e c) : EnterpriseMembership e c := by
  prove_element



theorem patternMembership_derivable {pat c}
    (hMult : HasTwoOrMorePredicateActs pat c) (hRel : ActsAreRelated pat c)
    (hCont : ActsShowContinuity pat c) : PatternMembership pat c := by
  prove_element

end Proving.USC.T18.Prohibited.Ontology
