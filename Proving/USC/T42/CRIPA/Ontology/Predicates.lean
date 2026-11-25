












import Proving.USC.Common.Types
import Proving.USC.T42.CRIPA.Ontology.Types

namespace Proving.USC.T42.CRIPA.Ontology

open Proving.USC.Common (Person ComplaintText)






axiom IsInstitution (i : Institution) (c : ComplaintText) : Prop





axiom IsPerson (p : Person) (c : ComplaintText) : Prop




axiom IsState (s : State) (c : ComplaintText) : Prop




axiom IsLegislativeDay (d : LegislativeDay) (c : ComplaintText) : Prop






axiom IsPrisoner (p : Prisoner) (c : ComplaintText) : Prop





axiom IsEgregiousOrFlagrantConditions (x : Conditions) (c : ComplaintText) : Prop





axiom IsPatternOrPracticeOfResistance (x : PatternOrPractice) (c : ComplaintText) : Prop





axiom IsInstitutionalizedPerson (p : InstitutionalizedPerson) (c : ComplaintText) : Prop

end Proving.USC.T42.CRIPA.Ontology
