








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch47.Deontic

open Proving.USC.Common




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr





opaque IdentificationArtifact : Type





opaque AccessArtifact : Type




opaque Court : Type



opaque Agency : Type



inductive Tier1028b where

  | fifteenYear

  | fiveYear


  | twentyYear


  | thirtyYear


  | forfeiture

  | oneYear
  deriving DecidableEq, Repr



inductive Tier1029c where


  | firstOffenseTenYear


  | firstOffenseFifteenYear


  | repeatTwentyYear


  | forfeiture
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch47.Deontic
