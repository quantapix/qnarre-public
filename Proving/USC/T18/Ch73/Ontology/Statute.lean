import Proving.USC.T18.Ch73.Ontology.Types
import Proving.USC.T18.Ch73.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false


















namespace Proving.USC.T18.Ch73.Ontology

open Proving.USC.Common




structure DefEdge where
  defined        : String
  dependsOn      : String
  citeDefine     : String
  danglingTarget : Bool
  deriving Repr


inductive JurorKind
  | grand
  | petit
  deriving Repr, DecidableEq



inductive EvidenceItemKind
  | record
  | document
  | otherObject
  deriving Repr, DecidableEq




structure FederalOfficialProceeding (p : OfficialProceeding) (c : ComplaintText) : Prop where
  proceeding  : IsOfficialProceeding p c
  federalNexus : HasFederalNexus p c




structure WitnessInProceeding (w : Witness) (p : OfficialProceeding) (c : ComplaintText) : Prop where
  witness    : IsWitness w c
  proceeding : IsOfficialProceeding p c



inductive Section1503Protectee (c : ComplaintText) : Type
  | asCourtOfficer (o : CourtOfficer) (h : IsCourtOfficer o c)
  | asJuror        (j : Juror)        (h : IsGrandOrPetitJuror j c)










def edge_s1503_juror : DefEdge :=
  { defined := "18 USC § 1503", dependsOn := "grand or petit juror",
    citeDefine := "18 USC § 1503", danglingTarget := false }


def edge_s1503_courtOfficer : DefEdge :=
  { defined := "18 USC § 1503", dependsOn := "officer of a court of the United States",
    citeDefine := "18 USC § 1503", danglingTarget := false }


def edge_s1512_officialProceeding : DefEdge :=
  { defined := "18 USC § 1512", dependsOn := "official proceeding",
    citeDefine := "18 USC § 1512", danglingTarget := false }


def edge_s1512_lawEnforcementOfficer : DefEdge :=
  { defined := "18 USC § 1512", dependsOn := "law enforcement officer",
    citeDefine := "18 USC § 1512", danglingTarget := false }


def edge_s1512_evidenceItem : DefEdge :=
  { defined := "18 USC § 1512", dependsOn := "record, document, or other object",
    citeDefine := "18 USC § 1512", danglingTarget := false }


def edge_s1512_misleadingConduct : DefEdge :=
  { defined := "18 USC § 1512(b)", dependsOn := "misleading conduct",
    citeDefine := "18 USC § 1512", danglingTarget := false }


def edge_s1513_officialProceeding : DefEdge :=
  { defined := "18 USC § 1513", dependsOn := "official proceeding",
    citeDefine := "18 USC § 1513", danglingTarget := false }


def edge_s1513_witness : DefEdge :=
  { defined := "18 USC § 1513", dependsOn := "witness",
    citeDefine := "18 USC § 1513", danglingTarget := false }


def edge_s1513_federalOffense : DefEdge :=
  { defined := "18 USC § 1513", dependsOn := "Federal offense",
    citeDefine := "18 USC § 1513", danglingTarget := false }




def edge_officialProceeding_defn : DefEdge :=
  { defined := "official proceeding", dependsOn := "ch. 73 definitions (§ 1515, out of slice)",
    citeDefine := "18 USC § 1515", danglingTarget := true }



def edge_lawEnforcementOfficer_defn : DefEdge :=
  { defined := "law enforcement officer", dependsOn := "ch. 73 definitions (§ 1515, out of slice)",
    citeDefine := "18 USC § 1515", danglingTarget := true }



def edge_misleadingConduct_defn : DefEdge :=
  { defined := "misleading conduct", dependsOn := "ch. 73 definitions (§ 1515, out of slice)",
    citeDefine := "18 USC § 1515", danglingTarget := true }


def defEdges : List DefEdge :=
  [ edge_s1503_juror, edge_s1503_courtOfficer,
    edge_s1512_officialProceeding, edge_s1512_lawEnforcementOfficer,
    edge_s1512_evidenceItem, edge_s1512_misleadingConduct,
    edge_s1513_officialProceeding, edge_s1513_witness, edge_s1513_federalOffense,
    edge_officialProceeding_defn, edge_lawEnforcementOfficer_defn,
    edge_misleadingConduct_defn ]

end Proving.USC.T18.Ch73.Ontology
