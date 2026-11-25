







import Proving.USC.T29.Elements.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T29.Elements

open Proving.USC.Common


theorem section158a_intro {p c}
    (hEmp : IsCoveredEmployer p c) (hThy : EmployerUlpTheory p c)
    (hSpeech : ¬ ProtectedByFreeSpeech c) : Section158a p c :=
  ⟨hEmp, hThy, hSpeech⟩


theorem section158b_intro {lo c}
    (hLo : IsLaborOrganization lo c) (hThy : UnionUlpTheory lo c)
    (hSpeech : ¬ ProtectedByFreeSpeech c) : Section158b lo c :=
  ⟨hLo, hThy, hSpeech⟩


theorem section158e_intro {p lo c}
    (hEmp : IsCoveredEmployer p c) (hLo : IsLaborOrganization lo c)
    (hHot : HotCargoAgreement p lo c) : Section158e p lo c :=
  ⟨hEmp, hLo, hHot⟩


theorem validUnfairLaborPracticeCharge_intro {p c}
    (hViol : Section158Violation p c) (hNexus : FederalJurisdictionalNexus c)
    (hCharge : ChargeFiledAndServed p c) (hTimely : WithinSixMonthLimitations p c)
    (hPrep : BoardFindsByPreponderance p c) : ValidUnfairLaborPracticeCharge p c :=
  ⟨hViol, hNexus, hCharge, hTimely, hPrep⟩


theorem section162Offense_intro {p c}
    (hPerson : IsPersonInUS p c) (hWillful : WillfullyInterferesWithBoard p c)
    : Section162Offense p c :=
  ⟨hPerson, hWillful⟩

end Proving.USC.T29.Elements
