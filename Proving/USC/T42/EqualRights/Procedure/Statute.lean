







import Proving.USC.T42.EqualRights.Procedure.Types
import Proving.USC.T42.EqualRights.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Procedure

open Proving.USC.Common



structure Transition where
  src   : State
  dst   : State
  guard : Prop




structure TimelyEqualRightsFiling (p : Person) (c : ComplaintText) : Prop where
  accrued  : ClaimAccrued p c
  filed    : ComplaintFiled p c
  inWindow : WithinLimitationsWindow p c





structure Section1981aGateway (p : Person) (a : DamagesAction) (c : ComplaintText) : Prop where
  underTitleVII : BroughtUnderTitleVII p a c
  exhausted     : ExhaustedTitleVII p a c
  no1981Recovery : CannotRecoverUnder1981 p a c




structure Section1981aJuryProcedure (p : Person) (a : DamagesAction) (c : ComplaintText) : Prop where
  gateway   : Section1981aGateway p a c
  juryDemand : JuryTrialDemanded p a c





inductive ReachesFiled (p : Person) (c : ComplaintText) : Prop
  | viaEqualRights (h : TimelyEqualRightsFiling p c) : ReachesFiled p c
  | viaDamages (a : DamagesAction)
      (hGate : Section1981aGateway p a c)
      (hFiled : ComplaintFiled p c)
      (hWin : WithinLimitationsWindow p c) : ReachesFiled p c

end Proving.USC.T42.EqualRights.Procedure
