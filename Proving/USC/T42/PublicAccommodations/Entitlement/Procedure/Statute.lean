









import Proving.USC.T42.PublicAccommodations.Entitlement.Procedure.Predicates

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Procedure

open Proving.USC.Common



structure Transition (p : Person) (c : ComplaintText) where
  «from» : State
  to     : State
  guard  : Prop





structure TimelyFilingNoticeBranch (p : Person) (c : ComplaintText) : Prop where
  trigger      : AggrievedTriggerExists p c
  byAggrieved  : InstitutedByAggrieved p c
  stateLaw     : StateLawExists p c
  noticeGiven  : StateNoticeGiven p c
  windowMet    : WithinThirtyDayNoticeWindow p c






structure TimelyFilingNoStateLawBranch (p : Person) (c : ComplaintText) : Prop where
  trigger       : AggrievedTriggerExists p c
  byAggrieved   : InstitutedByAggrieved p c
  noStateLaw    : ¬ StateLawExists p c
  referralMet   : WithinReferralWindow p c




structure ReachesMerits (p : Person) (c : ComplaintText) : Prop where
  jurisdiction  : DistrictCourtJurisdiction p c
  noExhaustion  : ExhaustionNotRequired p c




inductive WellFoundedTitleIIAction (p : Person) (c : ComplaintText) : Prop
  | viaNotice    (h : TimelyFilingNoticeBranch p c)    (m : ReachesMerits p c)
  | viaNoStateLaw (h : TimelyFilingNoStateLawBranch p c) (m : ReachesMerits p c)

end Proving.USC.T42.PublicAccommodations.Entitlement.Procedure
