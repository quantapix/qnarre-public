











import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.EqualRights.Reslice.Elements.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Elements

open Proving.USC.Common






axiom IsRaciallyProtectedClaimant (p : Person) (c : ComplaintText) : Prop



axiom ContractMakingImpaired (k : Contract) (c : ComplaintText) : Prop



axiom ContractPerformanceImpaired (k : Contract) (c : ComplaintText) : Prop



axiom ContractModificationImpaired (k : Contract) (c : ComplaintText) : Prop



axiom ContractTerminationImpaired (k : Contract) (c : ComplaintText) : Prop




axiom ContractualBenefitsEnjoymentImpaired (k : Contract) (c : ComplaintText) : Prop



axiom RightToSueOrGiveEvidenceDenied (r : ProtectedRight) (c : ComplaintText) : Prop




axiom FullAndEqualBenefitOfLawsDenied (r : ProtectedRight) (c : ComplaintText) : Prop




axiom SubjectedToUnlikePunishmentOrExaction (p : Person) (c : ComplaintText) : Prop




axiom DeniedRightEnjoyedByWhiteCitizens
    (p : Person) (r : ProtectedRight) (c : ComplaintText) : Prop




axiom RaceWasButForCauseOfDenial (p : Person) (c : ComplaintText) : Prop




axiom NongovernmentalDiscrimination (d : Person) (c : ComplaintText) : Prop





axiom IsCitizenOfUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsRealOrPersonalProperty (pr : PropertyInterest) (c : ComplaintText) : Prop



axiom RightToInheritPropertyDenied (pr : PropertyInterest) (c : ComplaintText) : Prop



axiom RightToPurchasePropertyDenied (pr : PropertyInterest) (c : ComplaintText) : Prop



axiom RightToLeasePropertyDenied (pr : PropertyInterest) (c : ComplaintText) : Prop



axiom RightToSellPropertyDenied (pr : PropertyInterest) (c : ComplaintText) : Prop



axiom RightToHoldPropertyDenied (pr : PropertyInterest) (c : ComplaintText) : Prop



axiom RightToConveyPropertyDenied (pr : PropertyInterest) (c : ComplaintText) : Prop




axiom DeniedPropertyRightEnjoyedByWhiteCitizens
    (p : Person) (pr : PropertyInterest) (c : ComplaintText) : Prop






axiom IsSuablePersonUnderSection1983 (d : Person) (c : ComplaintText) : Prop





axiom ActedUnderActOfCongressExclusiveToDC (d : Person) (c : ComplaintText) : Prop




axiom SubjectsOrCausesToBeSubjected (d : Person) (p : Person) (c : ComplaintText) : Prop



axiom RightSecuredByConstitution (r : ProtectedRight) (c : ComplaintText) : Prop




axiom StatuteIntendedToBenefitPlaintiff (r : ProtectedRight) (c : ComplaintText) : Prop




axiom RightNotVagueOrAmorphous (r : ProtectedRight) (c : ComplaintText) : Prop




axiom StatuteImposesMandatoryObligation (r : ProtectedRight) (c : ComplaintText) : Prop




axiom UnambiguousRightsCreatingLanguage (r : ProtectedRight) (c : ComplaintText) : Prop



axiom DeprivedOfSecuredRight
    (p : Person) (r : ProtectedRight) (c : ComplaintText) : Prop




axiom IsPartyInjured (p : Person) (c : ComplaintText) : Prop





axiom AbsoluteImmunityBarsLiability (d : Person) (c : ComplaintText) : Prop





axiom ActionAgainstJudicialOfficerInJudicialCapacity
    (d : Person) (c : ComplaintText) : Prop



axiom DeclaratoryDecreeViolated (d : Person) (c : ComplaintText) : Prop



axiom DeclaratoryReliefUnavailable (d : Person) (c : ComplaintText) : Prop






axiom ConspiracyInStateOrTerritory (ag : Agreement) (c : ComplaintText) : Prop




axiom ByForceIntimidationOrThreat (ag : Agreement) (c : ComplaintText) : Prop





axiom PreventHoldingFederalOfficeOrDuties (ag : Agreement) (c : ComplaintText) : Prop




axiom InduceFederalOfficerToLeavePost (ag : Agreement) (c : ComplaintText) : Prop




axiom InjureFederalOfficerForLawfulDischarge (ag : Agreement) (c : ComplaintText) : Prop




axiom InjureFederalOfficerPropertyToImpedeDuties
    (ag : Agreement) (c : ComplaintText) : Prop




axiom DeterFederalPartyOrWitness (ag : Agreement) (c : ComplaintText) : Prop




axiom InjureFederalPartyOrWitnessForTestifying (ag : Agreement) (c : ComplaintText) : Prop




axiom InfluenceFederalJuror (ag : Agreement) (c : ComplaintText) : Prop





axiom InjureFederalJurorForVerdict (ag : Agreement) (c : ComplaintText) : Prop





axiom ImpedeDueCourseOfJusticeInState (ag : Agreement) (c : ComplaintText) : Prop




axiom IntentToDenyEqualProtection (ag : Agreement) (c : ComplaintText) : Prop





axiom IntentToInjureForEnforcingEqualProtection (ag : Agreement) (c : ComplaintText) : Prop




axiom GoesInDisguiseOnHighwayOrPremises (ag : Agreement) (c : ComplaintText) : Prop





axiom PurposeToDepriveEqualProtectionOrPrivileges
    (ag : Agreement) (c : ComplaintText) : Prop





axiom PurposeToPreventAuthoritiesSecuringEqualProtection
    (ag : Agreement) (c : ComplaintText) : Prop





axiom PreventVoterSupportOrAdvocacyInFederalElection
    (ag : Agreement) (c : ComplaintText) : Prop




axiom InjureCitizenForVotingSupportOrAdvocacy (ag : Agreement) (c : ComplaintText) : Prop




axiom ClassBasedInvidiousAnimus (ag : Agreement) (c : ComplaintText) : Prop




axiom OvertActInFurtherance (ov : OvertAct) (ag : Agreement) (c : ComplaintText) : Prop




axiom InjuredInPersonOrProperty (p : Person) (ov : OvertAct) (c : ComplaintText) : Prop




axiom DeprivedOfCitizenRightOrPrivilege
    (p : Person) (ov : OvertAct) (c : ComplaintText) : Prop






axiom KnowledgeOfImpendingSection1985Wrong (d : Person) (c : ComplaintText) : Prop




axiom PowerToPreventOrAidInPreventing (d : Person) (c : ComplaintText) : Prop




axiom NeglectsOrRefusesToPrevent (d : Person) (c : ComplaintText) : Prop




axiom Section1985WrongfulActCommitted (ov : OvertAct) (c : ComplaintText) : Prop



axiom IsPartyInjuredOrLegalRepresentative (p : Person) (c : ComplaintText) : Prop




axiom PreventableByReasonableDiligence
    (d : Person) (ov : OvertAct) (c : ComplaintText) : Prop





axiom daysFromAccrualToCommencement (p : Person) (c : ComplaintText) : Nat




axiom DeathCausedByWrongfulActAndNeglect
    (p : Person) (ov : OvertAct) (c : ComplaintText) : Prop




axiom IsLegalRepresentativeOfDeceased (p : Person) (c : ComplaintText) : Prop



axiom DeceasedLeavesSurvivingWidow (p : Person) (c : ComplaintText) : Prop




axiom NextOfKinOfDeceasedExists (p : Person) (c : ComplaintText) : Prop




axiom deathActionDamagesSoughtDollars (c : ComplaintText) : Nat





axiom IsComplainingParty (p : Person) (c : ComplaintText) : Prop




axiom ActionUnderTitleVII706Or717 (pr : Proceeding) (c : ComplaintText) : Prop




axiom UnlawfulIntentionalDiscriminationUnderTitleVII (d : Person) (c : ComplaintText) : Prop




axiom DisparateImpactPracticeOnly (d : Person) (c : ComplaintText) : Prop




axiom CanRecoverUnderSection1981 (p : Person) (c : ComplaintText) : Prop





axiom ActionUnderRehabOrADAProcedures (pr : Proceeding) (c : ComplaintText) : Prop




axiom IntentionalDiscriminationUnderSection791 (d : Person) (c : ComplaintText) : Prop




axiom ViolatedSection791AccommodationRequirement (d : Person) (c : ComplaintText) : Prop



axiom ViolatedADASection102 (d : Person) (c : ComplaintText) : Prop



axiom ViolatedADASection102b5 (d : Person) (c : ComplaintText) : Prop




axiom AccommodationClaimAtIssue (d : Person) (c : ComplaintText) : Prop






axiom GoodFaithAccommodationEffortsDemonstrated (d : Person) (c : ComplaintText) : Prop





axiom RespondentIsGovernmentEntity (d : Person) (c : ComplaintText) : Prop




axiom ActedWithMalice (d : Person) (c : ComplaintText) : Prop





axiom RecklessIndifferenceToFederallyProtectedRights (d : Person) (c : ComplaintText) : Prop




axiom SeeksReliefAuthorizedUnderSection706g (p : Person) (c : ComplaintText) : Prop





axiom employeeCountInTwentyOrMoreWeeks (d : Person) (c : ComplaintText) : Nat





axiom compensatoryAndPunitiveSumDollars (p : Person) (c : ComplaintText) : Nat






axiom WithinCivilRightsJurisdiction (pr : Proceeding) (c : ComplaintText) : Prop




axiom FederalLawDeficientOrNotAdapted (pr : Proceeding) (c : ComplaintText) : Prop




axiom StateCommonLawSuppliesRemedy (pr : Proceeding) (c : ComplaintText) : Prop




axiom StateRuleInconsistentWithFederalLaw (pr : Proceeding) (c : ComplaintText) : Prop





axiom ActionToEnforceCoveredCivilRightsProvision (pr : Proceeding) (c : ComplaintText) : Prop



axiom IsPrevailingParty (p : Person) (c : ComplaintText) : Prop




axiom PrevailingPartyIsUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom FeeIsReasonable (pr : Proceeding) (c : ComplaintText) : Prop




axiom ActionClearlyInExcessOfJudicialJurisdiction (d : Person) (c : ComplaintText) : Prop




axiom ActionToEnforceSection1981Or1981a (pr : Proceeding) (c : ComplaintText) : Prop



axiom ExpertFeesIncurred (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T42.EqualRights.Reslice.Elements
