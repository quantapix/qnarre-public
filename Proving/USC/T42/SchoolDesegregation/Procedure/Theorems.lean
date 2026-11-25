











import Proving.USC.Common.Types
import Proving.USC.T42.SchoolDesegregation.Procedure.Types
import Proving.USC.T42.SchoolDesegregation.Procedure.Predicates
import Proving.USC.T42.SchoolDesegregation.Procedure.Statute

namespace Proving.USC.T42.SchoolDesegregation.Procedure

open Proving.USC.Common



theorem aGActionTrackProper_intro {s : Person} {w : WrittenComplaint} {c : ComplaintText}
    (hRecv : WrittenComplaintReceived s w c)
    (hWriting : ComplaintIsSection1001Writing w c)
    (hInab : SignatoryUnableToMaintain s w c)
    (hInst : AGInstitutedAction s w c) :
    AGActionTrackProper s w c :=
  ⟨hRecv, hWriting, hInab, hInst⟩



theorem privateSuitTrackProper_intro {p : Person} {c : ComplaintText}
    (hPres : PrivateRightOfSuitPreserved p c)
    (hFiled : PrivateSuitFiled p c) :
    PrivateSuitTrackProper p c :=
  ⟨hPres, hFiled⟩


theorem titleIVEnforcementReachable_viaAGAction_intro {c : ComplaintText}
    (s : Person) (w : WrittenComplaint)
    (h : AGActionTrackProper s w c) :
    TitleIVEnforcementReachable c :=
  TitleIVEnforcementReachable.viaAGAction s w h


theorem titleIVEnforcementReachable_viaPrivateSuit_intro {c : ComplaintText}
    (p : Person)
    (h : PrivateSuitTrackProper p c) :
    TitleIVEnforcementReachable c :=
  TitleIVEnforcementReachable.viaPrivateSuit p h

end Proving.USC.T42.SchoolDesegregation.Procedure
