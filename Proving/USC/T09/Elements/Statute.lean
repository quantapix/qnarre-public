









import Proving.USC.T09.Elements.Predicates

namespace Proving.USC.T09.Elements

open Proving.USC.Common






structure Section2 (a : ArbitrationAgreement) (t : CommerceTransaction)
    (d : Dispute) (c : ComplaintText) : Prop where
  inWriting     : AgreementInWriting a c
  commerce      : MaritimeOrCommerceTransaction a t c
  withinScope   : DisputeWithinScope a d c
  noRevocation  : NoRevocationGround a c
  notVoidedCh4  : NotVoidedByChapter4 a c



structure Section3 (a : ArbitrationAgreement) (d : Dispute) (p : Person)
    (c : ComplaintText) : Prop where
  suitPending  : SuitPendingInFederalCourt d c
  referable    : IssueReferableToArbitration a d c
  notInDefault : ApplicantNotInDefault p c



structure Section4 (p : Person) (a : ArbitrationAgreement) (d : Dispute)
    (c : ComplaintText) : Prop where
  aggrieved     : AggrievedByRefusalToArbitrate p a c
  inWriting     : AgreementInWriting a c
  jurisdiction  : CourtWouldHaveJurisdiction a d c
  federalNexus  : FederalJurisdictionalNexus c



structure Section9 (w : Award) (a : ArbitrationAgreement) (c : ComplaintText) : Prop where
  consentToEntry : AgreedToEntryOfJudgment a c
  awardMade      : AwardWasMade w a c
  timely         : WithinOneYearOfAward w c




inductive Section10 (w : Award) (c : ComplaintText) : Prop where
  | byFraud          : AwardProcuredByFraud w c        → Section10 w c
  | byPartiality     : ArbitratorPartiality w c        → Section10 w c
  | byMisconduct     : ArbitratorMisconduct w c        → Section10 w c
  | byExceedingPowers : ArbitratorsExceededPowers w c  → Section10 w c



structure Section202 (a : ArbitrationAgreement) (c : ComplaintText) : Prop where
  commercial    : CommercialLegalRelationship a c
  foreignElement : HasForeignElement a c




structure Section402 (p : Person) (a : ArbitrationAgreement) (d : Dispute)
    (c : ComplaintText) : Prop where
  coveredDispute : SexualAssaultOrHarassmentDispute d c
  predispute     : IsPredisputeAgreement a c
  elects         : PersonElectsInvalidity p c
  caseRelates    : CaseFiledRelatingToDispute d c




inductive ValidTitle9Claim (p : Person) (a : ArbitrationAgreement)
    (t : CommerceTransaction) (d : Dispute) (w : Award) (c : ComplaintText) : Prop where
  | enforce  : Section2 a t d c              → ValidTitle9Claim p a t d w c
  | stay     : Section3 a d p c              → ValidTitle9Claim p a t d w c
  | compel   : Section4 p a d c              → ValidTitle9Claim p a t d w c
  | confirm  : Section9 w a c                → ValidTitle9Claim p a t d w c
  | vacate   : Section10 w c                 → ValidTitle9Claim p a t d w c
  | convention : Section202 a c              → ValidTitle9Claim p a t d w c
  | escapeForcedArb : Section402 p a d c     → ValidTitle9Claim p a t d w c

end Proving.USC.T09.Elements
