




import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Reslice.Remedy.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Remedy

open Proving.USC.Common






axiom InjuryCognizable (p : Person) (c : ComplaintText) : Prop





axiom CausedByViolation (p d : Person) (c : ComplaintText) : Prop




axiom Redressable (p : Person) (c : ComplaintText) : Prop



axiom IsPrevailingParty (p : Person) (c : ComplaintText) : Prop




axiom IsCitizenOfUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom IsUnitedStatesAsParty (p : Person) (c : ComplaintText) : Prop








axiom HasPrivateRightOfAction1981 (p : Person) (c : ComplaintText) : Prop



axiom NongovernmentalImpairment1981 (d : Person) (c : ComplaintText) : Prop



axiom UnderColorOfStateLawImpairment1981 (d : Person) (c : ComplaintText) : Prop






axiom IsComplainingParty1981a (p : Person) (c : ComplaintText) : Prop





axiom IsFederalEnforcementAgencyParty1981a (p : Person) (c : ComplaintText) : Prop




axiom ActionUnderTitleVIIEnforcement1981a (p : Person) (c : ComplaintText) : Prop




axiom ActionUnderAdaOrRehabEnforcement1981a (p : Person) (c : ComplaintText) : Prop





axiom IntentionalDiscriminationNotDisparateImpact (d : Person) (c : ComplaintText) : Prop






axiom AccommodationRequirementViolated1981a (d : Person) (c : ComplaintText) : Prop




axiom CannotRecoverUnder1981 (p : Person) (c : ComplaintText) : Prop





axiom AccommodationClaimUnderAdaOrRehab1981a (c : ComplaintText) : Prop





axiom GoodFaithAccommodationEffort1981a (d : Person) (c : ComplaintText) : Prop




axiom MaliceOrRecklessIndifference (d : Person) (c : ComplaintText) : Prop




axiom RespondentIsGovernmentalEntity (d : Person) (c : ComplaintText) : Prop





axiom RespondentInCapTier1981a (d : Person) (t : CapTier) (c : ComplaintText) : Prop




axiom SeeksCompensatoryOrPunitiveDamages1981a (p : Person) (c : ComplaintText) : Prop






axiom HasPrivateRightOfAction1982 (p : Person) (c : ComplaintText) : Prop






axiom LiableToPartyInjured1983 (p d : Person) (c : ComplaintText) : Prop




axiom IsPartyInjured1983 (p : Person) (c : ComplaintText) : Prop




axiom JudicialOfficerActingJudicially (d : Person) (c : ComplaintText) : Prop



axiom DeclaratoryDecreeViolated1983 (d : Person) (c : ComplaintText) : Prop



axiom DeclaratoryReliefUnavailable1983 (p : Person) (c : ComplaintText) : Prop






axiom IsConspirator1985 (d : Person) (c : ComplaintText) : Prop





axiom OvertActInFurtherance1985 (c : ComplaintText) : Prop



axiom InjuredInPersonOrProperty1985 (p : Person) (c : ComplaintText) : Prop




axiom DeprivedOfRightOrPrivilege1985 (p : Person) (c : ComplaintText) : Prop




axiom InjuryOccasionedByConspiracy1985 (p : Person) (c : ComplaintText) : Prop







axiom KnowledgeOfImpendingSection1985Wrong1986 (d : Person) (c : ComplaintText) : Prop




axiom PowerToPreventOrAid1986 (d : Person) (c : ComplaintText) : Prop



axiom NeglectedOrRefusedToPrevent1986 (d : Person) (c : ComplaintText) : Prop




axiom WrongfulActCommitted1986 (c : ComplaintText) : Prop




axiom PreventableByReasonableDiligence1986 (d : Person) (c : ComplaintText) : Prop




axiom IsPartyInjuredOrLegalRepresentative1986 (p : Person) (c : ComplaintText) : Prop




axiom DeathCausedByWrongfulActAndNeglect1986 (c : ComplaintText) : Prop




axiom IsLegalRepresentativeOfDeceased1986 (p : Person) (c : ComplaintText) : Prop





axiom HasWidowOrNextOfKinBeneficiary1986 (c : ComplaintText) : Prop





axiom CommencedWithinOneYearOfAccrual1986 (p : Person) (c : ComplaintText) : Prop




axiom daysFromAccrualToCommencement (p : Person) (c : ComplaintText) : Nat




axiom dayCountImpliesWithinOneYear1986 (p : Person) (c : ComplaintText) :
    daysFromAccrualToCommencement p c ≤ oneYearLimitationDays →
    CommencedWithinOneYearOfAccrual1986 p c






axiom FederalLawSuitableToCarryIntoEffect1988a (c : ComplaintText) : Prop




axiom FederalLawDeficientInSuitableRemedies1988a (c : ComplaintText) : Prop





axiom StateCommonLawNotInconsistentWithFederalLaw1988a (c : ComplaintText) : Prop





axiom ActionToEnforceCoveredProvision1988b (c : ComplaintText) : Prop




axiom ActionClearlyInExcessOfJurisdiction1988b (c : ComplaintText) : Prop





axiom ActionToEnforce1981Or1981a1988c (c : ComplaintText) : Prop





axiom enforce1981Or1981aIsCovered1988b (c : ComplaintText) :
    ActionToEnforce1981Or1981a1988c c → ActionToEnforceCoveredProvision1988b c

end Proving.USC.T42.EqualRights.Reslice.Remedy
