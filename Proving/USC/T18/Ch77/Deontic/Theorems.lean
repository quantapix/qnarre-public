import Proving.USC.T18.Ch77.Deontic.Statute
set_option autoImplicit false







namespace Proving.USC.T18.Ch77.Deontic

open Proving.USC.Common


theorem prohibition1581a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hAct : PeonageActOccurred1581 p c) :
    Prohibition1581aViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition1581b_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hAct : ObstructsEnforcement p c) :
    Prohibition1581bViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition1583a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hAct : EnticementIntoSlaveryActOccurred1583 p c) :
    Prohibition1583aViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition1589a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hKnow : ActedKnowingly p c)
    (hAct : ForcedLaborActOccurred1589a p c) :
    Prohibition1589aViolated p c :=
  ⟨⟨hAddr, hKnow⟩, hAct⟩


theorem prohibition1589b_violated_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hKnow : ActedKnowingly p c)
    (hVent : VentureEngagedInForcedLabor1589b e c)
    (hAct : BenefitFromForcedLaborVentureActOccurred1589b p e c) :
    Prohibition1589bViolated p e c :=
  ⟨⟨hAddr, hKnow, hVent⟩, hAct⟩


theorem prohibition1590a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hKnow : ActedKnowingly p c)
    (hAct : TraffickingForLaborActOccurred1590a p c) :
    Prohibition1590aViolated p c :=
  ⟨⟨hAddr, hKnow⟩, hAct⟩


theorem prohibition1590b_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hAct : ObstructsEnforcement p c) :
    Prohibition1590bViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition1591a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hKnow : ActedKnowingly p c)
    (hInter : AffectsInterstateCommerce p c) (hMeans : MeansForceFraudOrMinor1591 p c)
    (hAct : SexTraffickingActOccurred1591a p c) :
    Prohibition1591aViolated p c :=
  ⟨⟨hAddr, hKnow, hInter, hMeans⟩, hAct⟩


theorem prohibition1591d_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hAct : ObstructsEnforcement p c) :
    Prohibition1591dViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition1592a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hKnow : ActedKnowingly p c)
    (hFurther : InFurtheranceOfTrafficking1592 p c)
    (hNoExc : ¬ VictimExceptionApplies1592 p c)
    (hAct : DocumentTraffickingActOccurred1592a p c) :
    Prohibition1592aViolated p c :=
  ⟨⟨hAddr, hKnow, hFurther, hNoExc⟩, hAct⟩


theorem permission1592b_intro {p : Person} {c : ComplaintText}
    (hExc : VictimExceptionApplies1592 p c) : Permission1592b p c :=
  ⟨hExc⟩


theorem prohibition1592c_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hAct : ObstructsEnforcement p c) :
    Prohibition1592cViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩

end Proving.USC.T18.Ch77.Deontic
