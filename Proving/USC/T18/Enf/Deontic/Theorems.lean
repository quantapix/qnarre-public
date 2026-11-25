





import Proving.USC.T18.Enf.Deontic.Statute

namespace Proving.USC.T18.Enf.Deontic

open Proving.USC.Common


theorem obligation1963aBreached_intro {p pr c}
    (hAddr : ViolatedSection1962 p c) (hCond : PropertyForfeitable pr c)
    (hAct : ForfeitureNotTendered p pr c) : Obligation1963aBreached p pr c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1963iViolated_intro {p pr c}
    (hAddr : InterestClaimant p pr c)
    (hAct : IntervenedOutsideAncillary p pr c) : Prohibition1963iViolated p pr c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem remedialPower1964Invoked_intro {c}
    (hShown : RemedialPowerInvoked c) : RemedialPower1964Invoked c :=
  hShown


theorem permission1964cAvailable_intro {p c}
    (hInjury : InjuredByViolation p c)
    (hNotBarred : SecuritiesFraudBarInapplicable p c) : Permission1964cAvailable p c :=
  ⟨hInjury, hNotBarred⟩


theorem permission1965aAvailable_intro {p c}
    (hVenue : VenueProper p c) : Permission1965aAvailable p c :=
  hVenue

end Proving.USC.T18.Enf.Deontic
