












import Proving.USC.Common.Types
import Proving.USC.T09.Ch1.Ontology.Types
import Proving.USC.T09.Ch1.Ontology.Predicates
import Proving.USC.T09.Ch1.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Ontology

open Proving.USC.Common (Person ComplaintText Time)





theorem maritimeTransactionKind_intro {t : Transaction} {c : ComplaintText}
    (h : IsCharterParty t c
       ∨ IsBillOfLadingOfWaterCarrier t c
       ∨ IsWharfageAgreement t c
       ∨ IsSuppliesOrRepairsToVessels t c
       ∨ IsCollisionMatter t c
       ∨ IsOtherForeignCommerceMatterWithinAdmiraltyJurisdiction t c)
    : MaritimeTransactionKind t c :=
  match h with
  | .inl h => .charterParty h
  | .inr (.inl h) => .billOfLading h
  | .inr (.inr (.inl h)) => .wharfage h
  | .inr (.inr (.inr (.inl h))) => .suppliesOrRepairs h
  | .inr (.inr (.inr (.inr (.inl h)))) => .collision h
  | .inr (.inr (.inr (.inr (.inr h)))) => .otherAdmiraltyMatter h



theorem commerceKind_intro {m : Commerce} {c : ComplaintText}
    (h : IsCommerceAmongTheSeveralStates m c
       ∨ IsCommerceWithForeignNations m c
       ∨ IsCommerceWithinTerritoryOrDistrictOfColumbia m c
       ∨ IsCommerceBetweenTerritories m c
       ∨ IsCommerceBetweenTerritoryAndStateOrForeignNation m c
       ∨ IsCommerceBetweenDistrictOfColumbiaAndStateTerritoryOrForeignNation m c)
    : CommerceKind m c :=
  match h with
  | .inl h => .amongTheSeveralStates h
  | .inr (.inl h) => .withForeignNations h
  | .inr (.inr (.inl h)) => .withinTerritoryOrDC h
  | .inr (.inr (.inr (.inl h))) => .betweenTerritories h
  | .inr (.inr (.inr (.inr (.inl h)))) => .territoryAndStateOrForeignNation h
  | .inr (.inr (.inr (.inr (.inr h)))) => .dcAndStateTerritoryOrForeignNation h


theorem exemptEmploymentContractKind_intro
    {k : EmploymentContract} {c : ComplaintText}
    (h : IsSeamanEmploymentContract k c
       ∨ IsRailroadEmployeeEmploymentContract k c
       ∨ IsOtherClassOfWorkersEngagedInForeignOrInterstateCommerce k c)
    : ExemptEmploymentContractKind k c :=
  match h with
  | .inl h => .seaman h
  | .inr (.inl h) => .railroadEmployee h
  | .inr (.inr h) => .otherEngagedWorkers h


theorem maritimeTransactionMembership_intro {t : Transaction} {c : ComplaintText}
    (hUmbrella : IsMaritimeTransaction t c) (hKind : MaritimeTransactionKind t c)
    : MaritimeTransactionMembership t c := ⟨hUmbrella, hKind⟩


theorem commerceMembership_intro {m : Commerce} {c : ComplaintText}
    (hUmbrella : IsCommerce m c) (hKind : CommerceKind m c)
    : CommerceMembership m c := ⟨hUmbrella, hKind⟩


theorem section1ExcludedEmploymentContract_intro
    {k : EmploymentContract} {c : ComplaintText}
    (hUmbrella : IsExemptEmploymentContract k c)
    (hKind : ExemptEmploymentContractKind k c)
    : Section1ExcludedEmploymentContract k c := ⟨hUmbrella, hKind⟩




theorem section2FutureDisputeClause_intro
    {a : ArbitrationAgreement} {k : Contract} {t : Transaction}
    {v : Controversy} {c : ComplaintText}
    (hWritten : IsWrittenProvisionToSettleByArbitration a c)
    (hNexus : IsMaritimeTransaction t c
            ∨ IsContractEvidencingTransactionInvolvingCommerce k c)
    (hSubject : IsControversyThereafterArising v a c
              ∨ IsRefusalToPerformWholeOrPart v c)
    : Section2FutureDisputeClause a k t v c := ⟨hWritten, hNexus, hSubject⟩


theorem section2ExistingDisputeSubmission_intro
    {a : ArbitrationAgreement} {k : Contract} {t : Transaction}
    {c : ComplaintText}
    (hWritten : IsAgreementInWritingToSubmitExistingControversy a c)
    (hNexus : IsMaritimeTransaction t c
            ∨ IsContractEvidencingTransactionInvolvingCommerce k c)
    : Section2ExistingDisputeSubmission a k t c := ⟨hWritten, hNexus⟩


theorem section2CoveredAgreement_intro
    {a : ArbitrationAgreement} {k : Contract} {t : Transaction}
    {v : Controversy} {c : ComplaintText}
    (h : Section2FutureDisputeClause a k t v c
       ∨ Section2ExistingDisputeSubmission a k t c)
    : Section2CoveredAgreement a k t v c :=
  match h with
  | .inl h => .futureDispute h
  | .inr h => .existingDispute h



theorem section2RevocableAgreement_intro
    {a : ArbitrationAgreement} {k : Contract} {t : Transaction}
    {v : Controversy} {c : ComplaintText}
    (hCovered : Section2CoveredAgreement a k t v c)
    (hGround : IsGroundAtLawOrEquityForRevocationOfAnyContract a c)
    : Section2RevocableAgreement a k t v c := ⟨hCovered, hGround⟩




theorem section3ReferableIssue_intro
    {pr : Proceeding} {ct : Court} {i : Issue} {a : ArbitrationAgreement}
    {ap : Application} {p : Person} {c : ComplaintText}
    (hForum : IsCourtOfTheUnitedStates ct c)
    (hPending : IsSuitOrProceedingPendingInCourt pr ct c)
    (hReferable : IsIssueReferableToArbitration i a c)
    (hApplied : IsApplicationOfOneOfTheParties ap c)
    (hNotInDefault : ¬ IsInDefaultInProceedingWithArbitration p c)
    : Section3ReferableIssue pr ct i a ap p c :=
  ⟨hForum, hPending, hReferable, hApplied, hNotInDefault⟩




theorem section4CompelPetition_intro
    {p : Person} {ct : Court} {ap : Application} {n : Notice}
    {a : ArbitrationAgreement} {c : ComplaintText}
    (hAggrieved : IsPartyAggrievedByFailureToArbitrate p c)
    (hWritten : IsWrittenProvisionToSettleByArbitration a c)
    (hForum : IsUnitedStatesDistrictCourtWithSubjectMatterJurisdiction ct c)
    (hPetition : IsPetitionForOrderDirectingArbitration ap c)
    (hNotice : IsFiveDaysWrittenNoticeServedOnPartyInDefault n c)
    : Section4CompelPetition p ct ap n a c :=
  ⟨hAggrieved, hWritten, hForum, hPetition, hNotice⟩


theorem section4ContestedMaking_intro
    {a : ArbitrationAgreement} {ap : Application} {c : ComplaintText}
    (hInIssue : IsMakingOfAgreementOrFailureToComplyInIssue a c)
    (hJury : IsJuryTrialDemandedByPartyAllegedInDefault ap c)
    : Section4ContestedMaking a ap c := ⟨hInIssue, hJury⟩





theorem section5ArbitratorAppointment_intro
    {a : ArbitrationAgreement} {r : Arbitrator} {c : ComplaintText}
    (h : (IsMethodOfNamingArbitratorProvidedInAgreement a c
            ∧ (IsArbitrator r c ∨ IsUmpire r c))
       ∨ (IsLapseInNamingArbitratorOrFillingVacancy a c
            ∧ IsCourtDesignatedArbitrator r c))
    : Section5ArbitratorAppointment a r c :=
  match h with
  | .inl ⟨hMethod, hWho⟩ => .agreedMethod hMethod hWho
  | .inr ⟨hLapse, hDesignated⟩ => .courtDesignation hLapse hDesignated




theorem section6ApplicationHeardAsMotion_intro
    {ap : Application} {c : ComplaintText}
    (hUnderTitle : IsApplicationToTheCourtUnderThisTitle ap c)
    (hAsMotion : IsHeardInMannerProvidedForMotions ap c)
    : Section6ApplicationHeardAsMotion ap c := ⟨hUnderTitle, hAsMotion⟩




theorem section7WitnessSummons_intro
    {s : Summons} {r : Arbitrator} {p : Person} {it : EvidentiaryItem}
    {c : ComplaintText}
    (hIssued : IsSummonsIssuedByArbitrators s c)
    (hArbitrator : IsArbitrator r c)
    (hWitness : IsWitnessSummonedToAttend p c)
    (hMaterial : IsMaterialEvidentiaryItem it c)
    : Section7WitnessSummons s r p it c :=
  ⟨hIssued, hArbitrator, hWitness, hMaterial⟩


theorem section7Disobedience_intro
    {s : Summons} {p : Person} {c : ComplaintText}
    (hSummoned : IsSummonsIssuedByArbitrators s c)
    (hWitness : IsWitnessSummonedToAttend p c)
    (hDisobeyed : IsRefusalOrNeglectToObeySummons p c)
    : Section7Disobedience s p c := ⟨hSummoned, hWitness, hDisobeyed⟩




theorem section8AdmiraltyCommencement_intro
    {pr : Proceeding} {pty : Property} {c : ComplaintText}
    (hJusticiable : IsCauseOfActionJusticiableInAdmiralty pr c)
    (hLibel : IsProceedingBegunByLibelAndSeizure pr c)
    (hRes : IsVesselOrOtherProperty pty c)
    : Section8AdmiraltyCommencement pr pty c := ⟨hJusticiable, hLibel, hRes⟩




theorem section9ConfirmationApplication_intro
    {w : Award} {a : ArbitrationAgreement} {ct : Court} {ap : Application}
    {p : Person} {c : ComplaintText}
    (hAward : IsAward w c)
    (hEntryAgreed : IsAgreementForEntryOfJudgmentUponAward a c)
    (hForum : IsCourtSpecifiedInAgreement ct a c)
    (hApplication : IsApplicationForOrderConfirmingAward ap c)
    (hTimely : IsWithinOneYearAfterAwardMade ap w c)
    (hAdverse : IsAdverseParty p c)
    : Section9ConfirmationApplication w a ct ap p c :=
  ⟨hAward, hEntryAgreed, hForum, hApplication, hTimely, hAdverse⟩





theorem section10VacaturGround_intro
    {w : Award} {r : Arbitrator} {c : ComplaintText}
    (h : IsAwardProcuredByCorruptionFraudOrUndueMeans w c
       ∨ IsEvidentPartialityOrCorruptionInArbitrators r w c
       ∨ IsArbitratorMisconductInRefusingPostponementOrEvidence r w c
       ∨ IsOtherMisbehaviorPrejudicingRightsOfParty r w c
       ∨ IsArbitratorExceededOrImperfectlyExecutedPowers r w c)
    : Section10VacaturGround w r c :=
  match h with
  | .inl h => .corruptionFraudOrUndueMeans h
  | .inr (.inl h) => .evidentPartiality h
  | .inr (.inr (.inl h)) => .hearingMisconduct h
  | .inr (.inr (.inr (.inl h))) => .otherMisbehavior h
  | .inr (.inr (.inr (.inr h))) => .exceededPowers h



theorem section10Rehearing_intro
    {w : Award} {r : Arbitrator} {a : ArbitrationAgreement} {o : CourtOrder}
    {c : ComplaintText}
    (hGround : Section10VacaturGround w r c)
    (hVacated : IsOrderVacatingAward o c)
    (hTime : IsTimeForMakingAwardNotExpired a c)
    : Section10Rehearing w r a o c := ⟨hGround, hVacated, hTime⟩


theorem section10AdrVacatur_intro
    {w : Award} {p : Person} {c : ComplaintText}
    (hAdr : IsAwardIssuedPursuantToSection580OfTitle5 w c)
    (hAggrieved : IsPersonAdverselyAffectedNotPartyToArbitration p w c)
    (hInconsistent : IsClearlyInconsistentWithSection572Factors w c)
    : Section10AdrVacatur w p c := ⟨hAdr, hAggrieved, hInconsistent⟩




theorem section11ModificationGround_intro {w : Award} {c : ComplaintText}
    (h : IsEvidentMaterialMiscalculationOrMistakeInDescription w c
       ∨ (IsAwardUponMatterNotSubmitted w c ∧ IsMatterAffectingTheMeritsOfTheDecision w c)
       ∨ IsAwardImperfectInMatterOfForm w c)
    : Section11ModificationGround w c :=
  match h with
  | .inl h => .miscalculationOrMistake h
  | .inr (.inl ⟨hNotSubmitted, hMerits⟩) => .matterNotSubmitted hNotSubmitted hMerits
  | .inr (.inr h) => .imperfectForm h




theorem section12TimelyNotice_intro
    {w : Award} {n : Notice} {p : Person} {c : ComplaintText}
    (hNotice : IsNoticeOfMotionToVacateModifyOrCorrect n c)
    (hAdverse : IsAdverseParty p c)
    (hTimely : IsWithinThreeMonthsAfterAwardFiledOrDelivered n w c)
    : Section12TimelyNotice w n p c := ⟨hNotice, hAdverse, hTimely⟩




theorem section13FiledPaper_intro {pp : Paper} {c : ComplaintText}
    (h : IsAgreementOrAppointmentOrExtensionPaper pp c
       ∨ IsAwardPaper pp c
       ∨ IsApplicationPaperOrCourtOrderCopy pp c)
    : Section13FiledPaper pp c :=
  match h with
  | .inl h => .agreementAppointmentOrExtension h
  | .inr (.inl h) => .award h
  | .inr (.inr h) => .applicationPaperOrOrderCopy h



theorem section13EnteredJudgment_intro
    {j : Judgment} {o : CourtOrder} {c : ComplaintText}
    (hOrder : IsOrderConfirmingAward o c ∨ IsOrderModifyingOrCorrectingAward o c)
    (hDocketed : IsJudgmentDocketedAsInAnAction j c)
    : Section13EnteredJudgment j o c := ⟨hOrder, hDocketed⟩




theorem section14ExcludedContract_intro {k : Contract} {c : ComplaintText}
    (hPreAct : IsContractMadePriorToJanuary1_1926 k c)
    : Section14ExcludedContract k c := ⟨hPreAct⟩




theorem section15ProtectedSubject_intro
    {a : ArbitrationAgreement} {w : Award} {j : Judgment} {c : ComplaintText}
    (h : IsArbitralAgreement a c
       ∨ IsArbitralAward w c
       ∨ IsExecutionUponJudgmentBasedOnOrderConfirmingAward j c)
    : Section15ProtectedSubject a w j c :=
  match h with
  | .inl h => .arbitralAgreementEnforcement h
  | .inr (.inl h) => .arbitralAwardConfirmation h
  | .inr (.inr h) => .executionOnConfirmingJudgment h



theorem section15ActOfStateConfiguration_intro
    {a : ArbitrationAgreement} {w : Award} {j : Judgment} {pr : Proceeding}
    {c : ComplaintText}
    (hSubject : Section15ProtectedSubject a w j c)
    (hGround : IsActOfStateDoctrineGroundAsserted pr c)
    : Section15ActOfStateConfiguration a w j pr c := ⟨hSubject, hGround⟩




theorem section16AppealableOrder_intro
    {o : CourtOrder} {pr : Proceeding} {c : ComplaintText}
    (h : IsOrderRefusingStayUnderSection3 o c
       ∨ IsOrderDenyingPetitionUnderSection4 o c
       ∨ IsOrderDenyingApplicationUnderSection206 o c
       ∨ IsOrderConfirmingOrDenyingConfirmationOfAward o c
       ∨ IsOrderModifyingCorrectingOrVacatingAward o c
       ∨ (IsInterlocutoryOrderEnjoiningArbitration o c
            ∧ IsArbitrationSubjectToThisTitle pr c)
       ∨ (IsFinalDecisionWithRespectToArbitration o c
            ∧ IsArbitrationSubjectToThisTitle pr c))
    : Section16AppealableOrder o pr c :=
  match h with
  | .inl h => .refusingStayUnderSection3 h
  | .inr (.inl h) => .denyingPetitionUnderSection4 h
  | .inr (.inr (.inl h)) => .denyingApplicationUnderSection206 h
  | .inr (.inr (.inr (.inl h))) => .confirmingOrDenyingConfirmation h
  | .inr (.inr (.inr (.inr (.inl h)))) => .modifyingCorrectingOrVacating h
  | .inr (.inr (.inr (.inr (.inr (.inl ⟨hOrd, hArb⟩))))) =>
      .interlocutoryInjunction hOrd hArb
  | .inr (.inr (.inr (.inr (.inr (.inr ⟨hOrd, hArb⟩))))) => .finalDecision hOrd hArb


theorem section16NonappealableInterlocutoryOrder_intro
    {o : CourtOrder} {pr : Proceeding} {c : ComplaintText}
    (h : IsOrderGrantingStayUnderSection3 o c
       ∨ IsOrderDirectingArbitrationUnderSection4 o c
       ∨ IsOrderCompellingArbitrationUnderSection206 o c
       ∨ (IsOrderRefusingToEnjoinArbitration o c
            ∧ IsArbitrationSubjectToThisTitle pr c))
    : Section16NonappealableInterlocutoryOrder o pr c :=
  match h with
  | .inl h => .grantingStayUnderSection3 h
  | .inr (.inl h) => .directingArbitrationUnderSection4 h
  | .inr (.inr (.inl h)) => .compellingArbitrationUnderSection206 h
  | .inr (.inr (.inr ⟨hOrd, hArb⟩)) => .refusingToEnjoinArbitration hOrd hArb


theorem section16Appeal_intro
    {ap : Appeal} {o : CourtOrder} {pr : Proceeding} {c : ComplaintText}
    (hAppealable : Section16AppealableOrder o pr c)
    (hTaken : IsAppealTakenFromOrder ap o c)
    : Section16Appeal ap o pr c := ⟨hAppealable, hTaken⟩



theorem section16CertifiedInterlocutoryOrder_intro
    {o : CourtOrder} {pr : Proceeding} {c : ComplaintText}
    (hBarred : Section16NonappealableInterlocutoryOrder o pr c)
    (hCertified : IsCertifiedUnderSection1292bOfTitle28 o c)
    : Section16CertifiedInterlocutoryOrder o pr c := ⟨hBarred, hCertified⟩

end Proving.USC.T09.Ch1.Ontology
