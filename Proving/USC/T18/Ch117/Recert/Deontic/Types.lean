






import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Deontic

open Proving.USC.Common




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr







opaque InteractiveComputerService : Type


opaque Court : Type




opaque Jurisdiction : Type




inductive Subsection2423 where

  | transportationOfMinor

  | travelWithIntent

  | engagingAbroad

  | organizationalConnection

  | arrangingTravelForGain
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch117.Recert.Deontic
