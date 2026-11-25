




import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Reslice.Remedy.Types
import Proving.USC.T42.EqualRights.Reslice.Remedy.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Remedy

open Proving.USC.Common






structure StandingChain (p d : Person) (c : ComplaintText) : Prop where
  injury         : InjuryCognizable p c
  causation      : CausedByViolation p d c
  redressability : Redressable p c






def ImpairmentReachable1981 (d : Person) (c : ComplaintText) : Prop :=
  NongovernmentalImpairment1981 d c ∨ UnderColorOfStateLawImpairment1981 d c


structure RemedyAvailable1981 (p d : Person) (c : ComplaintText) : Prop where
  privateRight : HasPrivateRightOfAction1981 p c
  reachable    : ImpairmentReachable1981 d c
  standing     : StandingChain p d c



def s1981Enforcer : Enforcer := .privateRight




def s1981Relief : List Relief :=
  [.damages, .equitableRelief, .attorneysFees, .expertFees, .costs]






def Violation1981aAdaRehab (d : Person) (c : ComplaintText) : Prop :=
  IntentionalDiscriminationNotDisparateImpact d c ∨
    AccommodationRequirementViolated1981a d c




inductive Predicate1981a (p d : Person) (c : ComplaintText) : Prop where

  | titleVII :
      ActionUnderTitleVIIEnforcement1981a p c →
      IntentionalDiscriminationNotDisparateImpact d c →
      CannotRecoverUnder1981 p c →
      Predicate1981a p d c

  | adaOrRehab :
      ActionUnderAdaOrRehabEnforcement1981a p c →
      Violation1981aAdaRehab d c →
      Predicate1981a p d c




def AccommodationGoodFaithBar1981a (d : Person) (c : ComplaintText) : Prop :=
  AccommodationClaimUnderAdaOrRehab1981a c ∧ GoodFaithAccommodationEffort1981a d c


structure CompensatoryDamagesAvailable1981a (p d : Person) (c : ComplaintText) : Prop where
  complainingParty : IsComplainingParty1981a p c
  predicate        : Predicate1981a p d c
  noGoodFaithBar   : ¬ AccommodationGoodFaithBar1981a d c




structure PunitiveDamagesAvailable1981a (p d : Person) (c : ComplaintText) : Prop where
  compensatoryBase : CompensatoryDamagesAvailable1981a p d c
  malice           : MaliceOrRecklessIndifference d c
  notGovernment    : ¬ RespondentIsGovernmentalEntity d c



structure CappedRecovery1981a (p d : Person) (t : CapTier) (c : ComplaintText) : Prop where
  award : CompensatoryDamagesAvailable1981a p d c
  tier  : RespondentInCapTier1981a d t c



structure JuryTrialRight1981a (p : Person) (c : ComplaintText) : Prop where
  damagesSought : SeeksCompensatoryOrPunitiveDamages1981a p c



def s1981aEnforcer : Enforcer := .mixed



def s1981aRelief : List Relief :=
  [.compensatoryDamages, .punitiveDamages, .attorneysFees, .expertFees, .costs]




def s1981aExcludedFromCompensatory : List Relief :=
  [.backpay, .interestOnBackpay, .section706gRelief]





structure RemedyAvailable1982 (p d : Person) (c : ComplaintText) : Prop where
  privateRight : HasPrivateRightOfAction1982 p c
  citizen      : IsCitizenOfUnitedStates p c
  standing     : StandingChain p d c



def s1982Enforcer : Enforcer := .privateRight



def s1982Relief : List Relief :=
  [.damages, .equitableRelief, .attorneysFees, .costs]






structure RemedyAvailable1983 (p d : Person) (c : ComplaintText) : Prop where
  liability : LiableToPartyInjured1983 p d c
  injured   : IsPartyInjured1983 p c
  standing  : StandingChain p d c




def JudicialOfficerEscape1983 (p d : Person) (c : ComplaintText) : Prop :=
  DeclaratoryDecreeViolated1983 d c ∨ DeclaratoryReliefUnavailable1983 p c





structure InjunctiveReliefAvailable1983 (p d : Person) (c : ComplaintText) : Prop where
  base      : RemedyAvailable1983 p d c
  notBarred : ¬ JudicialOfficerActingJudicially d c ∨ JudicialOfficerEscape1983 p d c


inductive Relief1983Route (p d : Person) (c : ComplaintText) : Prop where

  | atLaw : RemedyAvailable1983 p d c → Relief1983Route p d c

  | injunctive : InjunctiveReliefAvailable1983 p d c → Relief1983Route p d c


  | otherProceeding : RemedyAvailable1983 p d c → Relief1983Route p d c


def s1983Enforcer : Enforcer := .privateRight




def s1983Relief : List Relief :=
  [.damages, .equitableRelief, .injunction, .declaratoryRelief,
   .otherProperProceeding, .attorneysFees, .costs]






def CognizableHarm1985 (p : Person) (c : ComplaintText) : Prop :=
  InjuredInPersonOrProperty1985 p c ∨ DeprivedOfRightOrPrivilege1985 p c




structure RemedyAvailable1985 (p d : Person) (c : ComplaintText) : Prop where
  conspirator : IsConspirator1985 d c
  overtAct    : OvertActInFurtherance1985 c
  harm        : CognizableHarm1985 p c
  occasioned  : InjuryOccasionedByConspiracy1985 p c



def s1985Enforcer : Enforcer := .privateRight




def s1985Relief : List Relief := [.damages, .attorneysFees, .costs]





def WithinOneYearByDayCount1986 (p : Person) (c : ComplaintText) : Prop :=
  daysFromAccrualToCommencement p c ≤ oneYearLimitationDays





structure RemedyAvailable1986 (p d : Person) (c : ComplaintText) : Prop where
  knowledge   : KnowledgeOfImpendingSection1985Wrong1986 d c
  power       : PowerToPreventOrAid1986 d c
  neglect     : NeglectedOrRefusedToPrevent1986 d c
  wrongDone   : WrongfulActCommitted1986 c
  injured     : IsPartyInjuredOrLegalRepresentative1986 p c
  preventable : PreventableByReasonableDiligence1986 d c
  timely      : CommencedWithinOneYearOfAccrual1986 p c



structure WrongfulDeathRecovery1986 (p d : Person) (c : ComplaintText) : Prop where
  base          : RemedyAvailable1986 p d c
  death         : DeathCausedByWrongfulActAndNeglect1986 c
  repOfDeceased : IsLegalRepresentativeOfDeceased1986 p c
  beneficiary   : HasWidowOrNextOfKinBeneficiary1986 c


def s1986Enforcer : Enforcer := .privateRight





def s1986Relief : List Relief :=
  [.damages, .wrongfulDeathDamages, .attorneysFees, .costs]






inductive RemedialLawSource1988a (c : ComplaintText) : Prop where

  | federal : FederalLawSuitableToCarryIntoEffect1988a c → RemedialLawSource1988a c


  | stateGapFill :
      FederalLawDeficientInSuitableRemedies1988a c →
      StateCommonLawNotInconsistentWithFederalLaw1988a c →
      RemedialLawSource1988a c






structure AttorneysFeeAvailable1988b (p d : Person) (c : ComplaintText) : Prop where
  enforcingCovered : ActionToEnforceCoveredProvision1988b c
  prevailing       : IsPrevailingParty p c
  notUnitedStates  : ¬ IsUnitedStatesAsParty p c
  notImmuneOfficer :
    ¬ JudicialOfficerActingJudicially d c ∨ ActionClearlyInExcessOfJurisdiction1988b c



structure ExpertFeesIncludable1988c (p d : Person) (c : ComplaintText) : Prop where
  feeAward   : AttorneysFeeAvailable1988b p d c
  underlying : ActionToEnforce1981Or1981a1988c c




def s1988Enforcer : Enforcer := .privateRight



def s1988Relief : List Relief := [.attorneysFees, .expertFees, .costs]


def s1988bCoveredProvisions : List String :=
  ["42 USC § 1981", "42 USC § 1981a", "42 USC § 1982", "42 USC § 1983",
   "42 USC § 1985", "42 USC § 1986",
   "title IX of Public Law 92-318 (20 USC § 1681 et seq.)",
   "Religious Freedom Restoration Act of 1993 (42 USC § 2000bb et seq.)",
   "Religious Land Use and Institutionalized Persons Act of 2000 (42 USC § 2000cc et seq.)",
   "title VI of the Civil Rights Act of 1964 (42 USC § 2000d et seq.)",
   "34 USC § 12361"]



def s1988cCoveredProvisions : List String :=
  ["42 USC § 1981", "42 USC § 1981a"]

end Proving.USC.T42.EqualRights.Reslice.Remedy
