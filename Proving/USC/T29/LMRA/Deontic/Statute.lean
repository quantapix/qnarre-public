












import Proving.USC.Common.Types
import Proving.USC.T29.LMRA.Deontic.Types
import Proving.USC.T29.LMRA.Deontic.Predicates

namespace Proving.USC.T29.LMRA.Deontic

open Proving.USC.Common





structure Prohibition186a (p : Person) (t : ThingOfValue) (c : ComplaintText) : Prop where
  addressee   : IsEmployerSidePayor p c
  noExemption : ¬ Section186cExemptionApplies t c



def Prohibition186aViolated (p : Person) (t : ThingOfValue) (c : ComplaintText) : Prop :=
  Prohibition186a p t c ∧ PaymentActOccurred p t c




structure Prohibition186b1 (p : Person) (t : ThingOfValue) (c : ComplaintText) : Prop where
  addressee   : IsPaymentRecipient p c
  noExemption : ¬ Section186cExemptionApplies t c



def Prohibition186b1Violated (p : Person) (t : ThingOfValue) (c : ComplaintText) : Prop :=
  Prohibition186b1 p t c ∧ ReceiptActOccurred p t c




structure Prohibition187a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsLaborOrganizationAddressee p c



def Prohibition187aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition187a p c ∧ SecondaryBoycottActOccurred p c




structure Obligation174a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsBargainingParty p c



def Obligation174aBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation174a p c ∧ ¬ ReasonableEffortActOccurred p c





structure Power176 (p : Person) (d : LaborDispute) (c : ComplaintText) : Prop where
  addressee : IsPresidentAddressee p c
  condition : NationalEmergencyConditionMet d c



def Power176Exercised (p : Person) (d : LaborDispute) (c : ComplaintText) : Prop :=
  Power176 p d c ∧ BoardOfInquiryAppointed d c





structure Obligation178 (d : LaborDispute) (c : ComplaintText) : Prop where
  condition : InjunctionFindingsMet d c


def Obligation178Satisfied (d : LaborDispute) (c : ComplaintText) : Prop :=
  Obligation178 d c ∧ InjunctionIssued d c


def Obligation178Breached (d : LaborDispute) (c : ComplaintText) : Prop :=
  Obligation178 d c ∧ ¬ InjunctionIssued d c

end Proving.USC.T29.LMRA.Deontic
