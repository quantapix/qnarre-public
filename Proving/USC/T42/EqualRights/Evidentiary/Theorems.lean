







import Proving.USC.T42.EqualRights.Evidentiary.Statute

namespace Proving.USC.T42.EqualRights.Evidentiary

open Proving.USC.Common (ComplaintText)

theorem proof1981_intro {c : ComplaintText}
    (carried : BurdenCarried Allocation1981.1 Allocation1981.2.1 c)
    (unrebutted : PresumptionUnrebutted Allocation1981.2.2 c) :
    Proof1981 c := ⟨carried, unrebutted⟩

theorem proof1982_intro {c : ComplaintText}
    (carried : BurdenCarried Allocation1982.1 Allocation1982.2.1 c)
    (unrebutted : PresumptionUnrebutted Allocation1982.2.2 c) :
    Proof1982 c := ⟨carried, unrebutted⟩

theorem proof1981a_b1_intro {c : ComplaintText}
    (carried : BurdenCarried Allocation1981a_b1.1 Allocation1981a_b1.2.1 c)
    (unrebutted : PresumptionUnrebutted Allocation1981a_b1.2.2 c) :
    Proof1981a_b1 c := ⟨carried, unrebutted⟩

theorem proof1981a_a3_intro {c : ComplaintText}
    (carried : BurdenCarried Allocation1981a_a3.1 Allocation1981a_a3.2.1 c)
    (unrebutted : PresumptionUnrebutted Allocation1981a_a3.2.2 c) :
    Proof1981a_a3 c := ⟨carried, unrebutted⟩

theorem proof1981a_c_intro {c : ComplaintText}
    (seeks : SeeksStatutoryDamages c)
    (juryDemand : TrierOfFactAvailable Trier.EitherOnDemand c) :
    Proof1981a_c c := ⟨seeks, juryDemand⟩

theorem section1981aEvidentiaryEstablished_intro {c : ComplaintText}
    (hb1 : Proof1981a_b1 c) (hc : Proof1981a_c c) :
    Section1981aEvidentiaryEstablished c := ⟨hb1, hc⟩

theorem equalRightsMeritsEstablished_intro_1981 {c : ComplaintText}
    (h : Proof1981 c) : EqualRightsMeritsEstablished c :=
  .viaSection1981 h

theorem equalRightsMeritsEstablished_intro_1982 {c : ComplaintText}
    (h : Proof1982 c) : EqualRightsMeritsEstablished c :=
  .viaSection1982 h

end Proving.USC.T42.EqualRights.Evidentiary
