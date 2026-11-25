import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Reslice.Procedure.Types
import Proving.USC.T18.Ch75.Reslice.Procedure.Predicates

set_option autoImplicit false













namespace Proving.USC.T18.Ch75.Reslice.Procedure

open Proving.USC.Common






def UseAfterVoidance (tl : DocumentTimeline) : Prop :=
  tl.voidanceDay ≤ tl.useDay



def IsFirstOrSecondSuchOffense (sf : SentencingFacts) : Prop :=
  sf.suchOffenseOrdinal ≤ 2






def statutoryMaximumYears (sf : SentencingFacts) : Nat :=
  if sf.facilitatesInternationalTerrorism then 25
  else if sf.facilitatesDrugTraffickingCrime then 20
  else if sf.suchOffenseOrdinal ≤ 2 then 10
  else 15


def section1546bMaximumYears : Nat := 5


def SentenceWithinStatutoryMaximum (sf : SentencingFacts) : Prop :=
  sf.imposedImprisonmentYears ≤ statutoryMaximumYears sf


def SentenceWithinSection1546bMaximum (sf : SentencingFacts) : Prop :=
  sf.imposedImprisonmentYears ≤ section1546bMaximumYears







inductive DocumentReached (d : TravelDocument) (c : ComplaintText) :
    DocumentStage → Prop where

  | applied (h : ApplicationForPassportSubmitted d c) :
      DocumentReached d c DocumentStage.applied

  | issued (hPrev : DocumentReached d c DocumentStage.applied)
      (h : PassportIssuedUnderUSAuthority d c) :
      DocumentReached d c DocumentStage.issued


  | issuedOnRecord (h : PassportIssuedUnderUSAuthority d c) :
      DocumentReached d c DocumentStage.issued


  | void (hPrev : DocumentReached d c DocumentStage.issued)
      (h : PassportVoidedByPrescribedCondition d c) :
      DocumentReached d c DocumentStage.void





inductive Section1542Track (d : TravelDocument) (c : ComplaintText) : Prop where


  | falseApplication (reachedApplied : DocumentReached d c DocumentStage.applied)
      (contraryToRules : ContraryToPassportIssuanceRules d c)
      (securedByFalseStatement : IssuanceSecuredByFalseStatement d c)


  | useOfTaintedIssuance (reachedIssued : DocumentReached d c DocumentStage.issued)
      (securedByFalseStatement : IssuanceSecuredByFalseStatement d c)
      (used : DocumentUsedOrPresented d c)


  | furnishingTaintedIssuance
      (reachedIssued : DocumentReached d c DocumentStage.issued)
      (securedByFalseStatement : IssuanceSecuredByFalseStatement d c)
      (furnished : DocumentFurnishedForUseByAnother d c)




inductive Section1543Track (d : TravelDocument) (c : ComplaintText) : Prop where



  | useOfVoidedPassport (reachedVoid : DocumentReached d c DocumentStage.void)
      (used : DocumentUsedOrPresented d c)
      (tl : DocumentTimeline) (timeline : DocumentTimelineFound d tl c)
      (afterVoidance : UseAfterVoidance tl)


  | useOfUnissuedInstrument (notIssued : ¬ PassportIssuedUnderUSAuthority d c)
      (used : DocumentUsedOrPresented d c)


inductive Section1544Track (d : TravelDocument) (c : ComplaintText) : Prop where


  | useOfAnothersPassport (reachedIssued : DocumentReached d c DocumentStage.issued)
      (designatedForAnother : DocumentDesignatedForUseOfAnother d c)
      (used : DocumentUsedOrPresented d c)


  | useContraryToConditions (reachedIssued : DocumentReached d c DocumentStage.issued)
      (violation : UsedInViolationOfDocumentConditions d c)
      (used : DocumentUsedOrPresented d c)


  | useContraryToIssuanceRules
      (reachedIssued : DocumentReached d c DocumentStage.issued)
      (contraryToRules : ContraryToPassportIssuanceRules d c)
      (used : DocumentUsedOrPresented d c)


  | furnishingToAnother (reachedIssued : DocumentReached d c DocumentStage.issued)
      (designatedForAnother : DocumentDesignatedForUseOfAnother d c)
      (furnished : DocumentFurnishedForUseByAnother d c)


inductive Section1546aTrack (pr : Prosecution) (p : Person) (d : TravelDocument)
    (f : ImmigrationFiling) (c : ComplaintText) : Prop where


  | prescribedDocumentProcuredByFraud
      (prescribed : DocumentPrescribedByStatuteOrRegulation d c)
      (procured : IssuanceSecuredByFalseStatement d c)
      (used : DocumentUsedOrPresented d c)



  | issuanceApparatusWithoutAuthority
      (notDirected : ¬ UnderDirectionOfProperOfficer pr c)
      (controls : ControlsBlankPermitOrPrintingPlate d c)


  | undisclosedIdentityAtApplication
      (prescribed : DocumentPrescribedByStatuteOrRegulation d c)
      (appeared : AppearedUnderUndisclosedIdentityAtApplication p c)


  | falseSwornFiling (required : FilingRequiredByImmigrationLaws f c)
      (sworn : SwornOrSubscribedUnderPenaltyOfPerjury f c)
      (presented : FilingPresentedToAuthority f c)


  | filingWithoutReasonableBasis (required : FilingRequiredByImmigrationLaws f c)
      (presented : FilingPresentedToAuthority f c)
      (noBasis : FilingLacksReasonableBasisInLawOrFact f c)



inductive Section1546bTrack (pr : Prosecution) (d : TravelDocument)
    (f : ImmigrationFiling) (c : ComplaintText) : Prop where


  | unlawfulIdentificationDocument
      (notLawful : DocumentNotLawfullyIssuedForPossessor d c)
      (used : DocumentUsedOrPresented d c)
      (forVerification : UsedToSatisfySection274ABRequirement pr c)

  | falseAttestation (attestation : FalseAttestationMade f c)
      (forVerification : UsedToSatisfySection274ABRequirement pr c)



inductive Chapter75ChargingTheory (pr : Prosecution) (p : Person)
    (d : TravelDocument) (f : ImmigrationFiling) (c : ComplaintText) : Prop where
  | s1542 (h : Section1542Track d c)
  | s1543 (h : Section1543Track d c)
  | s1544 (h : Section1544Track d c)
  | s1546a (h : Section1546aTrack pr p d f c)
  | s1546b (h : Section1546bTrack pr d f c)





structure LawfulImprisonment (pr : Prosecution) (sf : SentencingFacts)
    (c : ComplaintText) : Prop where
  factsFound : SentencingFactsFound pr sf c
  imprisonment : ImprisonmentImposed pr c
  withinMaximum : SentenceWithinStatutoryMaximum sf


structure LawfulSection1546bImprisonment (pr : Prosecution) (sf : SentencingFacts)
    (c : ComplaintText) : Prop where
  factsFound : SentencingFactsFound pr sf c
  imprisonment : ImprisonmentImposed pr c
  withinMaximum : SentenceWithinSection1546bMaximum sf



inductive LawfulChapter75Sentence (pr : Prosecution) (sf : SentencingFacts)
    (c : ComplaintText) : Prop where
  | fineOnly (imposed : SentenceImposed pr c) (fine : FineImposedUnderThisTitle pr c)
  | imprisonmentOnly (imposed : SentenceImposed pr c)
      (term : LawfulImprisonment pr sf c)
  | fineAndImprisonment (imposed : SentenceImposed pr c)
      (fine : FineImposedUnderThisTitle pr c) (term : LawfulImprisonment pr sf c)




def stepChargeFiled : ProsecutionStep :=
  { source := ProsecutionStage.conduct, target := ProsecutionStage.charged }


def stepAdjudication : ProsecutionStep :=
  { source := ProsecutionStage.charged, target := ProsecutionStage.convicted }


def stepSentencing : ProsecutionStep :=
  { source := ProsecutionStage.convicted, target := ProsecutionStage.sentenced }



def prosecutionGuard (pr : Prosecution) (p : Person) (d : TravelDocument)
    (f : ImmigrationFiling) (sf : SentencingFacts) (c : ComplaintText)
    (s : ProsecutionStep) : Prop :=
  match s.source, s.target with
  | ProsecutionStage.conduct, ProsecutionStage.charged =>
      ProsecutionCommenced pr c ∧ Chapter75ChargingTheory pr p d f c ∧
        ¬ LawfullyAuthorizedAgencyActivity pr c
  | ProsecutionStage.charged, ProsecutionStage.convicted =>
      AdjudicatedGuilty pr c
  | ProsecutionStage.convicted, ProsecutionStage.sentenced =>
      LawfulChapter75Sentence pr sf c
  | _, _ => False





inductive ProsecutionReached (pr : Prosecution) (p : Person) (d : TravelDocument)
    (f : ImmigrationFiling) (sf : SentencingFacts) (c : ComplaintText) :
    ProsecutionStage → Prop where
  | conduct (h : Chapter75ChargingTheory pr p d f c) :
      ProsecutionReached pr p d f sf c ProsecutionStage.conduct
  | charged (hPrev : ProsecutionReached pr p d f sf c ProsecutionStage.conduct)
      (commenced : ProsecutionCommenced pr c)
      (notExempt : ¬ LawfullyAuthorizedAgencyActivity pr c) :
      ProsecutionReached pr p d f sf c ProsecutionStage.charged
  | convicted (hPrev : ProsecutionReached pr p d f sf c ProsecutionStage.charged)
      (guilty : AdjudicatedGuilty pr c) :
      ProsecutionReached pr p d f sf c ProsecutionStage.convicted
  | sentenced (hPrev : ProsecutionReached pr p d f sf c ProsecutionStage.convicted)
      (sentence : LawfulChapter75Sentence pr sf c) :
      ProsecutionReached pr p d f sf c ProsecutionStage.sentenced



def ProsecutionCompleted (pr : Prosecution) (p : Person) (d : TravelDocument)
    (f : ImmigrationFiling) (sf : SentencingFacts) (c : ComplaintText) : Prop :=
  ProsecutionReached pr p d f sf c ProsecutionStage.sentenced



structure ValidChapter75Prosecution (pr : Prosecution) (p : Person)
    (d : TravelDocument) (f : ImmigrationFiling) (sf : SentencingFacts)
    (c : ComplaintText) : Prop where
  theory : Chapter75ChargingTheory pr p d f c
  commenced : ProsecutionCommenced pr c
  notExempt : ¬ LawfullyAuthorizedAgencyActivity pr c
  guilty : AdjudicatedGuilty pr c
  sentence : LawfulChapter75Sentence pr sf c

end Proving.USC.T18.Ch75.Reslice.Procedure
