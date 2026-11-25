import Proving.USC.T18.Ch73.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch73.Ontology

open Proving.USC.Common




axiom IsOfficialProceeding (p : OfficialProceeding) (c : ComplaintText) : Prop






axiom HasFederalNexus (p : OfficialProceeding) (c : ComplaintText) : Prop




axiom IsLawEnforcementOfficer (o : LawEnforcementOfficer) (c : ComplaintText) : Prop



axiom IsJudgeOfTheUnitedStates (j : JudgeOfUS) (c : ComplaintText) : Prop


axiom IsGrandOrPetitJuror (j : Juror) (c : ComplaintText) : Prop



axiom IsCourtOfficer (o : CourtOfficer) (c : ComplaintText) : Prop


axiom IsRecordDocumentOrObject (r : RecordDocumentOrObject) (c : ComplaintText) : Prop



axiom IsWitness (w : Witness) (c : ComplaintText) : Prop


axiom IsFederalOffense (f : FederalOffense) (c : ComplaintText) : Prop




axiom IsMisleadingConduct (m : MisleadingConduct) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Ontology
