








import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Deontic.Types
import Proving.USC.T42.TitleVI.Deontic.Predicates

namespace Proving.USC.T42.TitleVI.Deontic

open Proving.USC.Common





structure Prohibition2000d (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2000d p c
  condition : ConditionFederalAssistance2000d e c




def Prohibition2000dViolated (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition2000d p e c ∧ RegulatedActOccurred2000d p e c





structure Power2000d1 (a : Agency) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2000d1 a c



def Power2000d1Exercised (a : Agency) (c : ComplaintText) : Prop :=
  Power2000d1 a c ∧ RegulatedActOccurred2000d1 a c



structure Prohibition2000d1 (a : Agency) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2000d1 a c




def Prohibition2000d1Violated (a : Agency) (c : ComplaintText) : Prop :=
  Prohibition2000d1 a c ∧ ConditionPrematureAction2000d1 a c






structure Prohibition2000d7 (s : State) (t : Time) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2000d7 s c
  condition : ConditionAfterEffectiveDate2000d7 s t c




def Prohibition2000d7Violated (s : State) (t : Time) (c : ComplaintText) : Prop :=
  Prohibition2000d7 s t c ∧ RegulatedActOccurred2000d7 s c

end Proving.USC.T42.TitleVI.Deontic
