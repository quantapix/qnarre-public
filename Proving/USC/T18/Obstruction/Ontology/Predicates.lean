














import Proving.USC.T18.Obstruction.Ontology.Types

namespace Proving.USC.T18.Obstruction.Ontology

open Proving.USC.Common (ComplaintText Person Time)





axiom IsOfficialProceeding (op : OfficialProceeding) (c : ComplaintText) : Prop





axiom IsLawEnforcementOfficer (o : LawEnforcementOfficer) (c : ComplaintText) : Prop





axiom IsCourtPersonnel (cp : CourtPersonnel) (c : ComplaintText) : Prop





axiom IsWitness (w : Witness) (c : ComplaintText) : Prop




axiom IsEvidentiaryObject (r : EvidentiaryObject) (c : ComplaintText) : Prop






axiom IsFederalOffense (fo : FederalOffense) (c : ComplaintText) : Prop





axiom IsDueAdministrationOfJustice (j : DueAdministrationOfJustice) (c : ComplaintText) : Prop







axiom HasObstructionNexus (c : ComplaintText) : Prop

end Proving.USC.T18.Obstruction.Ontology
