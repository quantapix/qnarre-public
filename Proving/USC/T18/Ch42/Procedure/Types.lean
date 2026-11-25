

















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch42.Procedure

open Proving.USC.Common






inductive State
  | Charged
  | PrimaFacieEstablished
  | ReputationAdmissible
  | Convicted
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch42.Procedure
