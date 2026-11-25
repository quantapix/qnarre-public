




















import Proving.USC.Common.Types

namespace Proving.USC.T18.PredicateDefs.Deontic

open Proving.USC.Common




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr





opaque DefinedTerm : Type





opaque DefinedObject : Type

end Proving.USC.T18.PredicateDefs.Deontic
