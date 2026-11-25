







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.Common.Tactic
import Proving.USC.T18.Ch113.Counterfeiting.Elements.Types
import Proving.USC.T18.Ch113.Counterfeiting.Elements.Predicates
import Proving.USC.T18.Ch113.Counterfeiting.Elements.Statute

namespace Proving.USC.T18.Ch113.Counterfeiting.Elements

open Proving.USC.Common



theorem section2318Offense_intro {p l w c}
    (hTraffics : TrafficsInLabel p l c) (hScienter : ActedWithScienter p c)
    (hLabel : CoveredLabel2318b l c) (hAffixed : AffixedToCoveredWork l w c)
    (hCirc : Circumstance2318c l c) :
    Section2318Offense p l w c :=
  ⟨hTraffics, hScienter, hLabel, hAffixed, hCirc⟩

theorem section2318CivilClaim_intro {p d l w c}
    (hViolation : Section2318Offense d l w c) (hOwner : IsCopyrightOwner p c)
    (hInjury : InjuredOrThreatenedByViolation p c) (hCause : ProximateCause p c)
    (hTimely : WithinLimitations p c) :
    Section2318CivilClaim p d l w c :=
  ⟨hViolation, hOwner, hInjury, hCause, hTimely⟩



theorem section2319Offense_intro {p w c}
    (hWork : IsCopyrightedWork w c) (hWillful : ActedWithScienter p c)
    (hRoute : InfringementRoute2319 p w c) :
    Section2319Offense p w c :=
  ⟨hWork, hWillful, hRoute⟩





theorem counterfeitMark_intro {m g c}
    (hSpurious : IsSpuriousMark m c) (hIdentical : MarkIdenticalToRegistered m c)
    (hRegistered : MarkAppliedToRegisteredGoods m g c) (hConfusion : LikelyToCauseConfusion m c) :
    IsCounterfeitMark m g c :=
  ⟨hSpurious, hIdentical, hRegistered, hConfusion⟩



example {m g c}
    (hSpurious : IsSpuriousMark m c) (hIdentical : MarkIdenticalToRegistered m c)
    (hRegistered : MarkAppliedToRegisteredGoods m g c) (hConfusion : LikelyToCauseConfusion m c) :
    IsCounterfeitMark m g c := by prove_element

theorem section2320Offense_intro {p m g c}
    (hScienter : ActedWithScienter p c) (hTraffics : TrafficsInGoods p g c)
    (hMark : IsCounterfeitMark m g c) (hRoute : TraffickingRoute2320a p m g c)
    (hNotRepack : ¬ IsGenuineGoodsRepackaging p g c) :
    Section2320Offense p m g c :=
  ⟨hScienter, hTraffics, hMark, hRoute, hNotRepack⟩

end Proving.USC.T18.Ch113.Counterfeiting.Elements
