





import Proving.USC.T18.Procedure.Predicates

namespace Proving.USC.T18.Procedure
open Proving.USC.Common



structure TimelyFiling (p : Person) (c : ComplaintText) : Prop where
  accrued  : ClaimAccrued p c
  filed    : ComplaintFiled p c
  inWindow : WithinFourYearWindow p c

end Proving.USC.T18.Procedure
