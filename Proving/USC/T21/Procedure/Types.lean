












import Proving.USC.Common.Types

namespace Proving.USC.T21.Procedure

open Proving.USC.Common




opaque Offense : Type




opaque Conviction : Type



opaque Sentence : Type



inductive Stage
  | violated
  | convicted
  | sentenced
  | onSupervisedRelease
  | enjoined

end Proving.USC.T21.Procedure
