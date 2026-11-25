













import Proving.USC.T42.TitleVI.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Ontology

open Proving.USC.Common




structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  dangling   : Bool





def edge_programOrActivity_dependsOn_federalAssistance : DefEdge :=
  { defined := "program or activity (§ 2000d)",
    dependsOn := "Federal financial assistance",
    citeDefine := "42 USC § 2000d", dangling := true }


def edge_prohibition_dependsOn_protectedGround : DefEdge :=
  { defined := "Title VI prohibition (§ 2000d)",
    dependsOn := "race, color, or national origin",
    citeDefine := "42 USC § 2000d", dangling := false }


def edge_prohibition_dependsOn_person : DefEdge :=
  { defined := "Title VI prohibition (§ 2000d)",
    dependsOn := "person in the United States",
    citeDefine := "42 USC § 2000d", dangling := false }




def edge_enforcement_dependsOn_recipient : DefEdge :=
  { defined := "enforcement (§ 2000d-1)",
    dependsOn := "recipient",
    citeDefine := "42 USC § 2000d-1", dangling := false }


def edge_enforcement_dependsOn_federalAgency : DefEdge :=
  { defined := "enforcement (§ 2000d-1)",
    dependsOn := "Federal department or agency",
    citeDefine := "42 USC § 2000d-1", dangling := false }



def edge_enforcement_dependsOn_prohibition : DefEdge :=
  { defined := "enforcement (§ 2000d-1)",
    dependsOn := "Title VI prohibition (§ 2000d)",
    citeDefine := "42 USC § 2000d-1", dangling := false }





def edge_remedies_dependsOn_prohibition : DefEdge :=
  { defined := "remedies equalization (§ 2000d-7)",
    dependsOn := "Title VI prohibition (§ 2000d)",
    citeDefine := "42 USC § 2000d-7", dangling := false }


def edge_remedies_dependsOn_state : DefEdge :=
  { defined := "remedies equalization (§ 2000d-7)",
    dependsOn := "State",
    citeDefine := "42 USC § 2000d-7", dangling := false }






structure CoveredProgram (x : ProgramOrActivity) (c : ComplaintText) : Prop where
  isProgram : IsProgramOrActivity x c



structure ProtectedSubject (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop where
  isPerson : IsPersonInUS p c
  isGround : IsProtectedGround g c



structure EnforcementSetting (a : FederalAgency) (r : Recipient) (c : ComplaintText) : Prop where
  isAgency    : IsFederalAgency a c
  isRecipient : IsRecipient r c



structure RemediesAgainstState (s : StateDefendant) (c : ComplaintText) : Prop where
  isState : IsStateDefendant s c

end Proving.USC.T42.TitleVI.Ontology
