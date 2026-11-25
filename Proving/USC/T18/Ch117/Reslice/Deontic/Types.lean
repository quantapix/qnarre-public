







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Deontic

open Proving.USC.Common




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr






opaque InteractiveComputerService : Type



opaque CoveredOrganization : Type



opaque TargetedJurisdiction : Type




opaque UnitedStatesDistrictCourt : Type



inductive Subsection2423 where
  | a
  | b
  | c
  | d
  | e
  deriving DecidableEq, Repr



example : Type := Person
example : Type := ComplaintText

end Proving.USC.T18.Ch117.Reslice.Deontic
