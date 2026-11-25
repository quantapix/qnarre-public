






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.EqualRights.Reslice.Elements.Types
import Proving.USC.T42.EqualRights.Reslice.Elements.Predicates
import Proving.USC.T42.EqualRights.Reslice.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Elements

open Proving.USC.Common



theorem makeAndEnforceContractsImpaired_intro_making {k : Contract} {c : ComplaintText}
    (h : ContractMakingImpaired k c) : MakeAndEnforceContractsImpaired k c := .making h

theorem makeAndEnforceContractsImpaired_intro_performance
    {k : Contract} {c : ComplaintText}
    (h : ContractPerformanceImpaired k c) : MakeAndEnforceContractsImpaired k c :=
  .performance h

theorem makeAndEnforceContractsImpaired_intro_modification
    {k : Contract} {c : ComplaintText}
    (h : ContractModificationImpaired k c) : MakeAndEnforceContractsImpaired k c :=
  .modification h

theorem makeAndEnforceContractsImpaired_intro_termination
    {k : Contract} {c : ComplaintText}
    (h : ContractTerminationImpaired k c) : MakeAndEnforceContractsImpaired k c :=
  .termination h

theorem makeAndEnforceContractsImpaired_intro_benefits
    {k : Contract} {c : ComplaintText}
    (h : ContractualBenefitsEnjoymentImpaired k c) :
    MakeAndEnforceContractsImpaired k c := .benefits h

theorem protectedActivity1981_intro_contracts
    {p : Person} {k : Contract} {r : ProtectedRight} {c : ComplaintText}
    (h : ImpairedMakeAndEnforceContracts k c) : ProtectedActivity1981 p k r c :=
  .contracts h

theorem protectedActivity1981_intro_sueOrTestify
    {p : Person} {k : Contract} {r : ProtectedRight} {c : ComplaintText}
    (h : RightToSueOrGiveEvidenceDenied r c) : ProtectedActivity1981 p k r c :=
  .sueOrTestify h

theorem protectedActivity1981_intro_equalBenefit
    {p : Person} {k : Contract} {r : ProtectedRight} {c : ComplaintText}
    (h : FullAndEqualBenefitOfLawsDenied r c) : ProtectedActivity1981 p k r c :=
  .equalBenefit h

theorem protectedActivity1981_intro_unlikePunishment
    {p : Person} {k : Contract} {r : ProtectedRight} {c : ComplaintText}
    (h : SubjectedToUnlikePunishmentOrExaction p c) : ProtectedActivity1981 p k r c :=
  .unlikePunishment h

theorem impairment1981c_intro_nongovernmental {d : Person} {c : ComplaintText}
    (h : NongovernmentalDiscrimination d c) : Impairment1981c d c := .nongovernmental h

theorem impairment1981c_intro_underColorOfStateLaw {d : Person} {c : ComplaintText}
    (h : ActsUnderColorOfStateLaw d c) : Impairment1981c d c := .underColorOfStateLaw h

theorem section1981_intro
    {p d : Person} {k : Contract} {r : ProtectedRight} {c : ComplaintText}
    (hPerson : IsPersonInUS p c)
    (hClass : IsRaciallyProtectedClaimant p c)
    (hActivity : ProtectedActivity1981 p k r c)
    (hDenial : DeniedRightEnjoyedByWhiteCitizens p r c)
    (hIntent : IntentToDiscriminate d c)
    (hButFor : RaceWasButForCauseOfDenial p c)
    (hImpairment : Impairment1981c d c) : Section1981 p d k r c :=
  ⟨hPerson, hClass, hActivity, hDenial, hIntent, hButFor, hImpairment⟩



theorem propertyRightImpaired1982_intro_inherit
    {pi : PropertyInterest} {c : ComplaintText}
    (h : RightToInheritPropertyDenied pi c) : PropertyRightImpaired1982 pi c := .inherit h

theorem propertyRightImpaired1982_intro_purchase
    {pi : PropertyInterest} {c : ComplaintText}
    (h : RightToPurchasePropertyDenied pi c) : PropertyRightImpaired1982 pi c := .purchase h

theorem propertyRightImpaired1982_intro_lease
    {pi : PropertyInterest} {c : ComplaintText}
    (h : RightToLeasePropertyDenied pi c) : PropertyRightImpaired1982 pi c := .lease h

theorem propertyRightImpaired1982_intro_sell
    {pi : PropertyInterest} {c : ComplaintText}
    (h : RightToSellPropertyDenied pi c) : PropertyRightImpaired1982 pi c := .sell h

theorem propertyRightImpaired1982_intro_hold
    {pi : PropertyInterest} {c : ComplaintText}
    (h : RightToHoldPropertyDenied pi c) : PropertyRightImpaired1982 pi c := .hold h

theorem propertyRightImpaired1982_intro_convey
    {pi : PropertyInterest} {c : ComplaintText}
    (h : RightToConveyPropertyDenied pi c) : PropertyRightImpaired1982 pi c := .convey h

theorem section1982_intro
    {p d : Person} {pi : PropertyInterest} {c : ComplaintText}
    (hCitizen : IsCitizenOfUnitedStates p c)
    (hClass : IsRaciallyProtectedClaimant p c)
    (hProperty : IsRealOrPersonalProperty pi c)
    (hRight : PropertyRightImpaired1982 pi c)
    (hDenial : DeniedPropertyRightEnjoyedByWhiteCitizens p pi c)
    (hIntent : IntentToDiscriminate d c) : Section1982 p d pi c :=
  ⟨hCitizen, hClass, hProperty, hRight, hDenial, hIntent⟩



theorem federalStatutoryRight_intro {r : ProtectedRight} {c : ComplaintText}
    (hBenefit : StatuteIntendedToBenefitPlaintiff r c)
    (hNotVague : RightNotVagueOrAmorphous r c)
    (hMandatory : StatuteImposesMandatoryObligation r c)
    (hRightsCreating : UnambiguousRightsCreatingLanguage r c) :
    FederalStatutoryRight r c :=
  ⟨hBenefit, hNotVague, hMandatory, hRightsCreating⟩

theorem securedFederalRight_intro_constitutional
    {r : ProtectedRight} {c : ComplaintText}
    (h : RightSecuredByConstitution r c) : SecuredFederalRight r c := .constitutional h

theorem securedFederalRight_intro_statutory {r : ProtectedRight} {c : ComplaintText}
    (h : FederalStatutoryRight r c) : SecuredFederalRight r c := .statutory h

theorem colorOfLaw1983_intro_stateTerritoryOrDC {d : Person} {c : ComplaintText}
    (h : ActsUnderColorOfStateLaw d c) : ColorOfLaw1983 d c := .stateTerritoryOrDC h

theorem colorOfLaw1983_intro_dcActOfCongress {d : Person} {c : ComplaintText}
    (h : ActedUnderActOfCongressExclusiveToDC d c) : ColorOfLaw1983 d c :=
  .dcActOfCongress h

theorem section1983_intro
    {p d : Person} {r : ProtectedRight} {c : ComplaintText}
    (hSuable : IsSuablePersonUnderSection1983 d c)
    (hColor : ColorOfLaw1983 d c)
    (hCovered : IsPersonInUS p c)
    (hRight : RightSecuredByConstitutionAndLaws r c)
    (hDeprived : DeprivedOfSecuredRight p r c)
    (hCausation : SubjectsOrCausesToBeSubjected d p c)
    (hInjured : IsPartyInjured p c)
    (hNoImmunity : ¬ AbsoluteImmunityBarsLiability d c) : Section1983 p d r c :=
  ⟨hSuable, hColor, hCovered, hRight, hDeprived, hCausation, hInjured, hNoImmunity⟩

theorem injunctiveReliefPermitted1983_intro_notJudicialAct
    {d : Person} {c : ComplaintText}
    (h : ¬ ActionAgainstJudicialOfficerInJudicialCapacity d c) :
    InjunctiveReliefPermitted1983 d c := .notJudicialAct h

theorem injunctiveReliefPermitted1983_intro_decreeViolated
    {d : Person} {c : ComplaintText}
    (hOfficer : ActionAgainstJudicialOfficerInJudicialCapacity d c)
    (h : DeclaratoryDecreeViolated d c) : InjunctiveReliefPermitted1983 d c :=
  .decreeViolated hOfficer h

theorem injunctiveReliefPermitted1983_intro_reliefUnavailable
    {d : Person} {c : ComplaintText}
    (hOfficer : ActionAgainstJudicialOfficerInJudicialCapacity d c)
    (h : DeclaratoryReliefUnavailable d c) : InjunctiveReliefPermitted1983 d c :=
  .reliefUnavailable hOfficer h

theorem section1983InjunctiveClaim_intro
    {p d : Person} {r : ProtectedRight} {c : ComplaintText}
    (hViolation : Section1983 p d r c)
    (hGate : InjunctiveReliefPermitted1983 d c) : Section1983InjunctiveClaim p d r c :=
  ⟨hViolation, hGate⟩



theorem clause1985_1_intro_preventOffice {ag : Agreement} {c : ComplaintText}
    (hMeans : ByForceIntimidationOrThreat ag c)
    (h : PreventHoldingFederalOfficeOrDuties ag c) : Clause1985_1 ag c :=
  .preventOffice hMeans h

theorem clause1985_1_intro_induceDeparture {ag : Agreement} {c : ComplaintText}
    (hMeans : ByForceIntimidationOrThreat ag c)
    (h : InduceFederalOfficerToLeavePost ag c) : Clause1985_1 ag c :=
  .induceDeparture hMeans h

theorem clause1985_1_intro_injureOfficer {ag : Agreement} {c : ComplaintText}
    (h : InjureFederalOfficerForLawfulDischarge ag c) : Clause1985_1 ag c :=
  .injureOfficer h

theorem clause1985_1_intro_injureOfficerProperty {ag : Agreement} {c : ComplaintText}
    (h : InjureFederalOfficerPropertyToImpedeDuties ag c) : Clause1985_1 ag c :=
  .injureOfficerProperty h

theorem equalProtectionPurpose1985_2_intro_denyEqualProtection
    {ag : Agreement} {c : ComplaintText}
    (h : IntentToDenyEqualProtection ag c) : EqualProtectionPurpose1985_2 ag c :=
  .denyEqualProtection h

theorem equalProtectionPurpose1985_2_intro_injureForEnforcing
    {ag : Agreement} {c : ComplaintText}
    (h : IntentToInjureForEnforcingEqualProtection ag c) :
    EqualProtectionPurpose1985_2 ag c := .injureForEnforcing h

theorem clause1985_2_intro_deterWitness {ag : Agreement} {c : ComplaintText}
    (hMeans : ByForceIntimidationOrThreat ag c)
    (h : DeterFederalPartyOrWitness ag c) : Clause1985_2 ag c := .deterWitness hMeans h

theorem clause1985_2_intro_injureWitness {ag : Agreement} {c : ComplaintText}
    (h : InjureFederalPartyOrWitnessForTestifying ag c) : Clause1985_2 ag c :=
  .injureWitness h

theorem clause1985_2_intro_influenceJuror {ag : Agreement} {c : ComplaintText}
    (h : InfluenceFederalJuror ag c) : Clause1985_2 ag c := .influenceJuror h

theorem clause1985_2_intro_injureJuror {ag : Agreement} {c : ComplaintText}
    (h : InjureFederalJurorForVerdict ag c) : Clause1985_2 ag c := .injureJuror h

theorem clause1985_2_intro_stateJustice {ag : Agreement} {c : ComplaintText}
    (h : ImpedeDueCourseOfJusticeInState ag c)
    (hPurpose : EqualProtectionPurpose1985_2 ag c) : Clause1985_2 ag c :=
  .stateJustice h hPurpose

theorem conspiracyManner1985_3_intro_conspire {ag : Agreement} {c : ComplaintText}
    (h : AgreementAmongTwoOrMore ag c) : ConspiracyManner1985_3 ag c := .conspire h

theorem conspiracyManner1985_3_intro_goInDisguise {ag : Agreement} {c : ComplaintText}
    (h : GoesInDisguiseOnHighwayOrPremises ag c) : ConspiracyManner1985_3 ag c :=
  .goInDisguise h

theorem deprivationObject1985_3_intro_depriveEqualProtection
    {ag : Agreement} {c : ComplaintText}
    (h : PurposeToDepriveEqualProtectionOrPrivileges ag c) :
    DeprivationObject1985_3 ag c := .depriveEqualProtection h

theorem deprivationObject1985_3_intro_preventAuthorities
    {ag : Agreement} {c : ComplaintText}
    (h : PurposeToPreventAuthoritiesSecuringEqualProtection ag c) :
    DeprivationObject1985_3 ag c := .preventAuthorities h

theorem supportOrAdvocacyObject1985_3_intro_voterIntimidation
    {ag : Agreement} {c : ComplaintText}
    (hMeans : ByForceIntimidationOrThreat ag c)
    (h : PreventVoterSupportOrAdvocacyInFederalElection ag c) :
    SupportOrAdvocacyObject1985_3 ag c := .voterIntimidation hMeans h

theorem supportOrAdvocacyObject1985_3_intro_injureVoter
    {ag : Agreement} {c : ComplaintText}
    (h : InjureCitizenForVotingSupportOrAdvocacy ag c) :
    SupportOrAdvocacyObject1985_3 ag c := .injureVoter h

theorem clause1985_3_intro_deprivation {ag : Agreement} {c : ComplaintText}
    (hManner : ConspiracyManner1985_3 ag c)
    (h : DeprivationObject1985_3 ag c)
    (hAnimus : ClassBasedInvidiousAnimus ag c) : Clause1985_3 ag c :=
  .deprivation hManner h hAnimus

theorem clause1985_3_intro_supportOrAdvocacy {ag : Agreement} {c : ComplaintText}
    (h : SupportOrAdvocacyObject1985_3 ag c) : Clause1985_3 ag c := .supportOrAdvocacy h

theorem conspiracyObject1985_intro_clause1 {ag : Agreement} {c : ComplaintText}
    (h : Clause1985_1 ag c) : ConspiracyObject1985 ag c := .clause1 h

theorem conspiracyObject1985_intro_clause2 {ag : Agreement} {c : ComplaintText}
    (h : Clause1985_2 ag c) : ConspiracyObject1985 ag c := .clause2 h

theorem conspiracyObject1985_intro_clause3 {ag : Agreement} {c : ComplaintText}
    (h : Clause1985_3 ag c) : ConspiracyObject1985 ag c := .clause3 h

theorem injury1985_intro_personOrProperty
    {p : Person} {ov : OvertAct} {c : ComplaintText}
    (h : InjuredInPersonOrProperty p ov c) : Injury1985 p ov c := .personOrProperty h

theorem injury1985_intro_deprivationOfCitizenRight
    {p : Person} {ov : OvertAct} {c : ComplaintText}
    (h : DeprivedOfCitizenRightOrPrivilege p ov c) : Injury1985 p ov c :=
  .deprivationOfCitizenRight h

theorem section1985Claim_intro
    {p : Person} {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hLocus : ConspiracyInStateOrTerritory ag c)
    (hObject : ConspiracyObject1985 ag c)
    (hOvertAct : OvertActInFurtherance ov ag c)
    (hInjury : Injury1985 p ov c)
    (hCausation : ProximateCause p c) : Section1985Claim p ag ov c :=
  ⟨hAgreement, hLocus, hObject, hOvertAct, hInjury, hCausation⟩



theorem section1986Claim_intro
    {p d : Person} {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (hKnowledge : KnowledgeOfImpendingSection1985Wrong d c)
    (hObject : ConspiracyObject1985 ag c)
    (hPower : PowerToPreventOrAidInPreventing d c)
    (hNeglect : NeglectsOrRefusesToPrevent d c)
    (hCommitted : Section1985WrongfulActCommitted ov c)
    (hStanding : IsPartyInjuredOrLegalRepresentative p c)
    (hPreventable : PreventableByReasonableDiligence d ov c)
    (hTimely : CommencedWithinOneYear p c) : Section1986Claim p d ag ov c :=
  ⟨hKnowledge, hObject, hPower, hNeglect, hCommitted, hStanding, hPreventable, hTimely⟩

theorem deathActionBeneficiary1986_intro_widow {p : Person} {c : ComplaintText}
    (h : DeceasedLeavesSurvivingWidow p c) : DeathActionBeneficiary1986 p c := .widow h

theorem deathActionBeneficiary1986_intro_nextOfKin {p : Person} {c : ComplaintText}
    (hNoWidow : ¬ DeceasedLeavesSurvivingWidow p c)
    (h : NextOfKinOfDeceasedExists p c) : DeathActionBeneficiary1986 p c :=
  .nextOfKin hNoWidow h

theorem section1986DeathAction_intro
    {p d : Person} {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (hClaim : Section1986Claim p d ag ov c)
    (hDeath : DeathCausedByWrongfulActAndNeglect p ov c)
    (hRep : IsLegalRepresentativeOfDeceased p c)
    (hBeneficiary : DeathActionBeneficiary1986 p c)
    (hCap : WithinDeathActionDamagesCap c) : Section1986DeathAction p d ag ov c :=
  ⟨hClaim, hDeath, hRep, hBeneficiary, hCap⟩



theorem disabilityViolation1981a_intro_section791Intentional
    {d : Person} {c : ComplaintText}
    (h : IntentionalDiscriminationUnderSection791 d c) : DisabilityViolation1981a d c :=
  .section791Intentional h

theorem disabilityViolation1981a_intro_section791Accommodation
    {d : Person} {c : ComplaintText}
    (h : ViolatedSection791AccommodationRequirement d c) :
    DisabilityViolation1981a d c := .section791Accommodation h

theorem disabilityViolation1981a_intro_adaSection102 {d : Person} {c : ComplaintText}
    (h : ViolatedADASection102 d c) : DisabilityViolation1981a d c := .adaSection102 h

theorem disabilityViolation1981a_intro_adaSection102b5 {d : Person} {c : ComplaintText}
    (h : ViolatedADASection102b5 d c) : DisabilityViolation1981a d c := .adaSection102b5 h

theorem section1981aRoute_intro_titleVII
    {p d : Person} {pr : Proceeding} {c : ComplaintText}
    (hAction : ActionUnderTitleVII706Or717 pr c)
    (hViolation : UnlawfulIntentionalDiscriminationUnderTitleVII d c)
    (hNotImpactOnly : ¬ DisparateImpactPracticeOnly d c)
    (hNo1981 : ¬ CanRecoverUnderSection1981 p c) : Section1981aRoute p d pr c :=
  .titleVII hAction hViolation hNotImpactOnly hNo1981

theorem section1981aRoute_intro_rehabOrADA
    {p d : Person} {pr : Proceeding} {c : ComplaintText}
    (hAction : ActionUnderRehabOrADAProcedures pr c)
    (hViolation : DisabilityViolation1981a d c)
    (hNotImpactOnly : ¬ DisparateImpactPracticeOnly d c) : Section1981aRoute p d pr c :=
  .rehabOrADA hAction hViolation hNotImpactOnly

theorem accommodationDamagesGate1981a_intro_notAccommodationCase
    {d : Person} {c : ComplaintText}
    (h : ¬ AccommodationClaimAtIssue d c) : AccommodationDamagesGate1981a d c :=
  .notAccommodationCase h

theorem accommodationDamagesGate1981a_intro_noGoodFaithShowing
    {d : Person} {c : ComplaintText}
    (hAcc : AccommodationClaimAtIssue d c)
    (h : ¬ GoodFaithAccommodationEffortsDemonstrated d c) :
    AccommodationDamagesGate1981a d c := .noGoodFaithShowing hAcc h

theorem withinDamagesCap1981a_intro_tier50k {p d : Person} {c : ComplaintText}
    (hLo : 14 < employeeCountInTwentyOrMoreWeeks d c)
    (hHi : employeeCountInTwentyOrMoreWeeks d c < 101)
    (hCap : compensatoryAndPunitiveSumDollars p c ≤ 50000) :
    WithinDamagesCap1981a p d c := .tier50k hLo hHi hCap

theorem withinDamagesCap1981a_intro_tier100k {p d : Person} {c : ComplaintText}
    (hLo : 100 < employeeCountInTwentyOrMoreWeeks d c)
    (hHi : employeeCountInTwentyOrMoreWeeks d c < 201)
    (hCap : compensatoryAndPunitiveSumDollars p c ≤ 100000) :
    WithinDamagesCap1981a p d c := .tier100k hLo hHi hCap

theorem withinDamagesCap1981a_intro_tier200k {p d : Person} {c : ComplaintText}
    (hLo : 200 < employeeCountInTwentyOrMoreWeeks d c)
    (hHi : employeeCountInTwentyOrMoreWeeks d c < 501)
    (hCap : compensatoryAndPunitiveSumDollars p c ≤ 200000) :
    WithinDamagesCap1981a p d c := .tier200k hLo hHi hCap

theorem withinDamagesCap1981a_intro_tier300k {p d : Person} {c : ComplaintText}
    (hLo : 500 < employeeCountInTwentyOrMoreWeeks d c)
    (hCap : compensatoryAndPunitiveSumDollars p c ≤ 300000) :
    WithinDamagesCap1981a p d c := .tier300k hLo hCap

theorem section1981aDamages_intro
    {p d : Person} {pr : Proceeding} {c : ComplaintText}
    (hParty : IsComplainingParty p c)
    (hRoute : Section1981aRoute p d pr c)
    (hGate : AccommodationDamagesGate1981a d c)
    (hNo706g : ¬ SeeksReliefAuthorizedUnderSection706g p c)
    (hCap : WithinDamagesCap1981a p d c) : Section1981aDamages p d pr c :=
  ⟨hParty, hRoute, hGate, hNo706g, hCap⟩

theorem punitiveMentalState1981a_intro_malice {d : Person} {c : ComplaintText}
    (h : ActedWithMalice d c) : PunitiveMentalState1981a d c := .malice h

theorem punitiveMentalState1981a_intro_recklessIndifference
    {d : Person} {c : ComplaintText}
    (h : RecklessIndifferenceToFederallyProtectedRights d c) :
    PunitiveMentalState1981a d c := .recklessIndifference h

theorem section1981aPunitive_intro
    {p d : Person} {pr : Proceeding} {c : ComplaintText}
    (hDamages : Section1981aDamages p d pr c)
    (hNotGovernment : ¬ RespondentIsGovernmentEntity d c)
    (hMentalState : PunitiveMentalState1981a d c) : Section1981aPunitive p d pr c :=
  ⟨hDamages, hNotGovernment, hMentalState⟩



theorem section1988aBorrowing_intro {pr : Proceeding} {c : ComplaintText}
    (hJurisdiction : WithinCivilRightsJurisdiction pr c)
    (hDeficiency : FederalLawDeficientOrNotAdapted pr c)
    (hStateRule : StateCommonLawSuppliesRemedy pr c)
    (hNotInconsistent : ¬ StateRuleInconsistentWithFederalLaw pr c) :
    Section1988aBorrowing pr c :=
  ⟨hJurisdiction, hDeficiency, hStateRule, hNotInconsistent⟩

theorem judicialOfficerCostsGate1988_intro_notJudicialAct
    {d : Person} {c : ComplaintText}
    (h : ¬ ActionAgainstJudicialOfficerInJudicialCapacity d c) :
    JudicialOfficerCostsGate1988 d c := .notJudicialAct h

theorem judicialOfficerCostsGate1988_intro_clearlyInExcess
    {d : Person} {c : ComplaintText}
    (hOfficer : ActionAgainstJudicialOfficerInJudicialCapacity d c)
    (h : ActionClearlyInExcessOfJudicialJurisdiction d c) :
    JudicialOfficerCostsGate1988 d c := .clearlyInExcess hOfficer h

theorem section1988bFeeAward_intro
    {p d : Person} {pr : Proceeding} {c : ComplaintText}
    (hCovered : ActionToEnforceCoveredCivilRightsProvision pr c)
    (hPrevailing : IsPrevailingParty p c)
    (hNotUS : ¬ PrevailingPartyIsUnitedStates p c)
    (hReasonable : FeeIsReasonable pr c)
    (hGate : JudicialOfficerCostsGate1988 d c) : Section1988bFeeAward p d pr c :=
  ⟨hCovered, hPrevailing, hNotUS, hReasonable, hGate⟩

theorem section1988cExpertFees_intro
    {p d : Person} {pr : Proceeding} {c : ComplaintText}
    (hFeeAward : Section1988bFeeAward p d pr c)
    (hAction : ActionToEnforceSection1981Or1981a pr c)
    (hExpert : ExpertFeesIncurred pr c) : Section1988cExpertFees p d pr c :=
  ⟨hFeeAward, hAction, hExpert⟩



theorem equalRightsViolation_intro_section1981
    {p d : Person} {k : Contract} {r : ProtectedRight} {pi : PropertyInterest}
    {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (h : Section1981 p d k r c) : EqualRightsViolation p d k r pi ag ov c := .section1981 h

theorem equalRightsViolation_intro_section1982
    {p d : Person} {k : Contract} {r : ProtectedRight} {pi : PropertyInterest}
    {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (h : Section1982 p d pi c) : EqualRightsViolation p d k r pi ag ov c := .section1982 h

theorem equalRightsViolation_intro_section1983
    {p d : Person} {k : Contract} {r : ProtectedRight} {pi : PropertyInterest}
    {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (h : Section1983 p d r c) : EqualRightsViolation p d k r pi ag ov c := .section1983 h

theorem equalRightsViolation_intro_section1985
    {p d : Person} {k : Contract} {r : ProtectedRight} {pi : PropertyInterest}
    {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (h : Section1985Claim p ag ov c) : EqualRightsViolation p d k r pi ag ov c :=
  .section1985 h

theorem equalRightsViolation_intro_section1986
    {p d : Person} {k : Contract} {r : ProtectedRight} {pi : PropertyInterest}
    {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (h : Section1986Claim p d ag ov c) : EqualRightsViolation p d k r pi ag ov c :=
  .section1986 h

theorem validEqualRightsComplaint_intro
    {p d : Person} {k : Contract} {r : ProtectedRight} {pi : PropertyInterest}
    {ag : Agreement} {ov : OvertAct} {c : ComplaintText}
    (hViolation : EqualRightsViolation p d k r pi ag ov c)
    (hCausation : ProximateCause p c)
    (hTimely : WithinLimitations p c) :
    ValidEqualRightsComplaint p d k r pi ag ov c :=
  ⟨hViolation, hCausation, hTimely⟩

end Proving.USC.T42.EqualRights.Reslice.Elements
