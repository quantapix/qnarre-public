














import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Evidentiary.Types

namespace Proving.USC.T42.EqualRights.Evidentiary

open Proving.USC.Common (ComplaintText Person)





axiom BurdenCarried (b : Bearer) (s : Standard) (c : ComplaintText) : Prop





axiom PresumptionUnrebutted (pr : Presumption) (c : ComplaintText) : Prop





axiom TrierOfFactAvailable (t : Trier) (c : ComplaintText) : Prop





axiom SeeksStatutoryDamages (c : ComplaintText) : Prop








def Allocation1981 : Bearer × Standard × Presumption :=
  (.Plaintiff, .Preponderance, .None)



def Allocation1982 : Bearer × Standard × Presumption :=
  (.Plaintiff, .Preponderance, .None)






def Allocation1981a_b1 : Bearer × Standard × Presumption :=
  (.Plaintiff, .Preponderance, .None)





def Allocation1981a_a3 : Bearer × Standard × Presumption :=
  (.Defendant, .Preponderance, .None)

end Proving.USC.T42.EqualRights.Evidentiary
