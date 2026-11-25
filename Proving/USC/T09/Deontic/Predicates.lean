
















import Proving.USC.T09.Deontic.Types

namespace Proving.USC.T09.Deontic

open Proving.USC.Common





axiom IsWrittenArbitrationAgreement (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom RevocationGroundExists (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom IssueReferableToArbitration (a : ArbitrationAgreement) (pr : Proceeding) (c : ComplaintText) : Prop





axiom PartyAppliedForRelief (p : Person) (c : ComplaintText) : Prop




axiom ApplicantNotInDefault (p : Person) (c : ComplaintText) : Prop





axiom FailureToArbitrate (p : Person) (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom MakingNotInIssue (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom AwardConfirmationTimely (w : ArbitralAward) (c : ComplaintText) : Prop





axiom NoGroundToRefuseConfirmation (w : ArbitralAward) (c : ComplaintText) : Prop





axiom CourtEnteredOrder (pr : Proceeding) (c : ComplaintText) : Prop





axiom IsPredisputeArbitrationAgreement (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom SexualMisconductDisputeElected (p : Person) (c : ComplaintText) : Prop





axiom EnforcementSought (a : ArbitrationAgreement) (c : ComplaintText) : Prop

end Proving.USC.T09.Deontic
