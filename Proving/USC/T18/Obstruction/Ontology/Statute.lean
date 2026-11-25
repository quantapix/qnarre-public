















import Proving.USC.T18.Obstruction.Ontology.Predicates

namespace Proving.USC.T18.Obstruction.Ontology

open Proving.USC.Common (ComplaintText Person Time)





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_witness_dependsOn_proceeding : DefEdge :=
  { defined := "witness", dependsOn := "official proceeding",
    citeDefine := "18 USC § 1512(a)(2)(A)" }



def edge_informant_dependsOn_officer : DefEdge :=
  { defined := "informant communication", dependsOn := "law enforcement officer",
    citeDefine := "18 USC § 1512(a)(1)(C)" }



def edge_informant_dependsOn_offense : DefEdge :=
  { defined := "informant communication", dependsOn := "Federal offense",
    citeDefine := "18 USC § 1512(a)(1)(C)" }



def edge_documentTampering_dependsOn_object : DefEdge :=
  { defined := "documentary tampering", dependsOn := "record, document, or other object",
    citeDefine := "18 USC § 1512(b)(2)(A)" }



def edge_residualObstruction_dependsOn_proceeding : DefEdge :=
  { defined := "residual obstruction", dependsOn := "official proceeding",
    citeDefine := "18 USC § 1512(c)(2)" }



def edge_dueAdmin_dependsOn_courtPersonnel : DefEdge :=
  { defined := "due administration of justice", dependsOn := "court personnel",
    citeDefine := "18 USC § 1503(a)" }



def edge_retaliation_dependsOn_witness : DefEdge :=
  { defined := "retaliation object", dependsOn := "witness",
    citeDefine := "18 USC § 1513(a)(1)(A)" }


def definitionalEdges : List DefEdge :=
  [ edge_witness_dependsOn_proceeding,
    edge_informant_dependsOn_officer,
    edge_informant_dependsOn_offense,
    edge_documentTampering_dependsOn_object,
    edge_residualObstruction_dependsOn_proceeding,
    edge_dueAdmin_dependsOn_courtPersonnel,
    edge_retaliation_dependsOn_witness ]











structure Section1503Object (cp : CourtPersonnel) (j : DueAdministrationOfJustice)
    (c : ComplaintText) : Prop where
  personnel : IsCourtPersonnel cp c
  justice   : IsDueAdministrationOfJustice j c
  nexus     : HasObstructionNexus c




structure Section1512WitnessObject (op : OfficialProceeding) (w : Witness)
    (c : ComplaintText) : Prop where
  proceeding : IsOfficialProceeding op c
  witness    : IsWitness w c
  nexus      : HasObstructionNexus c




structure Section1512InformantObject (o : LawEnforcementOfficer) (fo : FederalOffense)
    (c : ComplaintText) : Prop where
  officer  : IsLawEnforcementOfficer o c
  offense  : IsFederalOffense fo c
  nexus    : HasObstructionNexus c




structure Section1512DocumentObject (r : EvidentiaryObject) (op : OfficialProceeding)
    (c : ComplaintText) : Prop where
  object     : IsEvidentiaryObject r c
  proceeding : IsOfficialProceeding op c
  nexus      : HasObstructionNexus c




structure Section1513Object (w : Witness) (op : OfficialProceeding)
    (c : ComplaintText) : Prop where
  witness    : IsWitness w c
  proceeding : IsOfficialProceeding op c
  nexus      : HasObstructionNexus c







inductive Chapter73ObstructionObject (c : ComplaintText) : Prop
  | officerOrJuror   {cp j}   (h : Section1503Object cp j c)        : Chapter73ObstructionObject c
  | witnessTampering {op w}   (h : Section1512WitnessObject op w c) : Chapter73ObstructionObject c
  | informant        {o fo}   (h : Section1512InformantObject o fo c) : Chapter73ObstructionObject c
  | documentTampering {r op}  (h : Section1512DocumentObject r op c)  : Chapter73ObstructionObject c
  | retaliation      {w op}   (h : Section1513Object w op c)        : Chapter73ObstructionObject c

end Proving.USC.T18.Obstruction.Ontology
