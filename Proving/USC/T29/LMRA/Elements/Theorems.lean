







import Proving.USC.T29.LMRA.Elements.Statute

namespace Proving.USC.T29.LMRA.Elements

open Proving.USC.Common


theorem section185_intro {p e k c}
    (hParty : IsPartyToLaborContract p k c) (hCov : IsSection301Contract k c)
    (hICC : EngagedInInterstateCommerce e c) (hBreach : ContractViolated k c) :
    Section185 p e k c :=
  ⟨hParty, hCov, hICC, hBreach⟩


theorem section178_intro {w c}
    (hAff : AffectsEntireIndustry w c) (hImp : ImperilsNationalHealthOrSafety w c)
    (hProc : BoardOfInquiryReportAndPetition c) :
    Section178 w c :=
  ⟨hAff, hImp, hProc⟩


theorem section186_intro {p pay c}
    (hProh : IsProhibitedPayment pay c) (hCov : CoveredPayerAndPayee pay c)
    (hNoExc : NotWithinSection186cException pay c) (hScienter : ActedWithScienter p c) :
    Section186 p pay c :=
  ⟨hProh, hCov, hNoExc, hScienter⟩


theorem section187_intro {p lo c}
    (hConduct : EngagedInSection158b4Conduct p c) (hICC : EngagedInInterstateCommerce lo c)
    (hInjury : InjuredInBusinessOrProperty p c) (hCause : ProximateCause p c)
    (hTimely : WithinLimitations p c) :
    Section187 p lo c :=
  ⟨hConduct, hICC, hInjury, hCause, hTimely⟩


theorem validLMRAClaim_contract_intro {p e k c} (h : Section185 p e k c) :
    ValidLMRAClaim p e c :=
  .contract k h


theorem validLMRAClaim_financial_intro {p e pay c} (h : Section186 p pay c) :
    ValidLMRAClaim p e c :=
  .financial pay h


theorem validLMRAClaim_boycott_intro {p e c} (h : Section187 p e c) :
    ValidLMRAClaim p e c :=
  .boycott h

end Proving.USC.T29.LMRA.Elements
