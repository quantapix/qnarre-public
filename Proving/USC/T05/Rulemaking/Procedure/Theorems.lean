










import Proving.USC.Common.Types
import Proving.USC.T05.Rulemaking.Procedure.Types
import Proving.USC.T05.Rulemaking.Procedure.Predicates
import Proving.USC.T05.Rulemaking.Procedure.Statute

namespace Proving.USC.T05.Rulemaking.Procedure

open Proving.USC.Common


theorem noticeTransition553b_intro {a r}
    (hApplies : Section553Applies a r)
    (hNotice : NoticePublished a r)
    (hContents : NoticeContentsComplete a r) :
    NoticeTransition a r :=
  { applies := hApplies, notice := hNotice, contents := hContents }


theorem commentTransition553c_intro {a r}
    (hOpened : CommentOpportunityGiven a r) :
    CommentTransition a r :=
  { opened := hOpened }


theorem adoptionTransition553c_intro {a r}
    (hConsidered : BasisAndPurposeStated a r) :
    AdoptionTransition a r :=
  { considered := hConsidered }



theorem effectiveDateTransition553d_intro {a r}
    (hTimely : WithinThirtyDayWindow a r ∨ ThirtyDayExceptionApplies a r) :
    EffectiveDateTransition a r :=
  { timely := hTimely }


theorem lawfulRuleAdoption553_intro {a r}
    (hNotice : NoticeTransition a r)
    (hComment : CommentTransition a r)
    (hAdoption : AdoptionTransition a r)
    (hPetition : PetitionRightAfforded a r) :
    LawfulRuleAdoption a r :=
  { notice := hNotice, comment := hComment,
    adoption := hAdoption, petition := hPetition }


theorem effectiveRuleTimely553_intro {a r}
    (hLawful : LawfulRuleAdoption a r)
    (hEffective : EffectiveDateTransition a r) :
    EffectiveRuleTimely a r :=
  { lawful := hLawful, effective := hEffective }




theorem effectiveReachable553_intro {a r}
    (hNotice : NoticeTransition a r)
    (hComment : CommentTransition a r)
    (hAdoption : AdoptionTransition a r)
    (hEffective : EffectiveDateTransition a r) :
    Reachable a r State.Effective :=
  .effective
    (.adopt
      (.comment
        (.notice .initiated hNotice)
        hComment)
      hAdoption)
    hEffective

end Proving.USC.T05.Rulemaking.Procedure
