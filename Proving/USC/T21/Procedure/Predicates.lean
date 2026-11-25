












import Proving.USC.T21.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T21.Procedure

open Proving.USC.Common







axiom ViolationCommitted (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom ViolationCommittedOnDay (p : Person) (o : Offense) (day : Nat) (c : ComplaintText) : Prop







axiom PriorFelonyDrugConviction (p : Person) (k : Conviction) (c : ComplaintText) : Prop





axiom OffensePunishableByImprisonmentMonths (k : Conviction) (months : Nat) (c : ComplaintText) : Prop




axiom ConvictionBecameFinalOnDay (k : Conviction) (day : Nat) (c : ComplaintText) : Prop




axiom ConvictedOfViolation (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom SentenceImposed (p : Person) (o : Offense) (s : Sentence) (c : ComplaintText) : Prop





axiom SupervisedReleaseTermYears (s : Sentence) (years : Nat) (c : ComplaintText) : Prop





axiom DeathOrSeriousInjuryResulted (o : Offense) (c : ComplaintText) : Prop




axiom PlacedOnProbationOrSentenceSuspended (p : Person) (s : Sentence) (c : ComplaintText) : Prop







axiom FelonyListedChemicalConviction (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom EnjoinedFromListedChemicalTransactionsForYears (p : Person) (years : Nat) (c : ComplaintText) : Prop







axiom KnowledgeOfRecordkeepingNoncomplianceAcquired (p : Person) (c : ComplaintText) : Prop





axiom ImmediateRemedialStepsTaken (p : Person) (c : ComplaintText) : Prop






axiom DispensedControlledSubstanceByInternet (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom ValidlyRegisteredWithInternetModification (p : Person) (c : ComplaintText) : Prop






axiom AttemptsOrConspiresToCommit (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom OffenseDefinedInSubchapter (o : Offense) (c : ComplaintText) : Prop






axiom OffenseDescribedInSection924e2 (k : Conviction) (c : ComplaintText) : Prop





axiom ServedImprisonmentMonths (p : Person) (k : Conviction) (months : Nat) (c : ComplaintText) : Prop




axiom ReleasedFromImprisonmentOnDay (p : Person) (k : Conviction) (day : Nat) (c : ComplaintText) : Prop




axiom InstantOffenseCommencedOnDay (p : Person) (o : Offense) (day : Nat) (c : ComplaintText) : Prop







axiom NarcoticDispensedForTreatmentDays (p : Person) (days : Nat) (c : ComplaintText) : Prop

end Proving.USC.T21.Procedure
