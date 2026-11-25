

















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch42.Scienter

open Proving.USC.Common






inductive Addressee
  | Creditor
  | Financier
  | Collector
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch42.Scienter
