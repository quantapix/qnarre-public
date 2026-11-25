











import Proving.USC.T42.SchoolDesegregationAid.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.SchoolDesegregationAid.Deontic

open Proving.USC.Common




structure Power2000c2 (b : SchoolBoard) (c : ComplaintText) : Prop where
  addressee : ApplicantInClass b c
  condition : ApplicationMade b c



def Power2000c2Exercised (b : SchoolBoard) (c : ComplaintText) : Prop :=
  Power2000c2 b c ∧ TechnicalAssistanceRendered b c





def Power2000c3Exercised (c : ComplaintText) : Prop :=
  TrainingInstituteArranged c




structure Power2000c4a (b : SchoolBoard) (c : ComplaintText) : Prop where
  addressee : ApplicantInClass b c
  condition : ApplicationMade b c



def Power2000c4aExercised (b : SchoolBoard) (c : ComplaintText) : Prop :=
  Power2000c4a b c ∧ GrantMade b c



def Obligation2000c4bSatisfied (b : SchoolBoard) (c : ComplaintText) : Prop :=
  GrantMade b c ∧ GrantFactorsConsidered b c



def Obligation2000c4bBreached (b : SchoolBoard) (c : ComplaintText) : Prop :=
  GrantMade b c ∧ ¬ GrantFactorsConsidered b c





def Permission2000c5Exercised (b : SchoolBoard) (c : ComplaintText) : Prop :=
  PaymentMade b c





def Obligation2000c7Satisfied (c : ComplaintText) : Prop :=
  ActionUnderSubchapter c ∧ UnitedStatesLiableForCosts c



def Obligation2000c7Breached (c : ComplaintText) : Prop :=
  ActionUnderSubchapter c ∧ ¬ UnitedStatesLiableForCosts c






def Permission2000c9Exercised (c : ComplaintText) : Prop :=
  NonProtectedBasis c ∧ ClassificationAndAssignmentMade c

end Proving.USC.T42.SchoolDesegregationAid.Deontic
