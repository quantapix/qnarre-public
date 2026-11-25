




import Proving.USC.T42.SchoolDesegregation.Elements.Predicates

namespace Proving.USC.T42.SchoolDesegregation.Elements
open Proving.USC.Common



structure Section2000c6SchoolBoard (wc : WrittenComplaint) (s : PublicSchool) (c : ComplaintText) : Prop where
  complaint    : ReceivedSchoolBoardEqualProtectionComplaint wc s c
  validWriting : ComplaintIsWritingUnder1001 wc c
  inability    : SignersUnableToMaintainProceedings wc c
  desegRelief  : SeeksDesegregationRelief s c



structure Section2000c6College (wc : WrittenComplaint) (s : PublicSchool) (c : ComplaintText) : Prop where
  complaint    : ReceivedPublicCollegeDenialComplaint wc s c
  validWriting : ComplaintIsWritingUnder1001 wc c
  inability    : SignersUnableToMaintainProceedings wc c
  desegRelief  : SeeksDesegregationRelief s c





inductive ValidAttorneyGeneralDesegregationAction
    (wc : WrittenComplaint) (s : PublicSchool) (c : ComplaintText) : Prop where

  | schoolBoard (h : Section2000c6SchoolBoard wc s c) :
      ValidAttorneyGeneralDesegregationAction wc s c

  | college (h : Section2000c6College wc s c) :
      ValidAttorneyGeneralDesegregationAction wc s c




structure Section2000c8 (p : Person) (c : ComplaintText) : Prop where
  rightToSue    : HasRightToSueForPublicEducationDiscrimination p c
  notDisplaced  : PrivateRightNotDisplaced p c

end Proving.USC.T42.SchoolDesegregation.Elements
