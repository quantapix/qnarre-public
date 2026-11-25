








import Proving.USC.T29.SelfOrgRep.Procedure.Types
import Proving.USC.T29.SelfOrgRep.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T29.SelfOrgRep.Procedure

open Proving.USC.Common




structure CommerceQuestionStep (pet : RepresentationPetition) (c : ComplaintText) : Prop where
  filed    : PetitionFiled pet c
  affecting : QuestionAffectingCommerce pet c



structure TimelyElectionDirection
    (pet : RepresentationPetition) (u : BargainingUnit) (c : ComplaintText) : Prop where
  commerceQuestion : CommerceQuestionStep pet c
  barClear         : WithinTwelveMonthBar u c
  directed         : ElectionDirected u c





structure ValidCertification
    (pet : RepresentationPetition) (u : BargainingUnit) (rep : Person) (c : ComplaintText) : Prop where
  timelyDirection : TimelyElectionDirection pet u c
  majority        : MajoritySelected u rep c




inductive Reaches :
    State → RepresentationPetition → BargainingUnit → Person → ComplaintText → Prop
  | filed {pet u rep c} :
      PetitionFiled pet c → Reaches State.PetitionFiled pet u rep c
  | commerce {pet u rep c} :
      Reaches State.PetitionFiled pet u rep c →
      QuestionAffectingCommerce pet c →
      Reaches State.CommerceQuestionFound pet u rep c
  | directed {pet u rep c} :
      Reaches State.CommerceQuestionFound pet u rep c →
      WithinTwelveMonthBar u c →
      ElectionDirected u c →
      Reaches State.ElectionDirected pet u rep c
  | certified {pet u rep c} :
      Reaches State.ElectionDirected pet u rep c →
      MajoritySelected u rep c →
      Reaches State.Certified pet u rep c

end Proving.USC.T29.SelfOrgRep.Procedure
