









import Proving.USC.Common.Types
import Proving.USC.T22.Deontic.Types
import Proving.USC.T22.Deontic.Predicates

namespace Proving.USC.T22.Deontic
open Proving.USC.Common




structure Definition7102 (t : DefinedTerm) (c : ComplaintText) : Prop where
  defines : TermIsDefined t c




def modality7102 : Modality := Modality.definition



def DeonticallyInert7102 : Prop := modality7102 = Modality.definition

end Proving.USC.T22.Deontic
