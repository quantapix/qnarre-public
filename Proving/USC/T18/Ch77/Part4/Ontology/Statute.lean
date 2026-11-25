











import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part4.Ontology.Types
import Proving.USC.T18.Ch77.Part4.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Ontology

open Proving.USC.Common





structure DefEdge where

  defined : String

  dependsOn : String

  citeDefine : String


structure UseEdge where

  usingProvision : String

  usesTerm : String

  citeDefine : String



structure DanglingTerm where

  term : String

  usedAt : String


def edge_coercion_dependsOn_abuseOfLegalProcess : DefEdge :=
  { defined := "coercion",
    dependsOn := "abuse or threatened abuse of law or legal process",
    citeDefine := "18 USC § 1591(e)(2)" }



def edge_coercion_dependsOn_seriousHarm : DefEdge :=
  { defined := "coercion",
    dependsOn := "serious harm",
    citeDefine := "18 USC § 1591(e)(2)" }





def edge_participationInVenture_dependsOn_violationA1 : DefEdge :=
  { defined := "participation in a venture",
    dependsOn := "violation of subsection (a)(1)",
    citeDefine := "18 USC § 1591(e)(4)" }


def defEdges : List DefEdge :=
  [ edge_coercion_dependsOn_abuseOfLegalProcess,
    edge_coercion_dependsOn_seriousHarm,
    edge_participationInVenture_dependsOn_violationA1 ]





def useEdges : List UseEdge :=
  [ { usingProvision := "18 USC § 1591(a)(1)", usesTerm := "commercial sex act",
      citeDefine := "18 USC § 1591(e)(3)" },
    { usingProvision := "18 USC § 1591(a)", usesTerm := "coercion",
      citeDefine := "18 USC § 1591(e)(2)" },
    { usingProvision := "18 USC § 1591(a)(2)", usesTerm := "participation in a venture",
      citeDefine := "18 USC § 1591(e)(4)" },
    { usingProvision := "18 USC § 1591(a)(2)", usesTerm := "venture",
      citeDefine := "18 USC § 1591(e)(6)" },
    { usingProvision := "18 USC § 1591(b)(1)", usesTerm := "coercion",
      citeDefine := "18 USC § 1591(e)(2)" },
    { usingProvision := "18 USC § 1591(e)(2)(A)", usesTerm := "serious harm",
      citeDefine := "18 USC § 1591(e)(5)" },
    { usingProvision := "18 USC § 1591(e)(2)(B)", usesTerm := "serious harm",
      citeDefine := "18 USC § 1591(e)(5)" },
    { usingProvision := "18 USC § 1591(e)(2)(C)",
      usesTerm := "abuse or threatened abuse of law or legal process",
      citeDefine := "18 USC § 1591(e)(1)" } ]





def danglingTerms : List DanglingTerm :=
  [ { term := "law or legal process", usedAt := "18 USC § 1591(e)(1)" },
    { term := "sex act", usedAt := "18 USC § 1591(e)(3)" },
    { term := "anything of value", usedAt := "18 USC § 1591(a)(2), (e)(3)" },
    { term := "commercial sexual activity", usedAt := "18 USC § 1591(e)(5)" },
    { term := "physical restraint", usedAt := "18 USC § 1591(e)(2)(A), (B)" },
    { term := "force", usedAt := "18 USC § 1591(a), (b)(1)" },
    { term := "threats of force", usedAt := "18 USC § 1591(a), (b)(1)" },
    { term := "fraud", usedAt := "18 USC § 1591(a), (b)(1)" },
    { term := "interstate or foreign commerce", usedAt := "18 USC § 1591(a)(1)" },
    { term := "special maritime and territorial jurisdiction of the United States",
      usedAt := "18 USC § 1591(a)(1)" },
    { term := "reckless disregard", usedAt := "18 USC § 1591(a)" },
    { term := "reasonable opportunity to observe", usedAt := "18 USC § 1591(c)" },
    { term := "person", usedAt := "18 USC § 1591(a)(1), (e)(1), (e)(2), (e)(3)" },
    { term := "individuals", usedAt := "18 USC § 1591(e)(6)" } ]







structure AbuseOfLegalProcessMembership
    (m : Means) (p : Person) (c : ComplaintText) : Prop where


  useOfProcess : IsUseOrThreatenedUseOfLegalProcess m c

  purposeNotDesignedFor : IsPurposeLawNotDesignedFor m c


  pressure : ExertsPressureOnAnotherPerson m p c

  term : IsAbuseOrThreatenedAbuseOfLegalProcess m c



structure SeriousHarmMembership (h : Harm) (c : ComplaintText) : Prop where


  harm : IsHarmPhysicalOrNonphysical h c


  compels : CompelsReasonablePersonToPerformCommercialSexualActivity h c

  term : IsSeriousHarm h c




inductive CoercionMembership (m : Means) (p : Person) (h : Harm) (c : ComplaintText) : Prop where

  | threatOfSeriousHarm
      (threat : ThreatensSeriousHarmToPerson m p h c)
      (serious : IsSeriousHarm h c)

  | physicalRestraint
      (restraint : ThreatensPhysicalRestraintAgainstPerson m p c)


  | schemeOfSeriousHarm
      (scheme : SchemeInducingBeliefOfHarmFromNonperformance m p h c)
      (serious : IsSeriousHarm h c)


  | schemeOfPhysicalRestraint
      (scheme : SchemeInducingBeliefOfRestraintFromNonperformance m p c)


  | abuseOfLegalProcess
      (abuse : IsAbuseOrThreatenedAbuseOfLegalProcess m c)


structure CoercionTerm (m : Means) (p : Person) (h : Harm) (c : ComplaintText) : Prop where

  defn : CoercionMembership m p h c

  term : IsCoercion m c



structure CommercialSexActMembership
    (a : Act) (p : Person) (c : ComplaintText) : Prop where

  sexAct : IsSexAct a c


  valueExchanged : AnythingOfValueGivenOrReceived a p c

  term : IsCommercialSexAct a c





structure ParticipationInVentureMembership
    (cond : Conduct) (v : Violation) (c : ComplaintText) : Prop where

  assists : KnowinglyAssistsSupportsOrFacilitates cond v c

  violation : IsViolationOfSubsectionA1 v c

  term : IsParticipationInVenture cond c




structure VentureMembership (v : Venture) (c : ComplaintText) : Prop where

  twoOrMore : HasTwoOrMoreIndividuals v c

  associatedInFact : IsAssociatedInFact v c

  term : IsVenture v c






structure Section1591a1TermUse
    (m : Means) (a : Act) (c : ComplaintText) : Prop where

  coercion : IsCoercion m c

  commercialSexAct : IsCommercialSexAct a c




structure Section1591a2TermUse
    (cond : Conduct) (v : Venture) (a : Act) (c : ComplaintText) : Prop where

  participation : IsParticipationInVenture cond c

  venture : IsVenture v c

  commercialSexAct : IsCommercialSexAct a c

end Proving.USC.T18.Ch77.Part4.Ontology
