import Proving.USC.T18.Ch31.Deontic.Statute

namespace Proving.USC.T18.Ch31.Deontic
open Proving.USC.Common



theorem prohibitionViolated659_intro {p : Person} {s : Shipment} {c : ComplaintText}
    (hAddr : AddresseeInClass659 p c) (hCond : ConditionMet659 s c)
    (hAct : RegulatedActOccurred659 p s c) : ProhibitionViolated659 p s c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibitionViolated664_intro {p : Person} {b : BenefitPlan} {c : ComplaintText}
    (hAddr : AddresseeInClass664 p c) (hCond : ConditionMet664 b c)
    (hAct : RegulatedActOccurred664 p b c) : ProhibitionViolated664 p b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Ch31.Deontic
