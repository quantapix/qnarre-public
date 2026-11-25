










import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Tail.Deontic.Types
import Proving.USC.T42.Ch21Tail.Deontic.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21Tail.Deontic

open Proving.USC.Common






def modality1997d : Modality := Modality.prohibition


def force1997d : NormForce := NormForce.binding





structure Prohibition1997d (p : Person) (r : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeInClass1997d p c

  protectedReport : ProtectedReportMade r c


  reportedConditionsQualify : ConditionsMayConstituteSubchapterViolation c



def Prohibition1997dViolated (p : Person) (r : Person) (c : ComplaintText) : Prop :=
  Prohibition1997d p r c ∧ RetaliationOccurred p r c ∧ RetaliationForSoReporting p r c






def modality1997gCorrection : Modality := Modality.obligation




def force1997gCorrection : NormForce := NormForce.precatory


structure Obligation1997gCorrection
    (a : Entity) (i : Institution) (c : ComplaintText) : Prop where

  addressee : AddresseeInClass1997g a c

  coveredInstitution : InstitutionCoveredBySubchapter i c


  conditionsObtain : DeplorableConditionsDepriveRights i c



def Obligation1997gCorrectionBreached
    (a : Entity) (i : Institution) (c : ComplaintText) : Prop :=
  Obligation1997gCorrection a i c ∧ ¬ VoluntaryGoodFaithCorrectionUndertaken a i c


def Obligation1997gCorrectionFulfilled
    (a : Entity) (i : Institution) (c : ComplaintText) : Prop :=
  Obligation1997gCorrection a i c ∧ VoluntaryGoodFaithCorrectionUndertaken a i c





def modality1997gPriority : Modality := Modality.obligation


def force1997gPriority : NormForce := NormForce.precatory


structure Obligation1997gPriority
    (a : Entity) (i : Institution) (c : ComplaintText) : Prop where

  addressee : AddresseeInClass1997g a c

  coveredInstitution : InstitutionCoveredBySubchapter i c


  conditionsObtain : DeplorableConditionsDepriveRights i c


  fundsAvailable : FederalFundsAvailableForImprovement i c



def Obligation1997gPriorityBreached
    (a : Entity) (i : Institution) (c : ComplaintText) : Prop :=
  Obligation1997gPriority a i c ∧ ¬ PriorityGivenToConditionCorrection a i c


def Obligation1997gPriorityFulfilled
    (a : Entity) (i : Institution) (c : ComplaintText) : Prop :=
  Obligation1997gPriority a i c ∧ PriorityGivenToConditionCorrection a i c







def modality1997gNoRedirection : Modality := Modality.permission


def force1997gNoRedirection : NormForce := NormForce.binding




structure Permission1997gNoRedirection (a : Entity) (c : ComplaintText) : Prop where

  addressee : AddresseeInClass1997g a c




def Permission1997gNoRedirectionExercised (a : Entity) (c : ComplaintText) : Prop :=
  Permission1997gNoRedirection a c ∧ DeclinesFundRedirection a c

end Proving.USC.T42.Ch21Tail.Deontic
