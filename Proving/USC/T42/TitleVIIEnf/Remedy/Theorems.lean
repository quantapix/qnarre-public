






import Proving.USC.T42.TitleVIIEnf.Remedy.Statute

namespace Proving.USC.T42.TitleVIIEnf.Remedy

open Proving.USC.Common


theorem standingTitleVII_intro {p c}
    (hPR : HasPrivateRightOfAction p c)
    (hAgg : IsAggrievedPerson p c)
    (hEx : ExhaustedAdministrativeRemedies p c)
    (hTimely : ChargeTimelyFiled p c)
    (hCaus : ProximateCause p c) :
    StandingTitleVII p c :=
  ⟨hPR, hAgg, hEx, hTimely, hCaus⟩


theorem remedy2000e5g_intro {p c}
    (hStanding : StandingTitleVII p c)
    (hViol : IntentionalViolationFound p c)
    (hRedr : ReliefRedressable p c)
    (hNoBar : ¬ GoodFaithRelianceDefense p c) :
    Remedy2000e5g p c :=
  ⟨hStanding, hViol, hRedr, hNoBar⟩


theorem remedyPatternPractice_intro {p c}
    (hPat : PatternOrPracticePleaded p c)
    (hRedr : ReliefRedressable p c) :
    RemedyPatternPractice p c :=
  ⟨hPat, hRedr⟩


theorem remedyAgencyEnforcement_intro {e p c}
    (hAuth : CommissionEnforcementAuthority e c)
    (hCharge : ChargeTimelyFiled p c) :
    RemedyAgencyEnforcement e p c :=
  ⟨hAuth, hCharge⟩



theorem titleVIIEnforcer_private_intro {p c}
    (hStanding : StandingTitleVII p c) :
    TitleVIIEnforcer p c :=
  .privateAction hStanding



theorem titleVIIEnforcer_public_intro {p c}
    (hPat : PatternOrPracticePleaded p c) :
    TitleVIIEnforcer p c :=
  .publicAction hPat

end Proving.USC.T42.TitleVIIEnf.Remedy
