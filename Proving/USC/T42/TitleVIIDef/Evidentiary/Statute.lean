















import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIDef.Evidentiary.Types
import Proving.USC.T42.TitleVIIDef.Evidentiary.Predicates

namespace Proving.USC.T42.TitleVIIDef.Evidentiary

open Proving.USC.Common (ComplaintText)








def Allocation2000e2m : Bearer × Standard × Presumption :=
  (.Plaintiff, .Preponderance, .None)




def Allocation2000e2kPrima : Bearer × Standard × Presumption :=
  (.Plaintiff, .Preponderance, .None)







def Allocation2000e2kRebuttal : Bearer × Standard × Presumption :=
  (.Defendant, .Preponderance, .None)




def Allocation2000e2eBFOQ : Bearer × Standard × Presumption :=
  (.Defendant, .Preponderance, .None)




def Allocation2000e2hSeniorityMerit : Bearer × Standard × Presumption :=
  (.Defendant, .Preponderance, .None)



def Allocation2000e3a : Bearer × Standard × Presumption :=
  (.Plaintiff, .Preponderance, .None)





structure Proof2000e2m (c : ComplaintText) : Prop where
  carried : BurdenCarried Allocation2000e2m.1 Allocation2000e2m.2.1 c





structure Proof2000e2k (c : ComplaintText) : Prop where
  primaCarried   : BurdenCarried Allocation2000e2kPrima.1 Allocation2000e2kPrima.2.1 c
  rebuttalFailed : ¬ BurdenCarried Allocation2000e2kRebuttal.1 Allocation2000e2kRebuttal.2.1 c


structure Proof2000e2e (c : ComplaintText) : Prop where
  carried : BurdenCarried Allocation2000e2eBFOQ.1 Allocation2000e2eBFOQ.2.1 c



structure Proof2000e2h (c : ComplaintText) : Prop where
  carried : BurdenCarried Allocation2000e2hSeniorityMerit.1 Allocation2000e2hSeniorityMerit.2.1 c



structure Proof2000e3a (c : ComplaintText) : Prop where
  carried : BurdenCarried Allocation2000e3a.1 Allocation2000e3a.2.1 c

end Proving.USC.T42.TitleVIIDef.Evidentiary
