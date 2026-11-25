




import Proving.USC.T18.Deontic.Statute

namespace Proving.USC.T18.Deontic
open Proving.USC.Common

theorem prohibition1962c_violated_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeInClass p e c)
    (hCond : ConditionMet e c)
    (hAct  : RegulatedActOccurred p e c)
    : ProhibitionViolated1962c p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Deontic
