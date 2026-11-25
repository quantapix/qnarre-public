







import Proving.USC.T18.Ch11.EchoReslice.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Procedure

open Proving.USC.Common



theorem publicOfficialStatus_intro_enumeratedPosition {p : Person} {c : ComplaintText}
    (h : HoldsEnumeratedFederalPosition p c) : PublicOfficialStatus p c :=
  .enumeratedPosition h

theorem publicOfficialStatus_intro_officialFunction {p : Person} {c : ComplaintText}
    (h : ServesInFederalOfficialFunction p c) : PublicOfficialStatus p c :=
  .officialFunction h

theorem selectedForOfficeStatus_intro_nominatedOrAppointed {p : Person} {c : ComplaintText}
    (h : NominatedOrAppointedToOffice p c) : SelectedForOfficeStatus p c :=
  .nominatedOrAppointed h

theorem selectedForOfficeStatus_intro_officiallyInformed {p : Person} {c : ComplaintText}
    (h : OfficiallyInformedOfForthcomingSelection p c) : SelectedForOfficeStatus p c :=
  .officiallyInformed h

theorem formerOfficialStatus_intro {p : Person} {c : ComplaintText}
    (hHeld : PublicOfficialStatus p c) (hEnded : OfficialServiceEnded p c) :
    FormerOfficialStatus p c :=
  ⟨hHeld, hEnded⟩

theorem coveredOfficialOrSelectee_intro_official {p : Person} {c : ComplaintText}
    (h : PublicOfficialStatus p c) : CoveredOfficialOrSelectee p c :=
  .official h

theorem coveredOfficialOrSelectee_intro_selectee {p : Person} {c : ComplaintText}
    (h : SelectedForOfficeStatus p c) : CoveredOfficialOrSelectee p c :=
  .selectee h

theorem coveredGratuityRecipientClass_intro_official {p : Person} {c : ComplaintText}
    (h : PublicOfficialStatus p c) : CoveredGratuityRecipientClass p c :=
  .official h

theorem coveredGratuityRecipientClass_intro_former {p : Person} {c : ComplaintText}
    (h : FormerOfficialStatus p c) : CoveredGratuityRecipientClass p c :=
  .former h

theorem coveredGratuityRecipientClass_intro_selectee {p : Person} {c : ComplaintText}
    (h : SelectedForOfficeStatus p c) : CoveredGratuityRecipientClass p c :=
  .selectee h

theorem atOfficialStage_intro_selected {p : Person} {c : ComplaintText}
    (h : SelectedForOfficeStatus p c) : AtOfficialStage p c OfficialStage.selected :=
  .selected h

theorem atOfficialStage_intro_serving {p : Person} {c : ComplaintText}
    (h : PublicOfficialStatus p c) : AtOfficialStage p c OfficialStage.serving :=
  .serving h

theorem atOfficialStage_intro_former {p : Person} {c : ComplaintText}
    (h : FormerOfficialStatus p c) : AtOfficialStage p c OfficialStage.former :=
  .former h

theorem selectionToServiceTransition_intro {p : Person} {c : ComplaintText}
    (hAt : AtOfficialStage p c OfficialStage.selected)
    (hQual : HasQualifiedForOffice p c)
    (hServes : PublicOfficialStatus p c) : SelectionToServiceTransition p c :=
  ⟨hAt, hQual, hServes⟩

theorem serviceToFormerTransition_intro {p : Person} {c : ComplaintText}
    (hAt : AtOfficialStage p c OfficialStage.serving)
    (hEnded : OfficialServiceEnded p c) : ServiceToFormerTransition p c :=
  ⟨hAt, hEnded⟩



theorem publicOfficialStatus_of_atServing {p : Person} {c : ComplaintText}
    (h : AtOfficialStage p c OfficialStage.serving) : PublicOfficialStatus p c := by
  cases h with
  | serving hs => exact hs


theorem serviceToFormerTransition_target {p : Person} {c : ComplaintText}
    (h : ServiceToFormerTransition p c) : AtOfficialStage p c OfficialStage.former :=
  .former ⟨publicOfficialStatus_of_atServing h.atServing, h.serviceEnded⟩


theorem selectionToServiceTransition_target {p : Person} {c : ComplaintText}
    (h : SelectionToServiceTransition p c) : AtOfficialStage p c OfficialStage.serving :=
  .serving h.nowServes




theorem publicOfficialStatus_independent_of_qualification {p : Person} {c : ComplaintText}
    (h : PublicOfficialStatus p c)
    (_hQual : HasQualifiedForOffice p c ∨ ¬ HasQualifiedForOffice p c) :
    PublicOfficialStatus p c := h


theorem coveredGratuityRecipientClass_of_coveredOfficialOrSelectee {p : Person} {c : ComplaintText}
    (h : CoveredOfficialOrSelectee p c) : CoveredGratuityRecipientClass p c := by
  cases h with
  | official ho => exact .official ho
  | selectee hs => exact .selectee hs



theorem matterCognizableByOfficial_intro_pending {m : Matter} {p : Person} {c : ComplaintText}
    (h : MatterPendingBeforeOfficial m p c) : MatterCognizableByOfficial m p c :=
  .pending h

theorem matterCognizableByOfficial_intro_mayBeBrought {m : Matter} {p : Person} {c : ComplaintText}
    (h : MatterMayByLawBeBroughtBeforeOfficial m p c) : MatterCognizableByOfficial m p c :=
  .mayBeBrought h

theorem qualifyingOfficialAct_intro {a : OfficialAct} {m : Matter} {p : Person} {c : ComplaintText}
    (hAct : DecisionOrActionOnMatter a m c)
    (hCog : MatterCognizableByOfficial m p c)
    (hCap : ActTakenInOfficialCapacityOrPlaceOfTrust a p c) :
    QualifyingOfficialAct a m p c :=
  ⟨hAct, hCog, hCap⟩



theorem qualifyingForum_intro_court {f : Forum} {c : ComplaintText}
    (h : ForumIsCourt f c) : QualifyingForum f c :=
  .court h

theorem qualifyingForum_intro_congressionalCommittee {f : Forum} {c : ComplaintText}
    (h : ForumIsCongressionalCommittee f c) : QualifyingForum f c :=
  .congressionalCommittee h

theorem qualifyingForum_intro_authorizedEvidenceTaker {f : Forum} {c : ComplaintText}
    (h : ForumAuthorizedToHearEvidenceOrTakeTestimony f c) : QualifyingForum f c :=
  .authorizedEvidenceTaker h

theorem qualifyingProceeding_intro {pr : Proceeding} {f : Forum} {c : ComplaintText}
    (hProc : ProceedingIsTrialHearingOrOtherProceeding pr c)
    (hHeld : ProceedingHeldBeforeForum pr f c)
    (hForum : QualifyingForum f c) : QualifyingProceeding pr f c :=
  ⟨hProc, hHeld, hForum⟩

theorem witnessConductTargeted_intro_testimony {w : Person} {pr : Proceeding} {c : ComplaintText}
    (h : TestimonyGivenOrToBeGivenUnderOath w pr c) : WitnessConductTargeted w pr c :=
  .testimony h

theorem witnessConductTargeted_intro_absence {w : Person} {pr : Proceeding} {c : ComplaintText}
    (h : WitnessAbsentedFromProceeding w pr c) : WitnessConductTargeted w pr c :=
  .absence h






theorem actPerformedOrToBePerformed_unconstrained
    (t : Transfer) (a : OfficialAct) (c : ComplaintText) :
    ActPerformedOrToBePerformed t a c :=
  Nat.le_total (dayOfOfficialAct a c) (dayOfTransfer t c)



theorem actPerformedOrToBePerformed_of_transferPrecedes
    {t : Transfer} {a : OfficialAct} {c : ComplaintText}
    (h : TransferPrecedesOrAccompaniesAct t a c) : ActPerformedOrToBePerformed t a c :=
  Or.inr h



theorem witnessFeeSafeHarbor_intro_statutoryFee
    {t : Transfer} {w : Person} {pr : Proceeding} {c : ComplaintText}
    (h : PaymentIsStatutoryWitnessFee t c) : WitnessFeeSafeHarbor t w pr c :=
  .statutoryFee h

theorem witnessFeeSafeHarbor_intro_partyPaidCosts
    {t : Transfer} {w : Person} {pr : Proceeding} {c : ComplaintText}
    (hParty : PayorIsPartyOnWhoseBehalfWitnessCalled t w pr c)
    (hCap : WithinWitnessCompensationCap t w pr c) : WitnessFeeSafeHarbor t w pr c :=
  .partyPaidCosts hParty hCap

theorem witnessFeeSafeHarbor_intro_expertFee
    {t : Transfer} {w : Person} {pr : Proceeding} {c : ComplaintText}
    (hParty : PayorIsPartyOnWhoseBehalfWitnessCalled t w pr c)
    (hExpert : WitnessQualifiedAsExpert w pr c)
    (hCap : WithinWitnessCompensationCap t w pr c) : WitnessFeeSafeHarbor t w pr c :=
  .expertFee hParty hExpert hCap



theorem withinWitnessCompensationCap_of_le_statutoryFee
    {t : Transfer} {w : Person} {pr : Proceeding} {c : ComplaintText}
    (h : amountTransferredCents t c ≤ statutoryWitnessFeeCents w pr c) :
    WithinWitnessCompensationCap t w pr c := by
  unfold WithinWitnessCompensationCap allowableWitnessCompensationCents
  omega



theorem subsectionB1Object_intro_officialAct
    {t : Transfer} {recipient : Person} {c : ComplaintText} {a : OfficialAct} {m : Matter}
    (hAct : QualifyingOfficialAct a m recipient c)
    (hOrder : TransferPrecedesOrAccompaniesAct t a c) : SubsectionB1Object t recipient c :=
  .officialAct hAct hOrder

theorem subsectionB1Object_intro_fraudOnUnitedStates
    {t : Transfer} {recipient : Person} {c : ComplaintText}
    (h : ObjectIsFraudOnUnitedStates t c) : SubsectionB1Object t recipient c :=
  .fraudOnUnitedStates h

theorem subsectionB1Object_intro_dutyViolation
    {t : Transfer} {recipient : Person} {c : ComplaintText}
    (h : ObjectIsActInViolationOfLawfulDuty t c) : SubsectionB1Object t recipient c :=
  .dutyViolation h

theorem subsectionB2Object_intro_officialAct
    {t : Transfer} {official : Person} {c : ComplaintText} {a : OfficialAct} {m : Matter}
    (hAct : QualifyingOfficialAct a m official c)
    (hOrder : TransferPrecedesOrAccompaniesAct t a c) : SubsectionB2Object t official c :=
  .officialAct hAct hOrder

theorem subsectionB2Object_intro_fraudOnUnitedStates
    {t : Transfer} {official : Person} {c : ComplaintText}
    (h : ObjectIsFraudOnUnitedStates t c) : SubsectionB2Object t official c :=
  .fraudOnUnitedStates h

theorem subsectionB2Object_intro_dutyViolation
    {t : Transfer} {official : Person} {c : ComplaintText}
    (h : ObjectIsActInViolationOfLawfulDuty t c) : SubsectionB2Object t official c :=
  .dutyViolation h

theorem routeB1_intro {t : Transfer} {payor recipient : Person} {c : ComplaintText}
    (hStep : CorruptlyGivesOffersOrPromises t payor c)
    (hDirected : ValueDirectedToOfficialOrDesignee t recipient c)
    (hClass : CoveredOfficialOrSelectee recipient c)
    (hObject : SubsectionB1Object t recipient c) : RouteB1 t payor recipient c :=
  ⟨hStep, hDirected, hClass, hObject⟩

theorem routeB2_intro {t : Transfer} {official : Person} {c : ComplaintText}
    (hStep : CorruptlyDemandsSeeksReceivesOrAccepts t official c)
    (hClass : CoveredOfficialOrSelectee official c)
    (hObject : SubsectionB2Object t official c) : RouteB2 t official c :=
  ⟨hStep, hClass, hObject⟩

theorem routeB3_intro {t : Transfer} {payor w : Person} {pr : Proceeding} {f : Forum}
    {c : ComplaintText}
    (hStep : CorruptlyGivesOffersOrPromises t payor c)
    (hDirected : ValueDirectedToOfficialOrDesignee t w c)
    (hProc : QualifyingProceeding pr f c)
    (hConduct : WitnessConductTargeted w pr c)
    (hEscape : ¬ WitnessFeeSafeHarbor t w pr c) : RouteB3 t payor w pr f c :=
  ⟨hStep, hDirected, hProc, hConduct, hEscape⟩

theorem routeB4_intro {t : Transfer} {w : Person} {pr : Proceeding} {f : Forum}
    {c : ComplaintText}
    (hStep : CorruptlyDemandsSeeksReceivesOrAccepts t w c)
    (hProc : QualifyingProceeding pr f c)
    (hConduct : WitnessConductTargeted w pr c)
    (hEscape : ¬ WitnessFeeSafeHarbor t w pr c) : RouteB4 t w pr f c :=
  ⟨hStep, hProc, hConduct, hEscape⟩



theorem routeC1A_intro {t : Transfer} {payor recipient : Person} {a : OfficialAct} {m : Matter}
    {c : ComplaintText}
    (hChannel : ¬ AuthorizedByLawForProperDischargeOfDuty t c)
    (hStep : GivesOffersOrPromises t payor c)
    (hDirected : ValueDirectedToOfficialOrDesignee t recipient c)
    (hClass : CoveredGratuityRecipientClass recipient c)
    (hAct : QualifyingOfficialAct a m recipient c)
    (hNexus : ActPerformedOrToBePerformed t a c) : RouteC1A t payor recipient a m c :=
  ⟨hChannel, hStep, hDirected, hClass, hAct, hNexus⟩

theorem routeC1B_intro {t : Transfer} {official : Person} {a : OfficialAct} {m : Matter}
    {c : ComplaintText}
    (hChannel : ¬ AuthorizedByLawForProperDischargeOfDuty t c)
    (hStep : DemandsSeeksReceivesOrAccepts t official c)
    (hClass : CoveredGratuityRecipientClass official c)
    (hAct : QualifyingOfficialAct a m official c)
    (hNexus : ActPerformedOrToBePerformed t a c) : RouteC1B t official a m c :=
  ⟨hChannel, hStep, hClass, hAct, hNexus⟩

theorem routeC2_intro {t : Transfer} {payor w : Person} {pr : Proceeding} {f : Forum}
    {c : ComplaintText}
    (hStep : GivesOffersOrPromises t payor c)
    (hDirected : ValueDirectedToOfficialOrDesignee t w c)
    (hProc : QualifyingProceeding pr f c)
    (hConduct : WitnessConductTargeted w pr c)
    (hEscape : ¬ WitnessFeeSafeHarbor t w pr c) : RouteC2 t payor w pr f c :=
  ⟨hStep, hDirected, hProc, hConduct, hEscape⟩

theorem routeC3_intro {t : Transfer} {w : Person} {pr : Proceeding} {f : Forum}
    {c : ComplaintText}
    (hStep : DemandsSeeksReceivesOrAccepts t w c)
    (hProc : QualifyingProceeding pr f c)
    (hConduct : WitnessConductTargeted w pr c)
    (hEscape : ¬ WitnessFeeSafeHarbor t w pr c) : RouteC3 t w pr f c :=
  ⟨hStep, hProc, hConduct, hEscape⟩



theorem subsectionBRoute_intro_b1 {t : Transfer} {payor recipient : Person} {c : ComplaintText}
    (h : RouteB1 t payor recipient c) : SubsectionBRoute c := .b1 h

theorem subsectionBRoute_intro_b2 {t : Transfer} {official : Person} {c : ComplaintText}
    (h : RouteB2 t official c) : SubsectionBRoute c := .b2 h

theorem subsectionBRoute_intro_b3 {t : Transfer} {payor w : Person} {pr : Proceeding} {f : Forum}
    {c : ComplaintText} (h : RouteB3 t payor w pr f c) : SubsectionBRoute c := .b3 h

theorem subsectionBRoute_intro_b4 {t : Transfer} {w : Person} {pr : Proceeding} {f : Forum}
    {c : ComplaintText} (h : RouteB4 t w pr f c) : SubsectionBRoute c := .b4 h

theorem subsectionCRoute_intro_c1a {t : Transfer} {payor recipient : Person} {a : OfficialAct}
    {m : Matter} {c : ComplaintText}
    (h : RouteC1A t payor recipient a m c) : SubsectionCRoute c := .c1a h

theorem subsectionCRoute_intro_c1b {t : Transfer} {official : Person} {a : OfficialAct}
    {m : Matter} {c : ComplaintText}
    (h : RouteC1B t official a m c) : SubsectionCRoute c := .c1b h

theorem subsectionCRoute_intro_c2 {t : Transfer} {payor w : Person} {pr : Proceeding} {f : Forum}
    {c : ComplaintText} (h : RouteC2 t payor w pr f c) : SubsectionCRoute c := .c2 h

theorem subsectionCRoute_intro_c3 {t : Transfer} {w : Person} {pr : Proceeding} {f : Forum}
    {c : ComplaintText} (h : RouteC3 t w pr f c) : SubsectionCRoute c := .c3 h

theorem section201Route_intro_subsectionB {c : ComplaintText}
    (h : SubsectionBRoute c) : Section201Route c := .subsectionB h

theorem section201Route_intro_subsectionC {c : ComplaintText}
    (h : SubsectionCRoute c) : Section201Route c := .subsectionC h



theorem subsectionBConviction_intro {pros : Prosecution} {c : ComplaintText}
    (hRoute : SubsectionBRoute c) (hConv : ConvictionEntered pros c) :
    SubsectionBConviction pros c :=
  ⟨hRoute, hConv⟩

theorem subsectionCConviction_intro {pros : Prosecution} {c : ComplaintText}
    (hRoute : SubsectionCRoute c) (hConv : ConvictionEntered pros c) :
    SubsectionCConviction pros c :=
  ⟨hRoute, hConv⟩

theorem lawfulSentenceSubsectionB_intro {s : Sentence} {pros : Prosecution} {t : Transfer}
    {c : ComplaintText}
    (hConv : SubsectionBConviction pros c)
    (hImposed : SentenceImposed s pros c)
    (hFine : imposedFineCents s c ≤ maxFineCentsSubsectionB pros t c)
    (hPrison : imposedImprisonmentMonths s c ≤ maxImprisonmentMonthsSubsectionB) :
    LawfulSentenceSubsectionB s pros t c :=
  ⟨hConv, hImposed, hFine, hPrison⟩

theorem lawfulSentenceSubsectionC_intro {s : Sentence} {pros : Prosecution} {c : ComplaintText}
    (hConv : SubsectionCConviction pros c)
    (hImposed : SentenceImposed s pros c)
    (hFine : imposedFineCents s c ≤ maxFineCentsSubsectionC pros c)
    (hPrison : imposedImprisonmentMonths s c ≤ maxImprisonmentMonthsSubsectionC) :
    LawfulSentenceSubsectionC s pros c :=
  ⟨hConv, hImposed, hFine, hPrison⟩

theorem disqualificationFromFederalOffice_intro {p : Person} {pros : Prosecution}
    {c : ComplaintText}
    (hConv : SubsectionBConviction pros c)
    (hOrdered : DisqualificationOrdered p pros c) :
    DisqualificationFromFederalOffice p pros c :=
  ⟨hConv, hOrdered⟩

theorem cumulativeChargingWithObstruction_intro {pros : Prosecution} {c : ComplaintText}
    (hRoute : Section201Route c) (hObstruction : ChargedUnderObstructionSection pros c) :
    CumulativeChargingWithObstruction pros c :=
  ⟨hRoute, hObstruction⟩



theorem atCaseStage_intro_conductComplete {pros : Prosecution} {c : ComplaintText}
    (h : Section201Route c) : AtCaseStage pros c CaseStage.conductComplete :=
  .conductComplete h

theorem atCaseStage_intro_convicted {pros : Prosecution} {c : ComplaintText}
    (hRoute : Section201Route c) (hConv : ConvictionEntered pros c) :
    AtCaseStage pros c CaseStage.convicted :=
  .convicted hRoute hConv

theorem atCaseStage_intro_sentenced {s : Sentence} {pros : Prosecution} {c : ComplaintText}
    (hRoute : Section201Route c) (hConv : ConvictionEntered pros c)
    (hImposed : SentenceImposed s pros c) : AtCaseStage pros c CaseStage.sentenced :=
  .sentenced hRoute hConv hImposed

theorem atCaseStage_intro_disqualified {p : Person} {pros : Prosecution} {c : ComplaintText}
    (h : DisqualificationFromFederalOffice p pros c) :
    AtCaseStage pros c CaseStage.disqualified :=
  .disqualified h




theorem subsectionBRoute_of_atDisqualified {pros : Prosecution} {c : ComplaintText}
    (h : AtCaseStage pros c CaseStage.disqualified) : SubsectionBRoute c := by
  cases h with
  | disqualified hd => exact hd.convicted.route


theorem atCaseStage_convicted_of_sentenced {pros : Prosecution} {c : ComplaintText}
    (h : AtCaseStage pros c CaseStage.sentenced) : AtCaseStage pros c CaseStage.convicted := by
  cases h with
  | sentenced hRoute hConv _ => exact .convicted hRoute hConv





theorem fineUnderThisTitleCapCents_le_maxFineCentsSubsectionB
    (pros : Prosecution) (t : Transfer) (c : ComplaintText) :
    fineUnderThisTitleCapCents pros c ≤ maxFineCentsSubsectionB pros t c := by
  unfold maxFineCentsSubsectionB
  omega



theorem trebleValue_le_maxFineCentsSubsectionB
    (pros : Prosecution) (t : Transfer) (c : ComplaintText) :
    3 * monetaryEquivalentOfThingOfValueCents t c ≤ maxFineCentsSubsectionB pros t c := by
  unfold maxFineCentsSubsectionB
  omega



theorem maxFineCentsSubsectionC_le_maxFineCentsSubsectionB
    (pros : Prosecution) (t : Transfer) (c : ComplaintText) :
    maxFineCentsSubsectionC pros c ≤ maxFineCentsSubsectionB pros t c := by
  unfold maxFineCentsSubsectionC maxFineCentsSubsectionB
  omega



theorem maxImprisonmentMonthsSubsectionC_lt_subsectionB :
    maxImprisonmentMonthsSubsectionC < maxImprisonmentMonthsSubsectionB := by
  decide



theorem imprisonment_within_subsectionB_of_subsectionC {s : Sentence} {c : ComplaintText}
    (h : imposedImprisonmentMonths s c ≤ maxImprisonmentMonthsSubsectionC) :
    imposedImprisonmentMonths s c ≤ maxImprisonmentMonthsSubsectionB := by
  unfold maxImprisonmentMonthsSubsectionC at h
  unfold maxImprisonmentMonthsSubsectionB
  omega

end Proving.USC.T18.Ch11.EchoReslice.Procedure
