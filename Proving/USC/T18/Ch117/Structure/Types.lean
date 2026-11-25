import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch117.Structure

set_option autoImplicit false



inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis




structure Ref where
  source : String
  target : String
  kind   : EdgeKind

end Proving.USC.T18.Ch117.Structure
