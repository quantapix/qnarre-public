










import Proving.USC.T29.Review.Deontic.Predicates

namespace Proving.USC.T29.Review.Deontic

open Proving.USC.Common






structure Permission160f (p : Person) (o : BoardOrder) (c : ComplaintText) : Prop where
  addressee : IsPersonAggrievedByBoardOrder p o c
  condition : IsFinalBoardOrder o c




def Permission160fExercised
    (p : Person) (o : BoardOrder) (ct : Court) (c : ComplaintText) : Prop :=
  Permission160f p o c ∧ SeeksReviewOfBoardOrder p o ct c





structure Obligation160c (b : Board) (c : ComplaintText) : Prop where
  addressee : IsBoard b c
  condition : PreponderanceOfUnfairLaborPractice b c



def Obligation160cDischarged (b : Board) (o : BoardOrder) (c : ComplaintText) : Prop :=
  Obligation160c b c ∧ IssuedCeaseAndDesistOrder b o c




def Obligation160cBreached (b : Board) (o : BoardOrder) (c : ComplaintText) : Prop :=
  Obligation160c b c ∧ ¬ IssuedCeaseAndDesistOrder b o c





structure Power160e (b : Board) (c : ComplaintText) : Prop where
  addressee : IsBoard b c



def Power160eExercised
    (b : Board) (o : BoardOrder) (ct : Court) (c : ComplaintText) : Prop :=
  Power160e b c ∧ PetitionsForEnforcement b o ct c

end Proving.USC.T29.Review.Deontic
