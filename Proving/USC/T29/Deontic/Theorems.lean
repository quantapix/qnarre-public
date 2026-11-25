






import Proving.USC.T29.Deontic.Statute

namespace Proving.USC.T29.Deontic

open Proving.USC.Common



theorem prohibitionViolatedS158a_intro {p e c}
    (hAddr : EmployerAddressee p c) (hCond : AffectsCommerce e c)
    (hAct : EmployerULPActOccurred p c) : ProhibitionViolatedS158a p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolatedS158b_intro {l e c}
    (hAddr : LaborOrgAddressee l c) (hCond : AffectsCommerce e c)
    (hAct : LaborOrgULPActOccurred l c) : ProhibitionViolatedS158b l e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolatedS158e_intro {p l e c}
    (hEmp : EmployerAddressee p c) (hOrg : LaborOrgAddressee l c)
    (hCond : AffectsCommerce e c) (hAct : HotCargoAgreementEntered p l c) :
    ProhibitionViolatedS158e p l e c :=
  ⟨⟨hEmp, hOrg, hCond⟩, hAct⟩


theorem obligationBreachedS158d_intro {p c}
    (hCond : BargainingDutyCondition p c)
    (hNot : ¬ BargainingObligationDischarged p c) : ObligationBreachedS158d p c :=
  ⟨⟨hCond⟩, hNot⟩


theorem obligationBreachedS158g_intro {l c}
    (hCond : HealthcareNoticeCondition l c)
    (hNot : ¬ HealthcareNoticeGiven l c) : ObligationBreachedS158g l c :=
  ⟨⟨hCond⟩, hNot⟩


theorem obligationBreachedS153c_intro {b c}
    (hCond : FiscalYearClosed b c)
    (hNot : ¬ AnnualReportMade b c) : ObligationBreachedS153c b c :=
  ⟨⟨hCond⟩, hNot⟩


theorem boardCompetenceSuite_intro {b c}
    (hDel : BoardDelegationPower b c) (hPrev : BoardPreventionPower b c)
    (hInv : BoardInvestigatoryPower b c) : BoardCompetenceSuite b c :=
  ⟨hDel, hPrev, hInv⟩


theorem prohibitionViolatedS162_intro {p c}
    (hAddr : AnyPersonAddressee p c)
    (hAct : InterfereWithBoardOccurred p c) : ProhibitionViolatedS162 p c :=
  ⟨⟨hAddr⟩, hAct⟩

end Proving.USC.T29.Deontic
