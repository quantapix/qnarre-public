








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.SchoolDesegregation.Ontology.Types

namespace Proving.USC.T42.SchoolDesegregation.Ontology

open Proving.USC.Common




axiom IsParentT42IV (x : ParentT42IV) (c : ComplaintText) : Prop




axiom IsWrittenComplaintT42IV (w : WrittenComplaintT42IV) (c : ComplaintText) : Prop




axiom IsSchoolBoard (s : SchoolBoard) (c : ComplaintText) : Prop





axiom IsPublicCollege (p : PublicCollege) (c : ComplaintText) : Prop




axiom IsSimilarlySituatedClass (cls : SimilarlySituatedClass) (c : ComplaintText) : Prop





axiom IsAttorneyGeneralCivilAction (a : AttorneyGeneralCivilAction) (c : ComplaintText) : Prop







axiom IsUnableToMaintainProceedings (x : ParentT42IV) (c : ComplaintText) : Prop





axiom IsPersonalSuitForRelief (s : PersonalSuitForRelief) (c : ComplaintText) : Prop





axiom PreservesPrivateRight (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.SchoolDesegregation.Ontology
