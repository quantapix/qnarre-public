









import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Deontic.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Deontic.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Deontic.Statute

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Deontic

open Proving.USC.Common



theorem power2000a4Investigate_exercised_intro {c}
    (hAddr : AddresseeIsService c) (hCond : ComplaintReferredByCourt c)
    (hAct : InvestigationConducted c) :
    Power2000a4Investigate_exercised c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligation2000a4ExecSession_breached_intro {c}
    (hAddr : AddresseeIsService c) (hCond : ComplaintReferredByCourt c)
    (hNoAct : ¬ HearingsInExecutiveSession c) :
    Obligation2000a4ExecSession_breached c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩



theorem prohibition2000a4Release_violated_intro {c}
    (hAddr : AddresseeIsService c) (hAct : TestimonyReleased c)
    (hUnauth : ¬ ReleaseAuthorized c) :
    Prohibition2000a4Release_violated c :=
  ⟨⟨hAddr⟩, hAct, hUnauth⟩



theorem obligation2000a4Settlement_breached_intro {c}
    (hAddr : AddresseeIsService c) (hCond : ComplaintReferredByCourt c)
    (hNoAct : ¬ EndeavoredVoluntarySettlement c) :
    Obligation2000a4Settlement_breached c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩



theorem permission2000a5AGAction_exercised_intro {c}
    (hCond : PatternOrPracticeCause c) (hAct : AGBroughtCivilAction c) :
    Permission2000a5AGAction_exercised c :=
  ⟨⟨hCond⟩, hAct⟩



theorem obligation2000a5Designate_breached_intro {j c}
    (hAddr : AddresseeIsChiefJudge j c) (hCond : ThreeJudgeRequestFiled c)
    (hNoAct : ¬ PanelDesignated j c) :
    Obligation2000a5Designate_breached j c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩

end Proving.USC.T42.PublicAccommodations.Enforcement.Deontic
