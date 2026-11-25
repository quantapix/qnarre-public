




































import Proving.USC.T18.Ch75.Elements.Theorems

namespace Proving.USC.Reconciled.T18Ch75
open Proving.USC.Common



export Proving.USC.T18.Ch75.Elements
  (Section1542 Section1543 Section1544 Section1546 ValidPassportOrVisaFraudCharge)




abbrev ValidCh75DocumentFraudCharge
    (p : Person) (pp : Proving.USC.T18.Ch75.Elements.Passport)
    (d : Proving.USC.T18.Ch75.Elements.EntryDocument) (c : ComplaintText) : Prop :=
  Proving.USC.T18.Ch75.Elements.ValidPassportOrVisaFraudCharge p pp d c


theorem validCh75_of_s1542
    {p pp d c} (h : Proving.USC.T18.Ch75.Elements.Section1542 p pp c) :
    ValidCh75DocumentFraudCharge p pp d c := .s1542 h


theorem validCh75_of_s1543
    {p pp d c} (h : Proving.USC.T18.Ch75.Elements.Section1543 p pp c) :
    ValidCh75DocumentFraudCharge p pp d c := .s1543 h


theorem validCh75_of_s1544
    {p pp d c} (h : Proving.USC.T18.Ch75.Elements.Section1544 p pp c) :
    ValidCh75DocumentFraudCharge p pp d c := .s1544 h


theorem validCh75_of_s1546
    {p pp d c} (h : Proving.USC.T18.Ch75.Elements.Section1546 p d c) :
    ValidCh75DocumentFraudCharge p pp d c := .s1546 h

end Proving.USC.Reconciled.T18Ch75
