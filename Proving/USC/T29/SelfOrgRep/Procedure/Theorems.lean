







import Proving.USC.T29.SelfOrgRep.Procedure.Types
import Proving.USC.T29.SelfOrgRep.Procedure.Predicates
import Proving.USC.T29.SelfOrgRep.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T29.SelfOrgRep.Procedure

open Proving.USC.Common


theorem commerceQuestionStep_intro {pet c}
    (hFiled : PetitionFiled pet c)
    (hAffecting : QuestionAffectingCommerce pet c) :
    CommerceQuestionStep pet c :=
  ⟨hFiled, hAffecting⟩



theorem timelyElectionDirection_intro {pet u c}
    (hStep : CommerceQuestionStep pet c)
    (hBar : WithinTwelveMonthBar u c)
    (hDirected : ElectionDirected u c) :
    TimelyElectionDirection pet u c :=
  ⟨hStep, hBar, hDirected⟩



theorem validCertification_intro {pet u rep c}
    (hTimely : TimelyElectionDirection pet u c)
    (hMajority : MajoritySelected u rep c) :
    ValidCertification pet u rep c :=
  ⟨hTimely, hMajority⟩



theorem validCertification_reachesCertified {pet u rep c}
    (h : ValidCertification pet u rep c) :
    Reaches State.Certified pet u rep c :=
  let step := h.timelyDirection.commerceQuestion
  .certified
    (.directed
      (.commerce (.filed step.filed) step.affecting)
      h.timelyDirection.barClear
      h.timelyDirection.directed)
    h.majority

end Proving.USC.T29.SelfOrgRep.Procedure
