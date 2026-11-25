









import Proving.USC.T18.Ch77.Ontology.Types
import Proving.USC.T18.Ch77.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  dangling   : Bool


def edge_coercion_seriousHarm : DefEdge :=
  { defined := "coercion", dependsOn := "serious harm",
    citeDefine := "18 USC § 1591(e)(2)", dangling := false }


def edge_coercion_physicalRestraint : DefEdge :=
  { defined := "coercion", dependsOn := "physical restraint",
    citeDefine := "18 USC § 1591(e)(2)", dangling := true }



def edge_coercion_abuseOfLegalProcess : DefEdge :=
  { defined := "coercion", dependsOn := "abuse or threatened abuse of law or legal process",
    citeDefine := "18 USC § 1591(e)(2)", dangling := false }


def edge_participation_venture : DefEdge :=
  { defined := "participation in a venture", dependsOn := "venture",
    citeDefine := "18 USC § 1591(e)(4)", dangling := false }


def edge_participation_s1591a1 : DefEdge :=
  { defined := "participation in a venture", dependsOn := "18 USC § 1591(a)(1) violation",
    citeDefine := "18 USC § 1591(e)(4)", dangling := true }


def edge_venture_person : DefEdge :=
  { defined := "venture", dependsOn := "person (two or more individuals)",
    citeDefine := "18 USC § 1591(e)(6)", dangling := false }


def edge_commercialSexAct_thingOfValue : DefEdge :=
  { defined := "commercial sex act", dependsOn := "anything of value",
    citeDefine := "18 USC § 1591(e)(3)", dangling := true }


def edge_forcedLabor_seriousHarm : DefEdge :=
  { defined := "forced labor", dependsOn := "serious harm",
    citeDefine := "18 USC § 1589(a)(2)", dangling := false }



def edge_forcedLabor_abuseOfLegalProcess : DefEdge :=
  { defined := "forced labor", dependsOn := "abuse or threatened abuse of law or legal process",
    citeDefine := "18 USC § 1589(a)(3)", dangling := false }


def edge_forcedLabor_physicalRestraint : DefEdge :=
  { defined := "forced labor", dependsOn := "physical restraint",
    citeDefine := "18 USC § 1589(a)(1)", dangling := true }



def edge_abuseOfLegalProcess_lawOrProcess : DefEdge :=
  { defined := "abuse or threatened abuse of law or legal process",
    dependsOn := "law or legal process",
    citeDefine := "18 USC § 1589(c)(1)", dangling := true }


def edge_peonage_dangling : DefEdge :=
  { defined := "peonage", dependsOn := "(judicial definition — outside slice)",
    citeDefine := "18 USC § 1581", dangling := true }


def edge_involuntaryServitude_dangling : DefEdge :=
  { defined := "involuntary servitude", dependsOn := "(18 USC § 1584 / amend. XIII — outside slice)",
    citeDefine := "18 USC § 1583", dangling := true }


def edge_slavery_dangling : DefEdge :=
  { defined := "slavery", dependsOn := "(amend. XIII — outside slice)",
    citeDefine := "18 USC § 1583", dangling := true }


def edge_s1592_severeTrafficking : DefEdge :=
  { defined := "18 USC § 1592 document offense",
    dependsOn := "severe form of trafficking in persons",
    citeDefine := "18 USC § 1592(a)(3)", dangling := false }


def edge_severeTrafficking_dangling : DefEdge :=
  { defined := "severe form of trafficking in persons",
    dependsOn := "(22 USC § 7102 / TVPA § 103 — outside slice)",
    citeDefine := "18 USC § 1592(a)(3)", dangling := true }


def edge_s1592_govIdDocument : DefEdge :=
  { defined := "18 USC § 1592 document offense",
    dependsOn := "government identification document",
    citeDefine := "18 USC § 1592(a)", dangling := true }


def defEdges : List DefEdge :=
  [ edge_coercion_seriousHarm, edge_coercion_physicalRestraint,
    edge_coercion_abuseOfLegalProcess, edge_participation_venture,
    edge_participation_s1591a1, edge_venture_person,
    edge_commercialSexAct_thingOfValue, edge_forcedLabor_seriousHarm,
    edge_forcedLabor_abuseOfLegalProcess, edge_forcedLabor_physicalRestraint,
    edge_abuseOfLegalProcess_lawOrProcess, edge_peonage_dangling,
    edge_involuntaryServitude_dangling, edge_slavery_dangling,
    edge_s1592_severeTrafficking, edge_severeTrafficking_dangling,
    edge_s1592_govIdDocument ]






inductive CoercionMembership (co : Coercion) (c : ComplaintText) : Prop where

  | seriousHarmOrRestraint (h : IsCoercion co c) : CoercionMembership co c


  | schemeToInduceBelief (h : IsCoercion co c) : CoercionMembership co c

  | legalProcessAbuse (h : IsCoercion co c) : CoercionMembership co c


inductive ForcedLaborMeans (fl : ForcedLabor) (c : ComplaintText) : Prop where

  | forceOrRestraint (h : IsForcedLabor fl c) : ForcedLaborMeans fl c

  | seriousHarm (h : IsForcedLabor fl c) : ForcedLaborMeans fl c

  | legalProcessAbuse (h : IsForcedLabor fl c) : ForcedLaborMeans fl c


  | schemePattern (h : IsForcedLabor fl c) : ForcedLaborMeans fl c




structure VentureMembership (v : Venture) (c : ComplaintText) : Prop where
  isVenture : IsVenture v c




structure ParticipationMembership (p : ParticipationInVenture) (v : Venture)
    (c : ComplaintText) : Prop where
  participation : IsParticipationInVenture p c
  venture       : IsVenture v c

end Proving.USC.T18.Ch77.Ontology
