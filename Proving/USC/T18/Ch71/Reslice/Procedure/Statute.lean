import Proving.USC.T18.Ch71.Reslice.Procedure.Types
import Proving.USC.T18.Ch71.Reslice.Procedure.Predicates
import Proving.USC.Common.Types
set_option autoImplicit false








namespace Proving.USC.T18.Ch71.Reslice.Procedure

open Proving.USC.Common






def PriorOffenseEstablished1462 (p : Person) (c : ComplaintText) : Prop :=
  priorOffenseCount1462 p c ≥ 1




structure EnhancedPenalty1462 (p : Person) (c : ComplaintText) : Prop where
  offense : OffenseEstablished1462 p c
  prior   : PriorOffenseEstablished1462 p c








def QuantityThresholdMet1465 (p : Person) (c : ComplaintText) : Prop :=
  publicationCount1465 p c ≥ 2 ∨ articleCount1465 p c ≥ 2 ∨
    publicationCount1465 p c + articleCount1465 p c ≥ 5




structure PresumptionRaised1465 (p : Person) (c : ComplaintText) : Prop where
  offense  : OffenseEstablished1465 p c
  quantity : QuantityThresholdMet1465 p c



structure PresumptionStands1465 (p : Person) (c : ComplaintText) : Prop where
  raised      : PresumptionRaised1465 p c
  notRebutted : ¬ PresumptionRebutted1465 p c

end Proving.USC.T18.Ch71.Reslice.Procedure
