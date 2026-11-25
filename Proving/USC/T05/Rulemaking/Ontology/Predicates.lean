











import Proving.USC.Common.Types
import Proving.USC.T05.Rulemaking.Ontology.Types

namespace Proving.USC.T05.Rulemaking.Ontology

open Proving.USC.Common





axiom IsNoticeOfProposedRuleMaking (n : NoticeOfProposedRuleMaking) (c : ComplaintText) : Prop




axiom IsProposedRule (r : ProposedRule) (c : ComplaintText) : Prop



axiom IsInterpretativeRule (r : InterpretativeRule) (c : ComplaintText) : Prop



axiom IsGeneralStatementOfPolicy (r : GeneralStatementOfPolicy) (c : ComplaintText) : Prop




axiom IsProceduralRule (r : ProceduralRule) (c : ComplaintText) : Prop



axiom IsSubstantiveRule (r : SubstantiveRule) (c : ComplaintText) : Prop




axiom IsConciseGeneralStatement (s : ConciseGeneralStatement) (c : ComplaintText) : Prop




axiom IsGoodCauseFinding (g : GoodCauseFinding) (c : ComplaintText) : Prop




axiom IsRulePetition (p : RulePetition) (c : ComplaintText) : Prop

end Proving.USC.T05.Rulemaking.Ontology
