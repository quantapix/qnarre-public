






import Proving.USC.Common.Types
import Proving.USC.T42.SchoolDesegregation.Ontology.Types
import Proving.USC.T42.SchoolDesegregation.Ontology.Predicates
import Proving.USC.T42.SchoolDesegregation.Ontology.Statute

namespace Proving.USC.T42.SchoolDesegregation.Ontology

open Proving.USC.Common


theorem schoolTriggerMembership_intro
    {par : ParentT42IV} {cls : SimilarlySituatedClass} {sb : SchoolBoard}
    {c : ComplaintText}
    (hParent : IsParentT42IV par c)
    (hClass : IsSimilarlySituatedClass cls c)
    (hBoard : IsSchoolBoard sb c)
    : SchoolTriggerMembership par cls sb c :=
  ⟨hParent, hClass, hBoard⟩


theorem collegeTriggerMembership_intro
    {par : ParentT42IV} {pc : PublicCollege} {c : ComplaintText}
    (hParent : IsParentT42IV par c)
    (hCollege : IsPublicCollege pc c)
    : CollegeTriggerMembership par pc c :=
  ⟨hParent, hCollege⟩



theorem qualifyingComplaintTrigger_school
    {par : ParentT42IV} {cls : SimilarlySituatedClass} {sb : SchoolBoard}
    {pc : PublicCollege} {c : ComplaintText}
    (h : SchoolTriggerMembership par cls sb c)
    : QualifyingComplaintTrigger par cls sb pc c :=
  .school h



theorem qualifyingComplaintTrigger_college
    {par : ParentT42IV} {cls : SimilarlySituatedClass} {sb : SchoolBoard}
    {pc : PublicCollege} {c : ComplaintText}
    (h : CollegeTriggerMembership par pc c)
    : QualifyingComplaintTrigger par cls sb pc c :=
  .college h



theorem agCivilActionMembership_intro
    {act : AttorneyGeneralCivilAction} {w : WrittenComplaintT42IV}
    {par : ParentT42IV} {cls : SimilarlySituatedClass} {sb : SchoolBoard}
    {pc : PublicCollege} {c : ComplaintText}
    (hAction : IsAttorneyGeneralCivilAction act c)
    (hComplaint : IsWrittenComplaintT42IV w c)
    (hTrigger : QualifyingComplaintTrigger par cls sb pc c)
    : AGCivilActionMembership act w par cls sb pc c :=
  ⟨hAction, hComplaint, hTrigger⟩


theorem personalSuitMembership_intro
    {s : PersonalSuitForRelief} {p : Person} {c : ComplaintText}
    (hSuit : IsPersonalSuitForRelief s c)
    (hPreserved : PreservesPrivateRight p c)
    : PersonalSuitMembership s p c :=
  ⟨hSuit, hPreserved⟩

end Proving.USC.T42.SchoolDesegregation.Ontology
