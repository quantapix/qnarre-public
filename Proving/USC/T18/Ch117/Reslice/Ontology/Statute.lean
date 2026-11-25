import Proving.USC.T18.Ch117.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch117.Reslice.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false























namespace Proving.USC.T18.Ch117.Reslice.Ontology

open Proving.USC.Common





structure DefEdge where
  defined       : String
  dependsOn     : String
  citeDefine    : String
  citeDependsOn : String




structure UndefinedTermUse where
  term      : String
  usedAt    : String
  definedAt : String


def defEdges : List DefEdge :=
  [ { defined := "illicit sexual conduct", dependsOn := "sexual act",
      citeDefine := "18 USC § 2423(g)(1)", citeDependsOn := "18 USC § 2246" },
    { defined := "illicit sexual conduct", dependsOn := "person under 18 years of age",
      citeDefine := "18 USC § 2423(g)(1)", citeDependsOn := "18 USC § 2423(a)" },
    { defined := "illicit sexual conduct", dependsOn := "chapter 109A offense",
      citeDefine := "18 USC § 2423(g)(1)", citeDependsOn := "18 USC ch. 109A" },
    { defined := "illicit sexual conduct",
      dependsOn := "special maritime and territorial jurisdiction of the United States",
      citeDefine := "18 USC § 2423(g)(1)", citeDependsOn := "18 USC § 7" },
    { defined := "illicit sexual conduct", dependsOn := "commercial sex act",
      citeDefine := "18 USC § 2423(g)(2)", citeDependsOn := "18 USC § 1591" },
    { defined := "illicit sexual conduct", dependsOn := "child pornography",
      citeDefine := "18 USC § 2423(g)(3)", citeDependsOn := "18 USC § 2256(8)" },
    { defined := "intent", dependsOn := "prostitution",
      citeDefine := "18 USC § 2423(h)", citeDependsOn := "" },
    { defined := "intent",
      dependsOn := "sexual activity for which any person can be charged with a criminal offense",
      citeDefine := "18 USC § 2423(h)", citeDependsOn := "18 USC § 2423(a)" },
    { defined := "intent", dependsOn := "illicit sexual conduct",
      citeDefine := "18 USC § 2423(h)", citeDependsOn := "18 USC § 2423(g)" },
    { defined := "intent", dependsOn := "transportation or travel",
      citeDefine := "18 USC § 2423(h)", citeDependsOn := "18 USC § 2423(a)" },

    { defined := "18 USC § 2423(a) transportation offense", dependsOn := "intent",
      citeDefine := "18 USC § 2423(a)", citeDependsOn := "18 USC § 2423(h)" },
    { defined := "18 USC § 2423(a) transportation offense",
      dependsOn := "person under 18 years of age",
      citeDefine := "18 USC § 2423(a)", citeDependsOn := "18 USC § 2423(a)" },
    { defined := "18 USC § 2423(b) travel offense", dependsOn := "illicit sexual conduct",
      citeDefine := "18 USC § 2423(b)", citeDependsOn := "18 USC § 2423(g)" },
    { defined := "18 USC § 2423(c) foreign-residence offense",
      dependsOn := "illicit sexual conduct",
      citeDefine := "18 USC § 2423(c)", citeDependsOn := "18 USC § 2423(g)" },
    { defined := "18 USC § 2423(d) organizational offense",
      dependsOn := "organization that affects interstate or foreign commerce",
      citeDefine := "18 USC § 2423(d)", citeDependsOn := "18 USC § 2423(d)(1)" },
    { defined := "18 USC § 2423(d) organizational offense",
      dependsOn := "officer, director, employee, or agent",
      citeDefine := "18 USC § 2423(d)", citeDependsOn := "18 USC § 2423(d)(1)" },
    { defined := "18 USC § 2423(e) facilitation offense",
      dependsOn := "illicit sexual conduct",
      citeDefine := "18 USC § 2423(e)", citeDependsOn := "18 USC § 2423(g)" },
    { defined := "18 USC § 2423(i) reasonable-belief defense",
      dependsOn := "commercial sex act",
      citeDefine := "18 USC § 2423(i)", citeDependsOn := "18 USC § 1591" },
    { defined := "18 USC § 2421A(a) promotion offense",
      dependsOn := "interactive computer service",
      citeDefine := "18 USC § 2421A(a)", citeDependsOn := "47 USC § 230(f)" },
    { defined := "18 USC § 2421A(a) promotion offense",
      dependsOn := "facility or means of interstate or foreign commerce",
      citeDefine := "18 USC § 2421A(a)", citeDependsOn := "18 USC § 10" },
    { defined := "18 USC § 2421A(a) promotion offense", dependsOn := "prostitution",
      citeDefine := "18 USC § 2421A(a)", citeDependsOn := "" },
    { defined := "18 USC § 2421A(b)(2) aggravated offense", dependsOn := "sex trafficking",
      citeDefine := "18 USC § 2421A(b)(2)", citeDependsOn := "18 USC § 1591(a)" },
    { defined := "18 USC § 2421A(c) private right of action",
      dependsOn := "person injured by reason of a violation",
      citeDefine := "18 USC § 2421A(c)", citeDependsOn := "18 USC § 2421A(c)" },
    { defined := "18 USC § 2421A(d) restitution", dependsOn := "scope of restitution",
      citeDefine := "18 USC § 2421A(d)", citeDependsOn := "18 USC § 2327(b)" },
    { defined := "18 USC § 2421A(e) affirmative defense",
      dependsOn := "jurisdiction where the promotion or facilitation was targeted",
      citeDefine := "18 USC § 2421A(e)", citeDependsOn := "18 USC § 2421A(e)" } ]




def undefinedTermUses : List UndefinedTermUse :=
  [ { term := "prostitution", usedAt := "18 USC § 2421A(a),(b),(e); § 2423(a),(h)",
      definedAt := "" },
    { term := "promote or facilitate", usedAt := "18 USC § 2421A(a),(b),(e)",
      definedAt := "" },
    { term := "interactive computer service", usedAt := "18 USC § 2421A(a),(b)",
      definedAt := "47 USC § 230(f)" },
    { term := "facility or means of interstate or foreign commerce",
      usedAt := "18 USC § 2421A(a),(b); § 2423(d)(2)", definedAt := "18 USC § 10" },
    { term := "sex trafficking", usedAt := "18 USC § 2421A(b)(2)",
      definedAt := "18 USC § 1591(a)" },
    { term := "sexual act", usedAt := "18 USC § 2423(g)(1)", definedAt := "18 USC § 2246" },
    { term := "commercial sex act", usedAt := "18 USC § 2423(g)(2); § 2423(i)",
      definedAt := "18 USC § 1591" },
    { term := "child pornography", usedAt := "18 USC § 2423(g)(3)",
      definedAt := "18 USC § 2256(8)" },
    { term := "special maritime and territorial jurisdiction of the United States",
      usedAt := "18 USC § 2423(g)(1)", definedAt := "18 USC § 7" },
    { term := "alien admitted for permanent residence",
      usedAt := "18 USC § 2423(b),(c),(d)", definedAt := "" },
    { term := "sexual activity for which any person can be charged with a criminal offense",
      usedAt := "18 USC § 2423(a),(h)", definedAt := "" },
    { term := "scope and nature of restitution", usedAt := "18 USC § 2421A(d)",
      definedAt := "18 USC § 2327(b)" } ]



inductive IllicitSexualConductMembership
    (k : IllicitSexualConduct) (c : ComplaintText) : Prop where


  | sexualActWithMinor
      (a : SexualAct) (v : Person)
      (hAct : IsSexualAct a c)
      (hMinor : IsUnderEighteen v c)
      (hCh109A : WouldViolateChapter109A a c)
      (hTerm : IsIllicitSexualConduct k c)

  | commercialSexActWithMinor
      (a : CommercialSexAct) (v : Person)
      (hAct : IsCommercialSexAct a c)
      (hMinor : IsUnderEighteen v c)
      (hTerm : IsIllicitSexualConduct k c)

  | productionOfChildPornography
      (m : ChildPornography)
      (hMaterial : IsChildPornography m c)
      (hTerm : IsIllicitSexualConduct k c)



inductive IntentMembership
    (i : Intent) (t : Travel) (c : ComplaintText) : Prop where
  | toProstitution
      (p : Prostitution) (hObject : IsProstitution p c)
      (hIntent : IsIntent i c) (hWhen : IsTravel t c)
  | toChargeableSexualActivity
      (a : SexualActivityChargeableAsOffense)
      (hObject : IsSexualActivityChargeableAsOffense a c)
      (hIntent : IsIntent i c) (hWhen : IsTravel t c)
  | toIllicitSexualConduct
      (k : IllicitSexualConduct) (hObject : IsIllicitSexualConduct k c)
      (hIntent : IsIntent i c) (hWhen : IsTravel t c)



inductive CoveredTravelerMembership (p : Person) (c : ComplaintText) : Prop where
  | citizen (h : IsUnitedStatesCitizen p c)
  | lawfulPermanentResident (h : IsAlienAdmittedForPermanentResidence p c)



structure Chapter109ACounterfactual
    (a : SexualAct) (j : Jurisdiction) (c : ComplaintText) : Prop where
  act          : IsSexualAct a c
  jurisdiction : IsWithinSpecialMaritimeAndTerritorialJurisdiction j c
  wouldViolate : WouldViolateChapter109A a c




structure CommerceNexusServiceMembership
    (s : InteractiveComputerService) (f : CommerceFacility) (c : ComplaintText) : Prop where
  service  : IsInteractiveComputerService s c
  facility : IsFacilityOfInterstateOrForeignCommerce f c



structure OrganizationalAffiliationMembership
    (p : Person) (o : Organization) (c : ComplaintText) : Prop where
  organization : IsOrganizationAffectingCommerce o c
  role         : IsOfficerDirectorEmployeeOrAgent p o c
  traveler     : CoveredTravelerMembership p c



structure LegalProstitutionJurisdictionMembership
    (j : Jurisdiction) (p : Prostitution) (c : ComplaintText) : Prop where
  targeted : IsTargetedJurisdiction j c
  legal    : IsJurisdictionWhereProstitutionLegal j c
  subject  : IsProstitution p c



structure InjuredPersonMembership (p : Person) (c : ComplaintText) : Prop where
  injured : IsPersonInjuredByViolation p c

end Proving.USC.T18.Ch117.Reslice.Ontology
