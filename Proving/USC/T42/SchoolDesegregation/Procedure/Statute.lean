















import Proving.USC.Common.Types
import Proving.USC.T42.SchoolDesegregation.Procedure.Types
import Proving.USC.T42.SchoolDesegregation.Procedure.Predicates

namespace Proving.USC.T42.SchoolDesegregation.Procedure

open Proving.USC.Common



structure Transition where
  frm   : State
  to    : State
  guard : Prop









def stepToInabilityFound (s : Person) (w : WrittenComplaint) (c : ComplaintText) : Transition :=
  { frm := State.ComplaintReceived, to := State.InabilityFound,
    guard := SignatoryUnableToMaintain s w c }



def stepToActionInstituted (s : Person) (w : WrittenComplaint) (c : ComplaintText) : Transition :=
  { frm := State.InabilityFound, to := State.ActionInstituted,
    guard := AGInstitutedAction s w c }






structure AGActionTrackProper (s : Person) (w : WrittenComplaint) (c : ComplaintText) : Prop where
  received   : WrittenComplaintReceived s w c
  isWriting  : ComplaintIsSection1001Writing w c
  inability  : SignatoryUnableToMaintain s w c
  instituted : AGInstitutedAction s w c








def stepToPrivateSuitFiled (p : Person) (c : ComplaintText) : Transition :=
  { frm := State.PrivateRightAvailable, to := State.PrivateSuitFiled,
    guard := PrivateSuitFiled p c }




structure PrivateSuitTrackProper (p : Person) (c : ComplaintText) : Prop where
  preserved : PrivateRightOfSuitPreserved p c
  filed     : PrivateSuitFiled p c







inductive TitleIVEnforcementReachable (c : ComplaintText) : Prop
  | viaAGAction (s : Person) (w : WrittenComplaint)
      (h : AGActionTrackProper s w c) : TitleIVEnforcementReachable c
  | viaPrivateSuit (p : Person)
      (h : PrivateSuitTrackProper p c) : TitleIVEnforcementReachable c

end Proving.USC.T42.SchoolDesegregation.Procedure
