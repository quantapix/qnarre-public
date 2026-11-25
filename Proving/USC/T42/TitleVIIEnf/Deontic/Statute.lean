












import Proving.USC.T42.TitleVIIEnf.Deontic.Types
import Proving.USC.T42.TitleVIIEnf.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Deontic

open Proving.USC.Common





structure Obligation2000e5b (com : Commission) (c : ComplaintText) : Prop where
  condition : ChargeFiled c



def Obligation2000e5b_Breached (com : Commission) (c : ComplaintText) : Prop :=
  Obligation2000e5b com c ∧ ¬ CommissionServedAndInvestigated com c





structure Obligation2000e5e (c : ComplaintText) : Prop where
  condition : ChargeFiled c



def Obligation2000e5e_Breached (c : ComplaintText) : Prop :=
  Obligation2000e5e c ∧ ¬ ChargeTimelyFiled c





structure ProhibitionDisclosure (p : Person) (c : ComplaintText) : Prop where
  addressee : DisclosureAddresseeInClass p c



def ProhibitionDisclosure_Violated (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionDisclosure p c ∧ MadeProtectedInfoPublic p c





structure Obligation2000e8c (e : Entity) (c : ComplaintText) : Prop where
  condition : IsCoveredRecordKeeper e c



def Obligation2000e8c_Breached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation2000e8c e c ∧ ¬ RecordsMaintained e c





structure Prohibition2000e16a (a : FederalAgency) (c : ComplaintText) : Prop where
  addressee : IsCoveredFederalAgency a c
  condition : PersonnelActionTaken a c



def Prohibition2000e16a_Violated (a : FederalAgency) (c : ComplaintText) : Prop :=
  Prohibition2000e16a a c ∧ PersonnelActionDiscriminatory a c





structure PowerCommission (com : Commission) (c : ComplaintText) : Prop where
  exercised : CommissionPowerExercised com c





structure Permission2000e6a (c : ComplaintText) : Prop where
  condition : AgReasonableCausePattern c

end Proving.USC.T42.TitleVIIEnf.Deontic
