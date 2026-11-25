














import Proving.USC.T42.TitleVI.Evidentiary.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Evidentiary

open Proving.USC.Common (ComplaintText)






axiom BurdenCarried (b : Bearer) (s : Standard) (loc : Locus) (c : ComplaintText) : Prop





axiom PresumptionStanding (loc : Locus) (c : ComplaintText) : Prop










axiom RecordFindingAfterHearing (c : ComplaintText) : Prop







axiom IsFederalFundingRecipient (c : ComplaintText) : Prop









axiom StateImmunityAbrogated (c : ComplaintText) : Prop

















def Allocation : Locus → Bearer × Standard × Presumption
  | .discrimination2000d => (.Plaintiff, .Preponderance, .None)
  | .nonCompliance2000d1 => (.Government, .RecordFinding, .None)
  | .stateImmunity2000d7 => (.Defendant, .Preponderance, .None)

end Proving.USC.T42.TitleVI.Evidentiary
