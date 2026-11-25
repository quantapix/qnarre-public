import Proving.USC.T42.TitleVII.Procedure.Types








namespace Proving.USC.T42.TitleVII.Procedure

open Proving.USC.Common






axiom UnlawfulPracticeOccurred (p : AggrievedParty) (c : ComplaintText) : Prop






axiom StateProceedingCommenced (p : AggrievedParty) (c : ComplaintText) : Prop




axiom DeferralPeriodSatisfied (p : AggrievedParty) (c : ComplaintText) : Prop






axiom ChargeFiledWithEEOC (p : AggrievedParty) (c : ComplaintText) : Prop




axiom WithinOneHundredEightyDayChargeWindow (p : AggrievedParty) (c : ComplaintText) : Prop




axiom WithinThreeHundredDayChargeWindow (p : AggrievedParty) (c : ComplaintText) : Prop






axiom RightToSueIssued (p : AggrievedParty) (c : ComplaintText) : Prop



axiom CivilActionCommenced (p : AggrievedParty) (c : ComplaintText) : Prop




axiom WithinNinetyDaySuitWindow (p : AggrievedParty) (c : ComplaintText) : Prop







axiom AdminRemediesExhausted (p : AggrievedParty) (c : ComplaintText) : Prop




axiom WithinNinetyDayFederalSuitWindow (p : AggrievedParty) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVII.Procedure
