










import Proving.USC.T42.EqualRights.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Procedure

open Proving.USC.Common





axiom ClaimAccrued (p : Person) (c : ComplaintText) : Prop




axiom ComplaintFiled (p : Person) (c : ComplaintText) : Prop







axiom WithinLimitationsWindow (p : Person) (c : ComplaintText) : Prop






axiom BroughtUnderTitleVII (p : Person) (a : DamagesAction) (c : ComplaintText) : Prop






axiom ExhaustedTitleVII (p : Person) (a : DamagesAction) (c : ComplaintText) : Prop






axiom CannotRecoverUnder1981 (p : Person) (a : DamagesAction) (c : ComplaintText) : Prop




axiom JuryTrialDemanded (p : Person) (a : DamagesAction) (c : ComplaintText) : Prop

end Proving.USC.T42.EqualRights.Procedure
