









import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Procedure.Types
import Proving.USC.T18.Ch75.Procedure.Predicates
import Proving.USC.T18.Ch75.Procedure.Statute

namespace Proving.USC.T18.Ch75.Procedure

open Proving.USC.Common


theorem terrorismTier_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseProven p c) (hTerr : CommittedToFacilitateTerrorism p c) :
    TerrorismTier p c :=
  ⟨hOff, hTerr⟩


theorem drugTraffickingTier_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseProven p c) (hDrug : CommittedToFacilitateDrugTrafficking p c)
    (hNotTerr : ¬ CommittedToFacilitateTerrorism p c) :
    DrugTraffickingTier p c :=
  ⟨hOff, hDrug, hNotTerr⟩


theorem firstOrSecondTier_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseProven p c)
    (hNotTerr : ¬ CommittedToFacilitateTerrorism p c)
    (hNotDrug : ¬ CommittedToFacilitateDrugTrafficking p c)
    (hFos : IsFirstOrSecondOffense p c) :
    FirstOrSecondTier p c :=
  ⟨hOff, hNotTerr, hNotDrug, hFos⟩


theorem otherTier_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseProven p c)
    (hNotTerr : ¬ CommittedToFacilitateTerrorism p c)
    (hNotDrug : ¬ CommittedToFacilitateDrugTrafficking p c)
    (hNotFos : ¬ IsFirstOrSecondOffense p c) :
    OtherTier p c :=
  ⟨hOff, hNotTerr, hNotDrug, hNotFos⟩







theorem terrorism_ceiling_is_max (t : PenaltyTier) :
    t.ceilingYears ≤ PenaltyTier.Terrorism25.ceilingYears := by
  cases t <;> decide



theorem other_exceeds_firstOrSecond :
    PenaltyTier.FirstOrSecond10.ceilingYears < PenaltyTier.Other15.ceilingYears := by
  decide

end Proving.USC.T18.Ch75.Procedure
