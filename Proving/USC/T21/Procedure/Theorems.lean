




import Proving.USC.T21.Procedure.Types
import Proving.USC.T21.Procedure.Predicates
import Proving.USC.T21.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T21.Procedure

open Proving.USC.Common


theorem felonyDrugOffense_intro {p : Person} {k : Conviction} {maxMonths : Nat}
    {c : ComplaintText}
    (hDrug : PriorFelonyDrugConviction p k c)
    (hPun : OffensePunishableByImprisonmentMonths k maxMonths c)
    (hThr : punishableByMoreThanOneYear maxMonths) :
    FelonyDrugOffense p k maxMonths c :=
  ⟨hDrug, hPun, hThr⟩


theorem seriousDrugFelonyStatus_intro {p : Person} {k : Conviction} {o : Offense}
    {servedM releaseDay commenceDay : Nat} {c : ComplaintText}
    (hDesc : OffenseDescribedInSection924e2 k c)
    (hServed : ServedImprisonmentMonths p k servedM c)
    (hMin : servedMoreThanTwelveMonths servedM)
    (hRel : ReleasedFromImprisonmentOnDay p k releaseDay c)
    (hCom : InstantOffenseCommencedOnDay p o commenceDay c)
    (hWin : withinFifteenYearLookback releaseDay commenceDay) :
    SeriousDrugFelonyStatus p k o servedM releaseDay commenceDay c :=
  ⟨hDesc, hServed, hMin, hRel, hCom, hWin⟩


theorem recidivistEnhancementTrigger_intro {p : Person} {o : Offense}
    {k : Conviction} {finalDay violationDay maxMonths : Nat} {c : ComplaintText}
    (hV : ViolationCommitted p o c)
    (hD : ViolationCommittedOnDay p o violationDay c)
    (hP : FelonyDrugOffense p k maxMonths c)
    (hF : ConvictionBecameFinalOnDay k finalDay c)
    (hSeq : priorFinalBeforeViolation finalDay violationDay) :
    RecidivistEnhancementTrigger p o k finalDay violationDay maxMonths c :=
  ⟨hV, hD, hP, hF, hSeq⟩


theorem supervisedReleaseCompliant_intro {p : Person} {o : Offense} {s : Sentence}
    {floorYears termYears : Nat} {c : ComplaintText}
    (hImp : SentenceImposed p o s c)
    (hTerm : SupervisedReleaseTermYears s termYears c)
    (hFloor : supervisedReleaseFloorMet floorYears termYears) :
    SupervisedReleaseCompliant p o s floorYears termYears c :=
  ⟨hImp, hTerm, hFloor⟩


theorem probationBarApplies_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hK : ConvictedOfViolation p o c)
    (hH : DeathOrSeriousInjuryResulted o c) :
    ProbationBarApplies p o c :=
  ⟨hK, hH⟩


theorem probationBarBreached_intro {p : Person} {o : Offense} {s : Sentence}
    {c : ComplaintText}
    (hBar : ProbationBarApplies p o c)
    (hS : SentenceImposed p o s c)
    (hProb : PlacedOnProbationOrSentenceSuspended p s c) :
    ProbationBarBreached p o s c :=
  ⟨hBar, hS, hProb⟩


theorem chemicalInjunctionWithinCap_intro {p : Person} {o : Offense}
    {years : Nat} {c : ComplaintText}
    (hConv : FelonyListedChemicalConviction p o c)
    (hEnj : EnjoinedFromListedChemicalTransactionsForYears p years c)
    (hCap : injunctionWithinTenYearCap years) :
    ChemicalInjunctionWithinCap p o years c :=
  ⟨hConv, hEnj, hCap⟩


theorem timelyChemicalRemediation_intro {p : Person} {c : ComplaintText}
    (hKnow : KnowledgeOfRecordkeepingNoncomplianceAcquired p c)
    (hRem : ImmediateRemedialStepsTaken p c) :
    TimelyChemicalRemediation p c :=
  ⟨hKnow, hRem⟩


theorem authorizedInternetDispensing_intro {p : Person} {o : Offense}
    {c : ComplaintText}
    (hDisp : DispensedControlledSubstanceByInternet p o c)
    (hReg : ValidlyRegisteredWithInternetModification p c) :
    AuthorizedInternetDispensing p o c :=
  ⟨hDisp, hReg⟩


theorem attemptConspiracyPenaltyParity_intro {p : Person} {o : Offense}
    {c : ComplaintText}
    (hInch : AttemptsOrConspiresToCommit p o c)
    (hDef : OffenseDefinedInSubchapter o c) :
    AttemptConspiracyPenaltyParity p o c :=
  ⟨hInch, hDef⟩


theorem maintenanceTreatmentWindow_intro {p : Person} {days : Nat}
    {c : ComplaintText}
    (hDisp : NarcoticDispensedForTreatmentDays p days c)
    (hWin : maintenanceTreatmentPeriod days) :
    MaintenanceTreatmentWindow p days c :=
  ⟨hDisp, hWin⟩


theorem detoxificationTreatmentWindow_intro {p : Person} {days : Nat}
    {c : ComplaintText}
    (hDisp : NarcoticDispensedForTreatmentDays p days c)
    (hWin : detoxificationTreatmentPeriod days) :
    DetoxificationTreatmentWindow p days c :=
  ⟨hDisp, hWin⟩


theorem reachesSentenced_intro {p : Person} {o : Offense} {c : ComplaintText}
    (s : Sentence)
    (hV : ViolationCommitted p o c)
    (hK : ConvictedOfViolation p o c)
    (hS : SentenceImposed p o s c) :
    Reaches p o c .sentenced :=
  .sentenced s (.convicted (.violated hV) hK) hS

end Proving.USC.T21.Procedure
