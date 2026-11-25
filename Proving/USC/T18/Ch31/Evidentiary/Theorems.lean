import Proving.USC.T18.Ch31.Evidentiary.Types
import Proving.USC.T18.Ch31.Evidentiary.Predicates
import Proving.USC.T18.Ch31.Evidentiary.Statute
import Proving.USC.Common.Types






namespace Proving.USC.T18.Ch31.Evidentiary
open Proving.USC.Common



theorem proofS659Waybill_intro {c : ComplaintText}
    (h : BurdenCarried AllocS659Waybill.1 AllocS659Waybill.2.1 c)
    (hn : ¬ PresumptionRebutted c) :
    ProofS659WaybillInterstate c :=
  ⟨h, hn⟩



theorem proofS659Pipeline_intro {c : ComplaintText}
    (h : BurdenCarried AllocS659Pipeline.1 AllocS659Pipeline.2.1 c)
    (hn : ¬ PresumptionRebutted c) :
    ProofS659PipelineInterstate c :=
  ⟨h, hn⟩



theorem proofS659StateBar_intro {c : ComplaintText}
    (h : PriorStateAdjudicationOnMerits c) :
    ProofS659StateBar c :=
  ⟨h⟩


theorem s659InterstateEstablished_introWaybill {c : ComplaintText}
    (h : ProofS659WaybillInterstate c) :
    S659InterstateEstablished c :=
  Or.inl h


theorem s659InterstateEstablished_introPipeline {c : ComplaintText}
    (h : ProofS659PipelineInterstate c) :
    S659InterstateEstablished c :=
  Or.inr h

end Proving.USC.T18.Ch31.Evidentiary
