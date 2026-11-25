








import Proving.USC.T29.SelfOrgRep.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.SelfOrgRep.Procedure

open Proving.USC.Common







axiom PetitionFiled (pet : RepresentationPetition) (c : ComplaintText) : Prop





axiom QuestionAffectingCommerce (pet : RepresentationPetition) (c : ComplaintText) : Prop







axiom WithinTwelveMonthBar (u : BargainingUnit) (c : ComplaintText) : Prop




axiom ElectionDirected (u : BargainingUnit) (c : ComplaintText) : Prop





axiom MajoritySelected (u : BargainingUnit) (rep : Person) (c : ComplaintText) : Prop

end Proving.USC.T29.SelfOrgRep.Procedure
