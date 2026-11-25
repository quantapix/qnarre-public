







import Proving.USC.Common.Types

namespace Proving.USC.T31.Procedure




opaque FinancialInstitution : Type




opaque Transaction : Type



inductive State
  | transactionOccurred
  | reportDue
  | reportFiled
  | exempt
  | structuringCharged
  | penaltyAggravated

end Proving.USC.T31.Procedure
