











import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.SelfOrgRep.Elements.Types

namespace Proving.USC.T29.SelfOrgRep.Elements

open Proving.USC.Common






axiom IsProtectedEmployee (p : Person) (c : ComplaintText) : Prop






axiom EngagedInProtectedActivity (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom InterferedWithExercise (resp : Person) (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop






axiom JustifiedByUnionSecurityAgreement (resp : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop






axiom DesignatedByMajority (rep : Person) (u : BargainingUnit) (c : ComplaintText) : Prop





axiom IsAppropriateUnit (u : BargainingUnit) (c : ComplaintText) : Prop





axiom WithinBargainingScope (c : ComplaintText) : Prop








axiom EmployeeSidePetitionFiled (pet : RepresentationPetition) (c : ComplaintText) : Prop





axiom EmployerSidePetitionFiled (pet : RepresentationPetition) (c : ComplaintText) : Prop





axiom QuestionOfRepresentationAffectingCommerce (u : BargainingUnit) (c : ComplaintText) : Prop





axiom ValidElectionWithinTwelveMonths (u : BargainingUnit) (c : ComplaintText) : Prop

end Proving.USC.T29.SelfOrgRep.Elements
