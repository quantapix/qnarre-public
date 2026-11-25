










import Proving.USC.T42.TitleVI.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Ontology

open Proving.USC.Common




axiom IsProgramOrActivity (x : ProgramOrActivity) (c : ComplaintText) : Prop




axiom IsPersonInUS (p : Person) (c : ComplaintText) : Prop




axiom IsProtectedGround (g : ProtectedGround) (c : ComplaintText) : Prop






axiom IsRecipient (r : Recipient) (c : ComplaintText) : Prop




axiom IsFederalAgency (a : FederalAgency) (c : ComplaintText) : Prop




axiom IsStateDefendant (s : StateDefendant) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVI.Ontology
