







import Proving.USC.T18.Ch77Tail.Procedure.Statute

namespace Proving.USC.T18.Ch77Tail.Procedure

open Proving.USC.Common


theorem penalty1582_intro {n : Years} {p : Person} {c : ComplaintText}
    (hConduct : VesselPreparedForSlaveTrade p c)
    (hTerm : ImprisonmentTermImposed n p c)
    (hWithin : n ≤ ceiling1582) : Penalty1582 n p c :=
  ⟨hConduct, hTerm, hWithin⟩


theorem penalty1585_intro {n : Years} {p : Person} {c : ComplaintText}
    (hConduct : ForeignShoreSlaveConduct p c)
    (hTerm : ImprisonmentTermImposed n p c)
    (hWithin : n ≤ ceiling1585) : Penalty1585 n p c :=
  ⟨hConduct, hTerm, hWithin⟩


theorem penalty1586_intro {n : Years} {p : Person} {c : ComplaintText}
    (hConduct : VoluntarilyServedOnSlaveVessel p c)
    (hTerm : ImprisonmentTermImposed n p c)
    (hWithin : n ≤ ceiling1586) : Penalty1586 n p c :=
  ⟨hConduct, hTerm, hWithin⟩


theorem penalty1587_intro {n : Years} {p : Person} {c : ComplaintText}
    (hConduct : PossessedSlaveAboardVessel p c)
    (hTerm : ImprisonmentTermImposed n p c)
    (hWithin : n ≤ ceiling1587) : Penalty1587 n p c :=
  ⟨hConduct, hTerm, hWithin⟩


theorem penalty1588_intro {n : Years} {p : Person} {c : ComplaintText}
    (hConduct : ReceivedOrCarriedPersonAsSlave p c)
    (hTerm : ImprisonmentTermImposed n p c)
    (hWithin : n ≤ ceiling1588) : Penalty1588 n p c :=
  ⟨hConduct, hTerm, hWithin⟩


theorem documentOffense1592_intro {p : Person} {c : ComplaintText}
    (hConduct : DocumentOffenseInFurtherance p c)
    (hNotVictim : ¬ IsTraffickingVictimSafeHarbor p c) : DocumentOffense1592 p c :=
  ⟨hConduct, hNotVictim⟩


theorem enforcementObstruction1592_intro {p : Person} {c : ComplaintText}
    (hObstructed : ObstructedEnforcement p c) : EnforcementObstruction1592 p c :=
  ⟨hObstructed⟩

end Proving.USC.T18.Ch77Tail.Procedure
