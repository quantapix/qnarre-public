















import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Evidentiary.Types

namespace Proving.USC.T18.Spec.Evidentiary

open Proving.USC.Common (ComplaintText)






axiom BurdenCarried (b : Bearer) (s : Standard) (c : ComplaintText) : Prop







axiom PresumptionApplies (pr : Presumption) (c : ComplaintText) : Prop






axiom PresumptionRebutted (pr : Presumption) (c : ComplaintText) : Prop







def Allocation1964c : Allocation :=
  (.Plaintiff, .Preponderance, .None)








def Allocation1964d : Allocation :=
  (.Government, .BeyondReasonableDoubt, .Conclusive)





def Allocation1968e : Allocation :=
  (.Government, .Preponderance, .Rebuttable)




def Allocation1963 : Allocation :=
  (.Government, .BeyondReasonableDoubt, .None)

end Proving.USC.T18.Spec.Evidentiary
