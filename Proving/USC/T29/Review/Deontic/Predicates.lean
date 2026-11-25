













import Proving.USC.T29.Review.Deontic.Types

namespace Proving.USC.T29.Review.Deontic

open Proving.USC.Common










axiom IsPersonAggrievedByBoardOrder (p : Person) (o : BoardOrder) (c : ComplaintText) : Prop





axiom SeeksReviewOfBoardOrder (p : Person) (o : BoardOrder) (ct : Court) (c : ComplaintText) : Prop





axiom IsFinalBoardOrder (o : BoardOrder) (c : ComplaintText) : Prop









axiom IsBoard (b : Board) (c : ComplaintText) : Prop




axiom IssuedCeaseAndDesistOrder (b : Board) (o : BoardOrder) (c : ComplaintText) : Prop





axiom PreponderanceOfUnfairLaborPractice (b : Board) (c : ComplaintText) : Prop








axiom PetitionsForEnforcement (b : Board) (o : BoardOrder) (ct : Court) (c : ComplaintText) : Prop

end Proving.USC.T29.Review.Deontic
