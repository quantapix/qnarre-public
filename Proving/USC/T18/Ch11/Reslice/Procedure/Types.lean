import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Procedure

open Proving.USC.Common





inductive State
  | InService
  | Terminated
  | Barred
  | ConductAlleged
  | PetitionFiled
  | OrderIssued
  | ConvictionFinal
  | Rescinded
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch11.Reslice.Procedure
