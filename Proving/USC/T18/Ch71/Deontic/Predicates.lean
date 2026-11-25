import Proving.USC.Common.Types
import Proving.USC.T18.Ch71.Deontic.Types











set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Deontic

open Proving.USC.Common





axiom AddresseeAnyPerson (p : Person) (c : ComplaintText) : Prop





axiom AffectsInterstateOrForeignCommerce (p : Person) (c : ComplaintText) : Prop





axiom IsNonmailableMatter1461 (m : Matter) (c : ComplaintText) : Prop




axiom KnowinglyMailsNonmailable1461 (p : Person) (m : Matter) (c : ComplaintText) : Prop





axiom IsObsceneMatter1462 (m : Matter) (c : ComplaintText) : Prop




axiom ImportsOrTransportsObscene1462 (p : Person) (m : Matter) (c : ComplaintText) : Prop






axiom IsIndecentWrapperMatter1463 (m : Matter) (c : ComplaintText) : Prop




axiom KnowinglyDepositsWrapper1463 (p : Person) (m : Matter) (c : ComplaintText) : Prop




axiom IsObsceneOrProfaneLanguage1464 (m : Matter) (c : ComplaintText) : Prop


axiom UttersByRadio1464 (p : Person) (m : Matter) (c : ComplaintText) : Prop





axiom IsObsceneMatter1465 (m : Matter) (c : ComplaintText) : Prop




axiom ProducesOrTransportsForDistribution1465 (p : Person) (m : Matter) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch71.Deontic
