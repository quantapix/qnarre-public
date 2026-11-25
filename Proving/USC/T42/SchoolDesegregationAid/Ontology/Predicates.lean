












import Proving.USC.T42.SchoolDesegregationAid.Ontology.Types

namespace Proving.USC.T42.SchoolDesegregationAid.Ontology
open Proving.USC.Common




axiom IsSecretary (s : Secretary) (c : ComplaintText) : Prop





axiom IsDesegregation (d : Desegregation) (c : ComplaintText) : Prop




axiom IsPublicSchool (ps : PublicSchool) (c : ComplaintText) : Prop




axiom IsPublicCollege (pc : PublicCollege) (c : ComplaintText) : Prop







axiom IsGovernmentallyOperated (e : Entity) (c : ComplaintText) : Prop





axiom IsSchoolBoard (e : Entity) (c : ComplaintText) : Prop





axiom IsWithoutRegardToProtectedGround (d : Desegregation) (c : ComplaintText) : Prop






axiom IsNotRacialBalanceAssignment (d : Desegregation) (c : ComplaintText) : Prop

end Proving.USC.T42.SchoolDesegregationAid.Ontology
