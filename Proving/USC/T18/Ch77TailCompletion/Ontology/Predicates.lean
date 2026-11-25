





import Proving.USC.Common.Types
import Proving.USC.T18.Ch77TailCompletion.Ontology.Types

namespace Proving.USC.T18.Ch77TailCompletion.Ontology

open Proving.USC.Common





axiom IsVictim (p : Person) (c : ComplaintText) : Prop



axiom HarmedByChapterCrime (p : Person) (c : ComplaintText) : Prop





axiom IsAuthorizedRepresentative (p : Person) (c : ComplaintText) : Prop



axiom IsNamedDefendant (p : Person) (c : ComplaintText) : Prop




axiom IsFullAmountOfVictimLosses (l : VictimLosses) (c : ComplaintText) : Prop




axiom IsCriminalAction (a : CriminalAction) (c : ComplaintText) : Prop



axiom InInvestigationPhase (a : CriminalAction) (c : ComplaintText) : Prop



axiom InProsecutionPhase (a : CriminalAction) (c : ComplaintText) : Prop



axiom PendingUntilFinalAdjudication (a : CriminalAction) (c : ComplaintText) : Prop



axiom IsNationalOfUS (p : Person) (c : ComplaintText) : Prop




axiom IsLawfulPermanentResident (p : Person) (c : ComplaintText) : Prop




axiom IsPresentInUS (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77TailCompletion.Ontology
