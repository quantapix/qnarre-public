








import Proving.USC.T18.Trafficking.Deontic.Statute

namespace Proving.USC.T18.Trafficking.Deontic

open Proving.USC.Common


theorem prohibition1581_violated_intro {p c}
    (hAddr : AddresseeInClass1581 p c) (hAct : RegulatedActOccurred1581 p c) :
    ProhibitionViolated1581 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition1581b_violated_intro {p c}
    (hAddr : AddresseeInClass1581 p c) (hObs : ObstructedEnforcement1581 p c) :
    ProhibitionViolated1581b p c :=
  ⟨⟨hAddr⟩, hObs⟩



theorem prohibition1589_violated_intro {p c}
    (hAddr : AddresseeInClass1589 p c) (hCond : ConditionMet1589 p c)
    (hAct : RegulatedActOccurred1589 p c) : ProhibitionViolated1589 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1589b_violated_intro {p v c}
    (hAddr : AddresseeInClass1589 p c) (hBen : BenefitedFromVenture1589 p v c) :
    ProhibitionViolated1589b p v c :=
  ⟨hAddr, hBen⟩


theorem prohibition1590_violated_intro {p c}
    (hAddr : AddresseeInClass1590 p c) (hCond : ConditionMet1590 p c)
    (hAct : RegulatedActOccurred1590 p c) : ProhibitionViolated1590 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1590b_violated_intro {p c}
    (hAddr : AddresseeInClass1590 p c) (hCond : ConditionMet1590 p c)
    (hObs : ObstructedEnforcement1590 p c) : ProhibitionViolated1590b p c :=
  ⟨⟨hAddr, hCond⟩, hObs⟩


theorem prohibition1591_violated_intro {p c}
    (hAddr : AddresseeInClass1591 p c) (hCond : ConditionMet1591 p c)
    (hAct : RegulatedActOccurred1591 p c) : ProhibitionViolated1591 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1591d_violated_intro {p c}
    (hAddr : AddresseeInClass1591 p c) (hCond : ConditionMet1591 p c)
    (hObs : ObstructedEnforcement1591 p c) : ProhibitionViolated1591d p c :=
  ⟨⟨hAddr, hCond⟩, hObs⟩




theorem chapter77_peonage_intro {p c} (h : ProhibitionViolated1581 p c) :
    Chapter77ProhibitionViolated p c := .peonage h


theorem chapter77_forcedLabor_intro {p c} (h : ProhibitionViolated1589 p c) :
    Chapter77ProhibitionViolated p c := .forcedLabor h


theorem chapter77_trafficking_intro {p c} (h : ProhibitionViolated1590 p c) :
    Chapter77ProhibitionViolated p c := .trafficking h


theorem chapter77_sexTrafficking_intro {p c} (h : ProhibitionViolated1591 p c) :
    Chapter77ProhibitionViolated p c := .sexTrafficking h

end Proving.USC.T18.Trafficking.Deontic
