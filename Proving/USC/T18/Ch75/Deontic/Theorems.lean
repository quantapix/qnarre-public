





import Proving.USC.T18.Ch75.Deontic.Statute

namespace Proving.USC.T18.Ch75.Deontic

open Proving.USC.Common


theorem prohibition1542Violated_intro {p : Person} {d : TravelDocument} {c : ComplaintText}
    (hAddr : AddresseeInClass1542 p c) (hCond : ConditionMet1542 p c)
    (hAct : RegulatedActOccurred1542 p d c) : Prohibition1542Violated p d c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1543Violated_intro {p : Person} {d : TravelDocument} {c : ComplaintText}
    (hAddr : AddresseeInClass1543 p c) (hCond : ConditionMet1543 p c)
    (hAct : RegulatedActOccurred1543 p d c) : Prohibition1543Violated p d c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1544Violated_intro {p : Person} {d : TravelDocument} {c : ComplaintText}
    (hAddr : AddresseeInClass1544 p c) (hCond : ConditionMet1544 p c)
    (hAct : RegulatedActOccurred1544 p d c) : Prohibition1544Violated p d c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition1546Violated_intro {p : Person} {d : TravelDocument} {c : ComplaintText}
    (hAddr : AddresseeInClass1546 p c) (hCond : ConditionMet1546 p c)
    (hAct : RegulatedActOccurred1546 p d c)
    (hNoExc : ¬ LawEnforcementException1546c p c) : Prohibition1546Violated p d c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoExc⟩



theorem ch75DocumentFraudViolated_of_1542 {p : Person} {d : TravelDocument} {c : ComplaintText}
    (h : Prohibition1542Violated p d c) : Ch75DocumentFraudViolated p d c :=
  .falseStatement1542 h

theorem ch75DocumentFraudViolated_of_1543 {p : Person} {d : TravelDocument} {c : ComplaintText}
    (h : Prohibition1543Violated p d c) : Ch75DocumentFraudViolated p d c :=
  .forgery1543 h

theorem ch75DocumentFraudViolated_of_1544 {p : Person} {d : TravelDocument} {c : ComplaintText}
    (h : Prohibition1544Violated p d c) : Ch75DocumentFraudViolated p d c :=
  .misuse1544 h

theorem ch75DocumentFraudViolated_of_1546 {p : Person} {d : TravelDocument} {c : ComplaintText}
    (h : Prohibition1546Violated p d c) : Ch75DocumentFraudViolated p d c :=
  .visaFraud1546 h

end Proving.USC.T18.Ch75.Deontic
