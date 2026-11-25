








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.SelfOrgRep.Elements.Types
import Proving.USC.T29.SelfOrgRep.Elements.Predicates

namespace Proving.USC.T29.SelfOrgRep.Elements

open Proving.USC.Common




structure Section157 (resp p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop where
  employee     : IsProtectedEmployee p c
  protectedAct : EngagedInProtectedActivity p a c
  interference : InterferedWithExercise resp p a c
  notJustified : ¬ JustifiedByUnionSecurityAgreement resp a c




structure Section159a (rep : Person) (u : BargainingUnit) (c : ComplaintText) : Prop where
  majority    : DesignatedByMajority rep u c
  appropriate : IsAppropriateUnit u c
  scope       : WithinBargainingScope c





structure Section159cCore (u : BargainingUnit) (c : ComplaintText) : Prop where
  appropriate    : IsAppropriateUnit u c
  affectsCommerce : QuestionOfRepresentationAffectingCommerce u c
  noRecentElection : ¬ ValidElectionWithinTwelveMonths u c




inductive ValidRepresentationCase (u : BargainingUnit) (c : ComplaintText) : Prop where
  | employeeSide (pet : RepresentationPetition)
      (filed : EmployeeSidePetitionFiled pet c)
      (core : Section159cCore u c) : ValidRepresentationCase u c
  | employerSide (pet : RepresentationPetition)
      (filed : EmployerSidePetitionFiled pet c)
      (core : Section159cCore u c) : ValidRepresentationCase u c

end Proving.USC.T29.SelfOrgRep.Elements
