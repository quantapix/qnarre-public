








import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Deontic.Types

namespace Proving.USC.T42.TitleVI.Deontic

open Proving.USC.Common










axiom AddresseeInClass2000d (p : Person) (c : ComplaintText) : Prop






axiom RegulatedActOccurred2000d (p : Person) (e : Entity) (c : ComplaintText) : Prop






axiom ConditionFederalAssistance2000d (e : Entity) (c : ComplaintText) : Prop













axiom AddresseeInClass2000d1 (a : Agency) (c : ComplaintText) : Prop





axiom RegulatedActOccurred2000d1 (a : Agency) (c : ComplaintText) : Prop








axiom ConditionPrematureAction2000d1 (a : Agency) (c : ComplaintText) : Prop













axiom AddresseeInClass2000d7 (s : State) (c : ComplaintText) : Prop





axiom RegulatedActOccurred2000d7 (s : State) (c : ComplaintText) : Prop







axiom ConditionAfterEffectiveDate2000d7 (s : State) (t : Time) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVI.Deontic
