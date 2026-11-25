








import Proving.USC.T18.Ch11.EchoReslice.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Procedure

open Proving.USC.Common







inductive PublicOfficialStatus (p : Person) (c : ComplaintText) : Prop where
  | enumeratedPosition : HoldsEnumeratedFederalPosition p c → PublicOfficialStatus p c
  | officialFunction : ServesInFederalOfficialFunction p c → PublicOfficialStatus p c




inductive SelectedForOfficeStatus (p : Person) (c : ComplaintText) : Prop where
  | nominatedOrAppointed : NominatedOrAppointedToOffice p c → SelectedForOfficeStatus p c
  | officiallyInformed : OfficiallyInformedOfForthcomingSelection p c → SelectedForOfficeStatus p c



structure FormerOfficialStatus (p : Person) (c : ComplaintText) : Prop where
  heldOffice : PublicOfficialStatus p c
  serviceEnded : OfficialServiceEnded p c




inductive CoveredOfficialOrSelectee (p : Person) (c : ComplaintText) : Prop where
  | official : PublicOfficialStatus p c → CoveredOfficialOrSelectee p c
  | selectee : SelectedForOfficeStatus p c → CoveredOfficialOrSelectee p c




inductive CoveredGratuityRecipientClass (p : Person) (c : ComplaintText) : Prop where
  | official : PublicOfficialStatus p c → CoveredGratuityRecipientClass p c
  | former : FormerOfficialStatus p c → CoveredGratuityRecipientClass p c
  | selectee : SelectedForOfficeStatus p c → CoveredGratuityRecipientClass p c


inductive AtOfficialStage (p : Person) (c : ComplaintText) : OfficialStage → Prop where
  | selected : SelectedForOfficeStatus p c → AtOfficialStage p c OfficialStage.selected
  | serving : PublicOfficialStatus p c → AtOfficialStage p c OfficialStage.serving
  | former : FormerOfficialStatus p c → AtOfficialStage p c OfficialStage.former





structure SelectionToServiceTransition (p : Person) (c : ComplaintText) : Prop where
  atSelected : AtOfficialStage p c OfficialStage.selected
  qualified : HasQualifiedForOffice p c
  nowServes : PublicOfficialStatus p c



structure ServiceToFormerTransition (p : Person) (c : ComplaintText) : Prop where
  atServing : AtOfficialStage p c OfficialStage.serving
  serviceEnded : OfficialServiceEnded p c







inductive MatterCognizableByOfficial (m : Matter) (p : Person) (c : ComplaintText) : Prop where
  | pending : MatterPendingBeforeOfficial m p c → MatterCognizableByOfficial m p c
  | mayBeBrought : MatterMayByLawBeBroughtBeforeOfficial m p c → MatterCognizableByOfficial m p c



structure QualifyingOfficialAct (a : OfficialAct) (m : Matter) (p : Person) (c : ComplaintText) : Prop where
  decisionOrAction : DecisionOrActionOnMatter a m c
  cognizable : MatterCognizableByOfficial m p c
  capacity : ActTakenInOfficialCapacityOrPlaceOfTrust a p c




inductive QualifyingForum (f : Forum) (c : ComplaintText) : Prop where
  | court : ForumIsCourt f c → QualifyingForum f c
  | congressionalCommittee : ForumIsCongressionalCommittee f c → QualifyingForum f c
  | authorizedEvidenceTaker : ForumAuthorizedToHearEvidenceOrTakeTestimony f c → QualifyingForum f c



structure QualifyingProceeding (pr : Proceeding) (f : Forum) (c : ComplaintText) : Prop where
  isProceeding : ProceedingIsTrialHearingOrOtherProceeding pr c
  heldBefore : ProceedingHeldBeforeForum pr f c
  competentForum : QualifyingForum f c



inductive WitnessConductTargeted (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  | testimony : TestimonyGivenOrToBeGivenUnderOath w pr c → WitnessConductTargeted w pr c
  | absence : WitnessAbsentedFromProceeding w pr c → WitnessConductTargeted w pr c






def TransferPrecedesOrAccompaniesAct (t : Transfer) (a : OfficialAct) (c : ComplaintText) : Prop :=
  dayOfTransfer t c ≤ dayOfOfficialAct a c

noncomputable instance instDecidableTransferPrecedesOrAccompaniesAct
    (t : Transfer) (a : OfficialAct) (c : ComplaintText) :
    Decidable (TransferPrecedesOrAccompaniesAct t a c) :=
  inferInstanceAs (Decidable (dayOfTransfer t c ≤ dayOfOfficialAct a c))





def ActPerformedOrToBePerformed (t : Transfer) (a : OfficialAct) (c : ComplaintText) : Prop :=
  dayOfOfficialAct a c ≤ dayOfTransfer t c ∨ dayOfTransfer t c ≤ dayOfOfficialAct a c

noncomputable instance instDecidableActPerformedOrToBePerformed
    (t : Transfer) (a : OfficialAct) (c : ComplaintText) :
    Decidable (ActPerformedOrToBePerformed t a c) :=
  inferInstanceAs (Decidable (dayOfOfficialAct a c ≤ dayOfTransfer t c ∨
    dayOfTransfer t c ≤ dayOfOfficialAct a c))







noncomputable def allowableWitnessCompensationCents (w : Person) (pr : Proceeding) (c : ComplaintText) : Nat :=
  statutoryWitnessFeeCents w pr c + reasonableTravelAndSubsistenceCents w pr c
    + reasonableValueOfTimeLostCents w pr c + reasonableExpertPreparationFeeCents w pr c



def WithinWitnessCompensationCap (t : Transfer) (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop :=
  amountTransferredCents t c ≤ allowableWitnessCompensationCents w pr c

noncomputable instance instDecidableWithinWitnessCompensationCap
    (t : Transfer) (w : Person) (pr : Proceeding) (c : ComplaintText) :
    Decidable (WithinWitnessCompensationCap t w pr c) :=
  inferInstanceAs (Decidable (amountTransferredCents t c ≤ allowableWitnessCompensationCents w pr c))




inductive WitnessFeeSafeHarbor (t : Transfer) (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  | statutoryFee : PaymentIsStatutoryWitnessFee t c → WitnessFeeSafeHarbor t w pr c
  | partyPaidCosts : PayorIsPartyOnWhoseBehalfWitnessCalled t w pr c →
      WithinWitnessCompensationCap t w pr c → WitnessFeeSafeHarbor t w pr c
  | expertFee : PayorIsPartyOnWhoseBehalfWitnessCalled t w pr c →
      WitnessQualifiedAsExpert w pr c →
      WithinWitnessCompensationCap t w pr c → WitnessFeeSafeHarbor t w pr c






inductive SubsectionB1Object (t : Transfer) (recipient : Person) (c : ComplaintText) : Prop where
  | officialAct {a : OfficialAct} {m : Matter} : QualifyingOfficialAct a m recipient c →
      TransferPrecedesOrAccompaniesAct t a c → SubsectionB1Object t recipient c
  | fraudOnUnitedStates : ObjectIsFraudOnUnitedStates t c → SubsectionB1Object t recipient c
  | dutyViolation : ObjectIsActInViolationOfLawfulDuty t c → SubsectionB1Object t recipient c


inductive SubsectionB2Object (t : Transfer) (official : Person) (c : ComplaintText) : Prop where
  | officialAct {a : OfficialAct} {m : Matter} : QualifyingOfficialAct a m official c →
      TransferPrecedesOrAccompaniesAct t a c → SubsectionB2Object t official c
  | fraudOnUnitedStates : ObjectIsFraudOnUnitedStates t c → SubsectionB2Object t official c
  | dutyViolation : ObjectIsActInViolationOfLawfulDuty t c → SubsectionB2Object t official c


structure RouteB1 (t : Transfer) (payor recipient : Person) (c : ComplaintText) : Prop where
  transferStep : CorruptlyGivesOffersOrPromises t payor c
  directed : ValueDirectedToOfficialOrDesignee t recipient c
  recipientClass : CoveredOfficialOrSelectee recipient c
  object : SubsectionB1Object t recipient c


structure RouteB2 (t : Transfer) (official : Person) (c : ComplaintText) : Prop where
  receiptStep : CorruptlyDemandsSeeksReceivesOrAccepts t official c
  officialClass : CoveredOfficialOrSelectee official c
  object : SubsectionB2Object t official c



structure RouteB3 (t : Transfer) (payor w : Person) (pr : Proceeding) (f : Forum) (c : ComplaintText) : Prop where
  transferStep : CorruptlyGivesOffersOrPromises t payor c
  directed : ValueDirectedToOfficialOrDesignee t w c
  forumProceeding : QualifyingProceeding pr f c
  targetedConduct : WitnessConductTargeted w pr c
  outsideSafeHarbor : ¬ WitnessFeeSafeHarbor t w pr c



structure RouteB4 (t : Transfer) (w : Person) (pr : Proceeding) (f : Forum) (c : ComplaintText) : Prop where
  receiptStep : CorruptlyDemandsSeeksReceivesOrAccepts t w c
  forumProceeding : QualifyingProceeding pr f c
  targetedConduct : WitnessConductTargeted w pr c
  outsideSafeHarbor : ¬ WitnessFeeSafeHarbor t w pr c





structure RouteC1A (t : Transfer) (payor recipient : Person) (a : OfficialAct) (m : Matter)
    (c : ComplaintText) : Prop where
  outsideLawfulChannel : ¬ AuthorizedByLawForProperDischargeOfDuty t c
  transferStep : GivesOffersOrPromises t payor c
  directed : ValueDirectedToOfficialOrDesignee t recipient c
  recipientClass : CoveredGratuityRecipientClass recipient c
  act : QualifyingOfficialAct a m recipient c
  temporalNexus : ActPerformedOrToBePerformed t a c



structure RouteC1B (t : Transfer) (official : Person) (a : OfficialAct) (m : Matter)
    (c : ComplaintText) : Prop where
  outsideLawfulChannel : ¬ AuthorizedByLawForProperDischargeOfDuty t c
  receiptStep : DemandsSeeksReceivesOrAccepts t official c
  officialClass : CoveredGratuityRecipientClass official c
  act : QualifyingOfficialAct a m official c
  temporalNexus : ActPerformedOrToBePerformed t a c



structure RouteC2 (t : Transfer) (payor w : Person) (pr : Proceeding) (f : Forum)
    (c : ComplaintText) : Prop where
  transferStep : GivesOffersOrPromises t payor c
  directed : ValueDirectedToOfficialOrDesignee t w c
  forumProceeding : QualifyingProceeding pr f c
  targetedConduct : WitnessConductTargeted w pr c
  outsideSafeHarbor : ¬ WitnessFeeSafeHarbor t w pr c


structure RouteC3 (t : Transfer) (w : Person) (pr : Proceeding) (f : Forum)
    (c : ComplaintText) : Prop where
  receiptStep : DemandsSeeksReceivesOrAccepts t w c
  forumProceeding : QualifyingProceeding pr f c
  targetedConduct : WitnessConductTargeted w pr c
  outsideSafeHarbor : ¬ WitnessFeeSafeHarbor t w pr c




inductive SubsectionBRoute (c : ComplaintText) : Prop where
  | b1 {t : Transfer} {payor recipient : Person} : RouteB1 t payor recipient c → SubsectionBRoute c
  | b2 {t : Transfer} {official : Person} : RouteB2 t official c → SubsectionBRoute c
  | b3 {t : Transfer} {payor w : Person} {pr : Proceeding} {f : Forum} :
      RouteB3 t payor w pr f c → SubsectionBRoute c
  | b4 {t : Transfer} {w : Person} {pr : Proceeding} {f : Forum} :
      RouteB4 t w pr f c → SubsectionBRoute c


inductive SubsectionCRoute (c : ComplaintText) : Prop where
  | c1a {t : Transfer} {payor recipient : Person} {a : OfficialAct} {m : Matter} :
      RouteC1A t payor recipient a m c → SubsectionCRoute c
  | c1b {t : Transfer} {official : Person} {a : OfficialAct} {m : Matter} :
      RouteC1B t official a m c → SubsectionCRoute c
  | c2 {t : Transfer} {payor w : Person} {pr : Proceeding} {f : Forum} :
      RouteC2 t payor w pr f c → SubsectionCRoute c
  | c3 {t : Transfer} {w : Person} {pr : Proceeding} {f : Forum} :
      RouteC3 t w pr f c → SubsectionCRoute c


inductive Section201Route (c : ComplaintText) : Prop where
  | subsectionB : SubsectionBRoute c → Section201Route c
  | subsectionC : SubsectionCRoute c → Section201Route c



structure SubsectionBConviction (pros : Prosecution) (c : ComplaintText) : Prop where
  route : SubsectionBRoute c
  conviction : ConvictionEntered pros c

structure SubsectionCConviction (pros : Prosecution) (c : ComplaintText) : Prop where
  route : SubsectionCRoute c
  conviction : ConvictionEntered pros c



noncomputable def maxFineCentsSubsectionB (pros : Prosecution) (t : Transfer) (c : ComplaintText) : Nat :=
  max (fineUnderThisTitleCapCents pros c) (3 * monetaryEquivalentOfThingOfValueCents t c)


noncomputable def maxFineCentsSubsectionC (pros : Prosecution) (c : ComplaintText) : Nat :=
  fineUnderThisTitleCapCents pros c


def maxImprisonmentMonthsSubsectionB : Nat := 180


def maxImprisonmentMonthsSubsectionC : Nat := 24



structure LawfulSentenceSubsectionB (s : Sentence) (pros : Prosecution) (t : Transfer)
    (c : ComplaintText) : Prop where
  convicted : SubsectionBConviction pros c
  imposed : SentenceImposed s pros c
  fineWithinCap : imposedFineCents s c ≤ maxFineCentsSubsectionB pros t c
  imprisonmentWithinCap : imposedImprisonmentMonths s c ≤ maxImprisonmentMonthsSubsectionB


structure LawfulSentenceSubsectionC (s : Sentence) (pros : Prosecution) (c : ComplaintText) : Prop where
  convicted : SubsectionCConviction pros c
  imposed : SentenceImposed s pros c
  fineWithinCap : imposedFineCents s c ≤ maxFineCentsSubsectionC pros c
  imprisonmentWithinCap : imposedImprisonmentMonths s c ≤ maxImprisonmentMonthsSubsectionC








structure DisqualificationFromFederalOffice (p : Person) (pros : Prosecution) (c : ComplaintText) : Prop where
  convicted : SubsectionBConviction pros c
  ordered : DisqualificationOrdered p pros c



structure CumulativeChargingWithObstruction (pros : Prosecution) (c : ComplaintText) : Prop where
  section201Route : Section201Route c
  obstructionCharge : ChargedUnderObstructionSection pros c



inductive AtCaseStage (pros : Prosecution) (c : ComplaintText) : CaseStage → Prop where
  | conductComplete : Section201Route c → AtCaseStage pros c CaseStage.conductComplete
  | convicted : Section201Route c → ConvictionEntered pros c →
      AtCaseStage pros c CaseStage.convicted
  | sentenced {s : Sentence} : Section201Route c → ConvictionEntered pros c →
      SentenceImposed s pros c → AtCaseStage pros c CaseStage.sentenced
  | disqualified {p : Person} : DisqualificationFromFederalOffice p pros c →
      AtCaseStage pros c CaseStage.disqualified

end Proving.USC.T18.Ch11.EchoReslice.Procedure
