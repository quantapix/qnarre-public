








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Procedure

open Proving.USC.Common




opaque Matter : Type



opaque OfficialAct : Type




opaque Proceeding : Type





opaque Forum : Type





opaque Transfer : Type



opaque Prosecution : Type



opaque Sentence : Type






inductive OfficialStage
  | preselection
  | selected
  | serving
  | former
  deriving DecidableEq, Repr





inductive CaseStage
  | conductComplete
  | convicted
  | sentenced
  | disqualified
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch11.EchoReslice.Procedure
