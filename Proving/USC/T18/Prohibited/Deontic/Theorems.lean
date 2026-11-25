










import Proving.USC.T18.Prohibited.Deontic.Statute
import Proving.USC.T18.Prohibited.Deontic.Doctrine
import Proving.USC.Common.Tactic

namespace Proving.USC.T18.Prohibited.Deontic

open Proving.USC.Common



theorem prohibition1962a_violated_intro {p e c}
    (hIncome : ReceivedPatternIncome p c) (hPrincipal : ParticipatedAsPrincipal p c)
    (hCond : EnterpriseAffectsCommerce e c) (hAct : UsedOrInvestedIncome p e c) :
    ProhibitionViolated1962a p e c :=
  ⟨⟨by prove_element, hCond⟩, hAct⟩


theorem prohibition1962b_violated_intro {p e c}
    (hCond : EnterpriseAffectsCommerce e c) (hAct : AcquiredOrMaintainedInterest p e c) :
    ProhibitionViolated1962b p e c :=
  ⟨⟨hCond⟩, hAct⟩



theorem prohibition1962c_violated_intro_employed {p e c}
    (hEmployed : EmployedByEnterprise p e c)
    (hCond : EnterpriseAffectsCommerce e c) (hAct : ConductedAffairsThroughPattern p e c) :
    ProhibitionViolated1962c p e c :=
  ⟨⟨by prove_element, hCond⟩, hAct⟩


theorem prohibition1962c_violated_intro_associated {p e c}
    (hAssociated : AssociatedWithEnterprise p e c)
    (hCond : EnterpriseAffectsCommerce e c) (hAct : ConductedAffairsThroughPattern p e c) :
    ProhibitionViolated1962c p e c :=
  ⟨⟨by prove_element, hCond⟩, hAct⟩


theorem prohibition1962d_violated_intro {p ag c}
    (hAct : ConspiredToViolate p ag c) :
    ProhibitionViolated1962d p ag c :=
  hAct

end Proving.USC.T18.Prohibited.Deontic
