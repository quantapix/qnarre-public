












import Proving.USC.T42.TitleVI.Evidentiary.Types
import Proving.USC.T42.TitleVI.Evidentiary.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Evidentiary

open Proving.USC.Common (ComplaintText)




structure Proof2000d (c : ComplaintText) : Prop where

  carried : BurdenCarried
    (Allocation .discrimination2000d).1
    (Allocation .discrimination2000d).2.1
    .discrimination2000d c

  presumptionOk : PresumptionStanding .discrimination2000d c






structure Proof2000d1 (c : ComplaintText) : Prop where

  recipient : IsFederalFundingRecipient c

  carried : BurdenCarried
    (Allocation .nonCompliance2000d1).1
    (Allocation .nonCompliance2000d1).2.1
    .nonCompliance2000d1 c

  recordAntecedents : RecordFindingAfterHearing c




structure Proof2000d7 (c : ComplaintText) : Prop where

  immunityAbrogated : StateImmunityAbrogated c






inductive EvidentiarilyEstablished (c : ComplaintText) : Prop

  | byMerits        (h : Proof2000d c)   : EvidentiarilyEstablished c

  | byAgencyFinding (h : Proof2000d1 c)  : EvidentiarilyEstablished c

  | byAbrogation    (h : Proof2000d7 c)  : EvidentiarilyEstablished c

end Proving.USC.T42.TitleVI.Evidentiary
