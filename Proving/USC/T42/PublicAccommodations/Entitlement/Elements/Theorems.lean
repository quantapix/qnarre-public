





import Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Elements

open Proving.USC.Common


theorem placeOfPublicAccommodation_intro {e c}
    (hEnum : IsEnumeratedEstablishment e c)
    (hNotExempt : NotExemptPrivateClub e c) :
    PlaceOfPublicAccommodation e c :=
  ⟨hEnum, hNotExempt⟩


theorem section2000aCommerce_intro {p e c}
    (hCov : PlaceOfPublicAccommodation e c)
    (hICC : OperationsAffectCommerce e c)
    (hDenied : DeniedFullAndEqualEnjoyment p e c)
    (hGround : DiscriminatedOnProhibitedGround p e c) :
    Section2000aCommerce p e c :=
  ⟨hCov, hICC, hDenied, hGround⟩


theorem section2000aStateAction_intro {p e c}
    (hCov : PlaceOfPublicAccommodation e c)
    (hSA : DiscriminationSupportedByStateAction e c)
    (hDenied : DeniedFullAndEqualEnjoyment p e c)
    (hGround : DiscriminatedOnProhibitedGround p e c) :
    Section2000aStateAction p e c :=
  ⟨hCov, hSA, hDenied, hGround⟩


theorem section2000aViolation_commerce_intro {p e c}
    (h : Section2000aCommerce p e c) : Section2000aViolation p e c :=
  .commerce h


theorem section2000aViolation_stateAction_intro {p e c}
    (h : Section2000aStateAction p e c) : Section2000aViolation p e c :=
  .stateAction h


theorem validTitleIIPublicAccommodationClaim_intro {p e c}
    (hViol : Section2000aViolation p e c)
    (hInUS : IsPersonInUS p c)
    (hAggr : IsPersonAggrieved p c)
    (hRelief : SeeksPreventiveRelief p c)
    (hNotice : GaveStatePresuitNotice p c)
    (hTimely : WithinLimitations p c) :
    ValidTitleIIPublicAccommodationClaim p e c :=
  ⟨hViol, hInUS, hAggr, hRelief, hNotice, hTimely⟩

end Proving.USC.T42.PublicAccommodations.Entitlement.Elements
