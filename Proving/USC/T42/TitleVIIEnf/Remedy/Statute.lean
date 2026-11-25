









import Proving.USC.T42.TitleVIIEnf.Remedy.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Remedy

open Proving.USC.Common








structure StandingTitleVII (p : Person) (c : ComplaintText) : Prop where
  privateRight : HasPrivateRightOfAction p c
  aggrieved    : IsAggrievedPerson p c
  exhausted    : ExhaustedAdministrativeRemedies p c
  timely       : ChargeTimelyFiled p c
  causation    : ProximateCause p c







structure Remedy2000e5g (p : Person) (c : ComplaintText) : Prop where
  standing      : StandingTitleVII p c
  violation     : IntentionalViolationFound p c
  redressable   : ReliefRedressable p c
  noRelianceBar : ¬ GoodFaithRelianceDefense p c







structure RemedyPatternPractice (p : Person) (c : ComplaintText) : Prop where
  pattern    : PatternOrPracticePleaded p c
  redressable : ReliefRedressable p c







structure RemedyAgencyEnforcement (e : Entity) (p : Person) (c : ComplaintText) : Prop where
  authority : CommissionEnforcementAuthority e c
  charge    : ChargeTimelyFiled p c







inductive TitleVIIEnforcer (p : Person) (c : ComplaintText) : Prop

  | privateAction (h : StandingTitleVII p c)

  | publicAction (h : PatternOrPracticePleaded p c)





def s2000e5Enforcer : Enforcer := .mixed






def s2000e5GovernmentEnforcer : Enforcer := .mixed


def s2000e6Enforcer : Enforcer := .mixed


def s2000e4Enforcer : Enforcer := .agencyOnly


def s2000e8eEnforcer : Enforcer := .criminal



def s2000e5gRelief : List Relief :=
  [.injunction, .reinstatement, .hiring, .backPay, .equitableRelief]



def s2000e5g2bRelief : List Relief :=
  [.declaratory, .injunction, .attorneysFees]



def s2000e5kRelief : List Relief := [.attorneysFees, .expertFees]


def s2000e6Relief : List Relief := [.preliminaryInjunction, .injunction]


def s2000e8Relief : List Relief := [.complianceOrder]



def s2000e8eRelief : List Relief := [.criminalFine, .imprisonment]

end Proving.USC.T42.TitleVIIEnf.Remedy
