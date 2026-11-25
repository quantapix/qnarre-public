




import Proving.USC.T18.Ch113.Procedure.Statute

namespace Proving.USC.T18.Ch113.Procedure
open Proving.USC.Common


theorem transportationPenaltyReached_intro {p : Person} {c : ComplaintText}
    (hStolen : PropertyStolen p c)
    (hTrans : TransportedInInterstateCommerce p c)
    : TransportationPenaltyReached p c :=
  ⟨hStolen, hTrans⟩



theorem receiptPenaltyReached_intro {p : Person} {c : ComplaintText}
    (hStolen : PropertyStolen p c)
    (hOrder : CrossedBoundaryAfterTheft c)
    (hPoss : PossessoryActOccurred p c)
    : ReceiptPenaltyReached p c :=
  ⟨hStolen, hOrder, hPoss⟩

end Proving.USC.T18.Ch113.Procedure
