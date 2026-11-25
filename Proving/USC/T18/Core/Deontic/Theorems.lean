








import Proving.USC.T18.Core.Deontic.Types
import Proving.USC.T18.Core.Deontic.Predicates
import Proving.USC.T18.Core.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Core.Deontic

open Proving.USC.Common



theorem prohibition1962a_violated_intro {p e c}
    (hAddr : AddresseeInClass1962a p c) (hCond : ConditionMet1962a e c)
    (hAct : RegulatedActOccurred1962a p e c) : ProhibitionViolated1962a p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1962b_violated_intro {p e c}
    (hAddr : AddresseeInClass1962b p c) (hCond : ConditionMet1962b e c)
    (hAct : RegulatedActOccurred1962b p e c) : ProhibitionViolated1962b p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1962c_violated_intro {p e c}
    (hAddr : AddresseeInClass1962c p e c) (hCond : ConditionMet1962c e c)
    (hAct : RegulatedActOccurred1962c p e c) : ProhibitionViolated1962c p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1962d_violated_intro {p ag c}
    (hAddr : AddresseeInClass1962d p c) (hCond : ConditionMet1962d ag c)
    (hAct : RegulatedActOccurred1962d p ag c) : ProhibitionViolated1962d p ag c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem section1962Violated_viaC_intro {p e ag c}
    (h : ProhibitionViolated1962c p e c) : Section1962Violated p e ag c :=
  .viaC h

end Proving.USC.T18.Core.Deontic
