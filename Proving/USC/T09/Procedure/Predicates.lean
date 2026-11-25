












import Proving.USC.T09.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T09.Procedure

open Proving.USC.Common





axiom AggrievedByFailureToArbitrate (p : Person) (a : Agreement) (c : ComplaintText) : Prop




axiom PetitionToCompelFiled (p : Person) (app : Application) (c : ComplaintText) : Prop





axiom FiveDayNoticeServed (p : Person) (app : Application) (c : ComplaintText) : Prop




axiom OrderToCompelIssued (p : Person) (c : ComplaintText) : Prop





axiom StayApplicationMade (p : Person) (a : Agreement) (c : ComplaintText) : Prop




axiom ArbitratorsAppointed (a : Agreement) (c : ComplaintText) : Prop




axiom AwardMade (aw : Award) (c : ComplaintText) : Prop



axiom ConfirmationApplied (p : Person) (aw : Award) (app : Application) (c : ComplaintText) : Prop





axiom WithinOneYearWindow (aw : Award) (app : Application) (c : ComplaintText) : Prop




axiom ConfirmationNoticeServed (p : Person) (app : Application) (c : ComplaintText) : Prop




axiom VacaturGroundShown (aw : Award) (c : ComplaintText) : Prop




axiom ModificationGroundShown (aw : Award) (c : ComplaintText) : Prop




axiom VacaturMotionServed (p : Person) (app : Application) (c : ComplaintText) : Prop





axiom WithinThreeMonthWindow (aw : Award) (app : Application) (c : ComplaintText) : Prop





axiom OrderAppealable (c : ComplaintText) : Prop

end Proving.USC.T09.Procedure
