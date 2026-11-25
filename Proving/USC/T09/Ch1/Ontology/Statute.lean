












import Proving.USC.Common.Types
import Proving.USC.T09.Ch1.Ontology.Types
import Proving.USC.T09.Ch1.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Ontology

open Proving.USC.Common (Person ComplaintText Time)






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr




def edge_maritimeTransaction_dependsOn_foreignCommerce : DefEdge :=
  { defined := "maritime transactions", dependsOn := "foreign commerce",
    citeDefine := "9 USC § 1" }


def edge_maritimeTransaction_dependsOn_admiraltyJurisdiction : DefEdge :=
  { defined := "maritime transactions", dependsOn := "admiralty jurisdiction",
    citeDefine := "9 USC § 1" }


def edge_maritimeTransaction_dependsOn_controversy : DefEdge :=
  { defined := "maritime transactions", dependsOn := "controversy",
    citeDefine := "9 USC § 1" }


def edge_maritimeTransaction_dependsOn_vessel : DefEdge :=
  { defined := "maritime transactions", dependsOn := "vessel",
    citeDefine := "9 USC § 1" }


def edge_exemptEmploymentContract_dependsOn_commerce : DefEdge :=
  { defined := "contracts of employment of … workers engaged in commerce",
    dependsOn := "commerce", citeDefine := "9 USC § 1" }




def edge_section2Agreement_dependsOn_maritimeTransaction : DefEdge :=
  { defined := "written provision in any maritime transaction",
    dependsOn := "maritime transactions", citeDefine := "9 USC § 2" }



def edge_section2Agreement_dependsOn_commerce : DefEdge :=
  { defined := "contract evidencing a transaction involving commerce",
    dependsOn := "commerce", citeDefine := "9 USC § 2" }


def edge_section2Agreement_dependsOn_controversy : DefEdge :=
  { defined := "agreement to settle by arbitration", dependsOn := "controversy",
    citeDefine := "9 USC § 2" }


def edge_section2SavingsClause_dependsOn_contract : DefEdge :=
  { defined := "grounds … for the revocation of any contract",
    dependsOn := "contract", citeDefine := "9 USC § 2" }




def edge_section3Stay_dependsOn_agreementInWriting : DefEdge :=
  { defined := "issue referable to arbitration",
    dependsOn := "agreement in writing for such arbitration",
    citeDefine := "9 USC § 3" }


def edge_section3Stay_dependsOn_courtOfTheUnitedStates : DefEdge :=
  { defined := "stay of the trial of the action",
    dependsOn := "courts of the United States", citeDefine := "9 USC § 3" }


def edge_section3Stay_dependsOn_default : DefEdge :=
  { defined := "applicant for the stay",
    dependsOn := "default in proceeding with such arbitration",
    citeDefine := "9 USC § 3" }


def edge_section4Forum_dependsOn_title28Jurisdiction : DefEdge :=
  { defined := "United States district court … which would have jurisdiction",
    dependsOn := "jurisdiction under title 28", citeDefine := "9 USC § 4" }


def edge_section4Service_dependsOn_federalRules : DefEdge :=
  { defined := "service of the notice of application",
    dependsOn := "Federal Rules of Civil Procedure", citeDefine := "9 USC § 4" }


def edge_section4Petition_dependsOn_writtenAgreement : DefEdge :=
  { defined := "party aggrieved",
    dependsOn := "written agreement for arbitration", citeDefine := "9 USC § 4" }


def edge_section5Appointment_dependsOn_agreement : DefEdge :=
  { defined := "designation and appointment of an arbitrator",
    dependsOn := "the agreement", citeDefine := "9 USC § 5" }



def edge_section6Application_dependsOn_motionPractice : DefEdge :=
  { defined := "application to the court hereunder",
    dependsOn := "manner provided by law for … motions", citeDefine := "9 USC § 6" }


def edge_section7Summons_dependsOn_arbitrator : DefEdge :=
  { defined := "summons to a witness", dependsOn := "arbitrator",
    citeDefine := "9 USC § 7" }



def edge_section7Fees_dependsOn_mastersFees : DefEdge :=
  { defined := "fees for such attendance",
    dependsOn := "fees of witnesses before masters of the United States courts",
    citeDefine := "9 USC § 7" }


def edge_section8Commencement_dependsOn_admiraltyJurisdiction : DefEdge :=
  { defined := "proceeding begun by libel and seizure",
    dependsOn := "admiralty jurisdiction", citeDefine := "9 USC § 8" }




def edge_section9Confirmation_dependsOn_award : DefEdge :=
  { defined := "order confirming the award", dependsOn := "award",
    citeDefine := "9 USC § 9" }



def edge_section9Confirmation_dependsOn_section10And11Grounds : DefEdge :=
  { defined := "order confirming the award",
    dependsOn := "vacatur/modification grounds (§§ 10–11)",
    citeDefine := "9 USC § 9" }


def edge_section9Forum_dependsOn_agreement : DefEdge :=
  { defined := "the court so specified", dependsOn := "the agreement",
    citeDefine := "9 USC § 9" }


def edge_section10Vacatur_dependsOn_arbitrator : DefEdge :=
  { defined := "grounds for vacating the award", dependsOn := "arbitrator",
    citeDefine := "9 USC § 10" }


def edge_section10cVacatur_dependsOn_title5Section580 : DefEdge :=
  { defined := "award issued pursuant to section 580 of title 5",
    dependsOn := "5 USC § 580", citeDefine := "9 USC § 10(c)" }


def edge_section10cVacatur_dependsOn_title5Section572 : DefEdge :=
  { defined := "clearly inconsistent with the factors set forth in section 572",
    dependsOn := "5 USC § 572", citeDefine := "9 USC § 10(c)" }


def edge_section11Modification_dependsOn_award : DefEdge :=
  { defined := "grounds for modifying or correcting the award",
    dependsOn := "award", citeDefine := "9 USC § 11" }


def edge_section12Notice_dependsOn_section10And11Motion : DefEdge :=
  { defined := "notice of a motion to vacate, modify, or correct",
    dependsOn := "motion to vacate/modify (§§ 10–11)", citeDefine := "9 USC § 12" }



def edge_section13Papers_dependsOn_agreementAndAward : DefEdge :=
  { defined := "papers filed with the clerk",
    dependsOn := "the agreement; the appointment (§ 5); the award",
    citeDefine := "9 USC § 13" }



def edge_section13Judgment_dependsOn_judgmentInAnAction : DefEdge :=
  { defined := "judgment entered on the award",
    dependsOn := "judgment in an action", citeDefine := "9 USC § 13" }




def edge_section14Exclusion_dependsOn_contract : DefEdge :=
  { defined := "contracts made prior to January 1, 1926",
    dependsOn := "contract", citeDefine := "9 USC § 14" }


def edge_section15_dependsOn_actOfStateDoctrine : DefEdge :=
  { defined := "inapplicability of the Act of State doctrine",
    dependsOn := "Act of State doctrine", citeDefine := "9 USC § 15" }


def edge_section15_dependsOn_arbitralAgreementAndAward : DefEdge :=
  { defined := "protected enforcement acts",
    dependsOn := "arbitral agreements; arbitral awards; confirming judgments",
    citeDefine := "9 USC § 15" }


def edge_section16Appealable_dependsOn_section3And4Orders : DefEdge :=
  { defined := "appealable order", dependsOn := "orders under §§ 3–4",
    citeDefine := "9 USC § 16(a)" }



def edge_section16_dependsOn_section206 : DefEdge :=
  { defined := "appealable/nonappealable order", dependsOn := "9 USC § 206",
    citeDefine := "9 USC § 16" }


def edge_section16Appealable_dependsOn_awardOrders : DefEdge :=
  { defined := "appealable order",
    dependsOn := "orders confirming/modifying/vacating an award (§§ 9–11)",
    citeDefine := "9 USC § 16(a)" }


def edge_section16Nonappealable_dependsOn_title28Section1292b : DefEdge :=
  { defined := "nonappealable interlocutory order",
    dependsOn := "28 USC § 1292(b)", citeDefine := "9 USC § 16(b)" }


def definitionalEdges : List DefEdge :=
  [ edge_maritimeTransaction_dependsOn_foreignCommerce,
    edge_maritimeTransaction_dependsOn_admiraltyJurisdiction,
    edge_maritimeTransaction_dependsOn_controversy,
    edge_maritimeTransaction_dependsOn_vessel,
    edge_exemptEmploymentContract_dependsOn_commerce,
    edge_section2Agreement_dependsOn_maritimeTransaction,
    edge_section2Agreement_dependsOn_commerce,
    edge_section2Agreement_dependsOn_controversy,
    edge_section2SavingsClause_dependsOn_contract,
    edge_section3Stay_dependsOn_agreementInWriting,
    edge_section3Stay_dependsOn_courtOfTheUnitedStates,
    edge_section3Stay_dependsOn_default,
    edge_section4Forum_dependsOn_title28Jurisdiction,
    edge_section4Service_dependsOn_federalRules,
    edge_section4Petition_dependsOn_writtenAgreement,
    edge_section5Appointment_dependsOn_agreement,
    edge_section6Application_dependsOn_motionPractice,
    edge_section7Summons_dependsOn_arbitrator,
    edge_section7Fees_dependsOn_mastersFees,
    edge_section8Commencement_dependsOn_admiraltyJurisdiction,
    edge_section9Confirmation_dependsOn_award,
    edge_section9Confirmation_dependsOn_section10And11Grounds,
    edge_section9Forum_dependsOn_agreement,
    edge_section10Vacatur_dependsOn_arbitrator,
    edge_section10cVacatur_dependsOn_title5Section580,
    edge_section10cVacatur_dependsOn_title5Section572,
    edge_section11Modification_dependsOn_award,
    edge_section12Notice_dependsOn_section10And11Motion,
    edge_section13Papers_dependsOn_agreementAndAward,
    edge_section13Judgment_dependsOn_judgmentInAnAction,
    edge_section14Exclusion_dependsOn_contract,
    edge_section15_dependsOn_actOfStateDoctrine,
    edge_section15_dependsOn_arbitralAgreementAndAward,
    edge_section16Appealable_dependsOn_section3And4Orders,
    edge_section16_dependsOn_section206,
    edge_section16Appealable_dependsOn_awardOrders,
    edge_section16Nonappealable_dependsOn_title28Section1292b ]







inductive MaritimeTransactionKind (t : Transaction) (c : ComplaintText) : Prop where
  | charterParty        : IsCharterParty t c → MaritimeTransactionKind t c
  | billOfLading        : IsBillOfLadingOfWaterCarrier t c → MaritimeTransactionKind t c
  | wharfage            : IsWharfageAgreement t c → MaritimeTransactionKind t c
  | suppliesOrRepairs   : IsSuppliesOrRepairsToVessels t c → MaritimeTransactionKind t c
  | collision           : IsCollisionMatter t c → MaritimeTransactionKind t c
  | otherAdmiraltyMatter :
      IsOtherForeignCommerceMatterWithinAdmiraltyJurisdiction t c →
      MaritimeTransactionKind t c



inductive CommerceKind (m : Commerce) (c : ComplaintText) : Prop where
  | amongTheSeveralStates : IsCommerceAmongTheSeveralStates m c → CommerceKind m c
  | withForeignNations    : IsCommerceWithForeignNations m c → CommerceKind m c
  | withinTerritoryOrDC   : IsCommerceWithinTerritoryOrDistrictOfColumbia m c → CommerceKind m c
  | betweenTerritories    : IsCommerceBetweenTerritories m c → CommerceKind m c
  | territoryAndStateOrForeignNation :
      IsCommerceBetweenTerritoryAndStateOrForeignNation m c → CommerceKind m c
  | dcAndStateTerritoryOrForeignNation :
      IsCommerceBetweenDistrictOfColumbiaAndStateTerritoryOrForeignNation m c →
      CommerceKind m c




inductive ExemptEmploymentContractKind
    (k : EmploymentContract) (c : ComplaintText) : Prop where
  | seaman           : IsSeamanEmploymentContract k c → ExemptEmploymentContractKind k c
  | railroadEmployee :
      IsRailroadEmployeeEmploymentContract k c → ExemptEmploymentContractKind k c
  | otherEngagedWorkers :
      IsOtherClassOfWorkersEngagedInForeignOrInterstateCommerce k c →
      ExemptEmploymentContractKind k c



structure MaritimeTransactionMembership
    (t : Transaction) (c : ComplaintText) : Prop where
  umbrella : IsMaritimeTransaction t c
  kind     : MaritimeTransactionKind t c


structure CommerceMembership (m : Commerce) (c : ComplaintText) : Prop where
  umbrella : IsCommerce m c
  kind     : CommerceKind m c



structure Section1ExcludedEmploymentContract
    (k : EmploymentContract) (c : ComplaintText) : Prop where
  umbrella : IsExemptEmploymentContract k c
  kind     : ExemptEmploymentContractKind k c






structure Section2FutureDisputeClause
    (a : ArbitrationAgreement) (k : Contract) (t : Transaction)
    (v : Controversy) (c : ComplaintText) : Prop where
  written : IsWrittenProvisionToSettleByArbitration a c
  nexus   : IsMaritimeTransaction t c ∨ IsContractEvidencingTransactionInvolvingCommerce k c
  subject : IsControversyThereafterArising v a c ∨ IsRefusalToPerformWholeOrPart v c




structure Section2ExistingDisputeSubmission
    (a : ArbitrationAgreement) (k : Contract) (t : Transaction)
    (c : ComplaintText) : Prop where
  written : IsAgreementInWritingToSubmitExistingControversy a c
  nexus   : IsMaritimeTransaction t c ∨ IsContractEvidencingTransactionInvolvingCommerce k c


inductive Section2CoveredAgreement
    (a : ArbitrationAgreement) (k : Contract) (t : Transaction)
    (v : Controversy) (c : ComplaintText) : Prop where
  | futureDispute   : Section2FutureDisputeClause a k t v c → Section2CoveredAgreement a k t v c
  | existingDispute : Section2ExistingDisputeSubmission a k t c → Section2CoveredAgreement a k t v c



structure Section2RevocableAgreement
    (a : ArbitrationAgreement) (k : Contract) (t : Transaction)
    (v : Controversy) (c : ComplaintText) : Prop where
  covered : Section2CoveredAgreement a k t v c
  ground  : IsGroundAtLawOrEquityForRevocationOfAnyContract a c




structure Section3ReferableIssue
    (pr : Proceeding) (ct : Court) (i : Issue) (a : ArbitrationAgreement)
    (ap : Application) (p : Person) (c : ComplaintText) : Prop where
  federalForum : IsCourtOfTheUnitedStates ct c
  pending      : IsSuitOrProceedingPendingInCourt pr ct c
  referable    : IsIssueReferableToArbitration i a c
  applied      : IsApplicationOfOneOfTheParties ap c
  notInDefault : ¬ IsInDefaultInProceedingWithArbitration p c




structure Section4CompelPetition
    (p : Person) (ct : Court) (ap : Application) (n : Notice)
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop where
  aggrieved : IsPartyAggrievedByFailureToArbitrate p c
  written   : IsWrittenProvisionToSettleByArbitration a c
  forum     : IsUnitedStatesDistrictCourtWithSubjectMatterJurisdiction ct c
  petition  : IsPetitionForOrderDirectingArbitration ap c
  notice    : IsFiveDaysWrittenNoticeServedOnPartyInDefault n c




structure Section4ContestedMaking
    (a : ArbitrationAgreement) (ap : Application) (c : ComplaintText) : Prop where
  inIssue    : IsMakingOfAgreementOrFailureToComplyInIssue a c
  juryDemand : IsJuryTrialDemandedByPartyAllegedInDefault ap c





inductive Section5ArbitratorAppointment
    (a : ArbitrationAgreement) (r : Arbitrator) (c : ComplaintText) : Prop where
  | agreedMethod :
      IsMethodOfNamingArbitratorProvidedInAgreement a c →
      (IsArbitrator r c ∨ IsUmpire r c) →
      Section5ArbitratorAppointment a r c
  | courtDesignation :
      IsLapseInNamingArbitratorOrFillingVacancy a c →
      IsCourtDesignatedArbitrator r c →
      Section5ArbitratorAppointment a r c





structure Section6ApplicationHeardAsMotion
    (ap : Application) (c : ComplaintText) : Prop where
  underTitle : IsApplicationToTheCourtUnderThisTitle ap c
  asMotion   : IsHeardInMannerProvidedForMotions ap c




structure Section7WitnessSummons
    (s : Summons) (r : Arbitrator) (p : Person) (it : EvidentiaryItem)
    (c : ComplaintText) : Prop where
  issued       : IsSummonsIssuedByArbitrators s c
  byArbitrator : IsArbitrator r c
  witness      : IsWitnessSummonedToAttend p c
  material     : IsMaterialEvidentiaryItem it c



structure Section7Disobedience
    (s : Summons) (p : Person) (c : ComplaintText) : Prop where
  summoned  : IsSummonsIssuedByArbitrators s c
  witness   : IsWitnessSummonedToAttend p c
  disobeyed : IsRefusalOrNeglectToObeySummons p c





structure Section8AdmiraltyCommencement
    (pr : Proceeding) (pty : Property) (c : ComplaintText) : Prop where
  justiciable     : IsCauseOfActionJusticiableInAdmiralty pr c
  libelAndSeizure : IsProceedingBegunByLibelAndSeizure pr c
  res             : IsVesselOrOtherProperty pty c




structure Section9ConfirmationApplication
    (w : Award) (a : ArbitrationAgreement) (ct : Court) (ap : Application)
    (p : Person) (c : ComplaintText) : Prop where
  award       : IsAward w c
  entryAgreed : IsAgreementForEntryOfJudgmentUponAward a c
  forum       : IsCourtSpecifiedInAgreement ct a c
  application : IsApplicationForOrderConfirmingAward ap c
  timely      : IsWithinOneYearAfterAwardMade ap w c
  adverse     : IsAdverseParty p c





inductive Section10VacaturGround
    (w : Award) (r : Arbitrator) (c : ComplaintText) : Prop where
  | corruptionFraudOrUndueMeans :
      IsAwardProcuredByCorruptionFraudOrUndueMeans w c → Section10VacaturGround w r c
  | evidentPartiality :
      IsEvidentPartialityOrCorruptionInArbitrators r w c → Section10VacaturGround w r c
  | hearingMisconduct :
      IsArbitratorMisconductInRefusingPostponementOrEvidence r w c →
      Section10VacaturGround w r c
  | otherMisbehavior :
      IsOtherMisbehaviorPrejudicingRightsOfParty r w c → Section10VacaturGround w r c
  | exceededPowers :
      IsArbitratorExceededOrImperfectlyExecutedPowers r w c →
      Section10VacaturGround w r c



structure Section10Rehearing
    (w : Award) (r : Arbitrator) (a : ArbitrationAgreement) (o : CourtOrder)
    (c : ComplaintText) : Prop where
  ground         : Section10VacaturGround w r c
  vacated        : IsOrderVacatingAward o c
  timeNotExpired : IsTimeForMakingAwardNotExpired a c



structure Section10AdrVacatur
    (w : Award) (p : Person) (c : ComplaintText) : Prop where
  adrAward          : IsAwardIssuedPursuantToSection580OfTitle5 w c
  nonPartyAggrieved : IsPersonAdverselyAffectedNotPartyToArbitration p w c
  inconsistent      : IsClearlyInconsistentWithSection572Factors w c






inductive Section11ModificationGround (w : Award) (c : ComplaintText) : Prop where
  | miscalculationOrMistake :
      IsEvidentMaterialMiscalculationOrMistakeInDescription w c →
      Section11ModificationGround w c
  | matterNotSubmitted :
      IsAwardUponMatterNotSubmitted w c →
      IsMatterAffectingTheMeritsOfTheDecision w c →
      Section11ModificationGround w c
  | imperfectForm :
      IsAwardImperfectInMatterOfForm w c → Section11ModificationGround w c





structure Section12TimelyNotice
    (w : Award) (n : Notice) (p : Person) (c : ComplaintText) : Prop where
  notice  : IsNoticeOfMotionToVacateModifyOrCorrect n c
  adverse : IsAdverseParty p c
  timely  : IsWithinThreeMonthsAfterAwardFiledOrDelivered n w c





inductive Section13FiledPaper (pp : Paper) (c : ComplaintText) : Prop where
  | agreementAppointmentOrExtension :
      IsAgreementOrAppointmentOrExtensionPaper pp c → Section13FiledPaper pp c
  | award :
      IsAwardPaper pp c → Section13FiledPaper pp c
  | applicationPaperOrOrderCopy :
      IsApplicationPaperOrCourtOrderCopy pp c → Section13FiledPaper pp c



structure Section13EnteredJudgment
    (j : Judgment) (o : CourtOrder) (c : ComplaintText) : Prop where
  order    : IsOrderConfirmingAward o c ∨ IsOrderModifyingOrCorrectingAward o c
  docketed : IsJudgmentDocketedAsInAnAction j c




structure Section14ExcludedContract (k : Contract) (c : ComplaintText) : Prop where
  preAct : IsContractMadePriorToJanuary1_1926 k c





inductive Section15ProtectedSubject
    (a : ArbitrationAgreement) (w : Award) (j : Judgment)
    (c : ComplaintText) : Prop where
  | arbitralAgreementEnforcement :
      IsArbitralAgreement a c → Section15ProtectedSubject a w j c
  | arbitralAwardConfirmation :
      IsArbitralAward w c → Section15ProtectedSubject a w j c
  | executionOnConfirmingJudgment :
      IsExecutionUponJudgmentBasedOnOrderConfirmingAward j c →
      Section15ProtectedSubject a w j c




structure Section15ActOfStateConfiguration
    (a : ArbitrationAgreement) (w : Award) (j : Judgment) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  subject        : Section15ProtectedSubject a w j c
  groundAsserted : IsActOfStateDoctrineGroundAsserted pr c





inductive Section16AppealableOrder
    (o : CourtOrder) (pr : Proceeding) (c : ComplaintText) : Prop where
  | refusingStayUnderSection3 :
      IsOrderRefusingStayUnderSection3 o c → Section16AppealableOrder o pr c
  | denyingPetitionUnderSection4 :
      IsOrderDenyingPetitionUnderSection4 o c → Section16AppealableOrder o pr c
  | denyingApplicationUnderSection206 :
      IsOrderDenyingApplicationUnderSection206 o c → Section16AppealableOrder o pr c
  | confirmingOrDenyingConfirmation :
      IsOrderConfirmingOrDenyingConfirmationOfAward o c → Section16AppealableOrder o pr c
  | modifyingCorrectingOrVacating :
      IsOrderModifyingCorrectingOrVacatingAward o c → Section16AppealableOrder o pr c
  | interlocutoryInjunction :
      IsInterlocutoryOrderEnjoiningArbitration o c →
      IsArbitrationSubjectToThisTitle pr c →
      Section16AppealableOrder o pr c
  | finalDecision :
      IsFinalDecisionWithRespectToArbitration o c →
      IsArbitrationSubjectToThisTitle pr c →
      Section16AppealableOrder o pr c



inductive Section16NonappealableInterlocutoryOrder
    (o : CourtOrder) (pr : Proceeding) (c : ComplaintText) : Prop where
  | grantingStayUnderSection3 :
      IsOrderGrantingStayUnderSection3 o c →
      Section16NonappealableInterlocutoryOrder o pr c
  | directingArbitrationUnderSection4 :
      IsOrderDirectingArbitrationUnderSection4 o c →
      Section16NonappealableInterlocutoryOrder o pr c
  | compellingArbitrationUnderSection206 :
      IsOrderCompellingArbitrationUnderSection206 o c →
      Section16NonappealableInterlocutoryOrder o pr c
  | refusingToEnjoinArbitration :
      IsOrderRefusingToEnjoinArbitration o c →
      IsArbitrationSubjectToThisTitle pr c →
      Section16NonappealableInterlocutoryOrder o pr c


structure Section16Appeal
    (ap : Appeal) (o : CourtOrder) (pr : Proceeding) (c : ComplaintText) : Prop where
  appealable : Section16AppealableOrder o pr c
  taken      : IsAppealTakenFromOrder ap o c



structure Section16CertifiedInterlocutoryOrder
    (o : CourtOrder) (pr : Proceeding) (c : ComplaintText) : Prop where
  otherwiseBarred : Section16NonappealableInterlocutoryOrder o pr c
  certified       : IsCertifiedUnderSection1292bOfTitle28 o c

end Proving.USC.T09.Ch1.Ontology
