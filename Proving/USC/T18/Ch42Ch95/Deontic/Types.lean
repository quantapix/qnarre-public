








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Deontic




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr



opaque CreditExtension : Type




opaque Court : Type



opaque UnlawfulActivity : Type


opaque FinancialTransaction : Type



opaque MonetaryProperty : Type




opaque Authority : Type



opaque Investigation : Type



opaque JudicialDistrict : Type



opaque Offense : Type

end Proving.USC.T18.Ch42Ch95.Deontic
