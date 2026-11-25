









import Proving.USC.T18.Ch71.Reslice.Elements.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Elements

open Proving.USC.Common





structure MillerObscene (m : ObsceneMatter) (c : ComplaintText) : Prop where
  prurient  : AppealsToPrurientInterest m c
  offensive : DepictsSexualConductPatentlyOffensively m c
  noValue   : LacksSeriousValue m c



abbrev MatterIsObscene (m : ObsceneMatter) (c : ComplaintText) : Prop := MillerObscene m c






inductive ProhibitedTransportOrReceipt1462
    (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop where
  | importation (h : BringsObsceneMatterIntoUS p m c)
  | carriage    (h : UsesCarrierForInterstateCarriage p m c)
  | receipt     (h : KnowinglyReceivesFromCarrier p m c)




structure Section1462 (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop where
  obscene  : MatterIsObscene m c
  scienter : KnowsObsceneCharacter p m c
  conduct  : ProhibitedTransportOrReceipt1462 p m c





inductive ProductionOrTransport1465
    (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop where
  | production (h : ProducesWithIntentToTransport p m c)
  | transport  (h : TransportsOrUsesInterstateCommerceFacility p m c)





structure Section1465 (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop where
  obscene  : MatterIsObscene m c
  scienter : KnowsObsceneCharacter p m c
  purpose  : ForPurposeOfSaleOrDistribution p m c
  commerce : AffectsInterstateOrForeignCommerce m c
  conduct  : ProductionOrTransport1465 p m c

end Proving.USC.T18.Ch71.Reslice.Elements
