








import Proving.USC.T18.Ch113.Reslice.Procedure.Types
import Proving.USC.T18.Ch113.Reslice.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch113.Reslice.Procedure




def threeYearDays : Nat := 3 * 365





def WithinThreeYearWindow (p : Person) (c : ComplaintText) : Prop :=
  CommencementDay p c ≤ DiscoveryDay p c + threeYearDays



def ElectionBeforeFinalJudgment (p : Person) (c : ComplaintText) : Prop :=
  ElectionDay p c < FinalJudgmentDay p c




def WithinTrebleEnhancementWindow (p : Person) (c : ComplaintText) : Prop :=
  SubsequentViolationDay p c ≤ PriorFinalJudgmentDay p c + threeYearDays




structure Transition where
  frm   : State
  to    : State
  guard : Prop



structure TimelyCivilAction (p : Person) (c : ComplaintText) : Prop where
  accrued   : ViolationDiscovered p c
  commenced : CivilActionCommenced p c
  inWindow  : WithinThreeYearWindow p c



structure WellFoundedCivilAction (p : Person) (c : ComplaintText) : Prop where
  nexus  : FederalProceduralJurisdictionNexus c
  timely : TimelyCivilAction p c



structure TimelyElection (p : Person) (c : ComplaintText) : Prop where
  elected        : StatutoryDamagesElected p c
  beforeJudgment : ElectionBeforeFinalJudgment p c



structure TrebleEnhancementTriggered (p : Person) (c : ComplaintText) : Prop where
  subsequent : SubsequentViolation p c
  inWindow   : WithinTrebleEnhancementWindow p c



structure RepeatOffenderEnhancement (p : Person) (c : ComplaintText) : Prop where
  priorConviction : PriorConvictionUnderSubsectionA p c



structure VictimImpactStep (p : Person) (c : ComplaintText) : Prop where
  reportInPreparation : PresentenceReportInPreparation p c
  statementSubmitted  : VictimImpactStatementSubmitted p c



structure AnnualAccountingObligation (p : Person) (c : ComplaintText) : Prop where
  included : AttorneyGeneralAnnualReportIncluded p c

end Proving.USC.T18.Ch113.Reslice.Procedure
