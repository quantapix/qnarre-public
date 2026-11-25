import Proving.USC.T18.Ch113B.MaterialSupport.Deontic.Statute








set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Deontic

open Proving.USC.Common




theorem modalityOf_s2339a : modalityOf .s2339a = .prohibition := rfl


theorem modalityOf_s2339Ba2 : modalityOf .s2339Ba2 = .obligation := rfl


theorem modalityOf_s2339Bc : modalityOf .s2339Bc = .power := rfl


theorem modalityOf_s2339b : modalityOf .s2339b = .permission := rfl


theorem modalityOf_s2339Ab : modalityOf .s2339Ab = .definition := rfl




theorem prohibition2339_intro {p w : Person} {o : Offense} {c : ComplaintText}
    (hAddr : AddresseeInClass2339 p c) (hEnum : IsEnumeratedOffense2339 o c)
    (hCond : ConditionMet2339 p w o c) : Prohibition2339 p w o c :=
  ⟨hAddr, hEnum, hCond⟩


theorem prohibition2339Violated_intro {p w : Person} {o : Offense} {c : ComplaintText}
    (hNorm : Prohibition2339 p w o c) (hAct : RegulatedActOccurred2339 p w c) :
    Prohibition2339Violated p w o c :=
  ⟨hNorm, hAct⟩


theorem permission2339b_intro {p : Person} {d : JudicialDistrict} {o : Offense}
    {c : ComplaintText} (hAddr : IsProsecutingAuthority p c)
    (hCond : VenuePermittedDistrict2339b d o c) : Permission2339b p d o c :=
  ⟨hAddr, hCond⟩




theorem materialSupportRoute2339A_general_intro {m : MaterialSupport} {c : ComplaintText}
    (h : IsMaterialSupportOrResources2339A m c) : MaterialSupportRoute2339A m c :=
  .general h


theorem materialSupportRoute2339A_training_intro {m : MaterialSupport} {c : ComplaintText}
    (h : IsTraining2339A m c) : MaterialSupportRoute2339A m c :=
  .training h


theorem materialSupportRoute2339A_expertAdvice_intro {m : MaterialSupport} {c : ComplaintText}
    (h : IsExpertAdviceOrAssistance2339A m c) : MaterialSupportRoute2339A m c :=
  .expertAdvice h


theorem prohibition2339A_intro {p : Person} {m : MaterialSupport} {o : Offense}
    {c : ComplaintText} (hAddr : AddresseeInClass2339A p c)
    (hObj : MaterialSupportRoute2339A m c) (hEnum : IsEnumeratedOffense2339A o c)
    (hCond : ConditionMet2339A p m o c) : Prohibition2339A p m o c :=
  ⟨hAddr, hObj, hEnum, hCond⟩


theorem prohibition2339AViolated_intro {p : Person} {m : MaterialSupport} {o : Offense}
    {c : ComplaintText} (hNorm : Prohibition2339A p m o c)
    (hAct : RegulatedActOccurred2339A p m c) : Prohibition2339AViolated p m o c :=
  ⟨hNorm, hAct⟩




theorem jurisdictionalNexusCh113B_national_intro {p : Person} {o : Offense}
    {c : ComplaintText} (h : IsNationalOrLawfulPermanentResident p c) :
    JurisdictionalNexusCh113B p o c :=
  Or.inl h


theorem jurisdictionalNexusCh113B_stateless_intro {p : Person} {o : Offense}
    {c : ComplaintText} (h : IsStatelessPersonHabituallyResidentInUS p c) :
    JurisdictionalNexusCh113B p o c :=
  Or.inr (Or.inl h)


theorem jurisdictionalNexusCh113B_foundIn_intro {p : Person} {o : Offense}
    {c : ComplaintText} (h : BroughtIntoOrFoundInTheUnitedStates p c) :
    JurisdictionalNexusCh113B p o c :=
  Or.inr (Or.inr (Or.inl h))


theorem jurisdictionalNexusCh113B_territorial_intro {p : Person} {o : Offense}
    {c : ComplaintText} (h : OffenseOccursInWholeOrPartInTheUnitedStates o c) :
    JurisdictionalNexusCh113B p o c :=
  Or.inr (Or.inr (Or.inr (Or.inl h)))


theorem jurisdictionalNexusCh113B_commerce_intro {p : Person} {o : Offense}
    {c : ComplaintText} (h : OffenseAffectsInterstateOrForeignCommerce o c) :
    JurisdictionalNexusCh113B p o c :=
  Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))


theorem jurisdictionalNexusCh113B_derivative_intro {p : Person} {o : Offense}
    {c : ComplaintText} (h : AidsAbetsOrConspiresWithJurisdictionalOffender p o c) :
    JurisdictionalNexusCh113B p o c :=
  Or.inr (Or.inr (Or.inr (Or.inr (Or.inr h))))


theorem jurisdictionExists2339B_intro {p : Person} {o : Offense} {c : ComplaintText}
    (h : JurisdictionalNexusCh113B p o c) : JurisdictionExists2339B p o c := h


theorem jurisdictionExists2339D_intro {p : Person} {o : Offense} {c : ComplaintText}
    (h : JurisdictionalNexusCh113B p o c) : JurisdictionExists2339D p o c := h




theorem personnelProsecutionBar2339Bh_intro {p : Person} {g : Organization}
    {c : ComplaintText} (hTheory : ProsecutionRestsOnPersonnelTheory2339Bh p c)
    (hIndep : ¬ ProvidedPersonnelUnderOrganizationDirectionOrControl2339Bh p g c) :
    PersonnelProsecutionBar2339Bh p g c :=
  ⟨hTheory, hIndep⟩


theorem approvedProvisionProsecutionBar2339Bj_intro {p : Person} {m : MaterialSupport}
    {c : ComplaintText}
    (hTheory : ProsecutionRestsOnPersonnelTrainingOrExpertAdviceTheory2339Bj p c)
    (hApproved : SecretaryOfStateApprovedWithAttorneyGeneralConcurrence2339Bj p m c) :
    ApprovedProvisionProsecutionBar2339Bj p m c :=
  ⟨hTheory, hApproved⟩


theorem prosecutionBarred2339B_personnel_intro {p : Person} {m : MaterialSupport}
    {g : Organization} {c : ComplaintText} (h : PersonnelProsecutionBar2339Bh p g c) :
    ProsecutionBarred2339B p m g c :=
  Or.inl h


theorem prosecutionBarred2339B_approved_intro {p : Person} {m : MaterialSupport}
    {g : Organization} {c : ComplaintText} (h : ApprovedProvisionProsecutionBar2339Bj p m c) :
    ProsecutionBarred2339B p m g c :=
  Or.inr h




theorem prohibition2339Ba1_intro {p : Person} {m : MaterialSupport} {g : Organization}
    {o : Offense} {c : ComplaintText} (hAddr : AddresseeInClass2339Ba1 p c)
    (hOrg : IsForeignTerroristOrganization2339B g c) (hObj : MaterialSupportRoute2339A m c)
    (hSci : ConditionMet2339Ba1 p g c) (hJur : JurisdictionExists2339B p o c) :
    Prohibition2339Ba1 p m g o c :=
  ⟨hAddr, hOrg, hObj, hSci, hJur⟩


theorem prohibition2339Ba1Violated_intro {p : Person} {m : MaterialSupport}
    {g : Organization} {o : Offense} {c : ComplaintText}
    (hNorm : Prohibition2339Ba1 p m g o c) (hAct : RegulatedActOccurred2339Ba1 p m g c)
    (hNoBar : ¬ ProsecutionBarred2339B p m g c) : Prohibition2339Ba1Violated p m g o c :=
  ⟨hNorm, hAct, hNoBar⟩




theorem obligation2339Ba2_intro {f : FinancialInstitution} {u : Funds} {g : Organization}
    {c : ComplaintText} (hAddr : AddresseeInClass2339Ba2 f c)
    (hOrg : IsForeignTerroristOrganization2339B g c) (hFunds : IsFunds2339B u c)
    (hCond : ConditionMet2339Ba2 f u g c) : Obligation2339Ba2 f u g c :=
  ⟨hAddr, hOrg, hFunds, hCond⟩


theorem obligation2339Ba2Performed_intro {f : FinancialInstitution} {u : Funds}
    {c : ComplaintText} (hRetain : RetainedPossessionOrControl2339Ba2A f u c)
    (hReport : ReportedToSecretary2339Ba2B f u c) : Obligation2339Ba2Performed f u c :=
  ⟨hRetain, hReport⟩


theorem obligation2339Ba2Breached_intro {f : FinancialInstitution} {u : Funds}
    {g : Organization} {c : ComplaintText} (hNorm : Obligation2339Ba2 f u g c)
    (hNoAuth : ¬ SecretaryAuthorizationApplies2339Ba2 f u c)
    (hNoPerf : ¬ Obligation2339Ba2Performed f u c) : Obligation2339Ba2Breached f u g c :=
  ⟨hNorm, hNoAuth, hNoPerf⟩


theorem civilPenaltyLiability2339Bb_intro {f : FinancialInstitution} {u : Funds}
    {g : Organization} {c : ComplaintText} (hBreach : Obligation2339Ba2Breached f u g c)
    (hKnowing : KnowinglyFailedToComply2339Bb f u c) :
    CivilPenaltyLiability2339Bb f u g c :=
  ⟨hBreach, hKnowing⟩


theorem civilPenaltyFloor2339Bb_ge_fifty_thousand (f : FinancialInstitution) (u : Funds)
    (c : ComplaintText) : 50000 ≤ civilPenaltyFloor2339Bb f u c :=
  Nat.le_max_left _ _


theorem civilPenaltyFloor2339Bb_ge_double (f : FinancialInstitution) (u : Funds)
    (c : ComplaintText) :
    2 * amountRequiredToBeRetained2339Bb f u c ≤ civilPenaltyFloor2339Bb f u c :=
  Nat.le_max_right _ _




theorem power2339Bc_attorneyGeneral_intro {a s d : Person} {c : ComplaintText}
    (hHolder : IsAttorneyGeneral a c) (hObs : IsAttorneyGeneral s c)
    (hCond : AppearsEngagedOrAboutToEngageInViolation2339Bc s d c) : Power2339Bc a s d c :=
  ⟨hHolder, Or.inl hObs, hCond⟩


theorem power2339Bc_secretary_intro {a s d : Person} {c : ComplaintText}
    (hHolder : IsAttorneyGeneral a c) (hObs : IsSecretaryOfTheTreasury2339B s c)
    (hCond : AppearsEngagedOrAboutToEngageInViolation2339Bc s d c) : Power2339Bc a s d c :=
  ⟨hHolder, Or.inr hObs, hCond⟩


theorem power2339BcExercised_intro {a s d : Person} {c : ComplaintText}
    (hPower : Power2339Bc a s d c) (hAct : CivilInjunctionActionInitiated2339Bc a d c) :
    Power2339BcExercised a s d c :=
  ⟨hPower, hAct⟩




theorem obligation2339Be1_intro {a : Person} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral a c) (hCond : PossibleViolationUnderInvestigation2339Be1 c) :
    Obligation2339Be1 a c :=
  ⟨hAddr, hCond⟩


theorem obligation2339Be1Breached_intro {a : Person} {c : ComplaintText}
    (hNorm : Obligation2339Be1 a c) (hNoAct : ¬ InvestigationConducted2339Be1 a c) :
    Obligation2339Be1Breached a c :=
  ⟨hNorm, hNoAct⟩


theorem obligation2339Be2_intro {a : Person} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral a c)
    (hCond : InvestigationRelatesToFinancialInstitutionComplianceOrPenalty2339Be2 c) :
    Obligation2339Be2 a c :=
  ⟨hAddr, hCond⟩


theorem obligation2339Be2Breached_intro {a : Person} {c : ComplaintText}
    (hNorm : Obligation2339Be2 a c) (hNoAct : ¬ CoordinatedWithSecretary2339Be2 a c) :
    Obligation2339Be2Breached a c :=
  ⟨hNorm, hNoAct⟩


theorem obligation2339Be3Referral_intro {c : ComplaintText}
    (hCond : CriminalViolationEvidenceArose2339Be3 c) : Obligation2339Be3Referral c :=
  ⟨hCond⟩


theorem obligation2339Be3ReferralBreached_intro {c : ComplaintText}
    (hNorm : Obligation2339Be3Referral c)
    (hNoAct : ¬ EvidenceReferredImmediatelyToAttorneyGeneral2339Be3 c) :
    Obligation2339Be3ReferralBreached c :=
  ⟨hNorm, hNoAct⟩


theorem obligation2339Be3Notify_intro {a : Person} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral a c) (hCond : CriminalViolationEvidenceArose2339Be3 c) :
    Obligation2339Be3Notify a c :=
  ⟨hAddr, hCond⟩


theorem obligation2339Be3NotifyBreached_intro {a : Person} {c : ComplaintText}
    (hNorm : Obligation2339Be3Notify a c)
    (hNoAct : ¬ SecretaryTimelyNotifiedOfActionOnReferral2339Be3 a c) :
    Obligation2339Be3NotifyBreached a c :=
  ⟨hNorm, hNoAct⟩


theorem permission2339Be3RemedialExercised_intro {a : Person} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral a c) (hAct : ReferredToSecretaryForRemedialAction2339Be3 a c) :
    Permission2339Be3RemedialExercised a c :=
  ⟨hAddr, hAct⟩




theorem power2339Bf1A_intro {r : CivilProceeding} {q : ClassifiedInfoRequest}
    {c : ComplaintText} (hProc : IsCivilProceedingUnderSection2339B r c)
    (hReq : ExParteWrittenRequestByUnitedStates2339Bf1 r q c)
    (hShow : SufficientShowingMade2339Bf1 r q c) : Power2339Bf1A r q c :=
  ⟨hProc, hReq, hShow⟩


theorem power2339Bf1AExercised_intro {r : CivilProceeding} {q : ClassifiedInfoRequest}
    {c : ComplaintText} (hPower : Power2339Bf1A r q c)
    (hAct : CourtAuthorizedRedactionOrSubstitution2339Bf1 r q c) :
    Power2339Bf1AExercised r q c :=
  ⟨hPower, hAct⟩


theorem obligation2339Bf1B_intro {r : CivilProceeding} {q : ClassifiedInfoRequest}
    {c : ComplaintText} (hProc : IsCivilProceedingUnderSection2339B r c)
    (hCond : RequestGranted2339Bf1 r q c) : Obligation2339Bf1B r q c :=
  ⟨hProc, hCond⟩


theorem obligation2339Bf1BBreached_intro {r : CivilProceeding} {q : ClassifiedInfoRequest}
    {c : ComplaintText} (hNorm : Obligation2339Bf1B r q c)
    (hNoAct : ¬ DocumentsSealedAndPreserved2339Bf1B r q c) :
    Obligation2339Bf1BBreached r q c :=
  ⟨hNorm, hNoAct⟩


theorem obligation2339Bf2B_intro {r : CivilProceeding} {q : ClassifiedInfoRequest}
    {c : ComplaintText} (hProc : IsCivilProceedingUnderSection2339B r c)
    (hCond : SubstituteSufficientToPrepareDefense2339Bf2 r q c) : Obligation2339Bf2B r q c :=
  ⟨hProc, hCond⟩


theorem obligation2339Bf2BBreached_intro {r : CivilProceeding} {q : ClassifiedInfoRequest}
    {c : ComplaintText} (hNorm : Obligation2339Bf2B r q c)
    (hNoAct : ¬ CourtGrantedSubstitutionRequest2339Bf2 r q c) :
    Obligation2339Bf2BBreached r q c :=
  ⟨hNorm, hNoAct⟩


theorem obligation2339Bf3C_intro {r : CivilProceeding} {c : ComplaintText}
    (hProc : IsCivilProceedingUnderSection2339B r c)
    (hCond : DefendantSeeksToIntroduceClassifiedInformation2339Bf3 r c) :
    Obligation2339Bf3C r c :=
  ⟨hProc, hCond⟩


theorem obligation2339Bf3CBreached_intro {r : CivilProceeding} {c : ComplaintText}
    (hNorm : Obligation2339Bf3C r c)
    (hNoAct : ¬ DefendantEstablishedRelevanceAndMateriality2339Bf3 r c) :
    Obligation2339Bf3CBreached r c :=
  ⟨hNorm, hNoAct⟩


theorem obligation2339Bf5Bii_intro {r : CivilProceeding} {c : ComplaintText}
    (hProc : IsCivilProceedingUnderSection2339B r c)
    (hCond : PretrialOrderAppealed2339Bf5 r c) : Obligation2339Bf5Bii r c :=
  ⟨hProc, hCond⟩


theorem obligation2339Bf5BiiBreached_untimely_intro {r : CivilProceeding}
    {c : ComplaintText} (hNorm : Obligation2339Bf5Bii r c)
    (hLate : ¬ NoticeOfAppealTimely2339Bf5 r c) : Obligation2339Bf5BiiBreached r c :=
  ⟨hNorm, Or.inl hLate⟩


theorem obligation2339Bf5BiiBreached_commenced_intro {r : CivilProceeding}
    {c : ComplaintText} (hNorm : Obligation2339Bf5Bii r c)
    (hCommenced : TrialCommencedBeforeAppealResolved2339Bf5 r c) :
    Obligation2339Bf5BiiBreached r c :=
  ⟨hNorm, Or.inr hCommenced⟩


theorem obligation2339Bf5Biii_intro {r : CivilProceeding} {c : ComplaintText}
    (hProc : IsCivilProceedingUnderSection2339B r c)
    (hCond : AppealTakenDuringTrial2339Bf5 r c) : Obligation2339Bf5Biii r c :=
  ⟨hProc, hCond⟩


theorem obligation2339Bf5BiiiPerformed_intro {r : CivilProceeding} {c : ComplaintText}
    (hAdjourn : TrialAdjournedUntilAppealResolved2339Bf5 r c)
    (hExpedite : AppealExpeditedByCourtOfAppeals2339Bf5 r c)
    (hArg : ArgumentHeardWithinFourDays2339Bf5 r c)
    (hDec : DecisionRenderedWithinFourDays2339Bf5 r c) :
    Obligation2339Bf5BiiiPerformed r c :=
  ⟨hAdjourn, hExpedite, hArg, hDec⟩


theorem obligation2339Bf5BiiiBreached_intro {r : CivilProceeding} {c : ComplaintText}
    (hNorm : Obligation2339Bf5Biii r c) (hNoPerf : ¬ Obligation2339Bf5BiiiPerformed r c) :
    Obligation2339Bf5BiiiBreached r c :=
  ⟨hNorm, hNoPerf⟩




theorem prohibition2339Bi_intro {p : Person} {c : ComplaintText}
    (hAddr : IsAuthorityConstruingOrApplyingSection2339Bi p c) : Prohibition2339Bi p c :=
  ⟨hAddr⟩


theorem prohibition2339BiViolated_intro {p : Person} {c : ComplaintText}
    (hNorm : Prohibition2339Bi p c)
    (hAct : ConstructionAbridgesFirstAmendmentRights2339Bi p c) :
    Prohibition2339BiViolated p c :=
  ⟨hNorm, hAct⟩


theorem prohibition2339Bj2_intro {p : Person} {m : MaterialSupport} {c : ComplaintText}
    (hAddr : IsSecretaryOfState2339Bj p c)
    (hCond : MaterialSupportMayBeUsedToCarryOutTerroristActivity2339Bj m c) :
    Prohibition2339Bj2 p m c :=
  ⟨hAddr, hCond⟩


theorem prohibition2339Bj2Violated_intro {p : Person} {m : MaterialSupport}
    {c : ComplaintText} (hNorm : Prohibition2339Bj2 p m c)
    (hAct : ApprovalOfProvisionGranted2339Bj p m c) : Prohibition2339Bj2Violated p m c :=
  ⟨hNorm, hAct⟩




theorem predicateAct2339C_treaty_intro {o : Offense} {c : ComplaintText}
    (h : IsTreatyOffense2339Ca1A o c) : PredicateAct2339C o c :=
  .treatyOffense h


theorem predicateAct2339C_intimidation_intro {o : Offense} {c : ComplaintText}
    (h : IsIntimidationOrCompulsionAct2339Ca1B o c) : PredicateAct2339C o c :=
  .intimidationOrCompulsion h


theorem jurisdictionExists2339C_domestic_intro {p : Person} {o : Offense}
    {c : ComplaintText} (hLocus : OffenseTakesPlaceInTheUnitedStates2339Cb o c)
    (hNexus : ForeignNexusCircumstance2339Cb1 p o c) : JurisdictionExists2339C p o c :=
  Or.inl ⟨hLocus, hNexus⟩


theorem jurisdictionExists2339C_foreign_intro {p : Person} {o : Offense}
    {c : ComplaintText} (hLocus : ¬ OffenseTakesPlaceInTheUnitedStates2339Cb o c)
    (hNexus : ExtraterritorialNexusCircumstance2339Cb2 p o c) :
    JurisdictionExists2339C p o c :=
  Or.inr (Or.inl ⟨hLocus, hNexus⟩)


theorem jurisdictionExists2339C_vessel_intro {p : Person} {o : Offense} {c : ComplaintText}
    (h : CommittedOnUnitedStatesVesselOrAircraft2339Cb o c) :
    JurisdictionExists2339C p o c :=
  Or.inr (Or.inr (Or.inl h))


theorem jurisdictionExists2339C_compel_intro {p : Person} {o : Offense} {c : ComplaintText}
    (h : DirectedAtCompellingTheUnitedStates2339Cb5 o c) : JurisdictionExists2339C p o c :=
  Or.inr (Or.inr (Or.inr h))


theorem prohibition2339Ca1_intro {p : Person} {u : Funds} {o : Offense} {c : ComplaintText}
    (hAddr : AddresseeInClass2339Ca1 p c) (hPred : PredicateAct2339C o c)
    (hCond : ConditionMet2339Ca1 p u o c) (hJur : JurisdictionExists2339C p o c) :
    Prohibition2339Ca1 p u o c :=
  ⟨hAddr, hPred, hCond, hJur⟩


theorem prohibition2339Ca1Violated_intro {p : Person} {u : Funds} {o : Offense}
    {c : ComplaintText} (hNorm : Prohibition2339Ca1 p u o c)
    (hAct : RegulatedActOccurred2339Ca1 p u c) : Prohibition2339Ca1Violated p u o c :=
  ⟨hNorm, hAct⟩


theorem addresseeInClass2339Cc_inUS_intro {p : Person} {c : ComplaintText}
    (h : IsInTheUnitedStates p c) : AddresseeInClass2339Cc p c :=
  Or.inl h


theorem addresseeInClass2339Cc_abroad_intro {p : Person} {c : ComplaintText}
    (hOut : ¬ IsInTheUnitedStates p c)
    (hStatus : IsUnitedStatesNationalOrDomesticLegalEntity p c) :
    AddresseeInClass2339Cc p c :=
  Or.inr ⟨hOut, hStatus⟩


theorem prohibition2339Cc_intro {p : Person} {m : MaterialSupport} {c : ComplaintText}
    (hAddr : AddresseeInClass2339Cc p c) (hCond : ConditionMet2339Cc p m c) :
    Prohibition2339Cc p m c :=
  ⟨hAddr, hCond⟩


theorem prohibition2339CcViolated_intro {p : Person} {m : MaterialSupport}
    {c : ComplaintText} (hNorm : Prohibition2339Cc p m c)
    (hAct : RegulatedActOccurred2339Cc p m c) : Prohibition2339CcViolated p m c :=
  ⟨hNorm, hAct⟩


theorem obligation2339Cf_intro {l : LegalEntity} {p : Person} {c : ComplaintText}
    (hAddr : IsDomesticLegalEntity2339Cf l c)
    (hCond : ManagerCommittedSubsectionAOffense2339Cf l p c) : Obligation2339Cf l p c :=
  ⟨hAddr, hCond⟩


theorem obligation2339CfBreached_intro {l : LegalEntity} {p : Person} {c : ComplaintText}
    (hNorm : Obligation2339Cf l p c) (hUnpaid : ¬ Obligation2339CfDischarged l c) :
    Obligation2339CfBreached l p c :=
  ⟨hNorm, hUnpaid⟩




theorem prohibition2339D_intro {p : Person} {t : MilitaryTraining} {g : Organization}
    {o : Offense} {c : ComplaintText} (hAddr : AddresseeInClass2339D p c)
    (hTrain : IsMilitaryTypeTraining2339D t c)
    (hDesig : OrganizationDesignatedAtTimeOfTraining2339D g t c)
    (hSci : ConditionMet2339D p g c) (hJur : JurisdictionExists2339D p o c) :
    Prohibition2339D p t g o c :=
  ⟨hAddr, hTrain, hDesig, hSci, hJur⟩


theorem prohibition2339DViolated_intro {p : Person} {t : MilitaryTraining}
    {g : Organization} {o : Offense} {c : ComplaintText}
    (hNorm : Prohibition2339D p t g o c) (hAct : RegulatedActOccurred2339D p t g c) :
    Prohibition2339DViolated p t g o c :=
  ⟨hNorm, hAct⟩




theorem ch113BProhibitionViolated_harboring_intro {p w : Person} {o : Offense}
    {c : ComplaintText} (h : Prohibition2339Violated p w o c) :
    Ch113BProhibitionViolated c :=
  .harboring p w o h


theorem ch113BProhibitionViolated_supportToTerrorists_intro {p : Person}
    {m : MaterialSupport} {o : Offense} {c : ComplaintText}
    (h : Prohibition2339AViolated p m o c) : Ch113BProhibitionViolated c :=
  .supportToTerrorists p m o h


theorem ch113BProhibitionViolated_supportToOrganization_intro {p : Person}
    {m : MaterialSupport} {g : Organization} {o : Offense} {c : ComplaintText}
    (h : Prohibition2339Ba1Violated p m g o c) : Ch113BProhibitionViolated c :=
  .supportToOrganization p m g o h


theorem ch113BProhibitionViolated_financing_intro {p : Person} {u : Funds} {o : Offense}
    {c : ComplaintText} (h : Prohibition2339Ca1Violated p u o c) :
    Ch113BProhibitionViolated c :=
  .financing p u o h


theorem ch113BProhibitionViolated_concealment_intro {p : Person} {m : MaterialSupport}
    {c : ComplaintText} (h : Prohibition2339CcViolated p m c) :
    Ch113BProhibitionViolated c :=
  .concealment p m h


theorem ch113BProhibitionViolated_militaryTraining_intro {p : Person}
    {t : MilitaryTraining} {g : Organization} {o : Offense} {c : ComplaintText}
    (h : Prohibition2339DViolated p t g o c) : Ch113BProhibitionViolated c :=
  .militaryTraining p t g o h


theorem ch113BObligationBreached_retainAndReport_intro {f : FinancialInstitution}
    {u : Funds} {g : Organization} {c : ComplaintText}
    (h : Obligation2339Ba2Breached f u g c) : Ch113BObligationBreached c :=
  .retainAndReport f u g h


theorem ch113BObligationBreached_investigate_intro {a : Person} {c : ComplaintText}
    (h : Obligation2339Be1Breached a c) : Ch113BObligationBreached c :=
  .investigate a h


theorem ch113BObligationBreached_coordinate_intro {a : Person} {c : ComplaintText}
    (h : Obligation2339Be2Breached a c) : Ch113BObligationBreached c :=
  .coordinate a h


theorem ch113BObligationBreached_refer_intro {c : ComplaintText}
    (h : Obligation2339Be3ReferralBreached c) : Ch113BObligationBreached c :=
  .refer h


theorem ch113BObligationBreached_notify_intro {a : Person} {c : ComplaintText}
    (h : Obligation2339Be3NotifyBreached a c) : Ch113BObligationBreached c :=
  .notify a h


theorem ch113BObligationBreached_seal_intro {r : CivilProceeding}
    {q : ClassifiedInfoRequest} {c : ComplaintText} (h : Obligation2339Bf1BBreached r q c) :
    Ch113BObligationBreached c :=
  .seal r q h


theorem ch113BObligationBreached_grantSubstitution_intro {r : CivilProceeding}
    {q : ClassifiedInfoRequest} {c : ComplaintText} (h : Obligation2339Bf2BBreached r q c) :
    Ch113BObligationBreached c :=
  .grantSubstitution r q h


theorem ch113BObligationBreached_pretrialAppeal_intro {r : CivilProceeding}
    {c : ComplaintText} (h : Obligation2339Bf5BiiBreached r c) :
    Ch113BObligationBreached c :=
  .pretrialAppeal r h


theorem ch113BObligationBreached_midtrialAppeal_intro {r : CivilProceeding}
    {c : ComplaintText} (h : Obligation2339Bf5BiiiBreached r c) :
    Ch113BObligationBreached c :=
  .midtrialAppeal r h


theorem ch113BObligationBreached_entityLiability_intro {l : LegalEntity} {p : Person}
    {c : ComplaintText} (h : Obligation2339CfBreached l p c) :
    Ch113BObligationBreached c :=
  .entityLiability l p h

end Proving.USC.T18.Ch113B.MaterialSupport.Deontic
