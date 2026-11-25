import Proving.USC.T18.Ch113.Reslice.Elements.Statute
import Proving.USC.Common.Types
set_option autoImplicit false

namespace Proving.USC.T18.Ch113.Reslice.Elements
open Proving.USC.Common



theorem section2315Stolen_intro {p item c}
    (hStolen : IsStolenProperty item c) (hValue : MeetsValueThreshold item c)
    (hCrossed : CrossedStateOrUSBoundaryAfterTheft item c)
    (hConduct : Section2315Conduct p item c) (hScienter : KnewStolen p item c)
    : Section2315Stolen p item c :=
  ⟨hStolen, hValue, hCrossed, hConduct, hScienter⟩

theorem section2315Forged_intro {p item c}
    (hForged : IsForgedSecurityOrTaxStamp item c)
    (hCommerce : MovingInInterstateOrForeignCommerce item c)
    (hConduct : Section2315Conduct p item c) (hScienter : KnewForged p item c)
    : Section2315Forged p item c :=
  ⟨hForged, hCommerce, hConduct, hScienter⟩

theorem section2315Tool_intro {p item c}
    (hTool : IsForgingTool item c) (hCommerce : MovingInInterstateOrForeignCommerce item c)
    (hConduct : Section2315Conduct p item c) (hScienter : KnewFittedForForging p item c)
    : Section2315Tool p item c :=
  ⟨hTool, hCommerce, hConduct, hScienter⟩

theorem section2315Veterans_intro {p item c}
    (hVet : IsVeteransMemorialObject item c)
    (hCrossed : CrossedStateOrUSBoundaryAfterTheft item c)
    (hConduct : Section2315Conduct p item c) (hScienter : KnewStolen p item c)
    : Section2315Veterans p item c :=
  ⟨hVet, hCrossed, hConduct, hScienter⟩



theorem section2318Offense_intro {p item c}
    (hConduct : TraffickingConductLabel p item c) (hKnowingly : ActedKnowingly p c)
    (hObject : Section2318Object item c)
    (hJurisdiction : Section2318JurisdictionalCircumstance item c)
    : Section2318Offense p item c :=
  ⟨hConduct, hKnowingly, hObject, hJurisdiction⟩

theorem section2318CivilClaim_intro {p item c}
    (hOwner : IsCopyrightOwner p c) (hInjury : InjuredOrThreatenedByViolation p c)
    (hViolation : Section2318Offense p item c) (hLimitations : WithinSection2318Limitations p c)
    : Section2318CivilClaim p item c :=
  ⟨hOwner, hInjury, hViolation, hLimitations⟩




theorem counterfeitMark1A_intro {mark c}
    (h1 : MarkIsSpurious mark c) (h2 : MarkUsedInTrafficking mark c)
    (h3 : MarkIdenticalOrIndistinguishable mark c) (h4 : MarkAppliedToRegisteredGoods mark c)
    (h5 : MarkLikelyToCauseConfusion mark c) : CounterfeitMark1A mark c :=
  ⟨h1, h2, h3, h4, h5⟩

theorem isCounterfeitMark_of_registeredMark {mark c} (h : CounterfeitMark1A mark c)
    : IsCounterfeitMark mark c := .registeredMark h

theorem isCounterfeitMark_of_lanhamDesignation {mark c} (h : IsSpuriousLanhamDesignation mark c)
    : IsCounterfeitMark mark c := .lanhamDesignation h



theorem section2320Goods_intro {p item mark c}
    (hIntent : ActedIntentionally p c) (hConduct : TraffickingConductGoods p item c)
    (hUses : KnowinglyUsesCounterfeitMark p item c) (hMark : IsCounterfeitMark mark c)
    : Section2320Goods p item mark c :=
  ⟨hIntent, hConduct, hUses, hMark⟩

theorem section2320Labels_intro {p item mark c}
    (hIntent : ActedIntentionally p c) (hConduct : TraffickingConductGoods p item c)
    (hKnows : KnowsCounterfeitMarkApplied p item c) (hMark : IsCounterfeitMark mark c)
    (hConfusion : LikelyToCauseConfusion item c) : Section2320Labels p item mark c :=
  ⟨hIntent, hConduct, hKnows, hMark, hConfusion⟩

theorem section2320Military_intro {p item c}
    (hIntent : ActedIntentionally p c) (hConduct : TraffickingConductGoods p item c)
    (hMil : IsCounterfeitMilitaryGoodOrService item c) (hKnows : KnowsCounterfeitMilitary p item c)
    (hHarm : LikelyToCauseSeriousHarm item c) : Section2320Military p item c :=
  ⟨hIntent, hConduct, hMil, hKnows, hHarm⟩

theorem section2320Drug_intro {p item mark c}
    (hIntent : ActedIntentionally p c) (hConduct : TraffickingConductGoods p item c)
    (hDrug : IsDrug item c) (hUses : KnowinglyUsesCounterfeitMark p item c)
    (hMark : IsCounterfeitMark mark c) : Section2320Drug p item mark c :=
  ⟨hIntent, hConduct, hDrug, hUses, hMark⟩

theorem section2320Inchoate_intro {p c}
    (hIntent : ActedIntentionally p c) (hAttempts : AttemptsOrConspiresToViolate p c)
    : Section2320Inchoate p c :=
  ⟨hIntent, hAttempts⟩

end Proving.USC.T18.Ch113.Reslice.Elements
