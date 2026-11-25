







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Procedure

open Proving.USC.Common




opaque Offense : Type



opaque Indictment : Type



opaque Sentence : Type




opaque StateLawProvision : Type





inductive Stage
  | conductAlleged
  | jurisdictionEstablished
  | investigationOpened
  | prosecutionCommenced
  | convicted
  | sentenced
  deriving DecidableEq, Repr



structure GuardedTransition where
  source : Stage
  target : Stage
  guard  : Prop

end Proving.USC.T18.Ch113B.Wmd.Part2.Procedure
