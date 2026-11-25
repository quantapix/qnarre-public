





import Proving.USC.T18.Ch42Ch95.Deontic.Statute

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText)

namespace Proving.USC.T18.Ch42Ch95.Deontic




theorem prohibition892a_intro
    {p : Person} {x : CreditExtension} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson892a p c)
    (hCond : ConditionExtensionIsExtortionate892a x c) :
    Prohibition892a p x c :=
  ⟨hAddr, hCond⟩


theorem prohibitionViolated892a_intro
    {p : Person} {x : CreditExtension} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson892a p c)
    (hCond : ConditionExtensionIsExtortionate892a x c)
    (hAct : RegulatedActMakesExtortionateExtension892a p x c) :
    ProhibitionViolated892a p x c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem primaFacieFactors892b_intro
    {x : CreditExtension} {c : ComplaintText}
    (h1 : Factor892b1RepaymentUnenforceable x c)
    (h2 : Factor892b2RateExceedsFortyFivePercent x c)
    (h3 : Factor892b3DebtorBelievedExtortionateCollection x c)
    (h4 : Factor892b4OutstandingExceedsOneHundredDollars x c) :
    PrimaFacieFactors892b x c :=
  ⟨h1, h2, h3, h4⟩


theorem permission892c_intro
    {ct : Court} {x : CreditExtension} {c : ComplaintText}
    (hAddr : AddresseeTrialCourt ct c)
    (hEvid : ConditionEvidenceOf892bCircumstancesIntroduced x c)
    (hUnav : ConditionDirectEvidenceOfDebtorBeliefUnavailable x c) :
    Permission892c ct x c :=
  ⟨hAddr, hEvid, hUnav⟩


theorem permissionExercisedWithinScope892c_intro
    {ct : Court} {x : CreditExtension} {c : ComplaintText}
    (hAddr : AddresseeTrialCourt ct c)
    (hEvid : ConditionEvidenceOf892bCircumstancesIntroduced x c)
    (hUnav : ConditionDirectEvidenceOfDebtorBeliefUnavailable x c)
    (hAct : RegulatedActAllowsCreditorReputationEvidence892c ct x c) :
    PermissionExercisedWithinScope892c ct x c :=
  ⟨⟨hAddr, hEvid, hUnav⟩, hAct⟩




theorem prohibition894a_intro
    {p : Person} {x : CreditExtension} {c : ComplaintText}
    (hAddr : AddresseeKnowingParticipant894a p c)
    (hCond : ConditionExtortionateMeansUsed894a p x c) :
    Prohibition894a p x c :=
  ⟨hAddr, hCond⟩


theorem prohibitedPurpose894a_collect_intro
    {p v : Person} {x : CreditExtension} {c : ComplaintText}
    (h : RegulatedActCollectsExtension894a1 p x c) :
    ProhibitedPurpose894a p v x c :=
  ProhibitedPurpose894a.collect h


theorem prohibitedPurpose894a_punish_intro
    {p v : Person} {x : CreditExtension} {c : ComplaintText}
    (h : RegulatedActPunishesNonrepayment894a2 p v x c) :
    ProhibitedPurpose894a p v x c :=
  ProhibitedPurpose894a.punish h


theorem prohibitionViolated894a_intro
    {p v : Person} {x : CreditExtension} {c : ComplaintText}
    (hAddr : AddresseeKnowingParticipant894a p c)
    (hCond : ConditionExtortionateMeansUsed894a p x c)
    (hPurpose : ProhibitedPurpose894a p v x c) :
    ProhibitionViolated894a p v x c :=
  ⟨⟨hAddr, hCond⟩, hPurpose⟩


theorem permission894b_intro
    {p v : Person} {c : ComplaintText}
    (h : ConditionPriorExtortionateCollectionsKnownToTarget894b p v c) :
    Permission894b p v c :=
  ⟨h⟩


theorem permissionExercisedWithinScope894b_intro
    {p v : Person} {c : ComplaintText}
    (hCond : ConditionPriorExtortionateCollectionsKnownToTarget894b p v c)
    (hAct : RegulatedActIntroducesImplicitThreatEvidence894b p v c) :
    PermissionExercisedWithinScope894b p v c :=
  ⟨⟨hCond⟩, hAct⟩


theorem permission894c_intro
    {ct : Court} {x : CreditExtension} {c : ComplaintText}
    (hAddr : AddresseeTrialCourt ct c)
    (hEvid : ConditionEvidenceOf892bCircumstancesIntroduced x c)
    (hUnav : ConditionDirectEvidenceOfDebtorBeliefUnavailable x c) :
    Permission894c ct x c :=
  ⟨hAddr, hEvid, hUnav⟩


theorem permissionExercisedWithinScope894c_intro
    {ct : Court} {p v : Person} {x : CreditExtension} {c : ComplaintText}
    (hAddr : AddresseeTrialCourt ct c)
    (hEvid : ConditionEvidenceOf892bCircumstancesIntroduced x c)
    (hUnav : ConditionDirectEvidenceOfDebtorBeliefUnavailable x c)
    (hAct : RegulatedActAllowsDefendantReputationEvidence894c ct p v c) :
    PermissionExercisedWithinScope894c ct p v x c :=
  ⟨⟨hAddr, hEvid, hUnav⟩, hAct⟩




theorem prohibition1952a_intro
    {p : Person} {u : UnlawfulActivity} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1952a p c)
    (hUnlawful : ConditionActivityIsUnlawfulActivity1952b u c) :
    Prohibition1952a p u c :=
  ⟨hAddr, hUnlawful⟩


theorem proscribedIntent1952a_distributeProceeds_intro
    {p : Person} {u : UnlawfulActivity} {c : ComplaintText}
    (h : ConditionIntentToDistributeProceeds1952a1 p u c) :
    ProscribedIntent1952a p u c :=
  ProscribedIntent1952a.distributeProceeds h


theorem proscribedIntent1952a_crimeOfViolence_intro
    {p : Person} {u : UnlawfulActivity} {c : ComplaintText}
    (h : ConditionIntentToCommitCrimeOfViolence1952a2 p u c) :
    ProscribedIntent1952a p u c :=
  ProscribedIntent1952a.crimeOfViolence h


theorem proscribedIntent1952a_promoteOrFacilitate_intro
    {p : Person} {u : UnlawfulActivity} {c : ComplaintText}
    (h : ConditionIntentToPromoteOrFacilitate1952a3 p u c) :
    ProscribedIntent1952a p u c :=
  ProscribedIntent1952a.promoteOrFacilitate h



theorem prohibitionViolated1952a_intro
    {p : Person} {u : UnlawfulActivity} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1952a p c)
    (hUnlawful : ConditionActivityIsUnlawfulActivity1952b u c)
    (hTravel : RegulatedActTravelsOrUsesInterstateFacility1952a p c)
    (hIntent : ProscribedIntent1952a p u c)
    (hAfter : RegulatedActThereafterPerformsOrAttempts1952a p u c)
    (hNoExemption : ¬ EscapeSavingsPromotionRaffle1952e p u c) :
    ProhibitionViolated1952a p u c :=
  ⟨⟨hAddr, hUnlawful⟩, hTravel, hIntent, hAfter, hNoExemption⟩


theorem obligation1952c_intro
    {a : Authority} {i : Investigation} {c : ComplaintText}
    (hAddr : AddresseeInvestigatingAuthority1952c a c)
    (hCond : ConditionInvestigationInvolvesLiquor1952c i c) :
    Obligation1952c a i c :=
  ⟨hAddr, hCond⟩


theorem obligationBreached1952c_intro
    {a : Authority} {i : Investigation} {c : ComplaintText}
    (hAddr : AddresseeInvestigatingAuthority1952c a c)
    (hCond : ConditionInvestigationInvolvesLiquor1952c i c)
    (hOmission : ¬ RegulatedActConductedUnderAttorneyGeneralSupervision1952c a i c) :
    ObligationBreached1952c a i c :=
  ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem obligation1952d_intro
    {ct : Court} {o : Offense} {c : ComplaintText}
    (hAddr : AddresseeSentencingCourt1952d ct c)
    (hCond : ConditionOffenseInvolvesPreRetailMedicalProduct1952d o c)
    (hNoEscape : ¬ EscapeSubsectionAPunishmentGreater1952d o c) :
    Obligation1952d ct o c :=
  ⟨hAddr, hCond, hNoEscape⟩


theorem obligationBreached1952d_intro
    {ct : Court} {o : Offense} {c : ComplaintText}
    (hAddr : AddresseeSentencingCourt1952d ct c)
    (hCond : ConditionOffenseInvolvesPreRetailMedicalProduct1952d o c)
    (hNoEscape : ¬ EscapeSubsectionAPunishmentGreater1952d o c)
    (hOmission : ¬ RegulatedActPunishmentSetToSection670Level1952d ct o c) :
    ObligationBreached1952d ct o c :=
  ⟨⟨hAddr, hCond, hNoEscape⟩, hOmission⟩




theorem prohibition1956a1_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1956 p c)
    (hKnow : ConditionKnowsPropertyIsProceeds1956a1 p t c)
    (hSua : ConditionInvolvesProceedsOfSpecifiedUnlawfulActivity1956a1 t c) :
    Prohibition1956a1 p t c :=
  ⟨hAddr, hKnow, hSua⟩


theorem proscribedPurpose1956a1_promote_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionIntentToPromoteSua1956a1Ai p t c) :
    ProscribedPurpose1956a1 p t c :=
  ProscribedPurpose1956a1.promote h


theorem proscribedPurpose1956a1_taxViolation_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionIntentToViolateInternalRevenueCode1956a1Aii p t c) :
    ProscribedPurpose1956a1 p t c :=
  ProscribedPurpose1956a1.taxViolation h


theorem proscribedPurpose1956a1_conceal_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionKnowsTransactionDesignedToConceal1956a1Bi p t c) :
    ProscribedPurpose1956a1 p t c :=
  ProscribedPurpose1956a1.conceal h


theorem proscribedPurpose1956a1_avoidReporting_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionKnowsTransactionDesignedToAvoidReporting1956a1Bii p t c) :
    ProscribedPurpose1956a1 p t c :=
  ProscribedPurpose1956a1.avoidReporting h


theorem prohibitionViolated1956a1_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1956 p c)
    (hKnow : ConditionKnowsPropertyIsProceeds1956a1 p t c)
    (hSua : ConditionInvolvesProceedsOfSpecifiedUnlawfulActivity1956a1 t c)
    (hAct : RegulatedActConductsFinancialTransaction1956a1 p t c)
    (hPurpose : ProscribedPurpose1956a1 p t c) :
    ProhibitionViolated1956a1 p t c :=
  ⟨⟨hAddr, hKnow, hSua⟩, hAct, hPurpose⟩


theorem prohibition1956a2_intro
    {p : Person} {m : MonetaryProperty} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1956 p c)
    (hBorder : ConditionCrossesUnitedStatesBorder1956a2 m c) :
    Prohibition1956a2 p m c :=
  ⟨hAddr, hBorder⟩


theorem proscribedPurpose1956a2_promote_intro
    {p : Person} {m : MonetaryProperty} {c : ComplaintText}
    (h : ConditionIntentToPromoteSua1956a2A p m c) :
    ProscribedPurpose1956a2 p m c :=
  ProscribedPurpose1956a2.promote h


theorem proscribedPurpose1956a2_conceal_intro
    {p : Person} {m : MonetaryProperty} {c : ComplaintText}
    (h : ConditionKnowsProceedsAndDesignedToConceal1956a2Bi p m c) :
    ProscribedPurpose1956a2 p m c :=
  ProscribedPurpose1956a2.conceal h


theorem proscribedPurpose1956a2_avoidReporting_intro
    {p : Person} {m : MonetaryProperty} {c : ComplaintText}
    (h : ConditionKnowsProceedsAndDesignedToAvoidReporting1956a2Bii p m c) :
    ProscribedPurpose1956a2 p m c :=
  ProscribedPurpose1956a2.avoidReporting h


theorem prohibitionViolated1956a2_intro
    {p : Person} {m : MonetaryProperty} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1956 p c)
    (hBorder : ConditionCrossesUnitedStatesBorder1956a2 m c)
    (hAct : RegulatedActTransportsTransmitsOrTransfers1956a2 p m c)
    (hPurpose : ProscribedPurpose1956a2 p m c) :
    ProhibitionViolated1956a2 p m c :=
  ⟨⟨hAddr, hBorder⟩, hAct, hPurpose⟩


theorem prohibition1956a3_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1956 p c) :
    Prohibition1956a3 p c :=
  ⟨hAddr⟩


theorem proscribedPurpose1956a3_promote_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionIntentToPromoteSua1956a3A p t c) :
    ProscribedPurpose1956a3 p t c :=
  ProscribedPurpose1956a3.promote h


theorem proscribedPurpose1956a3_conceal_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionIntentToConcealRepresentedProceeds1956a3B p t c) :
    ProscribedPurpose1956a3 p t c :=
  ProscribedPurpose1956a3.conceal h


theorem proscribedPurpose1956a3_avoidReporting_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionIntentToAvoidReportingRequirement1956a3C p t c) :
    ProscribedPurpose1956a3 p t c :=
  ProscribedPurpose1956a3.avoidReporting h


theorem prohibitionViolated1956a3_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1956 p c)
    (hAct : RegulatedActConductsTransactionInRepresentedProperty1956a3 p t c)
    (hPurpose : ProscribedPurpose1956a3 p t c) :
    ProhibitionViolated1956a3 p t c :=
  ⟨⟨hAddr⟩, hAct, hPurpose⟩


theorem prohibition1956h_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1956 p c) :
    Prohibition1956h p c :=
  ⟨hAddr⟩


theorem prohibitionViolated1956h_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson1956 p c)
    (hAct : RegulatedActConspiresToCommitOffense1956h p c) :
    ProhibitionViolated1956h p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem section1956Violated_domesticTransaction_intro
    {p : Person} {t : FinancialTransaction} {m : MonetaryProperty} {c : ComplaintText}
    (h : ProhibitionViolated1956a1 p t c) :
    Section1956Violated p t m c :=
  Section1956Violated.domesticTransaction h


theorem section1956Violated_crossBorderTransfer_intro
    {p : Person} {t : FinancialTransaction} {m : MonetaryProperty} {c : ComplaintText}
    (h : ProhibitionViolated1956a2 p m c) :
    Section1956Violated p t m c :=
  Section1956Violated.crossBorderTransfer h


theorem section1956Violated_representedProceeds_intro
    {p : Person} {t : FinancialTransaction} {m : MonetaryProperty} {c : ComplaintText}
    (h : ProhibitionViolated1956a3 p t c) :
    Section1956Violated p t m c :=
  Section1956Violated.representedProceeds h


theorem section1956Violated_conspiracy_intro
    {p : Person} {t : FinancialTransaction} {m : MonetaryProperty} {c : ComplaintText}
    (h : ProhibitionViolated1956h p c) :
    Section1956Violated p t m c :=
  Section1956Violated.conspiracy h


theorem obligation1956b1_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (hAddr : AddresseeCivilPenaltyRespondent1956b1 p c)
    (hCond : ConditionConductedTransactionDescribedInSubsectionA1956b1 p t c) :
    Obligation1956b1 p t c :=
  ⟨hAddr, hCond⟩


theorem obligationBreached1956b1_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (hAddr : AddresseeCivilPenaltyRespondent1956b1 p c)
    (hCond : ConditionConductedTransactionDescribedInSubsectionA1956b1 p t c)
    (hOmission : ¬ RegulatedActPaysCivilPenalty1956b1 p c) :
    ObligationBreached1956b1 p t c :=
  ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem power1956b3_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeDistrictCourt1956b ct c)
    (hCond : ConditionNecessaryToSecureAssetsForJudgment1956b3 p c) :
    Power1956b3 ct p c :=
  ⟨hAddr, hCond⟩


theorem powerExercisedWithinScope1956b3_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeDistrictCourt1956b ct c)
    (hCond : ConditionNecessaryToSecureAssetsForJudgment1956b3 p c)
    (hAct : RegulatedActIssuesPretrialRestrainingOrder1956b3 ct p c) :
    PowerExercisedWithinScope1956b3 ct p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power1956b4_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeDistrictCourt1956b ct c)
    (hCond : ConditionReceivershipSoughtToSatisfyJudgment1956b4 p c) :
    Power1956b4 ct p c :=
  ⟨hAddr, hCond⟩


theorem powerExercisedWithinScope1956b4_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeDistrictCourt1956b ct c)
    (hCond : ConditionReceivershipSoughtToSatisfyJudgment1956b4 p c)
    (hAct : RegulatedActAppointsFederalReceiver1956b4 ct p c) :
    PowerExercisedWithinScope1956b4 ct p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission1956e_intro
    {a : Authority} {i : Investigation} {c : ComplaintText}
    (hAddr : AddresseeInvestigativeComponent1956e a c)
    (hAgree : ConditionInteragencyAgreementGoverns1956e a i c) :
    Permission1956e a i c :=
  ⟨hAddr, hAgree⟩


theorem permissionExercisedWithinScope1956e_intro
    {a : Authority} {i : Investigation} {c : ComplaintText}
    (hAddr : AddresseeInvestigativeComponent1956e a c)
    (hAgree : ConditionInteragencyAgreementGoverns1956e a i c)
    (hAct : RegulatedActInvestigatesViolation1956e a i c) :
    PermissionExercisedWithinScope1956e a i c :=
  ⟨⟨hAddr, hAgree⟩, hAct⟩


theorem power1956f_intro
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (hNexus : ConditionConductByUsCitizenOrPartlyInUs1956f1 p c)
    (hThreshold : ConditionTransactionValueExceedsTenThousand1956f2 t c) :
    Power1956f p t c :=
  ⟨hNexus, hThreshold⟩


theorem obligation1956g_intro
    {a : Authority} {p : Person} {o : Offense} {c : ComplaintText}
    (hAddr : AddresseeAttorneyGeneral1956g a c)
    (hCond : ConditionFinancialInstitutionFoundGuilty1956g p o c) :
    Obligation1956g a p o c :=
  ⟨hAddr, hCond⟩


theorem obligationBreached1956g_intro
    {a : Authority} {p : Person} {o : Offense} {c : ComplaintText}
    (hAddr : AddresseeAttorneyGeneral1956g a c)
    (hCond : ConditionFinancialInstitutionFoundGuilty1956g p o c)
    (hOmission : ¬ RegulatedActProvidesWrittenNoticeToRegulator1956g a p c) :
    ObligationBreached1956g a p o c :=
  ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem permission1956i_intro
    {a : Authority} {c : ComplaintText}
    (hAddr : AddresseeProsecutingAuthority1956 a c) :
    Permission1956i a c :=
  ⟨hAddr⟩


theorem venueBasis1956i_transactionDistrict_intro
    {d : JudicialDistrict} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionVenueDistrictOfTransaction1956i1A d t c) :
    VenueBasis1956i d t c :=
  VenueBasis1956i.transactionDistrict h


theorem venueBasis1956i_underlyingActivityDistrict_intro
    {d : JudicialDistrict} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionVenueDistrictOfUnderlyingActivity1956i1B d t c) :
    VenueBasis1956i d t c :=
  VenueBasis1956i.underlyingActivityDistrict h


theorem venueBasis1956i_actInFurtheranceDistrict_intro
    {d : JudicialDistrict} {t : FinancialTransaction} {c : ComplaintText}
    (h : ConditionVenueActInFurtheranceDistrict1956i2 d c) :
    VenueBasis1956i d t c :=
  VenueBasis1956i.actInFurtheranceDistrict h


theorem permissionExercisedWithinScope1956i_intro
    {a : Authority} {d : JudicialDistrict} {t : FinancialTransaction} {c : ComplaintText}
    (hAddr : AddresseeProsecutingAuthority1956 a c)
    (hBasis : VenueBasis1956i d t c)
    (hAct : RegulatedActBringsProsecutionInDistrict1956i a d c) :
    PermissionExercisedWithinScope1956i a d t c :=
  ⟨⟨hAddr⟩, hBasis, hAct⟩


theorem prohibition1956j_intro
    {a : Authority} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeProsecutingAuthority1956 a c)
    (hForeign : ConditionSuaIsForeignOffense1956j p c)
    (hTime : ConditionIndictmentNotFoundWithinSevenYears1956j p c) :
    Prohibition1956j a p c :=
  ⟨hAddr, hForeign, hTime⟩


theorem prohibitionViolated1956j_intro
    {a : Authority} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeProsecutingAuthority1956 a c)
    (hForeign : ConditionSuaIsForeignOffense1956j p c)
    (hTime : ConditionIndictmentNotFoundWithinSevenYears1956j p c)
    (hAct : RegulatedActProsecutesTriesOrPunishes1956j a p c) :
    ProhibitionViolated1956j a p c :=
  ⟨⟨hAddr, hForeign, hTime⟩, hAct⟩

end Proving.USC.T18.Ch42Ch95.Deontic
