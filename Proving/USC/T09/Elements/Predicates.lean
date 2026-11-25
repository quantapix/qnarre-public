













import Proving.USC.T09.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T09.Elements

open Proving.USC.Common





axiom AgreementInWriting (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom MaritimeOrCommerceTransaction (a : ArbitrationAgreement) (t : CommerceTransaction) (c : ComplaintText) : Prop




axiom DisputeWithinScope (a : ArbitrationAgreement) (d : Dispute) (c : ComplaintText) : Prop






axiom NoRevocationGround (a : ArbitrationAgreement) (c : ComplaintText) : Prop






axiom NotVoidedByChapter4 (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom SuitPendingInFederalCourt (d : Dispute) (c : ComplaintText) : Prop




axiom IssueReferableToArbitration (a : ArbitrationAgreement) (d : Dispute) (c : ComplaintText) : Prop



axiom ApplicantNotInDefault (p : Person) (c : ComplaintText) : Prop






axiom AggrievedByRefusalToArbitrate (p : Person) (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom CourtWouldHaveJurisdiction (a : ArbitrationAgreement) (d : Dispute) (c : ComplaintText) : Prop






axiom AgreedToEntryOfJudgment (a : ArbitrationAgreement) (c : ComplaintText) : Prop



axiom AwardWasMade (w : Award) (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom WithinOneYearOfAward (w : Award) (c : ComplaintText) : Prop





axiom AwardProcuredByFraud (w : Award) (c : ComplaintText) : Prop



axiom ArbitratorPartiality (w : Award) (c : ComplaintText) : Prop




axiom ArbitratorMisconduct (w : Award) (c : ComplaintText) : Prop




axiom ArbitratorsExceededPowers (w : Award) (c : ComplaintText) : Prop






axiom CommercialLegalRelationship (a : ArbitrationAgreement) (c : ComplaintText) : Prop







axiom HasForeignElement (a : ArbitrationAgreement) (c : ComplaintText) : Prop






axiom SexualAssaultOrHarassmentDispute (d : Dispute) (c : ComplaintText) : Prop




axiom IsPredisputeAgreement (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom PersonElectsInvalidity (p : Person) (c : ComplaintText) : Prop





axiom CaseFiledRelatingToDispute (d : Dispute) (c : ComplaintText) : Prop

end Proving.USC.T09.Elements
