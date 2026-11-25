import Proving.USC.T18.Ch73.Procedure.Types
import Proving.USC.T18.Ch73.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Procedure

open Proving.USC.Common




structure GuardedTransition where
  frm   : Stage
  to    : Stage
  guard : Prop




structure ProperCommencement (p : Person) (c : ComplaintText) : Prop where
  commenced    : ProsecutionCommenced p c
  venue        : VenueProper p c
  jurisdiction : FederalJurisdictionEstablished p c




structure ReachesAdjudication (p : Person) (c : ComplaintText) : Prop where
  commencement    : ProperCommencement p c
  proceedingNexus : OfficialProceedingNexus p c
  noDefense       : AffirmativeDefenseNotEstablished p c





structure EnhancedSentencing (p : Person) (c : ComplaintText) : Prop where
  adjudication : ReachesAdjudication p c
  trialNexus   : CriminalTrialNexus p c


def commenceTransition (p : Person) (c : ComplaintText) : GuardedTransition :=
  { frm := .Conduct, to := .Prosecuted, guard := ProperCommencement p c }

def adjudicateTransition (p : Person) (c : ComplaintText) : GuardedTransition :=
  { frm := .Prosecuted, to := .Adjudicated, guard := ReachesAdjudication p c }

def enhancedSentenceTransition (p : Person) (c : ComplaintText) : GuardedTransition :=
  { frm := .Adjudicated, to := .Sentenced, guard := EnhancedSentencing p c }

end Proving.USC.T18.Ch73.Procedure
