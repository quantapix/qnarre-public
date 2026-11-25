import Proving.USC.T18.Ch31.Evidentiary.Types
import Proving.USC.T18.Ch31.Evidentiary.Predicates
import Proving.USC.Common.Types





















namespace Proving.USC.T18.Ch31.Evidentiary
open Proving.USC.Common




def AllocS659Waybill : Bearer × Standard × Presumption :=
  (.Government, .BeyondReasonableDoubt, .Rebuttable)



def AllocS659Pipeline : Bearer × Standard × Presumption :=
  (.Government, .BeyondReasonableDoubt, .Rebuttable)



def AllocS659StateBar : Bearer × Standard × Presumption :=
  (.Defendant, .Preponderance, .Conclusive)




structure ProofS659WaybillInterstate (c : ComplaintText) : Prop where
  foundation : BurdenCarried AllocS659Waybill.1 AllocS659Waybill.2.1 c
  notRebutted : ¬ PresumptionRebutted c



structure ProofS659PipelineInterstate (c : ComplaintText) : Prop where
  foundation : BurdenCarried AllocS659Pipeline.1 AllocS659Pipeline.2.1 c
  notRebutted : ¬ PresumptionRebutted c




structure ProofS659StateBar (c : ComplaintText) : Prop where
  prior : PriorStateAdjudicationOnMerits c




def S659InterstateEstablished (c : ComplaintText) : Prop :=
  ProofS659WaybillInterstate c ∨ ProofS659PipelineInterstate c

end Proving.USC.T18.Ch31.Evidentiary
