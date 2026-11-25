






import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Remedy.Types
import Proving.USC.T42.TitleVI.Remedy.Predicates
import Proving.USC.T42.TitleVI.Remedy.Statute

namespace Proving.USC.T42.TitleVI.Remedy

open Proving.USC.Common


theorem standing2000d_intro {p e c}
    (hPR : HasPrivateRightOfAction p c)
    (hInt : IsIntentionalDiscriminationTheory p c)
    (hInj : InjuryCognizable p c)
    (hCaus : CausedByViolation p c)
    (hFund : IsFederalFundingRecipient e c) :
    Standing2000d p e c :=
  ⟨hPR, hInt, hInj, hCaus, hFund⟩


theorem standing2000d7State_intro {p e c}
    (hBase : Standing2000d p e c)
    (hImm : StateImmunityAbrogated p c) :
    Standing2000d7State p e c :=
  ⟨hBase, hImm⟩


theorem agencyEnforcement2000d1_intro {e c}
    (hFund : IsFederalFundingRecipient e c)
    (hComp : AgencyCompliancePredicateMet e c) :
    AgencyEnforcement2000d1 e c :=
  ⟨hFund, hComp⟩



theorem titleVIRemedyAvenue_private_intro {p e c}
    (h : Standing2000d p e c) : TitleVIRemedyAvenue p e c :=
  .privateSuit h



theorem titleVIRemedyAvenue_state_intro {p e c}
    (h : Standing2000d7State p e c) : TitleVIRemedyAvenue p e c :=
  .stateSuit h



theorem titleVIRemedyAvenue_agency_intro {p e c}
    (h : AgencyEnforcement2000d1 e c) : TitleVIRemedyAvenue p e c :=
  .agency h

end Proving.USC.T42.TitleVI.Remedy
