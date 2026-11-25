
















import Proving.USC.T18.Ch42.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch42.Elements

open Proving.USC.Common






axiom MakesExtensionOfCredit (p : Person) (cr : Credit) (c : ComplaintText) : Prop






axiom ExtensionIsExtortionate (cr : Credit) (c : ComplaintText) : Prop







axiom AdvancesMoneyOrProperty (p : Person) (c : ComplaintText) : Prop





axiom ReasonableGroundsToBelieveExtortionatePurpose (p : Person) (c : ComplaintText) : Prop






axiom ParticipatesInUseOfMeans (p : Person) (c : ComplaintText) : Prop






axiom MeansAreExtortionate (c : ComplaintText) : Prop




axiom ToCollectExtensionOfCredit (p : Person) (c : ComplaintText) : Prop




axiom ToPunishNonrepayment (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch42.Elements
