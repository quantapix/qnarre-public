







import Proving.USC.T18.Sec1961BPredicates.Deontic.Statute

namespace Proving.USC.T18.Sec1961BPredicates.Deontic

open Proving.USC.Common


theorem prohibition2314_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass2314 p c) (hScienter : ActedKnowingly p c)
    (hCommerce : AffectsInterstateCommerce c) (hCond : ConditionMet2314 c)
    (hAct : RegulatedActOccurred2314 p c) : ProhibitionViolated2314 p c :=
  ⟨⟨hAddr, hScienter, hCommerce, hCond⟩, hAct⟩


theorem prohibition2315_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass2315 p c) (hScienter : ActedKnowingly p c)
    (hCommerce : AffectsInterstateCommerce c) (hCond : ConditionMet2315 c)
    (hAct : RegulatedActOccurred2315 p c) : ProhibitionViolated2315 p c :=
  ⟨⟨hAddr, hScienter, hCommerce, hCond⟩, hAct⟩


theorem prohibition1028_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass1028 p c) (hScienter : ActedKnowingly p c)
    (hCond : ConditionMet1028 c) (hAct : RegulatedActOccurred1028 p c)
    : ProhibitionViolated1028 p c :=
  ⟨⟨hAddr, hScienter, hCond⟩, hAct⟩


theorem prohibition1029_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass1029 p c) (hScienter : ActedKnowingly p c)
    (hCond : ConditionMet1029 c) (hAct : RegulatedActOccurred1029 p c)
    : ProhibitionViolated1029 p c :=
  ⟨⟨hAddr, hScienter, hCond⟩, hAct⟩


theorem prohibition1955_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass1955 p c) (hCond : ConditionMet1955 c)
    (hAct : RegulatedActOccurred1955 p c) : ProhibitionViolated1955 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1084a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass1084a p c) (hScienter : ActedKnowingly p c)
    (hCommerce : AffectsInterstateCommerce c) (hCond : ConditionMet1084a c)
    (hAct : RegulatedActOccurred1084a p c) : ProhibitionViolated1084a p c :=
  ⟨⟨hAddr, hScienter, hCommerce, hCond⟩, hAct⟩


theorem obligation1084d_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass1084d p c) (hCond : ConditionMet1084d c)
    (hNotDone : ¬ RequiredActPerformed1084d p c) : ObligationBreached1084d p c :=
  ⟨⟨hAddr, hCond⟩, hNotDone⟩


theorem obligation1084d_discharged_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass1084d p c) (hCond : ConditionMet1084d c)
    (hDone : RequiredActPerformed1084d p c) : ObligationDischarged1084d p c :=
  ⟨⟨hAddr, hCond⟩, hDone⟩


theorem permission1028e_exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass1028e p c) (hCond : ConditionMet1028e c)
    (hAct : RegulatedActOccurred1028e p c) : PermissionExercised1028e p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Sec1961BPredicates.Deontic
