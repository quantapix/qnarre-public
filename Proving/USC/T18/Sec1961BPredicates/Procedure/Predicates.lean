
























import Proving.USC.T18.Sec1961BPredicates.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Sec1961BPredicates.Procedure

open Proving.USC.Common









axiom ConductOccurred (c : ComplaintText) : Prop










axiom FederalCircumstanceMet (c : ComplaintText) : Prop









axiom OperationSpanIs (n : Nat) (c : ComplaintText) : Prop







axiom PersonCountIs (k : Nat) (c : ComplaintText) : Prop






axiom WarrantSought (c : ComplaintText) : Prop









axiom WrittenNotificationServed (c : ComplaintText) : Prop






axiom ReasonableNoticeToSubscriber (c : ComplaintText) : Prop





axiom FacilityDiscontinued (c : ComplaintText) : Prop






axiom ActDoneInComplianceWithNotice (c : ComplaintText) : Prop







axiom PropertyUsedInViolation (pr : Property) (c : ComplaintText) : Prop




axiom PropertySeized (pr : Property) (c : ComplaintText) : Prop







axiom ForfeitureAdjudicated (pr : Property) (c : ComplaintText) : Prop





axiom ConvictionEntered (c : ComplaintText) : Prop










axiom PriorConvictionFinalDay (d : Nat) (c : ComplaintText) : Prop







axiom CurrentOffenseDay (d : Nat) (c : ComplaintText) : Prop

end Proving.USC.T18.Sec1961BPredicates.Procedure
