








import Proving.USC.Common.Types
import Proving.USC.T05.Rulemaking.Ontology.Types
import Proving.USC.T05.Rulemaking.Ontology.Predicates
import Proving.USC.T05.Rulemaking.Ontology.Statute

namespace Proving.USC.T05.Rulemaking.Ontology

open Proving.USC.Common



theorem isNotice_intro {n r c}
    (hN : IsNoticeOfProposedRuleMaking n c) (hR : IsProposedRule r c)
    : NoticeMembership n r c := ⟨hN, hR⟩



theorem isConciseStatement_intro {s n c}
    (hS : IsConciseGeneralStatement s c) (hN : IsNoticeOfProposedRuleMaking n c)
    : ConciseStatementMembership s n c := ⟨hS, hN⟩


theorem isGoodCause_intro {g c}
    (hG : IsGoodCauseFinding g c)
    : GoodCauseMembership g c := ⟨hG⟩

end Proving.USC.T05.Rulemaking.Ontology
