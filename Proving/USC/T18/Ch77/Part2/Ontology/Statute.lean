











import Proving.USC.T18.Ch77.Part2.Ontology.Types
import Proving.USC.T18.Ch77.Part2.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



structure UndefinedTermUse where
  term       : String
  usedAt     : String


  definedAt  : String



def edge_coercion_dependsOn_seriousHarm : DefEdge :=
  { defined := "coercion", dependsOn := "serious harm",
    citeDefine := "18 USC § 1591(e)(2)" }



def edge_coercion_dependsOn_abuseOfProcess : DefEdge :=
  { defined := "coercion",
    dependsOn := "abuse or threatened abuse of law or legal process",
    citeDefine := "18 USC § 1591(e)(2)" }



def edge_abuseOfProcess_dependsOn_legalProcess : DefEdge :=
  { defined := "abuse or threatened abuse of law or legal process",
    dependsOn := "law or legal process",
    citeDefine := "18 USC § 1591(e)(1)" }


def edge_commercialSexAct_dependsOn_sexAct : DefEdge :=
  { defined := "commercial sex act", dependsOn := "sex act",
    citeDefine := "18 USC § 1591(e)(3)" }



def edge_commercialSexAct_dependsOn_anythingOfValue : DefEdge :=
  { defined := "commercial sex act", dependsOn := "anything of value",
    citeDefine := "18 USC § 1591(e)(3)" }



def edge_participation_dependsOn_venture : DefEdge :=
  { defined := "participation in a venture", dependsOn := "venture",
    citeDefine := "18 USC § 1591(e)(4)" }



def edge_participation_dependsOn_subsectionA1 : DefEdge :=
  { defined := "participation in a venture",
    dependsOn := "violation of subsection (a)(1)",
    citeDefine := "18 USC § 1591(e)(4)" }



def edge_seriousHarm_dependsOn_commercialSexualActivity : DefEdge :=
  { defined := "serious harm", dependsOn := "commercial sexual activity",
    citeDefine := "18 USC § 1591(e)(5)" }



def edge_venture_dependsOn_associatedInFact : DefEdge :=
  { defined := "venture", dependsOn := "associated in fact",
    citeDefine := "18 USC § 1591(e)(6)" }


def defEdges : List DefEdge :=
  [ edge_coercion_dependsOn_seriousHarm,
    edge_coercion_dependsOn_abuseOfProcess,
    edge_abuseOfProcess_dependsOn_legalProcess,
    edge_commercialSexAct_dependsOn_sexAct,
    edge_commercialSexAct_dependsOn_anythingOfValue,
    edge_participation_dependsOn_venture,
    edge_participation_dependsOn_subsectionA1,
    edge_seriousHarm_dependsOn_commercialSexualActivity,
    edge_venture_dependsOn_associatedInFact ]



def usageEdges : List DefEdge :=
  [ { defined := "18 USC § 1591(a)(1)", dependsOn := "coercion",
      citeDefine := "18 USC § 1591(e)(2)" },
    { defined := "18 USC § 1591(a)(1)", dependsOn := "commercial sex act",
      citeDefine := "18 USC § 1591(e)(3)" },
    { defined := "18 USC § 1591(a)(2)", dependsOn := "participation in a venture",
      citeDefine := "18 USC § 1591(e)(4)" },
    { defined := "18 USC § 1591(a)(2)", dependsOn := "venture",
      citeDefine := "18 USC § 1591(e)(6)" },
    { defined := "18 USC § 1591(b)(1)", dependsOn := "coercion",
      citeDefine := "18 USC § 1591(e)(2)" } ]


def undefinedTermUses : List UndefinedTermUse :=
  [ { term := "sex act", usedAt := "18 USC § 1591(e)(3)",
      definedAt := "18 USC § 2246(2) (outside this slice)" },
    { term := "anything of value", usedAt := "18 USC § 1591(e)(3)",
      definedAt := "" },
    { term := "law or legal process", usedAt := "18 USC § 1591(e)(1)",
      definedAt := "" },
    { term := "associated in fact", usedAt := "18 USC § 1591(e)(6)",
      definedAt := "" },
    { term := "commercial sexual activity", usedAt := "18 USC § 1591(e)(5)",
      definedAt := "" },
    { term := "special maritime and territorial jurisdiction of the United States",
      usedAt := "18 USC § 1591(a)(1)",
      definedAt := "18 USC § 7 (outside this slice)" },
    { term := "interstate or foreign commerce", usedAt := "18 USC § 1591(a)(1)",
      definedAt := "18 USC § 10 (outside this slice)" },
    { term := "force", usedAt := "18 USC § 1591(a)", definedAt := "" },
    { term := "threats of force", usedAt := "18 USC § 1591(a)", definedAt := "" },
    { term := "fraud", usedAt := "18 USC § 1591(a)", definedAt := "" },
    { term := "reckless disregard", usedAt := "18 USC § 1591(a)", definedAt := "" },
    { term := "reasonable opportunity to observe", usedAt := "18 USC § 1591(c)",
      definedAt := "" } ]






def HasTwoOrMoreIndividuals (v : Venture) (c : ComplaintText) : Prop :=
  2 ≤ individualsInVenture v c







structure AbuseOfLegalProcessMembership
    (a : AbuseOfLegalProcess) (lp : LegalProcess) (p : Person)
    (c : ComplaintText) : Prop where
  member        : IsAbuseOrThreatenedAbuseOfLegalProcess a c
  process       : IsLawOrLegalProcess lp c
  notAsDesigned : UsedForPurposeNotDesigned a lp c
  pressure      : ExertsPressureOnAnotherPerson a p c





inductive CoercionRoute (x : Coercion) (h : SeriousHarm)
    (a : AbuseOfLegalProcess) (c : ComplaintText) : Prop where

  | threatOfSeriousHarm
      (hs : IsSeriousHarm h c) (ht : ThreatensSeriousHarm x h c)

  | physicalRestraint (hr : ThreatensOrAppliesPhysicalRestraint x c)

  | schemeOfSeriousHarm
      (hs : IsSeriousHarm h c) (hb : SchemeInducingBeliefOfSeriousHarm x h c)

  | schemeOfPhysicalRestraint (hb : SchemeInducingBeliefOfPhysicalRestraint x c)

  | abuseOfLegalProcess (ha : IsAbuseOrThreatenedAbuseOfLegalProcess a c)



structure CoercionMembership (x : Coercion) (h : SeriousHarm)
    (a : AbuseOfLegalProcess) (c : ComplaintText) : Prop where
  member : IsCoercion x c
  route  : CoercionRoute x h a c



structure CommercialSexActMembership
    (x : CommercialSexAct) (sa : SexAct) (v : ThingOfValue) (p : Person)
    (c : ComplaintText) : Prop where
  member      : IsCommercialSexAct x c
  sexAct      : IsSexAct sa c
  value       : IsAnythingOfValue v c
  onAccountOf : ValueGivenOrReceivedOnAccountOfSexAct x sa v p c




structure ParticipationInVentureMembership
    (x : ParticipationInVenture) (t : TraffickingConduct)
    (c : ComplaintText) : Prop where
  member    : IsParticipationInVenture x c
  knowingly : KnowinglyAssistsSupportsOrFacilitates x t c
  violation : IsViolationOfSubsectionA1 t c



structure SeriousHarmMembership (h : SeriousHarm) (p : Person)
    (c : ComplaintText) : Prop where
  member  : IsSeriousHarm h c
  harm    : IsHarmPhysicalOrNonphysical h c
  compels : CompelsReasonablePersonToPerformCommercialSexualActivity h p c




structure VentureMembership (v : Venture) (c : ComplaintText) : Prop where
  member    : IsVenture v c
  twoOrMore : HasTwoOrMoreIndividuals v c
  inFact    : AssociatedInFact v c




structure Section1591a1TermUsage
    (x : Coercion) (h : SeriousHarm) (a : AbuseOfLegalProcess)
    (csa : CommercialSexAct) (sa : SexAct) (val : ThingOfValue) (p : Person)
    (c : ComplaintText) : Prop where
  coercion         : CoercionMembership x h a c
  commercialSexAct : CommercialSexActMembership csa sa val p c


structure Section1591a2TermUsage
    (pv : ParticipationInVenture) (v : Venture) (t : TraffickingConduct)
    (c : ComplaintText) : Prop where
  venture       : VentureMembership v c
  participation : ParticipationInVentureMembership pv t c

end Proving.USC.T18.Ch77.Part2.Ontology
