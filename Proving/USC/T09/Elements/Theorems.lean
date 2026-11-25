







import Proving.USC.T09.Elements.Statute

namespace Proving.USC.T09.Elements

open Proving.USC.Common


theorem section2_intro {a t d c}
    (hWrite : AgreementInWriting a c)
    (hComm : MaritimeOrCommerceTransaction a t c)
    (hScope : DisputeWithinScope a d c)
    (hNoRev : NoRevocationGround a c)
    (hNotCh4 : NotVoidedByChapter4 a c) :
    Section2 a t d c :=
  ⟨hWrite, hComm, hScope, hNoRev, hNotCh4⟩


theorem section3_intro {a d p c}
    (hPending : SuitPendingInFederalCourt d c)
    (hRef : IssueReferableToArbitration a d c)
    (hNotDef : ApplicantNotInDefault p c) :
    Section3 a d p c :=
  ⟨hPending, hRef, hNotDef⟩


theorem section4_intro {p a d c}
    (hAggr : AggrievedByRefusalToArbitrate p a c)
    (hWrite : AgreementInWriting a c)
    (hJur : CourtWouldHaveJurisdiction a d c)
    (hFed : FederalJurisdictionalNexus c) :
    Section4 p a d c :=
  ⟨hAggr, hWrite, hJur, hFed⟩


theorem section9_intro {w a c}
    (hConsent : AgreedToEntryOfJudgment a c)
    (hMade : AwardWasMade w a c)
    (hTimely : WithinOneYearOfAward w c) :
    Section9 w a c :=
  ⟨hConsent, hMade, hTimely⟩


theorem section10_intro_byFraud {w c}
    (h : AwardProcuredByFraud w c) : Section10 w c :=
  Section10.byFraud h

theorem section10_intro_byPartiality {w c}
    (h : ArbitratorPartiality w c) : Section10 w c :=
  Section10.byPartiality h

theorem section10_intro_byMisconduct {w c}
    (h : ArbitratorMisconduct w c) : Section10 w c :=
  Section10.byMisconduct h

theorem section10_intro_byExceedingPowers {w c}
    (h : ArbitratorsExceededPowers w c) : Section10 w c :=
  Section10.byExceedingPowers h


theorem section202_intro {a c}
    (hComm : CommercialLegalRelationship a c)
    (hForeign : HasForeignElement a c) :
    Section202 a c :=
  ⟨hComm, hForeign⟩


theorem section402_intro {p a d c}
    (hCovered : SexualAssaultOrHarassmentDispute d c)
    (hPre : IsPredisputeAgreement a c)
    (hElect : PersonElectsInvalidity p c)
    (hRelates : CaseFiledRelatingToDispute d c) :
    Section402 p a d c :=
  ⟨hCovered, hPre, hElect, hRelates⟩

end Proving.USC.T09.Elements
