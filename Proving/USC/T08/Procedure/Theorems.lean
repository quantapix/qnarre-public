




import Proving.USC.T08.Procedure.Statute

namespace Proving.USC.T08.Procedure

open Proving.USC.Common



theorem hiringOffenseTriggered_intro {c : ComplaintText} (n d : Nat)
    (hCount : QualifyingHireCount c n)
    (hSpan : HiringWindowDays c d)
    (hThr : WithinTwelveMonthThreshold n d)
    : HiringOffenseTriggered c :=
  ⟨n, d, hCount, hSpan, hThr⟩




theorem within_twelve_month_threshold_decide : WithinTwelveMonthThreshold 12 200 := by
  decide


theorem forfeitureValid_intro {cv : Conveyance} {c : ComplaintText}
    (hUsed : PropertyUsedInViolation cv c)
    (hSeized : SeizureEffected cv c)
    (hCh46 : ForfeitureUnderChapter46 cv c)
    : ForfeitureValid cv c :=
  ⟨hUsed, hSeized, hCh46⟩


theorem depositionAdmissible_intro {dep : Deposition} {c : ComplaintText}
    (hUnavail : WitnessUnavailable c)
    (hCross : WitnessAvailableForCrossExam c)
    (hFRE : DepositionCompliesWithFRE dep c)
    : DepositionAdmissible dep c :=
  ⟨hUnavail, hCross, hFRE⟩


theorem prosecutionProcedurallyValid_intro {p : Person} {c : ComplaintText}
    (hArrest : ArrestByAuthorizedOfficer p c)
    (hVenue : VenueDistrictQualifies p c)
    : ProsecutionProcedurallyValid p c :=
  ⟨hArrest, hVenue⟩

end Proving.USC.T08.Procedure
