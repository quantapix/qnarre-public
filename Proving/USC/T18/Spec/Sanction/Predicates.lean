















import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Sanction.Types

namespace Proving.USC.T18.Spec.Sanction

open Proving.USC.Common (ComplaintText)




axiom SanctionSought (s : Sanction) (c : ComplaintText) : Prop






axiom TriggersSection1962 (c : ComplaintText) : Prop







axiom PredicateCarriesLife (c : ComplaintText) : Prop







axiom WithinForfeitureReach (c : ComplaintText) : Prop

end Proving.USC.T18.Spec.Sanction
