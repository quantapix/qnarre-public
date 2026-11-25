








import Proving.USC.T18.Wave.Deontic.Statute

namespace Proving.USC.T18.Wave.Deontic

open Proving.USC.Common



theorem prohibitionViolated1962a_intro {p e c}
    (hAddr : AddresseeInClass1962a p c)
    (hCond : EnterpriseAffectsCommerce e c)
    (hAct : RegulatedActOccurred1962a p e c)
    (hNoSafeHarbor : SecuritiesSafeHarbor1962a p e c → False) :
    ProhibitionViolated1962a p e c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoSafeHarbor⟩


theorem prohibitionViolated1962b_intro {p e c}
    (hAddr : AddresseeInClass1962b p c)
    (hCond : EnterpriseAffectsCommerce e c)
    (hAct : RegulatedActOccurred1962b p e c) :
    ProhibitionViolated1962b p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated1962c_intro {p e c}
    (hAddr : AddresseeInClass1962c p e c)
    (hCond : EnterpriseAffectsCommerce e c)
    (hAct : RegulatedActOccurred1962c p e c) :
    ProhibitionViolated1962c p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated1962d_intro {p c}
    (hConspire : ConspiredToViolate1962d p c) :
    ProhibitionViolated1962d p c :=
  hConspire



theorem ricoProhibitionViolated_viaC_intro {p c}
    (e : Enterprise) (h : ProhibitionViolated1962c p e c) :
    RicoProhibitionViolated p c :=
  .viaC e h


theorem criminalForfeiture1963_intro {p c}
    (hViol : ViolatedSection1962 p c)
    (hForf : HoldsForfeitableInterest1963 p c) :
    CriminalForfeiture1963 p c :=
  ⟨hViol, hForf⟩


theorem civilRemedy1964c_intro {p c}
    (hInjured : InjuredByViolation1964c p c)
    (hNoBar : SecuritiesFraudBar1964c p c → False) :
    CivilRemedy1964c p c :=
  ⟨hInjured, hNoBar⟩

end Proving.USC.T18.Wave.Deontic
