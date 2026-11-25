






import Proving.USC.T42.GoldenAdjacent.Elements.Statute

namespace Proving.USC.T42.GoldenAdjacent.Elements

open Proving.USC.Common

theorem section1982_intro {p r c}
    (hCit : IsUnitedStatesCitizen p c)
    (hCov : CoversProtectedPropertyRight r c)
    (hInt : InterferesWithPropertyRight p r c)
    (hRace : OnBasisOfRace p r c)
    (hCause : ProximateCause p c) :
    Section1982 p r c :=
  ⟨hCit, hCov, hInt, hRace, hCause⟩

theorem section1988b_intro {p a c}
    (hEnf : EnforcesEnumeratedCivilRightsStatute a c)
    (hPrev : IsPrevailingParty p a c)
    (hNotUS : NotTheUnitedStates p c)
    (hNotBar : ¬ JudicialOfficerFeeBar p a c) :
    Section1988b p a c :=
  ⟨hEnf, hPrev, hNotUS, hNotBar⟩

theorem section1988c_intro {p a c}
    (hFee : Section1988b p a c)
    (h1981 : EnforcesSection1981OrA a c) :
    Section1988c p a c :=
  ⟨hFee, h1981⟩

end Proving.USC.T42.GoldenAdjacent.Elements
