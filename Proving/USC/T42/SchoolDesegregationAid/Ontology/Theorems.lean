






import Proving.USC.T42.SchoolDesegregationAid.Ontology.Statute

namespace Proving.USC.T42.SchoolDesegregationAid.Ontology
open Proving.USC.Common


theorem desegregationMembership_intro {d : Desegregation} {c : ComplaintText}
    (hWithout : IsWithoutRegardToProtectedGround d c)
    (hNotBalance : IsNotRacialBalanceAssignment d c)
    : DesegregationMembership d c :=
  ⟨hWithout, hNotBalance⟩


theorem publicSchoolMembership_intro {ps : PublicSchool} {e : Entity} {c : ComplaintText}
    (hInst : IsPublicSchool ps c)
    (hGov : IsGovernmentallyOperated e c)
    : PublicSchoolMembership ps e c :=
  ⟨hInst, hGov⟩


theorem publicCollegeMembership_intro {pc : PublicCollege} {e : Entity} {c : ComplaintText}
    (hInst : IsPublicCollege pc c)
    (hGov : IsGovernmentallyOperated e c)
    : PublicCollegeMembership pc e c :=
  ⟨hInst, hGov⟩


theorem subchapterIVTermsInhabited_intro
    {s : Secretary} {ps : PublicSchool} {e : Entity} {c : ComplaintText}
    (hSec : IsSecretary s c)
    (hSchool : PublicSchoolMembership ps e c)
    (hBoard : IsSchoolBoard e c)
    : SubchapterIVTermsInhabited s ps e c :=
  ⟨hSec, hSchool, hBoard⟩

end Proving.USC.T42.SchoolDesegregationAid.Ontology
