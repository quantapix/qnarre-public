





import Proving.USC.Common.Types
import Proving.USC.T18.Ch77TailCompletion.Ontology.Types
import Proving.USC.T18.Ch77TailCompletion.Ontology.Predicates
import Proving.USC.T18.Ch77TailCompletion.Ontology.Statute

namespace Proving.USC.T18.Ch77TailCompletion.Ontology

open Proving.USC.Common


theorem victimDirect_intro {p c}
    (harm : HarmedByChapterCrime p c) (mem : IsVictim p c)
    : VictimMembership p c :=
  { ground := .direct harm, member := mem }


theorem victimRepresentative_intro {p c}
    (rep : IsAuthorizedRepresentative p c) (notDef : ¬ IsNamedDefendant p c)
    (mem : IsVictim p c)
    : VictimMembership p c :=
  { ground := .representative rep notDef, member := mem }


theorem fullAmountOfLosses_intro {l v c}
    (amount : IsFullAmountOfVictimLosses l c) (aboutVictim : IsVictim v c)
    : FullAmountOfLossesMembership l v c :=
  { amount := amount, aboutVictim := aboutVictim }


theorem criminalActionInvestigation_intro {a c}
    (inv : InInvestigationPhase a c) (pending : PendingUntilFinalAdjudication a c)
    (mem : IsCriminalAction a c)
    : CriminalActionMembership a c :=
  { phase := .investigation inv, pending := pending, member := mem }


theorem criminalActionProsecution_intro {a c}
    (pros : InProsecutionPhase a c) (pending : PendingUntilFinalAdjudication a c)
    (mem : IsCriminalAction a c)
    : CriminalActionMembership a c :=
  { phase := .prosecution pros, pending := pending, member := mem }


theorem jurisdictionalPersonNational_intro {p c}
    (h : IsNationalOfUS p c) : JurisdictionalPersonClass p c := .national h


theorem jurisdictionalPersonLpr_intro {p c}
    (h : IsLawfulPermanentResident p c) : JurisdictionalPersonClass p c := .lpr h


theorem jurisdictionalPersonPresent_intro {p c}
    (h : IsPresentInUS p c) : JurisdictionalPersonClass p c := .present h

end Proving.USC.T18.Ch77TailCompletion.Ontology
