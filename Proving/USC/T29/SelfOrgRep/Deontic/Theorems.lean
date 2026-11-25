






import Proving.USC.Common.Types
import Proving.USC.T29.SelfOrgRep.Deontic.Types
import Proving.USC.T29.SelfOrgRep.Deontic.Predicates
import Proving.USC.T29.SelfOrgRep.Deontic.Statute

namespace Proving.USC.T29.SelfOrgRep.Deontic

open Proving.USC.Common


theorem permission157Granted_intro {p c}
    (hAddr : IsEmployeeAddressee p c) (hAct : ProtectedConcertedAct p c) :
    Permission157Granted p c :=
  ⟨⟨hAddr⟩, hAct⟩



theorem refrainRightExercisable_intro {p c}
    (hAddr : IsEmployeeAddressee p c) (hRefrain : RefrainAct p c)
    (hNoExc : ¬ UnionSecurityException p c) :
    RefrainRightExercisable p c :=
  ⟨hAddr, hRefrain, hNoExc⟩


theorem obligation159aSatisfied_intro {lo u c}
    (hMaj : MajorityDesignated lo u c) (hExcl : TreatedAsExclusiveRep lo u c) :
    Obligation159aSatisfied lo u c :=
  ⟨⟨hMaj⟩, hExcl⟩



theorem obligation159aBreached_intro {lo u c}
    (hMaj : MajorityDesignated lo u c) (hNot : ¬ TreatedAsExclusiveRep lo u c) :
    Obligation159aBreached lo u c :=
  ⟨⟨hMaj⟩, hNot⟩


theorem obligation159bSatisfied_intro {u c}
    (hQ : UnitQuestionPresented u c) (hDec : BoardDecidedUnit u c) :
    Obligation159bSatisfied u c :=
  ⟨⟨hQ⟩, hDec⟩


theorem obligation159bBreached_intro {u c}
    (hQ : UnitQuestionPresented u c) (hNot : ¬ BoardDecidedUnit u c) :
    Obligation159bBreached u c :=
  ⟨⟨hQ⟩, hNot⟩


theorem prohibition159b3Violated_intro {lo u c}
    (hQ : UnitQuestionPresented u c) (hMixed : MixedGuardCertification lo u c) :
    Prohibition159b3Violated lo u c :=
  ⟨⟨hQ⟩, hMixed⟩


theorem prohibitionElectionBarViolated_intro {e u c}
    (hPrior : PriorValidElectionWithinYear u c) (hDir : ElectionDirected e u c) :
    ProhibitionElectionBarViolated e u c :=
  ⟨⟨hPrior⟩, hDir⟩

end Proving.USC.T29.SelfOrgRep.Deontic
