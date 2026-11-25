






























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21Misc.Elements.Predicates
import Proving.USC.T42.Ch21Misc.Ontology.Predicates
import Proving.USC.T42.Ch21Misc.Structure.Predicates
import Proving.TitleVI.Predicates

namespace Proving.USC.Common.CollapseT42Ch21Misc

open Proving.USC.Common
open Proving.USC.T42.Ch21Misc
























axiom corr_ffa_elements (e : Entity) (c : ComplaintText) :
    Elements.ReceivesFederalFinancialAssistance e c ↔
      IsFederalFundingRecipient e c



axiom corr_ffa_ontology (e : Entity) (c : ComplaintText) :
    Ontology.ReceivesFederalFinancialAssistance e c ↔
      IsFederalFundingRecipient e c


theorem collapse_ffa_elements_iff (e : Entity) (c : ComplaintText) :
    Elements.ReceivesFederalFinancialAssistance e c ↔
      IsFederalFundingRecipient e c :=
  corr_ffa_elements e c


theorem collapse_ffa_ontology_iff (e : Entity) (c : ComplaintText) :
    Ontology.ReceivesFederalFinancialAssistance e c ↔
      IsFederalFundingRecipient e c :=
  corr_ffa_ontology e c




theorem ffa_elements_iff_ontology (e : Entity) (c : ComplaintText) :
    Elements.ReceivesFederalFinancialAssistance e c ↔
      Ontology.ReceivesFederalFinancialAssistance e c :=
  (corr_ffa_elements e c).trans (corr_ffa_ontology e c).symm



axiom recipientToEntity : Proving.TitleVI.Recipient → Entity


axiom complaintOfTitleVI : Proving.TitleVI.ComplaintText → ComplaintText




axiom corr_ffa_golden (r : Proving.TitleVI.Recipient)
    (gc : Proving.TitleVI.ComplaintText) :
    Proving.TitleVI.ReceivesFederalFinancialAssistance r gc ↔
      IsFederalFundingRecipient (recipientToEntity r) (complaintOfTitleVI gc)





theorem collapse_ffa_golden_iff (r : Proving.TitleVI.Recipient)
    (gc : Proving.TitleVI.ComplaintText) :
    Proving.TitleVI.ReceivesFederalFinancialAssistance r gc ↔
      IsFederalFundingRecipient (recipientToEntity r) (complaintOfTitleVI gc) :=
  corr_ffa_golden r gc





axiom fundingRecipient_implies_jurisdictionalNexus
    {e : Entity} {c : ComplaintText} :
    IsFederalFundingRecipient e c → FederalJurisdictionalNexus c

theorem collapse_ffa_elements_to_nexus {e : Entity} {c : ComplaintText}
    (h : Elements.ReceivesFederalFinancialAssistance e c) :
    FederalJurisdictionalNexus c :=
  fundingRecipient_implies_jurisdictionalNexus ((corr_ffa_elements e c).mp h)















axiom entityActor : Entity → Person



axiom corr_scienter (e : Entity) (c : ComplaintText) :
    Elements.ActedWithScienter e c ↔
      MentalStateProven (entityActor e) MentalState.Knowledge c



theorem collapse_scienter_iff (e : Entity) (c : ComplaintText) :
    Elements.ActedWithScienter e c ↔
      MentalStateProven (entityActor e) MentalState.Knowledge c :=
  corr_scienter e c





theorem scienter_rung_dominates (rung : MentalState)
    (h : rung.rank ≤ MentalState.Knowledge.rank) :
    MentalState.Knowledge.atLeast rung :=
  h


























def kindTag : Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def refToCommon (r : Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag r.kind }




axiom guard_targetResolves (r : Structure.Ref) (c : ComplaintText) : Prop


axiom corr_referencedExists (r : Structure.Ref) (c : ComplaintText) :
    Structure.ReferencedSectionExists r c →
      StructuralReferenceCoheres (refToCommon r) c


axiom corr_incorporationHonored (r : Structure.Ref) (c : ComplaintText) :
    guard_targetResolves r c → Structure.IncorporationHonored r c →
      StructuralReferenceCoheres (refToCommon r) c


axiom corr_exceptionApplies (r : Structure.Ref) (c : ComplaintText) :
    guard_targetResolves r c → Structure.ExceptionApplies r c →
      StructuralReferenceCoheres (refToCommon r) c


axiom corr_overrideTriggered (r : Structure.Ref) (c : ComplaintText) :
    guard_targetResolves r c → Structure.OverrideTriggered r c →
      StructuralReferenceCoheres (refToCommon r) c


axiom corr_savingsPreserved (r : Structure.Ref) (c : ComplaintText) :
    guard_targetResolves r c → Structure.SavingsPreserved r c →
      StructuralReferenceCoheres (refToCommon r) c


axiom corr_lexSpecialisControls (r : Structure.Ref) (c : ComplaintText) :
    guard_targetResolves r c → Structure.LexSpecialisControls r c →
      StructuralReferenceCoheres (refToCommon r) c


theorem collapse_structure_referenced
    (r : Structure.Ref) (c : ComplaintText)
    (h : Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (refToCommon r) c :=
  corr_referencedExists r c h


theorem collapse_structure_incorporation
    (r : Structure.Ref) (c : ComplaintText)
    (guard : guard_targetResolves r c)
    (h : Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (refToCommon r) c :=
  corr_incorporationHonored r c guard h


theorem collapse_structure_exception
    (r : Structure.Ref) (c : ComplaintText)
    (guard : guard_targetResolves r c)
    (h : Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (refToCommon r) c :=
  corr_exceptionApplies r c guard h


theorem collapse_structure_override
    (r : Structure.Ref) (c : ComplaintText)
    (guard : guard_targetResolves r c)
    (h : Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (refToCommon r) c :=
  corr_overrideTriggered r c guard h


theorem collapse_structure_savings
    (r : Structure.Ref) (c : ComplaintText)
    (guard : guard_targetResolves r c)
    (h : Structure.SavingsPreserved r c) :
    StructuralReferenceCoheres (refToCommon r) c :=
  corr_savingsPreserved r c guard h


theorem collapse_structure_lexSpecialis
    (r : Structure.Ref) (c : ComplaintText)
    (guard : guard_targetResolves r c)
    (h : Structure.LexSpecialisControls r c) :
    StructuralReferenceCoheres (refToCommon r) c :=
  corr_lexSpecialisControls r c guard h




example :
    refToCommon Structure.edge_2000e17_incorporates_t5s554 =
      ({ source := "42 USC § 2000e-17", target := "5 USC § 554",
         kind := "Incorporates" } : StructRef) :=
  rfl

end Proving.USC.Common.CollapseT42Ch21Misc
