







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.EqualRights.Reslice.Elements.Types
import Proving.USC.T42.EqualRights.Reslice.Elements.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Elements

open Proving.USC.Common





inductive MakeAndEnforceContractsImpaired (k : Contract) (c : ComplaintText) : Prop where
  | making (h : ContractMakingImpaired k c)
  | performance (h : ContractPerformanceImpaired k c)
  | modification (h : ContractModificationImpaired k c)
  | termination (h : ContractTerminationImpaired k c)
  | benefits (h : ContractualBenefitsEnjoymentImpaired k c)


abbrev ImpairedMakeAndEnforceContracts (k : Contract) (c : ComplaintText) : Prop :=
  MakeAndEnforceContractsImpaired k c


inductive ProtectedActivity1981
    (p : Person) (k : Contract) (r : ProtectedRight) (c : ComplaintText) : Prop where
  | contracts (h : ImpairedMakeAndEnforceContracts k c)
  | sueOrTestify (h : RightToSueOrGiveEvidenceDenied r c)
  | equalBenefit (h : FullAndEqualBenefitOfLawsDenied r c)
  | unlikePunishment (h : SubjectedToUnlikePunishmentOrExaction p c)



inductive Impairment1981c (d : Person) (c : ComplaintText) : Prop where
  | nongovernmental (h : NongovernmentalDiscrimination d c)
  | underColorOfStateLaw (h : ActsUnderColorOfStateLaw d c)


structure Section1981
    (p d : Person) (k : Contract) (r : ProtectedRight) (c : ComplaintText) : Prop where
  personInUS : IsPersonInUS p c
  protectedClass : IsRaciallyProtectedClaimant p c
  activity : ProtectedActivity1981 p k r c
  denial : DeniedRightEnjoyedByWhiteCitizens p r c
  intent : IntentToDiscriminate d c
  butForCause : RaceWasButForCauseOfDenial p c
  impairment : Impairment1981c d c




inductive PropertyRightImpaired1982 (pr : PropertyInterest) (c : ComplaintText) : Prop where
  | inherit (h : RightToInheritPropertyDenied pr c)
  | purchase (h : RightToPurchasePropertyDenied pr c)
  | lease (h : RightToLeasePropertyDenied pr c)
  | sell (h : RightToSellPropertyDenied pr c)
  | hold (h : RightToHoldPropertyDenied pr c)
  | convey (h : RightToConveyPropertyDenied pr c)


structure Section1982
    (p d : Person) (pr : PropertyInterest) (c : ComplaintText) : Prop where
  citizen : IsCitizenOfUnitedStates p c
  protectedClass : IsRaciallyProtectedClaimant p c
  realOrPersonal : IsRealOrPersonalProperty pr c
  rightImpaired : PropertyRightImpaired1982 pr c
  denial : DeniedPropertyRightEnjoyedByWhiteCitizens p pr c
  intent : IntentToDiscriminate d c





structure FederalStatutoryRight (r : ProtectedRight) (c : ComplaintText) : Prop where
  intendedBeneficiary : StatuteIntendedToBenefitPlaintiff r c
  notVague : RightNotVagueOrAmorphous r c
  mandatory : StatuteImposesMandatoryObligation r c
  rightsCreating : UnambiguousRightsCreatingLanguage r c



inductive SecuredFederalRight (r : ProtectedRight) (c : ComplaintText) : Prop where
  | constitutional (h : RightSecuredByConstitution r c)
  | statutory (h : FederalStatutoryRight r c)


abbrev RightSecuredByConstitutionAndLaws (r : ProtectedRight) (c : ComplaintText) : Prop :=
  SecuredFederalRight r c





inductive ColorOfLaw1983 (d : Person) (c : ComplaintText) : Prop where
  | stateTerritoryOrDC (h : ActsUnderColorOfStateLaw d c)
  | dcActOfCongress (h : ActedUnderActOfCongressExclusiveToDC d c)





structure Section1983
    (p d : Person) (r : ProtectedRight) (c : ComplaintText) : Prop where
  suablePerson : IsSuablePersonUnderSection1983 d c
  colorOfLaw : ColorOfLaw1983 d c
  claimantCovered : IsPersonInUS p c
  securedRight : RightSecuredByConstitutionAndLaws r c
  deprivation : DeprivedOfSecuredRight p r c
  causation : SubjectsOrCausesToBeSubjected d p c
  injured : IsPartyInjured p c
  noAbsoluteImmunity : ¬ AbsoluteImmunityBarsLiability d c




inductive InjunctiveReliefPermitted1983 (d : Person) (c : ComplaintText) : Prop where
  | notJudicialAct (h : ¬ ActionAgainstJudicialOfficerInJudicialCapacity d c)
  | decreeViolated (hOfficer : ActionAgainstJudicialOfficerInJudicialCapacity d c)
      (h : DeclaratoryDecreeViolated d c)
  | reliefUnavailable (hOfficer : ActionAgainstJudicialOfficerInJudicialCapacity d c)
      (h : DeclaratoryReliefUnavailable d c)


structure Section1983InjunctiveClaim
    (p d : Person) (r : ProtectedRight) (c : ComplaintText) : Prop where
  violation : Section1983 p d r c
  injunctiveGate : InjunctiveReliefPermitted1983 d c





inductive Clause1985_1 (ag : Agreement) (c : ComplaintText) : Prop where
  | preventOffice (hMeans : ByForceIntimidationOrThreat ag c)
      (h : PreventHoldingFederalOfficeOrDuties ag c)
  | induceDeparture (hMeans : ByForceIntimidationOrThreat ag c)
      (h : InduceFederalOfficerToLeavePost ag c)
  | injureOfficer (h : InjureFederalOfficerForLawfulDischarge ag c)
  | injureOfficerProperty (h : InjureFederalOfficerPropertyToImpedeDuties ag c)


inductive EqualProtectionPurpose1985_2 (ag : Agreement) (c : ComplaintText) : Prop where
  | denyEqualProtection (h : IntentToDenyEqualProtection ag c)
  | injureForEnforcing (h : IntentToInjureForEnforcingEqualProtection ag c)



inductive Clause1985_2 (ag : Agreement) (c : ComplaintText) : Prop where
  | deterWitness (hMeans : ByForceIntimidationOrThreat ag c)
      (h : DeterFederalPartyOrWitness ag c)
  | injureWitness (h : InjureFederalPartyOrWitnessForTestifying ag c)
  | influenceJuror (h : InfluenceFederalJuror ag c)
  | injureJuror (h : InjureFederalJurorForVerdict ag c)
  | stateJustice (h : ImpedeDueCourseOfJusticeInState ag c)
      (hPurpose : EqualProtectionPurpose1985_2 ag c)



inductive ConspiracyManner1985_3 (ag : Agreement) (c : ComplaintText) : Prop where
  | conspire (h : AgreementAmongTwoOrMore ag c)
  | goInDisguise (h : GoesInDisguiseOnHighwayOrPremises ag c)


inductive DeprivationObject1985_3 (ag : Agreement) (c : ComplaintText) : Prop where
  | depriveEqualProtection (h : PurposeToDepriveEqualProtectionOrPrivileges ag c)
  | preventAuthorities (h : PurposeToPreventAuthoritiesSecuringEqualProtection ag c)


inductive SupportOrAdvocacyObject1985_3 (ag : Agreement) (c : ComplaintText) : Prop where
  | voterIntimidation (hMeans : ByForceIntimidationOrThreat ag c)
      (h : PreventVoterSupportOrAdvocacyInFederalElection ag c)
  | injureVoter (h : InjureCitizenForVotingSupportOrAdvocacy ag c)




inductive Clause1985_3 (ag : Agreement) (c : ComplaintText) : Prop where
  | deprivation (hManner : ConspiracyManner1985_3 ag c)
      (h : DeprivationObject1985_3 ag c) (hAnimus : ClassBasedInvidiousAnimus ag c)
  | supportOrAdvocacy (h : SupportOrAdvocacyObject1985_3 ag c)


inductive ConspiracyObject1985 (ag : Agreement) (c : ComplaintText) : Prop where
  | clause1 (h : Clause1985_1 ag c)
  | clause2 (h : Clause1985_2 ag c)
  | clause3 (h : Clause1985_3 ag c)




inductive Injury1985 (p : Person) (ov : OvertAct) (c : ComplaintText) : Prop where
  | personOrProperty (h : InjuredInPersonOrProperty p ov c)
  | deprivationOfCitizenRight (h : DeprivedOfCitizenRightOrPrivilege p ov c)


structure Section1985Claim
    (p : Person) (ag : Agreement) (ov : OvertAct) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  locus : ConspiracyInStateOrTerritory ag c
  object : ConspiracyObject1985 ag c
  overtAct : OvertActInFurtherance ov ag c
  injury : Injury1985 p ov c
  causation : ProximateCause p c





abbrev CommencedWithinOneYear (p : Person) (c : ComplaintText) : Prop :=
  daysFromAccrualToCommencement p c ≤ 365


abbrev WithinDeathActionDamagesCap (c : ComplaintText) : Prop :=
  deathActionDamagesSoughtDollars c ≤ 5000


structure Section1986Claim
    (p d : Person) (ag : Agreement) (ov : OvertAct) (c : ComplaintText) : Prop where
  knowledge : KnowledgeOfImpendingSection1985Wrong d c
  underlyingObject : ConspiracyObject1985 ag c
  power : PowerToPreventOrAidInPreventing d c
  neglect : NeglectsOrRefusesToPrevent d c
  wrongCommitted : Section1985WrongfulActCommitted ov c
  standing : IsPartyInjuredOrLegalRepresentative p c
  preventable : PreventableByReasonableDiligence d ov c
  timely : CommencedWithinOneYear p c



inductive DeathActionBeneficiary1986 (p : Person) (c : ComplaintText) : Prop where
  | widow (h : DeceasedLeavesSurvivingWidow p c)
  | nextOfKin (hNoWidow : ¬ DeceasedLeavesSurvivingWidow p c)
      (h : NextOfKinOfDeceasedExists p c)


structure Section1986DeathAction
    (p d : Person) (ag : Agreement) (ov : OvertAct) (c : ComplaintText) : Prop where
  neglectClaim : Section1986Claim p d ag ov c
  death : DeathCausedByWrongfulActAndNeglect p ov c
  representative : IsLegalRepresentativeOfDeceased p c
  beneficiary : DeathActionBeneficiary1986 p c
  withinCap : WithinDeathActionDamagesCap c




inductive DisabilityViolation1981a (d : Person) (c : ComplaintText) : Prop where
  | section791Intentional (h : IntentionalDiscriminationUnderSection791 d c)
  | section791Accommodation (h : ViolatedSection791AccommodationRequirement d c)
  | adaSection102 (h : ViolatedADASection102 d c)
  | adaSection102b5 (h : ViolatedADASection102b5 d c)




inductive Section1981aRoute
    (p d : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  | titleVII (hAction : ActionUnderTitleVII706Or717 pr c)
      (hViolation : UnlawfulIntentionalDiscriminationUnderTitleVII d c)
      (hNotImpactOnly : ¬ DisparateImpactPracticeOnly d c)
      (hNo1981 : ¬ CanRecoverUnderSection1981 p c)
  | rehabOrADA (hAction : ActionUnderRehabOrADAProcedures pr c)
      (hViolation : DisabilityViolation1981a d c)
      (hNotImpactOnly : ¬ DisparateImpactPracticeOnly d c)




inductive AccommodationDamagesGate1981a (d : Person) (c : ComplaintText) : Prop where
  | notAccommodationCase (h : ¬ AccommodationClaimAtIssue d c)
  | noGoodFaithShowing (hAcc : AccommodationClaimAtIssue d c)
      (h : ¬ GoodFaithAccommodationEffortsDemonstrated d c)



inductive WithinDamagesCap1981a (p d : Person) (c : ComplaintText) : Prop where
  | tier50k (hLo : 14 < employeeCountInTwentyOrMoreWeeks d c)
      (hHi : employeeCountInTwentyOrMoreWeeks d c < 101)
      (hCap : compensatoryAndPunitiveSumDollars p c ≤ 50000)
  | tier100k (hLo : 100 < employeeCountInTwentyOrMoreWeeks d c)
      (hHi : employeeCountInTwentyOrMoreWeeks d c < 201)
      (hCap : compensatoryAndPunitiveSumDollars p c ≤ 100000)
  | tier200k (hLo : 200 < employeeCountInTwentyOrMoreWeeks d c)
      (hHi : employeeCountInTwentyOrMoreWeeks d c < 501)
      (hCap : compensatoryAndPunitiveSumDollars p c ≤ 200000)
  | tier300k (hLo : 500 < employeeCountInTwentyOrMoreWeeks d c)
      (hCap : compensatoryAndPunitiveSumDollars p c ≤ 300000)


structure Section1981aDamages
    (p d : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  complainingParty : IsComplainingParty p c
  route : Section1981aRoute p d pr c
  accommodationGate : AccommodationDamagesGate1981a d c
  noSection706gRelief : ¬ SeeksReliefAuthorizedUnderSection706g p c
  withinCap : WithinDamagesCap1981a p d c


inductive PunitiveMentalState1981a (d : Person) (c : ComplaintText) : Prop where
  | malice (h : ActedWithMalice d c)
  | recklessIndifference (h : RecklessIndifferenceToFederallyProtectedRights d c)


structure Section1981aPunitive
    (p d : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  damages : Section1981aDamages p d pr c
  notGovernmentRespondent : ¬ RespondentIsGovernmentEntity d c
  mentalState : PunitiveMentalState1981a d c




structure Section1988aBorrowing (pr : Proceeding) (c : ComplaintText) : Prop where
  jurisdiction : WithinCivilRightsJurisdiction pr c
  deficiency : FederalLawDeficientOrNotAdapted pr c
  stateRule : StateCommonLawSuppliesRemedy pr c
  notInconsistent : ¬ StateRuleInconsistentWithFederalLaw pr c



inductive JudicialOfficerCostsGate1988 (d : Person) (c : ComplaintText) : Prop where
  | notJudicialAct (h : ¬ ActionAgainstJudicialOfficerInJudicialCapacity d c)
  | clearlyInExcess (hOfficer : ActionAgainstJudicialOfficerInJudicialCapacity d c)
      (h : ActionClearlyInExcessOfJudicialJurisdiction d c)


structure Section1988bFeeAward
    (p d : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  coveredAction : ActionToEnforceCoveredCivilRightsProvision pr c
  prevailing : IsPrevailingParty p c
  notUnitedStates : ¬ PrevailingPartyIsUnitedStates p c
  reasonable : FeeIsReasonable pr c
  judicialOfficerGate : JudicialOfficerCostsGate1988 d c


structure Section1988cExpertFees
    (p d : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  feeAward : Section1988bFeeAward p d pr c
  section1981Action : ActionToEnforceSection1981Or1981a pr c
  expertFees : ExpertFeesIncurred pr c




inductive EqualRightsViolation
    (p d : Person) (k : Contract) (r : ProtectedRight) (pi : PropertyInterest)
    (ag : Agreement) (ov : OvertAct) (c : ComplaintText) : Prop where
  | section1981 (h : Section1981 p d k r c)
  | section1982 (h : Section1982 p d pi c)
  | section1983 (h : Section1983 p d r c)
  | section1985 (h : Section1985Claim p ag ov c)
  | section1986 (h : Section1986Claim p d ag ov c)



structure ValidEqualRightsComplaint
    (p d : Person) (k : Contract) (r : ProtectedRight) (pi : PropertyInterest)
    (ag : Agreement) (ov : OvertAct) (c : ComplaintText) : Prop where
  violation : EqualRightsViolation p d k r pi ag ov c
  causation : ProximateCause p c
  timely : WithinLimitations p c

end Proving.USC.T42.EqualRights.Reslice.Elements
