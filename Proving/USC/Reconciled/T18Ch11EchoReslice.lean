
















































































import Proving.USC.T18.Ch11.EchoReslice.Elements.Statute
import Proving.USC.T18.Ch11.EchoReslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common (Person ComplaintText)
open Proving.USC.T18.Ch11.EchoReslice






abbrev Section201 (c : ComplaintText) : Prop :=
  Elements.ViolatesSection201 c


abbrev Section201Bribery (c : ComplaintText) : Prop :=
  Elements.BriberyUnderSection201b c


abbrev Section201Gratuity (c : ComplaintText) : Prop :=
  Elements.GratuityUnderSection201c c





abbrev Section201PublicOfficial (p : Person) (c : ComplaintText) : Prop :=
  Ontology.PublicOfficialClass p c



abbrev Section201SelectedOfficial (p : Person) (o : Ontology.Office)
    (s : Ontology.SelectionEvent) (c : ComplaintText) : Prop :=
  Ontology.SelectedToBePublicOfficial p o s c


abbrev Section201OfficialAct (a : Ontology.DecisionOrAction) (m : Ontology.Matter)
    (p : Person) (c : ComplaintText) : Prop :=
  Ontology.OfficialAct a m p c






abbrev Section201WitnessFeeException (v : Elements.ThingOfValue)
    (pr : Elements.Proceeding) (c : ComplaintText) : Prop :=
  Elements.WitnessFeeException201d v pr c

end Proving.USC.Reconciled
