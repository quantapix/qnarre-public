




import Proving.USC.T42.SchoolDesegregation.Elements.Statute

namespace Proving.USC.T42.SchoolDesegregation.Elements
open Proving.USC.Common


theorem section2000c6SchoolBoard_intro {wc : WrittenComplaint} {s : PublicSchool} {c : ComplaintText}
    (hCpl    : ReceivedSchoolBoardEqualProtectionComplaint wc s c)
    (hWrit   : ComplaintIsWritingUnder1001 wc c)
    (hInab   : SignersUnableToMaintainProceedings wc c)
    (hReli   : SeeksDesegregationRelief s c)
    : Section2000c6SchoolBoard wc s c :=
  ⟨hCpl, hWrit, hInab, hReli⟩


theorem section2000c6College_intro {wc : WrittenComplaint} {s : PublicSchool} {c : ComplaintText}
    (hCpl    : ReceivedPublicCollegeDenialComplaint wc s c)
    (hWrit   : ComplaintIsWritingUnder1001 wc c)
    (hInab   : SignersUnableToMaintainProceedings wc c)
    (hReli   : SeeksDesegregationRelief s c)
    : Section2000c6College wc s c :=
  ⟨hCpl, hWrit, hInab, hReli⟩


theorem validAttorneyGeneralDesegregationAction_schoolBoard_intro
    {wc : WrittenComplaint} {s : PublicSchool} {c : ComplaintText}
    (h : Section2000c6SchoolBoard wc s c)
    : ValidAttorneyGeneralDesegregationAction wc s c :=
  .schoolBoard h


theorem validAttorneyGeneralDesegregationAction_college_intro
    {wc : WrittenComplaint} {s : PublicSchool} {c : ComplaintText}
    (h : Section2000c6College wc s c)
    : ValidAttorneyGeneralDesegregationAction wc s c :=
  .college h


theorem section2000c8_intro {p : Person} {c : ComplaintText}
    (hRight : HasRightToSueForPublicEducationDiscrimination p c)
    (hKeep  : PrivateRightNotDisplaced p c)
    : Section2000c8 p c :=
  ⟨hRight, hKeep⟩

end Proving.USC.T42.SchoolDesegregation.Elements
