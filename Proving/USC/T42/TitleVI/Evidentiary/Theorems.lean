






import Proving.USC.T42.TitleVI.Evidentiary.Types
import Proving.USC.T42.TitleVI.Evidentiary.Predicates
import Proving.USC.T42.TitleVI.Evidentiary.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Evidentiary

open Proving.USC.Common (ComplaintText)


theorem proof2000d_intro {c : ComplaintText}
    (carried : BurdenCarried
      (Allocation .discrimination2000d).1
      (Allocation .discrimination2000d).2.1
      .discrimination2000d c)
    (presumptionOk : PresumptionStanding .discrimination2000d c) :
    Proof2000d c :=
  ⟨carried, presumptionOk⟩



theorem proof2000d1_intro {c : ComplaintText}
    (recipient : IsFederalFundingRecipient c)
    (carried : BurdenCarried
      (Allocation .nonCompliance2000d1).1
      (Allocation .nonCompliance2000d1).2.1
      .nonCompliance2000d1 c)
    (recordAntecedents : RecordFindingAfterHearing c) :
    Proof2000d1 c :=
  ⟨recipient, carried, recordAntecedents⟩


theorem proof2000d7_intro {c : ComplaintText}
    (immunityAbrogated : StateImmunityAbrogated c) :
    Proof2000d7 c :=
  ⟨immunityAbrogated⟩


theorem evidentiarilyEstablished_intro_byMerits {c : ComplaintText}
    (h : Proof2000d c) : EvidentiarilyEstablished c :=
  .byMerits h


theorem evidentiarilyEstablished_intro_byAgencyFinding {c : ComplaintText}
    (h : Proof2000d1 c) : EvidentiarilyEstablished c :=
  .byAgencyFinding h


theorem evidentiarilyEstablished_intro_byAbrogation {c : ComplaintText}
    (h : Proof2000d7 c) : EvidentiarilyEstablished c :=
  .byAbrogation h

end Proving.USC.T42.TitleVI.Evidentiary
