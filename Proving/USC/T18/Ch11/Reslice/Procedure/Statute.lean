import Proving.USC.T18.Ch11.Reslice.Procedure.Types
import Proving.USC.T18.Ch11.Reslice.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Procedure

open Proving.USC.Common






abbrev WithinDayWindow (elapsed window : Nat) : Prop := elapsed ≤ window





structure UntimelyPostEmploymentContact (p : Person) (c : ComplaintText) : Prop where
  formerOfficial     : FormerOfficerOrEmployee p c
  terminated         : ServiceTerminated p c
  contactMade        : RestrictedContactMade p c
  withinPeriod       : ContactWithinRestrictedPeriod p c
  restrictionApplies : PostEmploymentRestrictionApplies p c



structure CivilEnforcementEstablished (p : Person) (c : ComplaintText) : Prop where
  actionBrought         : CivilEnforcementActionBrought p c
  provenByPreponderance : ProvenByPreponderance p c



structure InjunctiveReliefEstablished (p : Person) (c : ComplaintText) : Prop where
  petitionFiled : InjunctivePetitionFiled p c
  courtFound    : CourtFoundOffenseConduct p c



structure VoidingRecoveryAuthorized (p : Person) (c : ComplaintText) : Prop where
  finalConviction    : FinalConvictionEntered p c
  rescissionDeclared : RescissionDeclared p c




structure ConflictSafeHarborSatisfied (p : Person) (c : ComplaintText) : Prop where
  disclosedInAdvance           : FinancialInterestDisclosedInAdvance p c
  advanceDeterminationReceived : AdvanceWrittenDeterminationReceived p c



structure ContinuingEnterpriseAccumulation (p : Person) (c : ComplaintText) : Prop where
  series                 : SeriesOfPredicateViolations p c
  receiptsWithin24Months : ReceiptsThresholdWithinTwentyFourMonths p c


structure ProcurementFeeDisclosureSatisfied (p : Person) (c : ComplaintText) : Prop where
  feeDisclosedInWriting : FeeDisclosedInWritingInApplication p c




inductive Reachable (p : Person) (c : ComplaintText) : State → Prop
  | inService : Reachable p c State.InService
  | terminate : Reachable p c State.InService → ServiceTerminated p c →
      Reachable p c State.Terminated
  | barred    : Reachable p c State.Terminated → RestrictedContactMade p c →
      ContactWithinRestrictedPeriod p c → PostEmploymentRestrictionApplies p c →
      Reachable p c State.Barred

end Proving.USC.T18.Ch11.Reslice.Procedure
