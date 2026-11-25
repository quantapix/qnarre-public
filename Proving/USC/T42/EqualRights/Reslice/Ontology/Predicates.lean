








import Proving.USC.T42.EqualRights.Reslice.Ontology.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Ontology





axiom IsPersonWithinJurisdictionOfUS (p : Person) (c : ComplaintText) : Prop




axiom IsWhiteCitizenBenchmark (p : Person) (c : ComplaintText) : Prop



axiom IsStateOrTerritory (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsSection1981ProtectedActivity
    (a : ProtectedActivity) (k : Section1981Right) (c : ComplaintText) : Prop



axiom IsMakeAndEnforceContracts (x : ContractualActivity) (c : ComplaintText) : Prop




axiom IsMakeAndEnforceContractsAspect
    (x : ContractualActivity) (k : ContractsAspect) (c : ComplaintText) : Prop



axiom IsContractualRelationship (k : Contract) (c : ComplaintText) : Prop



axiom IsRightProtectedBySection1981 (r : SecuredRight) (c : ComplaintText) : Prop



axiom IsImpairmentByNongovernmentalDiscrimination
    (i : Impairment) (c : ComplaintText) : Prop



axiom IsImpairmentUnderColorOfStateLaw (i : Impairment) (c : ComplaintText) : Prop





axiom IsComplainingParty (q : ComplainingParty) (c : ComplaintText) : Prop




axiom IsComplainingPartyOfCase
    (q : ComplainingParty) (k : ComplainingPartyCase) (c : ComplaintText) : Prop



axiom IsDiscriminatoryPractice (d : DiscriminatoryPractice) (c : ComplaintText) : Prop



axiom IsUnlawfulIntentionalDiscrimination
    (e : EmploymentPractice) (c : ComplaintText) : Prop




axiom IsDisparateImpactPractice (e : EmploymentPractice) (c : ComplaintText) : Prop




axiom IsReasonableAccommodationViolation
    (e : EmploymentPractice) (c : ComplaintText) : Prop



axiom IsRespondent (r : Respondent) (c : ComplaintText) : Prop




axiom IsGovernmentRespondent (r : Respondent) (c : ComplaintText) : Prop



axiom IsMalice (d : DiscriminatoryPractice) (c : ComplaintText) : Prop




axiom IsRecklessIndifferenceToFederallyProtectedRights
    (d : DiscriminatoryPractice) (c : ComplaintText) : Prop



axiom IsAggrievedIndividual (p : Person) (c : ComplaintText) : Prop



axiom IsCompensatoryDamages (a : DamagesAward) (c : ComplaintText) : Prop



axiom IsPunitiveDamages (a : DamagesAward) (c : ComplaintText) : Prop




axiom IsSection706gRelief (a : DamagesAward) (c : ComplaintText) : Prop




axiom IsCappedDamagesComponent (a : DamagesAward) (c : ComplaintText) : Prop



axiom IsCoveredEntity (t : Entity) (c : ComplaintText) : Prop




axiom IsReasonableAccommodation (m : Accommodation) (c : ComplaintText) : Prop




axiom IsGoodFaithEffortToAccommodate (m : Accommodation) (c : ComplaintText) : Prop



axiom IsUndueHardshipOnBusinessOperation (m : Accommodation) (c : ComplaintText) : Prop




axiom IsPersonWithDisabilityWhoRequestedAccommodation
    (p : Person) (c : ComplaintText) : Prop





axiom employeesInTwentyOrMoreCalendarWeeks (r : Respondent) (c : ComplaintText) : Nat





axiom IsCitizenOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsProtectedPropertyDealing
    (t : PropertyTransaction) (k : PropertyDealing) (c : ComplaintText) : Prop



axiom IsPropertyOfKind
    (i : PropertyInterest) (k : PropertyKind) (c : ComplaintText) : Prop





axiom IsSection1983Person (p : Person) (c : ComplaintText) : Prop



axiom IsColorOfLawSourceOfKind
    (s : LawSource) (k : ColorOfLawSourceKind) (c : ComplaintText) : Prop




axiom IsJurisdictionOfKind
    (j : Jurisdiction) (k : JurisdictionKind) (c : ComplaintText) : Prop




axiom IsActOfCongressApplicableExclusivelyToDC (s : LawSource) (c : ComplaintText) : Prop




axiom IsStatuteOfTheDistrictOfColumbia (s : LawSource) (c : ComplaintText) : Prop



axiom IsSecuredInterestOfKind
    (r : SecuredRight) (k : SecuredInterestKind) (c : ComplaintText) : Prop



axiom IsSecuredByConstitutionAndLaws (r : SecuredRight) (c : ComplaintText) : Prop




axiom IsRedressProceedingOfKind
    (g : Proceeding) (k : RedressProceedingKind) (c : ComplaintText) : Prop



axiom IsJudicialOfficer (o : JudicialOfficer) (c : ComplaintText) : Prop




axiom IsActOrOmissionInJudicialCapacity (o : JudicialOfficer) (c : ComplaintText) : Prop




axiom IsDeclaratoryDecreeViolatedOrReliefUnavailable
    (g : Proceeding) (c : ComplaintText) : Prop





axiom IsConspiracyOfTwoOrMorePersons (k : Conspiracy) (c : ComplaintText) : Prop




axiom IsSection1985ConspiracyOfClass
    (k : Conspiracy) (cl : Section1985ConspiracyClass) (c : ComplaintText) : Prop



axiom IsForceIntimidationOrThreat (m : CoerciveMeans) (c : ComplaintText) : Prop



axiom IsGoingInDisguiseOnHighwayOrPremises (k : Conspiracy) (c : ComplaintText) : Prop




axiom IsIntentToDenyEqualProtection (k : Conspiracy) (c : ComplaintText) : Prop




axiom IsActInFurtheranceOfConspiracy (o : OvertAct) (c : ComplaintText) : Prop



axiom IsInjuryToPersonOrProperty (n : Injury) (c : ComplaintText) : Prop




axiom IsDeprivationOfRightOrPrivilegeOfCitizen (n : Injury) (c : ComplaintText) : Prop



axiom IsOfficerOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsPartyOrWitnessInCourtOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsGrandOrPetitJuror (p : Person) (c : ComplaintText) : Prop



axiom IsCitizenLawfullyEntitledToVote (p : Person) (c : ComplaintText) : Prop



axiom IsConstitutedAuthorityOfStateOrTerritory (t : Entity) (c : ComplaintText) : Prop






axiom IsWrongMentionedInSection1985 (w : Wrong1985) (c : ComplaintText) : Prop




axiom HasKnowledgeThatWrongIsAboutToBeCommitted (p : Person) (c : ComplaintText) : Prop




axiom HasPowerToPreventOrAidInPreventing (p : Person) (c : ComplaintText) : Prop



axiom NeglectsOrRefusesToPrevent (p : Person) (c : ComplaintText) : Prop




axiom IsPreventableByReasonableDiligence (w : Wrong1985) (c : ComplaintText) : Prop




axiom IsLegalRepresentativeOfInjuredParty
    (l : LegalRepresentative) (c : ComplaintText) : Prop



axiom IsWidowOfDeceased (p : Person) (c : ComplaintText) : Prop



axiom IsNextOfKinOfDeceased (p : Person) (c : ComplaintText) : Prop






axiom IsActionToEnforceFeeEligibleStatute
    (a : Action) (s : FeeEligibleStatute) (c : ComplaintText) : Prop



axiom IsPrevailingParty (p : Person) (c : ComplaintText) : Prop



axiom IsTheUnitedStatesAsParty (p : Person) (c : ComplaintText) : Prop



axiom IsReasonableAttorneysFee (f : FeeAward) (c : ComplaintText) : Prop



axiom IsExpertFee (f : FeeAward) (c : ComplaintText) : Prop



axiom IsPartOfTheCosts (f : FeeAward) (c : ComplaintText) : Prop




axiom IsClearlyInExcessOfJudicialJurisdiction
    (o : JudicialOfficer) (c : ComplaintText) : Prop




axiom IsRuleOfDecisionOfKind
    (d : RuleOfDecision) (k : RuleOfDecisionKind) (c : ComplaintText) : Prop



axiom IsSuitableToCarryIntoEffect (d : RuleOfDecision) (c : ComplaintText) : Prop




axiom IsInconsistentWithConstitutionAndLawsOfUS
    (d : RuleOfDecision) (c : ComplaintText) : Prop





axiom IsRevisedStatutesCivilRightsJurisdiction (t : Court) (c : ComplaintText) : Prop

end Proving.USC.T42.EqualRights.Reslice.Ontology
