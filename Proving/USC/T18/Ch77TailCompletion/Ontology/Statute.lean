






import Proving.USC.Common.Types
import Proving.USC.T18.Ch77TailCompletion.Ontology.Types
import Proving.USC.T18.Ch77TailCompletion.Ontology.Predicates

namespace Proving.USC.T18.Ch77TailCompletion.Ontology

open Proving.USC.Common







structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  external   : Bool := false
  deriving Repr



def edge_victim_dependsOn_individual : DefEdge :=
  { defined := "victim", dependsOn := "individual harmed by a chapter crime",
    citeDefine := "18 USC § 1593(c)" }



def edge_victim_dependsOn_representative : DefEdge :=
  { defined := "victim", dependsOn := "authorized representative",
    citeDefine := "18 USC § 1593(c)" }


def edge_fullAmount_dependsOn_victim : DefEdge :=
  { defined := "full amount of the victim's losses", dependsOn := "victim",
    citeDefine := "18 USC § 1593(b)(3)" }



def edge_fullAmount_dependsOn_s2259 : DefEdge :=
  { defined := "full amount of the victim's losses",
    dependsOn := "full amount of the victim's losses (18 USC § 2259(c)(2))",
    citeDefine := "18 USC § 1593(b)(3)", external := true }



def edge_criminalAction_dependsOn_phases : DefEdge :=
  { defined := "criminal action", dependsOn := "investigation / prosecution phase",
    citeDefine := "18 USC § 1595(b)(2)" }



def edge_national_dependsOn_ina : DefEdge :=
  { defined := "national of the United States",
    dependsOn := "national of the United States (8 USC § 1101)",
    citeDefine := "18 USC § 1596(a)(1)", external := true }



def edge_lpr_dependsOn_ina : DefEdge :=
  { defined := "alien lawfully admitted for permanent residence",
    dependsOn := "alien lawfully admitted for permanent residence (8 USC § 1101)",
    citeDefine := "18 USC § 1596(a)(1)", external := true }


def defEdges : List DefEdge :=
  [ edge_victim_dependsOn_individual, edge_victim_dependsOn_representative,
    edge_fullAmount_dependsOn_victim, edge_fullAmount_dependsOn_s2259,
    edge_criminalAction_dependsOn_phases,
    edge_national_dependsOn_ina, edge_lpr_dependsOn_ina ]





inductive VictimGround (p : Person) (c : ComplaintText) : Prop where
  | direct (harm : HarmedByChapterCrime p c)
  | representative (rep : IsAuthorizedRepresentative p c) (notDef : ¬ IsNamedDefendant p c)



structure VictimMembership (p : Person) (c : ComplaintText) : Prop where
  ground : VictimGround p c
  member : IsVictim p c



structure FullAmountOfLossesMembership
    (l : VictimLosses) (v : Person) (c : ComplaintText) : Prop where
  amount      : IsFullAmountOfVictimLosses l c
  aboutVictim : IsVictim v c



inductive CriminalActionPhase (a : CriminalAction) (c : ComplaintText) : Prop where
  | investigation (h : InInvestigationPhase a c)
  | prosecution (h : InProsecutionPhase a c)



structure CriminalActionMembership (a : CriminalAction) (c : ComplaintText) : Prop where
  phase   : CriminalActionPhase a c
  pending : PendingUntilFinalAdjudication a c
  member  : IsCriminalAction a c



inductive JurisdictionalPersonClass (p : Person) (c : ComplaintText) : Prop where
  | national (h : IsNationalOfUS p c)
  | lpr (h : IsLawfulPermanentResident p c)
  | present (h : IsPresentInUS p c)

end Proving.USC.T18.Ch77TailCompletion.Ontology
