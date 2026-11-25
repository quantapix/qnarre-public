











import Proving.USC.T05.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T05.Procedure

open Proving.USC.Common







axiom AdjudicationRequiredOnRecord (proc : AgencyProceeding) (c : ComplaintText) : Prop





axiom NoticeTimelyGiven (proc : AgencyProceeding) (c : ComplaintText) : Prop






axiom HearingHeldBeforePresider (proc : AgencyProceeding) (c : ComplaintText) : Prop





axiom BurdenOfProofMet (proc : AgencyProceeding) (c : ComplaintText) : Prop





axiom DecisionOnExclusiveRecord (proc : AgencyProceeding) (c : ComplaintText) : Prop





axiom ExParteProhibitionHonored (proc : AgencyProceeding) (c : ComplaintText) : Prop





axiom InitialDecisionRendered (proc : AgencyProceeding) (c : ComplaintText) : Prop





axiom BecameFinalAgencyAction (proc : AgencyProceeding) (c : ComplaintText) : Prop







axiom ReviewNotPrecluded (act : AgencyAction) (c : ComplaintText) : Prop




axiom FinalAndNoAdequateRemedy (act : AgencyAction) (c : ComplaintText) : Prop





axiom PersonAggrieved (p : Person) (act : AgencyAction) (c : ComplaintText) : Prop





axiom JudicialReviewObtained (p : Person) (act : AgencyAction) (c : ComplaintText) : Prop

end Proving.USC.T05.Procedure
