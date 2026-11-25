





import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part3.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Deontic

open Proving.USC.Common








axiom IsSentencingCourt (ct : Court) (c : ComplaintText) : Prop




axiom OffenseUnderChapter77 (o : ChapterOffense) (c : ComplaintText) : Prop



axiom CourtOrderedRestitution (ct : Court) (o : ChapterOffense) (c : ComplaintText) : Prop







axiom OtherPenaltyAuthorizedByLaw (ct : Court) (o : ChapterOffense) (c : ComplaintText) : Prop




axiom CourtImposedAdditionalPenalty (ct : Court) (o : ChapterOffense) (c : ComplaintText) : Prop






axiom IsOrderUnderSection1593 (r : RestitutionOrder) (c : ComplaintText) : Prop





axiom IsDefendantForOffense (d : Person) (o : ChapterOffense) (c : ComplaintText) : Prop




axiom IsVictimUnderSection1593 (v : Person) (o : ChapterOffense) (c : ComplaintText) : Prop





axiom OrderDirectsDefendantToPayFullAmount
  (r : RestitutionOrder) (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom PaymentRoutedThroughCourtMechanism (r : RestitutionOrder) (c : ComplaintText) : Prop








axiom OrderIssuedAndEnforcedUnderSection3664 (r : RestitutionOrder) (c : ComplaintText) : Prop









axiom LossesMeasuredAsUnderSection2259
  (r : RestitutionOrder) (v : Person) (c : ComplaintText) : Prop








axiom AmountIncludesGreaterOfGrossIncomeOrLaborValue
  (r : RestitutionOrder) (d : Person) (v : Person) (c : ComplaintText) : Prop









axiom IsForfeitureUnderSubsectionB
  (f : ForfeitableProperty) (r : RestitutionOrder) (c : ComplaintText) : Prop





axiom ForfeitureGovernedBySection853 (f : ForfeitableProperty) (c : ComplaintText) : Prop







axiom IsIndividualHarmedByChapter77Crime
  (p : Person) (o : ChapterOffense) (c : ComplaintText) : Prop






axiom VictimIsMinorIncompetentIncapacitatedOrDeceased (v : Person) (c : ComplaintText) : Prop






axiom IsAuthorizedVictimStandIn (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom CourtNamedAsVictimRepresentative
  (ct : Court) (p : Person) (v : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part3.Deontic
