























































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21Misc.Procedure.Predicates
import Proving.USC.T05.Elements.Predicates
import Proving.USC.T05.Procedure.Predicates

namespace Proving.USC.Common.CrossWaveCh21MiscT05Adjudication

open Proving.USC.Common








axiom entityToPerson : Entity → Person

axiom elemProcToParty : Proving.USC.T05.Elements.Proceeding → Person

axiom procToParty : Proving.USC.T05.Procedure.AgencyProceeding → Person







axiom bridge_t42_fullHearing_to_common
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.Ch21Misc.Procedure.FullHearingAndAdjudicationAccorded e c →
    FormalAdjudicationAccorded (entityToPerson e) c



theorem collapse_fullHearing_t42_clean
    {e : Entity} {c : ComplaintText}
    (h : Proving.USC.T42.Ch21Misc.Procedure.FullHearingAndAdjudicationAccorded e c) :
    FormalAdjudicationAccorded (entityToPerson e) c :=
  bridge_t42_fullHearing_to_common h








axiom bridge_t05_elem_formalAdj_to_common
    {pr : Proving.USC.T05.Elements.Proceeding} {c : ComplaintText} :
    Proving.USC.T05.Elements.IsFormalOnTheRecordAdjudication pr c →
    Proving.USC.T05.Elements.OpportunityToBeHeard pr c →
    Proving.USC.T05.Elements.ReasonedFindingsOnTheRecord pr c →
    FormalAdjudicationAccorded (elemProcToParty pr) c


theorem collapse_formalAdjudication_t05_elem_clean
    {pr : Proving.USC.T05.Elements.Proceeding} {c : ComplaintText}
    (hFormal : Proving.USC.T05.Elements.IsFormalOnTheRecordAdjudication pr c)
    (hHeard  : Proving.USC.T05.Elements.OpportunityToBeHeard pr c)
    (hFind   : Proving.USC.T05.Elements.ReasonedFindingsOnTheRecord pr c) :
    FormalAdjudicationAccorded (elemProcToParty pr) c :=
  bridge_t05_elem_formalAdj_to_common hFormal hHeard hFind








axiom bridge_t05_proc_formalAdj_to_common
    {proc : Proving.USC.T05.Procedure.AgencyProceeding} {c : ComplaintText} :
    Proving.USC.T05.Procedure.AdjudicationRequiredOnRecord proc c →
    Proving.USC.T05.Procedure.HearingHeldBeforePresider proc c →
    Proving.USC.T05.Procedure.DecisionOnExclusiveRecord proc c →
    FormalAdjudicationAccorded (procToParty proc) c


theorem collapse_formalAdjudication_t05_proc_clean
    {proc : Proving.USC.T05.Procedure.AgencyProceeding} {c : ComplaintText}
    (hReq   : Proving.USC.T05.Procedure.AdjudicationRequiredOnRecord proc c)
    (hHear  : Proving.USC.T05.Procedure.HearingHeldBeforePresider proc c)
    (hRec   : Proving.USC.T05.Procedure.DecisionOnExclusiveRecord proc c) :
    FormalAdjudicationAccorded (procToParty proc) c :=
  bridge_t05_proc_formalAdj_to_common hReq hHear hRec










def edge_2000e17_to_t05s554 : StructRef :=
  { source := "42 USC § 2000e-17", target := "5 USC § 554", kind := "Incorporates" }



axiom bridge_2000e17_554_coheres (c : ComplaintText) :
    StructuralReferenceCoheres edge_2000e17_to_t05s554 c




theorem resolve_t42s2000e17_to_t05s554 (c : ComplaintText) :
    StructuralReferenceCoheres edge_2000e17_to_t05s554 c :=
  bridge_2000e17_554_coheres c

end Proving.USC.Common.CrossWaveCh21MiscT05Adjudication
