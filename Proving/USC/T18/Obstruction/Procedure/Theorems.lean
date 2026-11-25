









import Proving.USC.T18.Obstruction.Procedure.Statute

namespace Proving.USC.T18.Obstruction.Procedure

open Proving.USC.Common (Person ComplaintText)



theorem wellFormedProsecution_intro {p : Person} {c : ComplaintText}
    (hConduct : ObstructiveConductOccurred p c)
    (hCommenced : ProsecutionCommenced p c)
    (hProceeding : ProceedingIntendedToBeAffected p c)
    (hJurisdiction : FederalJurisdictionReaches p c)
    (hVenue : ProperVenue p c)
    (hDefense : AffirmativeDefenseNotEstablished p c) :
    WellFormedProsecution p c :=
  ⟨hConduct, hCommenced, hProceeding, hJurisdiction, hVenue, hDefense⟩



theorem properVenue_intro_proceeding {p : Person} {c : ComplaintText}
    (h : VenueInProceedingAffectedDistrict p c) : ProperVenue p c :=
  Or.inl h



theorem properVenue_intro_conduct {p : Person} {c : ComplaintText}
    (h : VenueInConductDistrict p c) : ProperVenue p c :=
  Or.inr h



theorem reachesAdjudicated_intro {p : Person} {c : ComplaintText}
    (w : WellFormedProsecution p c) : Reaches p c State.Adjudicated :=
  .adjudicate
    (.establishVenue
      (.commence .start w.commenced w.proceeding w.jurisdiction)
      w.venue)
    w.defenseFails

end Proving.USC.T18.Obstruction.Procedure
