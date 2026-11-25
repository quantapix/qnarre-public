








import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Evidentiary.Types
import Proving.USC.T42.EqualRights.Evidentiary.Predicates

namespace Proving.USC.T42.EqualRights.Evidentiary

open Proving.USC.Common (ComplaintText)



structure Proof1981 (c : ComplaintText) : Prop where
  carried     : BurdenCarried Allocation1981.1 Allocation1981.2.1 c
  unrebutted  : PresumptionUnrebutted Allocation1981.2.2 c



structure Proof1982 (c : ComplaintText) : Prop where
  carried     : BurdenCarried Allocation1982.1 Allocation1982.2.1 c
  unrebutted  : PresumptionUnrebutted Allocation1982.2.2 c



structure Proof1981a_b1 (c : ComplaintText) : Prop where
  carried     : BurdenCarried Allocation1981a_b1.1 Allocation1981a_b1.2.1 c
  unrebutted  : PresumptionUnrebutted Allocation1981a_b1.2.2 c





structure Proof1981a_a3 (c : ComplaintText) : Prop where
  carried     : BurdenCarried Allocation1981a_a3.1 Allocation1981a_a3.2.1 c
  unrebutted  : PresumptionUnrebutted Allocation1981a_a3.2.2 c





structure Proof1981a_c (c : ComplaintText) : Prop where
  seeks       : SeeksStatutoryDamages c
  juryDemand  : TrierOfFactAvailable Trier.EitherOnDemand c





def Section1981aEvidentiaryEstablished (c : ComplaintText) : Prop :=
  Proof1981a_b1 c ∧ Proof1981a_c c




inductive EqualRightsMeritsEstablished (c : ComplaintText) : Prop where
  | viaSection1981 : Proof1981 c → EqualRightsMeritsEstablished c
  | viaSection1982 : Proof1982 c → EqualRightsMeritsEstablished c

end Proving.USC.T42.EqualRights.Evidentiary
