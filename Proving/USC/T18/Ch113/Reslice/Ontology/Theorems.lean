import Proving.USC.T18.Ch113.Reslice.Ontology.Statute
import Proving.USC.Common.Types
set_option autoImplicit false
namespace Proving.USC.T18.Ch113.Reslice.Ontology
open Proving.USC.Common




theorem stateMembership_intro {j : Jurisdiction} {c : ComplaintText}
    (h : IsState j c) : StateMembership j c :=
  StateMembership.stateOfUnitedStates h


theorem counterfeitMarkMembership_intro {m : Mark} {c : ComplaintText}
    (h : IsCounterfeitMark m c) : CounterfeitMarkMembership m c :=
  CounterfeitMarkMembership.spuriousMark h


theorem counterfeitDocPackagingMembership_intro {p : Packaging} {c : ComplaintText}
    (hBase : IsDocumentationOrPackaging p c)
    (hCf : IsCounterfeitDocumentationOrPackaging p c)
    : CounterfeitDocPackagingMembership p c := ⟨hBase, hCf⟩


theorem counterfeitMilitaryMembership_intro {g : GoodOrService} {m : Mark} {c : ComplaintText}
    (hMark : IsCounterfeitMark m c) (hMil : IsCounterfeitMilitaryGoodOrService g c)
    : CounterfeitMilitaryMembership g m c := ⟨hMark, hMil⟩


theorem trafficMembership_intro {act : Conduct} {g : Gain} {c : ComplaintText}
    (hGain : IsFinancialGain g c) (hTraffic : IsTraffic act c)
    : TrafficMembership act g c := ⟨hGain, hTraffic⟩

end Proving.USC.T18.Ch113.Reslice.Ontology
