











import Proving.USC.T05.ScopeOfReview.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T05.ScopeOfReview.Elements

open Proving.USC.Common








structure Section705
    (p : Person) (court : ReviewingCourt) (a : AgencyAction) (c : ComplaintText) : Prop where
  aggrieved      : AggrievedByAgencyAction p c
  reviewable     : FinalAgencyActionReviewable p c
  reviewingCourt : IsReviewingCourt court a c
  irreparable    : NecessaryToPreventIrreparableInjury a c
  relief         : ReliefPostponesOrPreservesPendingReview a c





inductive SetAsideTheory (a : AgencyAction) (c : ComplaintText) : Prop where

  | arbitraryCapricious   : ArbitraryCapricious a c → SetAsideTheory a c

  | contraryConstitution  : ContraryToConstitutionalRight a c → SetAsideTheory a c

  | excessStatutory       : InExcessOfStatutoryAuthority a c → SetAsideTheory a c

  | proceduralDefect      : WithoutObservanceOfProcedure a c → SetAsideTheory a c

  | noSubstantialEvidence : UnsupportedBySubstantialEvidence a c → SetAsideTheory a c

  | unwarrantedDeNovo     : UnwarrantedByFactsDeNovo a c → SetAsideTheory a c








structure Section706SetAside
    (p : Person) (a : AgencyAction) (c : ComplaintText) : Prop where
  aggrieved   : AggrievedByAgencyAction p c
  reviewable  : FinalAgencyActionReviewable p c
  questionLaw : RelevantQuestionOfLawPresented a c
  ground      : SetAsideTheory a c
  wholeRecord : WholeRecordReviewed a c
  notHarmless : ¬ HarmlessError a c






structure Section706Compel
    (p : Person) (a : AgencyAction) (c : ComplaintText) : Prop where
  aggrieved   : AggrievedByAgencyAction p c
  reviewable  : FinalAgencyActionReviewable p c
  questionLaw : RelevantQuestionOfLawPresented a c
  withheld    : ActionUnlawfullyWithheldOrDelayed a c

end Proving.USC.T05.ScopeOfReview.Elements
