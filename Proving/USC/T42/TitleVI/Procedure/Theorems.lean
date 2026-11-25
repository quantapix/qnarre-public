







import Proving.USC.T42.TitleVI.Procedure.Statute

namespace Proving.USC.T42.TitleVI.Procedure

open Proving.USC.Common

theorem adviseStep_intro {a p e c}
    (hCov : IsCoveredRecipient e c) (hRule : RuleIssuedAndApproved a p c)
    (hAdv : RecipientAdvised a p c) : AdviseStep a p e c :=
  ⟨hCov, hRule, hAdv⟩

theorem voluntaryStep_intro {a p c}
    (hAdv : RecipientAdvised a p c) (hVol : VoluntaryComplianceFailed a p c)
    : VoluntaryStep a p c :=
  ⟨hAdv, hVol⟩

theorem findingStep_intro {a p c}
    (hVol : VoluntaryComplianceFailed a p c) (hFind : ExpressFindingOnRecord a p c)
    : FindingStep a p c :=
  ⟨hVol, hFind⟩

theorem reportStep_intro {a p c}
    (hFind : ExpressFindingOnRecord a p c) (hRep : ReportFiledWithCongress a p c)
    : ReportStep a p c :=
  ⟨hFind, hRep⟩

theorem effectiveStep_intro {a p c}
    (hRep : ReportFiledWithCongress a p c) (hWin : ThirtyDayReportWindowElapsed p c)
    : EffectiveStep a p c :=
  ⟨hRep, hWin⟩

theorem lawfulFundTermination_intro {a p e c}
    (hCov : IsCoveredRecipient e c) (hRule : RuleIssuedAndApproved a p c)
    (hAdv : RecipientAdvised a p c) (hVol : VoluntaryComplianceFailed a p c)
    (hFind : ExpressFindingOnRecord a p c) (hRep : ReportFiledWithCongress a p c)
    (hWin : ThirtyDayReportWindowElapsed p c)
    : LawfulFundTermination a p e c :=
  ⟨hCov, hRule, hAdv, hVol, hFind, hRep, hWin⟩

theorem abrogationTimely_intro {e c}
    (hAfter : ViolationAfter1986Cutoff e c) : AbrogationTimely e c :=
  ⟨hAfter⟩

end Proving.USC.T42.TitleVI.Procedure
