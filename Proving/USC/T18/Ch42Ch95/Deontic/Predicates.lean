








import Proving.USC.T18.Ch42Ch95.Deontic.Types

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText)

namespace Proving.USC.T18.Ch42Ch95.Deontic






axiom AddresseeAnyPerson892a (p : Person) (c : ComplaintText) : Prop





axiom ConditionExtensionIsExtortionate892a
    (x : CreditExtension) (c : ComplaintText) : Prop




axiom RegulatedActMakesExtortionateExtension892a
    (p : Person) (x : CreditExtension) (c : ComplaintText) : Prop






axiom Factor892b1RepaymentUnenforceable
    (x : CreditExtension) (c : ComplaintText) : Prop




axiom Factor892b2RateExceedsFortyFivePercent
    (x : CreditExtension) (c : ComplaintText) : Prop





axiom Factor892b3DebtorBelievedExtortionateCollection
    (x : CreditExtension) (c : ComplaintText) : Prop





axiom Factor892b4OutstandingExceedsOneHundredDollars
    (x : CreditExtension) (c : ComplaintText) : Prop





axiom AddresseeTrialCourt (ct : Court) (c : ComplaintText) : Prop





axiom ConditionEvidenceOf892bCircumstancesIntroduced
    (x : CreditExtension) (c : ComplaintText) : Prop





axiom ConditionDirectEvidenceOfDebtorBeliefUnavailable
    (x : CreditExtension) (c : ComplaintText) : Prop





axiom RegulatedActAllowsCreditorReputationEvidence892c
    (ct : Court) (x : CreditExtension) (c : ComplaintText) : Prop






axiom AddresseeKnowingParticipant894a (p : Person) (c : ComplaintText) : Prop




axiom ConditionExtortionateMeansUsed894a
    (p : Person) (x : CreditExtension) (c : ComplaintText) : Prop




axiom RegulatedActCollectsExtension894a1
    (p : Person) (x : CreditExtension) (c : ComplaintText) : Prop




axiom RegulatedActPunishesNonrepayment894a2
    (p : Person) (v : Person) (x : CreditExtension) (c : ComplaintText) : Prop





axiom ConditionPriorExtortionateCollectionsKnownToTarget894b
    (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom RegulatedActIntroducesImplicitThreatEvidence894b
    (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom RegulatedActAllowsDefendantReputationEvidence894c
    (ct : Court) (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom AddresseeAnyPerson1952a (p : Person) (c : ComplaintText) : Prop





axiom RegulatedActTravelsOrUsesInterstateFacility1952a
    (p : Person) (c : ComplaintText) : Prop




axiom ConditionActivityIsUnlawfulActivity1952b
    (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom ConditionIntentToDistributeProceeds1952a1
    (p : Person) (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom ConditionIntentToCommitCrimeOfViolence1952a2
    (p : Person) (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom ConditionIntentToPromoteOrFacilitate1952a3
    (p : Person) (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom RegulatedActThereafterPerformsOrAttempts1952a
    (p : Person) (u : UnlawfulActivity) (c : ComplaintText) : Prop





axiom EscapeSavingsPromotionRaffle1952e
    (p : Person) (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom AddresseeInvestigatingAuthority1952c (a : Authority) (c : ComplaintText) : Prop




axiom ConditionInvestigationInvolvesLiquor1952c
    (i : Investigation) (c : ComplaintText) : Prop




axiom RegulatedActConductedUnderAttorneyGeneralSupervision1952c
    (a : Authority) (i : Investigation) (c : ComplaintText) : Prop



axiom AddresseeSentencingCourt1952d (ct : Court) (c : ComplaintText) : Prop





axiom ConditionOffenseInvolvesPreRetailMedicalProduct1952d
    (o : Offense) (c : ComplaintText) : Prop




axiom EscapeSubsectionAPunishmentGreater1952d (o : Offense) (c : ComplaintText) : Prop




axiom RegulatedActPunishmentSetToSection670Level1952d
    (ct : Court) (o : Offense) (c : ComplaintText) : Prop






axiom AddresseeAnyPerson1956 (p : Person) (c : ComplaintText) : Prop





axiom ConditionKnowsPropertyIsProceeds1956a1
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom ConditionInvolvesProceedsOfSpecifiedUnlawfulActivity1956a1
    (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom RegulatedActConductsFinancialTransaction1956a1
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom ConditionIntentToPromoteSua1956a1Ai
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom ConditionIntentToViolateInternalRevenueCode1956a1Aii
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom ConditionKnowsTransactionDesignedToConceal1956a1Bi
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom ConditionKnowsTransactionDesignedToAvoidReporting1956a1Bii
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom RegulatedActTransportsTransmitsOrTransfers1956a2
    (p : Person) (m : MonetaryProperty) (c : ComplaintText) : Prop





axiom ConditionCrossesUnitedStatesBorder1956a2
    (m : MonetaryProperty) (c : ComplaintText) : Prop




axiom ConditionIntentToPromoteSua1956a2A
    (p : Person) (m : MonetaryProperty) (c : ComplaintText) : Prop





axiom ConditionKnowsProceedsAndDesignedToConceal1956a2Bi
    (p : Person) (m : MonetaryProperty) (c : ComplaintText) : Prop





axiom ConditionKnowsProceedsAndDesignedToAvoidReporting1956a2Bii
    (p : Person) (m : MonetaryProperty) (c : ComplaintText) : Prop





axiom RegulatedActConductsTransactionInRepresentedProperty1956a3
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom ConditionIntentToPromoteSua1956a3A
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom ConditionIntentToConcealRepresentedProceeds1956a3B
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom ConditionIntentToAvoidReportingRequirement1956a3C
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom AddresseeCivilPenaltyRespondent1956b1 (p : Person) (c : ComplaintText) : Prop





axiom ConditionConductedTransactionDescribedInSubsectionA1956b1
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom RegulatedActPaysCivilPenalty1956b1 (p : Person) (c : ComplaintText) : Prop





axiom AddresseeDistrictCourt1956b (ct : Court) (c : ComplaintText) : Prop





axiom ConditionNecessaryToSecureAssetsForJudgment1956b3
    (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActIssuesPretrialRestrainingOrder1956b3
    (ct : Court) (p : Person) (c : ComplaintText) : Prop







axiom ConditionReceivershipSoughtToSatisfyJudgment1956b4
    (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActAppointsFederalReceiver1956b4
    (ct : Court) (p : Person) (c : ComplaintText) : Prop





axiom ConditionConductByUsCitizenOrPartlyInUs1956f1
    (p : Person) (c : ComplaintText) : Prop





axiom ConditionTransactionValueExceedsTenThousand1956f2
    (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom AddresseeInvestigativeComponent1956e (a : Authority) (c : ComplaintText) : Prop



axiom RegulatedActInvestigatesViolation1956e
    (a : Authority) (i : Investigation) (c : ComplaintText) : Prop





axiom ConditionInteragencyAgreementGoverns1956e
    (a : Authority) (i : Investigation) (c : ComplaintText) : Prop



axiom AddresseeAttorneyGeneral1956g (a : Authority) (c : ComplaintText) : Prop





axiom ConditionFinancialInstitutionFoundGuilty1956g
    (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom RegulatedActProvidesWrittenNoticeToRegulator1956g
    (a : Authority) (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActConspiresToCommitOffense1956h (p : Person) (c : ComplaintText) : Prop





axiom AddresseeProsecutingAuthority1956 (a : Authority) (c : ComplaintText) : Prop




axiom RegulatedActBringsProsecutionInDistrict1956i
    (a : Authority) (d : JudicialDistrict) (c : ComplaintText) : Prop




axiom ConditionVenueDistrictOfTransaction1956i1A
    (d : JudicialDistrict) (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom ConditionVenueDistrictOfUnderlyingActivity1956i1B
    (d : JudicialDistrict) (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom ConditionVenueActInFurtheranceDistrict1956i2
    (d : JudicialDistrict) (c : ComplaintText) : Prop




axiom RegulatedActProsecutesTriesOrPunishes1956j
    (a : Authority) (p : Person) (c : ComplaintText) : Prop





axiom ConditionSuaIsForeignOffense1956j (p : Person) (c : ComplaintText) : Prop





axiom ConditionIndictmentNotFoundWithinSevenYears1956j
    (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch42Ch95.Deontic
