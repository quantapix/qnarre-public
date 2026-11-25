












import Proving.USC.Common.Types

namespace Proving.USC.T22.Deontic





opaque DefinedTerm : Type




inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr

end Proving.USC.T22.Deontic
