import Proving.USC.T18.Enf.Elements.Statute






namespace Proving.USC.T18.Enf.Elements

open Proving.USC.Common

theorem section1964c_intro {p c}
    (hViol : ViolationOfSection1962 p c) (hPl : IsCivilRicoPlaintiff p c)
    (hInj : InjuredInBusinessOrProperty p c) (hPx : ProximateCause p c)
    (hSec : SecuritiesFraudBar p c) (hLim : WithinLimitations p c)
    : Section1964c p c :=
  ⟨hViol, hPl, hInj, hPx, hSec, hLim⟩

theorem section1964a_intro {p r c}
    (hViol : ViolationOfSection1962 p c) (hRel : AppropriateEquitableRelief r c)
    : Section1964a p r c :=
  ⟨hViol, hRel⟩

theorem section1963_intro {p prop c}
    (hConv : ConvictedOfSection1962 p c) (hProp : PropertySubjectToForfeiture prop p c)
    : Section1963 p prop c :=
  ⟨hConv, hProp⟩

theorem section1963Claimant_intro {p prop c}
    (hBfp : BonaFidePurchaserForValue prop p c)
    : Section1963Claimant p prop c :=
  ⟨hBfp⟩

theorem validCivilRicoComplaint_intro {p c}
    (hClaim : Section1964c p c) (hVenue : ProperVenue p c)
    : ValidCivilRicoComplaint p c :=
  ⟨hClaim, hVenue⟩

end Proving.USC.T18.Enf.Elements
