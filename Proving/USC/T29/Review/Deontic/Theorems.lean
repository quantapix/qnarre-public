






import Proving.USC.T29.Review.Deontic.Statute

namespace Proving.USC.T29.Review.Deontic

open Proving.USC.Common



theorem permission160fExercised_intro {p o ct c}
    (hAddr : IsPersonAggrievedByBoardOrder p o c)
    (hCond : IsFinalBoardOrder o c)
    (hAct  : SeeksReviewOfBoardOrder p o ct c) :
    Permission160fExercised p o ct c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligation160cDischarged_intro {b o c}
    (hAddr : IsBoard b c)
    (hCond : PreponderanceOfUnfairLaborPractice b c)
    (hAct  : IssuedCeaseAndDesistOrder b o c) :
    Obligation160cDischarged b o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligation160cBreached_intro {b o c}
    (hAddr : IsBoard b c)
    (hCond : PreponderanceOfUnfairLaborPractice b c)
    (hNo   : ¬ IssuedCeaseAndDesistOrder b o c) :
    Obligation160cBreached b o c :=
  ⟨⟨hAddr, hCond⟩, hNo⟩



theorem power160eExercised_intro {b o ct c}
    (hAddr : IsBoard b c)
    (hAct  : PetitionsForEnforcement b o ct c) :
    Power160eExercised b o ct c :=
  ⟨⟨hAddr⟩, hAct⟩

end Proving.USC.T29.Review.Deontic
