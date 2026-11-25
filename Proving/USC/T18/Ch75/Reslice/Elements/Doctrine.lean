








import Proving.USC.T18.Ch75.Reslice.Elements.Types
import Proving.USC.T18.Ch75.Reslice.Elements.Predicates
import Proving.USC.T18.Ch75.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.Common.Tactic

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Elements

open Proving.USC.Common



@[grind →] theorem willfulAndKnowing_of_leaves {p : Person} {c : ComplaintText}
    (hWillful : ActedWillfully p c) (hKnowing : ActedKnowingly p c) :
    WillfulAndKnowing p c :=
  ⟨hWillful, hKnowing⟩



example {p : Person} {c : ComplaintText}
    (hWillful : ActedWillfully p c) (hKnowing : ActedKnowingly p c) :
    ActedWillfullyAndKnowingly p c := by prove_element

end Proving.USC.T18.Ch75.Reslice.Elements
