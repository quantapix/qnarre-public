

















import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Ontology.Types
import Proving.USC.T18.Ch77.Part5.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String




structure UseEdge where
  usingProvision : String
  usesTerm       : String
  citeUse        : String



structure DanglingTerm where
  term    : String
  usedAt  : String
  note    : String





def edge_coercion_dependsOn_legalProcessAbuse : DefEdge :=
  { defined := "coercion", dependsOn := "abuse or threatened abuse of law or legal process",
    citeDefine := "18 USC § 1591(e)(2)" }



def edge_coercion_dependsOn_seriousHarm : DefEdge :=
  { defined := "coercion", dependsOn := "serious harm",
    citeDefine := "18 USC § 1591(e)(2)" }



def edge_commercialSexAct_dependsOn_sexAct : DefEdge :=
  { defined := "commercial sex act", dependsOn := "sex act",
    citeDefine := "18 USC § 1591(e)(3)" }



def edge_commercialSexAct_dependsOn_thingOfValue : DefEdge :=
  { defined := "commercial sex act", dependsOn := "anything of value",
    citeDefine := "18 USC § 1591(e)(3)" }





def edge_participationInAVenture_dependsOn_subsectionA1 : DefEdge :=
  { defined := "participation in a venture", dependsOn := "violation of subsection (a)(1)",
    citeDefine := "18 USC § 1591(e)(4)" }



def edge_seriousHarm_dependsOn_harm : DefEdge :=
  { defined := "serious harm", dependsOn := "harm",
    citeDefine := "18 USC § 1591(e)(5)" }





def edge_seriousHarm_dependsOn_commercialSexualActivity : DefEdge :=
  { defined := "serious harm", dependsOn := "commercial sexual activity",
    citeDefine := "18 USC § 1591(e)(5)" }




def edge_venture_dependsOn_associatedInFact : DefEdge :=
  { defined := "venture", dependsOn := "associated in fact",
    citeDefine := "18 USC § 1591(e)(6)" }


def defEdges : List DefEdge :=
  [ edge_coercion_dependsOn_legalProcessAbuse,
    edge_coercion_dependsOn_seriousHarm,
    edge_commercialSexAct_dependsOn_sexAct,
    edge_commercialSexAct_dependsOn_thingOfValue,
    edge_participationInAVenture_dependsOn_subsectionA1,
    edge_seriousHarm_dependsOn_harm,
    edge_seriousHarm_dependsOn_commercialSexualActivity,
    edge_venture_dependsOn_associatedInFact ]


def useEdges : List UseEdge :=
  [ { usingProvision := "§ 1591(a)", usesTerm := "coercion",
      citeUse := "18 USC § 1591(a)" },
    { usingProvision := "§ 1591(a)", usesTerm := "commercial sex act",
      citeUse := "18 USC § 1591(a)" },
    { usingProvision := "§ 1591(a)(2)", usesTerm := "participation in a venture",
      citeUse := "18 USC § 1591(a)(2)" },
    { usingProvision := "§ 1591(a)(2)", usesTerm := "venture",
      citeUse := "18 USC § 1591(a)(2)" },
    { usingProvision := "§ 1591(b)(1)", usesTerm := "coercion",
      citeUse := "18 USC § 1591(b)(1)" },
    { usingProvision := "§ 1591(e)(4)", usesTerm := "venture",
      citeUse := "18 USC § 1591(e)(4)" } ]



def danglingTerms : List DanglingTerm :=
  [ { term := "sex act", usedAt := "18 USC § 1591(e)(3)",
      note := "genus of the defined term 'commercial sex act'; undefined in § 1591" },
    { term := "anything of value", usedAt := "18 USC § 1591(e)(3)",
      note := "undefined in § 1591; pervasive Title 18 phrase" },
    { term := "commercial sexual activity", usedAt := "18 USC § 1591(e)(5)",
      note := "undefined; textually DISTINCT from the defined 'commercial sex act'" },
    { term := "harm", usedAt := "18 USC § 1591(e)(5)",
      note := "genus of the defined term 'serious harm'; undefined in § 1591" },
    { term := "physical restraint", usedAt := "18 USC § 1591(e)(2)(A)",
      note := "undefined in § 1591" },
    { term := "legal process", usedAt := "18 USC § 1591(e)(1)",
      note := "undefined in § 1591" },
    { term := "force", usedAt := "18 USC § 1591(a)",
      note := "undefined in § 1591; unlike 'coercion' it carries no (e) definition" },
    { term := "threats of force", usedAt := "18 USC § 1591(a)",
      note := "undefined in § 1591" },
    { term := "fraud", usedAt := "18 USC § 1591(a)",
      note := "undefined in § 1591" },
    { term := "advertises", usedAt := "18 USC § 1591(a)(1)",
      note := "undefined; § 1591(a) carves advertising out of the reckless-disregard branch" },
    { term := "interstate or foreign commerce", usedAt := "18 USC § 1591(a)(1)",
      note := "undefined in § 1591; defined elsewhere in Title 18, outside this slice" },
    { term := "special maritime and territorial jurisdiction of the United States",
      usedAt := "18 USC § 1591(a)(1)",
      note := "undefined in § 1591; defined elsewhere in Title 18, outside this slice" },
    { term := "person", usedAt := "18 USC § 1591(a)",
      note := "undefined in § 1591; resolved to the shared Common.Person sort" } ]







structure AbuseOfLegalProcessMembership (u : LegalProcessAbuse)
    (c : ComplaintText) : Prop where
  useOrThreat        : IsUseOrThreatenedUseOfLawOrLegalProcess u c
  purposeNotDesigned : ForPurposeLawWasNotDesigned u c
  pressure           : ExertsPressureToCauseActionOrInaction u c
  member             : IsAbuseOrThreatenedAbuseOfLegalProcess u c





inductive CoercionMembership (m : CoerciveMeans) (c : ComplaintText) : Prop where

  | threatOfSeriousHarm (h : HarmInstance) (p : Person)
      (threat : ThreatensSeriousHarmToPerson m h p c)
      (serious : IsSeriousHarm h c)
      (member : IsCoercion m c) : CoercionMembership m c

  | physicalRestraint (p : Person)
      (restraint : ThreatensPhysicalRestraintAgainstPerson m p c)
      (member : IsCoercion m c) : CoercionMembership m c



  | schemePlanOrPattern (h : HarmInstance)
      (scheme : IsSchemePlanOrPattern m c)
      (belief : IntendedToCauseBeliefOfSeriousHarmOrRestraint m h c)
      (serious : IsSeriousHarm h c)
      (member : IsCoercion m c) : CoercionMembership m c


  | abuseOfLegalProcess (u : LegalProcessAbuse)
      (consists : MeansConsistsOfLegalProcessAbuse m u c)
      (abuse : IsAbuseOrThreatenedAbuseOfLegalProcess u c)
      (member : IsCoercion m c) : CoercionMembership m c



structure CommercialSexActMembership (a : SexAct) (v : ThingOfValue) (p : Person)
    (c : ComplaintText) : Prop where
  sexAct      : IsSexAct a c
  valueItem   : IsThingOfValue v c
  onAccountOf : ThingOfValueGivenOrReceivedOnAccountOf v a p c
  member      : IsCommercialSexAct a c




structure ParticipationInVentureMembership (x : VentureParticipation)
    (c : ComplaintText) : Prop where
  knowingAssistance   : KnowinglyAssistsSupportsOrFacilitates x c
  underlyingViolation : AssistsViolationOfSubsectionA1 x c
  member              : IsParticipationInAVenture x c





structure SeriousHarmMembership (h : HarmInstance) (p : Person)
    (c : ComplaintText) : Prop where
  harm    : IsHarmPhysicalOrNonphysical h c
  compels : SufficientlySeriousToCompelReasonablePerson h p c
  member  : IsSeriousHarm h c





structure VentureMembership (v : Venture) (c : ComplaintText) : Prop where
  twoOrMore        : HasTwoOrMoreIndividuals v c
  associatedInFact : AssociatedInFact v c
  member           : IsVenture v c

end Proving.USC.T18.Ch77.Part5.Ontology
