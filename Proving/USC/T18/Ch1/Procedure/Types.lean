import Proving.USC.Common.Types















namespace Proving.USC.T18.Ch1.Procedure

open Proving.USC.Common



opaque Location : Type





inductive DisclosureState
  | KnowledgeAcquired
  | Disclosed
  | Concealed
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch1.Procedure
