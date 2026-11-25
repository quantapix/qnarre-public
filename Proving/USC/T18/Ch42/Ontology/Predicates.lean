






import Proving.USC.T18.Ch42.Ontology.Types

namespace Proving.USC.T18.Ch42.Ontology
open Proving.USC.Common





axiom IsExtensionOfCredit (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom IsCreditor (p : Person) (c : ComplaintText) : Prop




axiom IsDebtor (p : Person) (c : ComplaintText) : Prop





axiom IsRepaymentOfExtension (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom IsCollectionOfExtension (x : ExtensionOfCredit) (c : ComplaintText) : Prop






axiom IsExtortionateExtensionOfCredit (x : ExtensionOfCredit) (c : ComplaintText) : Prop





axiom IsExtortionateMeans (m : Means) (c : ComplaintText) : Prop




axiom IsState (s : Jurisdiction) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch42.Ontology
