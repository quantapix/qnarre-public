







import Proving.USC.T29.Review.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.Review.Procedure

open Proving.USC.Common




axiom ChargeFiled (proc : UlpProceeding) (c : ComplaintText) : Prop





axiom WithinSixMonthWindow (proc : UlpProceeding) (c : ComplaintText) : Prop




axiom ComplaintIssuedAndServed (proc : UlpProceeding) (c : ComplaintText) : Prop




axiom FiveDayNoticeSatisfied (proc : UlpProceeding) (c : ComplaintText) : Prop



axiom HearingHeldAndRecordFiled (proc : UlpProceeding) (c : ComplaintText) : Prop




axiom FinalOrderIssued (ord : BoardOrder) (proc : UlpProceeding) (c : ComplaintText) : Prop




axiom ObjectionExhausted (proc : UlpProceeding) (c : ComplaintText) : Prop







axiom BoardEnforcementPetitionFiled (ord : BoardOrder) (proc : UlpProceeding) (c : ComplaintText) : Prop







axiom PersonAggrievedByFinalOrder (p : Person) (ord : BoardOrder) (c : ComplaintText) : Prop






axiom ReviewPetitionFiledInProperCourt (p : Person) (ord : BoardOrder) (c : ComplaintText) : Prop





axiom CertifiedRecordFiled (p : Person) (ord : BoardOrder) (c : ComplaintText) : Prop

end Proving.USC.T29.Review.Procedure
