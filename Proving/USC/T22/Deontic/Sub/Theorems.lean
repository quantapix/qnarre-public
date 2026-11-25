






import Proving.USC.T22.Deontic.Sub.Statute

namespace Proving.USC.T22.Deontic.Sub
open Proving.USC.Common


theorem obligation7103a_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsPresident p c)
    (hCond : ChapterInEffect c)
    (hNotDone : ¬ EstablishedTaskForce p c)
    : Obligation7103aBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotDone⟩


theorem obligation7103d_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsTaskForce p c)
    (hCond : ChapterInEffect c)
    (hNotDone : ¬ CarriedOutTaskForceActivities p c)
    : Obligation7103dBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotDone⟩


theorem obligation7103d7_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral p c)
    (hCond : ChapterInEffect c)
    (hNotDone : ¬ SubmittedAnnualReport p c)
    : Obligation7103d7Breached p c :=
  ⟨⟨hAddr, hCond⟩, hNotDone⟩


theorem obligation7103g5_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsPresident p c)
    (hCond : ChapterInEffect c)
    (hNotDone : ¬ PromulgatedImplementingRegulations p c)
    : Obligation7103g5Breached p c :=
  ⟨⟨hAddr, hCond⟩, hNotDone⟩



theorem obligation7106a_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsForeignGovernment p c)
    (hCond : IsCountryOfTraffickingConcern p c)
    (hNotMet : ¬ MinimumStandardsMet p c)
    : Obligation7106aBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotMet⟩

end Proving.USC.T22.Deontic.Sub
