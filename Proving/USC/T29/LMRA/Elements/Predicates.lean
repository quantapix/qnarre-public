















import Proving.USC.T29.LMRA.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T29.LMRA.Elements

open Proving.USC.Common







axiom IsPartyToLaborContract (p : Person) (k : LaborContract) (c : ComplaintText) : Prop





axiom IsSection301Contract (k : LaborContract) (c : ComplaintText) : Prop




axiom ContractViolated (k : LaborContract) (c : ComplaintText) : Prop








axiom AffectsEntireIndustry (w : WorkStoppage) (c : ComplaintText) : Prop




axiom ImperilsNationalHealthOrSafety (w : WorkStoppage) (c : ComplaintText) : Prop





axiom BoardOfInquiryReportAndPetition (c : ComplaintText) : Prop








axiom IsProhibitedPayment (pay : Payment) (c : ComplaintText) : Prop






axiom CoveredPayerAndPayee (pay : Payment) (c : ComplaintText) : Prop







axiom NotWithinSection186cException (pay : Payment) (c : ComplaintText) : Prop







axiom EngagedInSection158b4Conduct (p : Person) (c : ComplaintText) : Prop





axiom InjuredInBusinessOrProperty (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T29.LMRA.Elements
