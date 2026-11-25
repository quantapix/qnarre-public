






import Proving.USC.T42.TitleVI.Elements.Statute

namespace Proving.USC.T42.TitleVI.Elements

open Proving.USC.Common

theorem section2000d_intro {p e pr c}
    (hPerson : IsPersonInUS p c)
    (hFunded : IsFederalFundingRecipient e c)
    (hAdverse : SufferedCoveredAdverseAction p pr c)
    (hGround : OnProtectedGround p c)
    (hIntent : IntentToDiscriminate p c)
    (hTimely : WithinLimitations p c)
    : Section2000d p e pr c :=
  ⟨hPerson, hFunded, hAdverse, hGround, hIntent, hTimely⟩

theorem section2000dState_intro {p e pr c}
    (hBase : Section2000d p e pr c)
    (hImmunity : SovereignImmunityAbrogated p c)
    (hAfter : ViolationAfterEffectiveDate p c)
    : Section2000dState p e pr c :=
  ⟨hBase, hImmunity, hAfter⟩

theorem section2000d1_intro {a e pr c}
    (hFunded : IsFederalFundingRecipient e c)
    (hEnforce : ValidAgencyEnforcementAction a pr c)
    : Section2000d1 a e pr c :=
  ⟨hFunded, hEnforce⟩

end Proving.USC.T42.TitleVI.Elements
