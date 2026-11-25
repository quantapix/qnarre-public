












import Proving.USC.T18.Ch113B.MaterialSupport.Ontology.Predicates
import Proving.USC.T18.Ch113B.MaterialSupport.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Ontology

open Proving.USC.Common














structure DefEdge where
  defined       : String
  dependsOn     : String
  citeDefine    : String
  citeDependsOn : String
  kind          : String
  deriving Repr



structure DanglingRef where
  term      : String
  usedAt    : String
  authority : String
  note      : String
  deriving Repr


def edgesMaterialSupport : List DefEdge :=
  [ { defined := "material support or resources", dependsOn := "property",
      citeDefine := "18 USC § 2339A(b)(1)", citeDependsOn := "18 USC § 2339A(b)(1)",
      kind := "component" },
    { defined := "material support or resources", dependsOn := "service",
      citeDefine := "18 USC § 2339A(b)(1)", citeDependsOn := "18 USC § 2339A(b)(1)",
      kind := "component" },
    { defined := "material support or resources", dependsOn := "training",
      citeDefine := "18 USC § 2339A(b)(1)", citeDependsOn := "18 USC § 2339A(b)(2)",
      kind := "component" },
    { defined := "material support or resources", dependsOn := "expert advice or assistance",
      citeDefine := "18 USC § 2339A(b)(1)", citeDependsOn := "18 USC § 2339A(b)(3)",
      kind := "component" },
    { defined := "material support or resources", dependsOn := "personnel",
      citeDefine := "18 USC § 2339A(b)(1)", citeDependsOn := "18 USC § 2339A(b)(1)",
      kind := "component" },
    { defined := "material support or resources", dependsOn := "medicine",
      citeDefine := "18 USC § 2339A(b)(1)", citeDependsOn := "18 USC § 2339A(b)(1)",
      kind := "exclusion" },
    { defined := "material support or resources", dependsOn := "religious materials",
      citeDefine := "18 USC § 2339A(b)(1)", citeDependsOn := "18 USC § 2339A(b)(1)",
      kind := "exclusion" } ]



def edgesIncorporation : List DefEdge :=
  [ { defined := "material support or resources (as used in § 2339B)",
      dependsOn := "material support or resources",
      citeDefine := "18 USC § 2339B(g)(4)", citeDependsOn := "18 USC § 2339A(b)(1)",
      kind := "incorporation" },
    { defined := "material support or resources (as used in § 2339C)",
      dependsOn := "material support or resources (as used in § 2339B)",
      citeDefine := "18 USC § 2339C(e)(13)", citeDependsOn := "18 USC § 2339B(g)(4)",
      kind := "incorporation" },
    { defined := "personnel (as prosecutable under § 2339B)", dependsOn := "personnel",
      citeDefine := "18 USC § 2339B(h)", citeDependsOn := "18 USC § 2339A(b)(1)",
      kind := "construction" },
    { defined := "personnel (as prosecutable under § 2339B)",
      dependsOn := "foreign terrorist organization",
      citeDefine := "18 USC § 2339B(h)", citeDependsOn := "18 USC § 2339D(c)(4)",
      kind := "construction" } ]


def edgesDefinitionalLists : List DefEdge :=
  [ { defined := "classified information", dependsOn := "Classified Information Procedures Act § 1(a)",
      citeDefine := "18 USC § 2339B(g)(1)", citeDependsOn := "18 USC App. § 1(a)",
      kind := "incorporation" },
    { defined := "financial institution", dependsOn := "31 U.S.C. § 5312(a)(2) financial institution",
      citeDefine := "18 USC § 2339B(g)(2)", citeDependsOn := "31 USC § 5312(a)(2)",
      kind := "incorporation" },
    { defined := "terrorist organization", dependsOn := "INA § 219 designation",
      citeDefine := "18 USC § 2339B(g)(6)", citeDependsOn := "8 USC § 1189",
      kind := "incorporation" },
    { defined := "Secretary", dependsOn := "Secretary of the Treasury",
      citeDefine := "18 USC § 2339B(g)(5)", citeDependsOn := "18 USC § 2339B(g)(5)",
      kind := "component" },
    { defined := "proceeds", dependsOn := "funds (as used in § 2339C)",
      citeDefine := "18 USC § 2339C(e)(3)", citeDependsOn := "18 USC § 2339C(e)(1)",
      kind := "component" },
    { defined := "proceeds", dependsOn := "offense set forth in § 2339C(a)",
      citeDefine := "18 USC § 2339C(e)(3)", citeDependsOn := "18 USC § 2339C(a)",
      kind := "component" },
    { defined := "predicate act", dependsOn := "act within the scope of a specified treaty",
      citeDefine := "18 USC § 2339C(e)(6)", citeDependsOn := "18 USC § 2339C(a)(1)(A)",
      kind := "component" },
    { defined := "predicate act", dependsOn := "act intended to intimidate or compel",
      citeDefine := "18 USC § 2339C(e)(6)", citeDependsOn := "18 USC § 2339C(a)(1)(B)",
      kind := "component" },
    { defined := "act within the scope of a specified treaty", dependsOn := "treaty",
      citeDefine := "18 USC § 2339C(a)(1)(A)", citeDependsOn := "18 USC § 2339C(e)(7)",
      kind := "component" },
    { defined := "act intended to intimidate or compel", dependsOn := "serious bodily injury",
      citeDefine := "18 USC § 2339C(a)(1)(B)", citeDependsOn := "18 USC § 2339C(e)(11)",
      kind := "component" },
    { defined := "act intended to intimidate or compel", dependsOn := "armed conflict",
      citeDefine := "18 USC § 2339C(a)(1)(B)", citeDependsOn := "18 USC § 2339C(e)(10)",
      kind := "component" },
    { defined := "act intended to intimidate or compel", dependsOn := "international organization",
      citeDefine := "18 USC § 2339C(a)(1)(B)", citeDependsOn := "18 USC § 2339C(e)(9)",
      kind := "component" },
    { defined := "government facility", dependsOn := "state",
      citeDefine := "18 USC § 2339C(e)(2)", citeDependsOn := "18 USC § 2339C(e)(14)",
      kind := "component" },
    { defined := "government facility", dependsOn := "intergovernmental organization",
      citeDefine := "18 USC § 2339C(e)(2)", citeDependsOn := "18 USC § 2339C(e)(8)",
      kind := "component" },
    { defined := "intergovernmental organization", dependsOn := "international organization",
      citeDefine := "18 USC § 2339C(e)(8)", citeDependsOn := "18 USC § 2339C(e)(9)",
      kind := "component" },
    { defined := "international organization", dependsOn := "§ 1116(b)(5) international organization",
      citeDefine := "18 USC § 2339C(e)(9)", citeDependsOn := "18 USC § 1116(b)(5)",
      kind := "incorporation" },
    { defined := "armed conflict", dependsOn := "internal disturbances and tensions",
      citeDefine := "18 USC § 2339C(e)(10)", citeDependsOn := "18 USC § 2339C(e)(10)",
      kind := "exclusion" },
    { defined := "serious bodily injury (as used in § 2339C)", dependsOn := "§ 1365 serious bodily injury",
      citeDefine := "18 USC § 2339C(e)(11)", citeDependsOn := "18 USC § 1365",
      kind := "incorporation" },
    { defined := "national of the United States", dependsOn := "INA § 101(a)(22) national",
      citeDefine := "18 USC § 2339C(e)(12)", citeDependsOn := "8 USC § 1101(a)(22)",
      kind := "incorporation" },
    { defined := "military-type training", dependsOn := "serious bodily injury (as used in § 2339D)",
      citeDefine := "18 USC § 2339D(c)(1)", citeDependsOn := "18 USC § 2339D(c)(2)",
      kind := "component" },
    { defined := "military-type training", dependsOn := "critical infrastructure",
      citeDefine := "18 USC § 2339D(c)(1)", citeDependsOn := "18 USC § 2339D(c)(3)",
      kind := "component" },
    { defined := "military-type training", dependsOn := "weapon of mass destruction",
      citeDefine := "18 USC § 2339D(c)(1)", citeDependsOn := "18 USC § 2332a(c)(2)",
      kind := "component" },
    { defined := "serious bodily injury (as used in § 2339D)",
      dependsOn := "§ 1365(h)(3) serious bodily injury",
      citeDefine := "18 USC § 2339D(c)(2)", citeDependsOn := "18 USC § 1365(h)(3)",
      kind := "incorporation" },
    { defined := "foreign terrorist organization", dependsOn := "INA § 219(a)(1) designation",
      citeDefine := "18 USC § 2339D(c)(4)", citeDependsOn := "8 USC § 1189(a)(1)",
      kind := "incorporation" } ]



def edgesUse : List DefEdge :=
  [ { defined := "§ 2339 harboring or concealing offense",
      dependsOn := "offense enumerated in § 2339(a)",
      citeDefine := "18 USC § 2339(a)", citeDependsOn := "18 USC § 2339(a)",
      kind := "use" },
    { defined := "§ 2339 harboring or concealing offense", dependsOn := "harbors or conceals",
      citeDefine := "18 USC § 2339(a)", citeDependsOn := "18 USC § 2339(a)",
      kind := "use" },
    { defined := "§ 2339A material-support offense", dependsOn := "material support or resources",
      citeDefine := "18 USC § 2339A(a)", citeDependsOn := "18 USC § 2339A(b)(1)",
      kind := "use" },
    { defined := "§ 2339A material-support offense", dependsOn := "offense enumerated in § 2339A(a)",
      citeDefine := "18 USC § 2339A(a)", citeDependsOn := "18 USC § 2339A(a)",
      kind := "use" },
    { defined := "§ 2339B material-support offense",
      dependsOn := "material support or resources (as used in § 2339B)",
      citeDefine := "18 USC § 2339B(a)(1)", citeDependsOn := "18 USC § 2339B(g)(4)",
      kind := "use" },
    { defined := "§ 2339B material-support offense", dependsOn := "terrorist organization",
      citeDefine := "18 USC § 2339B(a)(1)", citeDependsOn := "18 USC § 2339B(g)(6)",
      kind := "use" },
    { defined := "§ 2339B(a)(2) retain-and-report duty", dependsOn := "financial institution",
      citeDefine := "18 USC § 2339B(a)(2)", citeDependsOn := "18 USC § 2339B(g)(2)",
      kind := "use" },
    { defined := "§ 2339B(a)(2) retain-and-report duty", dependsOn := "Secretary",
      citeDefine := "18 USC § 2339B(a)(2)", citeDependsOn := "18 USC § 2339B(g)(5)",
      kind := "use" },
    { defined := "§ 2339B(f) classified-information procedures",
      dependsOn := "classified information",
      citeDefine := "18 USC § 2339B(f)", citeDependsOn := "18 USC § 2339B(g)(1)",
      kind := "use" },
    { defined := "§ 2339C(a)(1) financing offense", dependsOn := "funds (as used in § 2339C)",
      citeDefine := "18 USC § 2339C(a)(1)", citeDependsOn := "18 USC § 2339C(e)(1)",
      kind := "use" },
    { defined := "§ 2339C(a)(1) financing offense", dependsOn := "provides",
      citeDefine := "18 USC § 2339C(a)(1)", citeDependsOn := "18 USC § 2339C(e)(4)",
      kind := "use" },
    { defined := "§ 2339C(a)(1) financing offense", dependsOn := "collects",
      citeDefine := "18 USC § 2339C(a)(1)", citeDependsOn := "18 USC § 2339C(e)(5)",
      kind := "use" },
    { defined := "§ 2339C(a)(3) no-actual-use rule", dependsOn := "predicate act",
      citeDefine := "18 USC § 2339C(a)(3)", citeDependsOn := "18 USC § 2339C(e)(6)",
      kind := "use" },
    { defined := "§ 2339C(c) concealment offense",
      dependsOn := "material support or resources (as used in § 2339C)",
      citeDefine := "18 USC § 2339C(c)(2)", citeDependsOn := "18 USC § 2339C(e)(13)",
      kind := "use" },
    { defined := "§ 2339C(c) concealment offense", dependsOn := "proceeds",
      citeDefine := "18 USC § 2339C(c)(2)", citeDependsOn := "18 USC § 2339C(e)(3)",
      kind := "use" },
    { defined := "§ 2339D(a) training offense", dependsOn := "military-type training",
      citeDefine := "18 USC § 2339D(a)", citeDependsOn := "18 USC § 2339D(c)(1)",
      kind := "use" },
    { defined := "§ 2339D(a) training offense", dependsOn := "foreign terrorist organization",
      citeDefine := "18 USC § 2339D(a)", citeDependsOn := "18 USC § 2339D(c)(4)",
      kind := "use" },
    { defined := "§ 2339D(b) jurisdictional predicate", dependsOn := "national of the United States",
      citeDefine := "18 USC § 2339D(b)(1)", citeDependsOn := "8 USC § 1101(a)(22)",
      kind := "use" } ]


def definitionalEdges : List DefEdge :=
  edgesMaterialSupport ++ edgesIncorporation ++ edgesDefinitionalLists ++ edgesUse


def danglingTerms : List DanglingRef :=
  [ { term := "classified information", usedAt := "18 USC § 2339B(f)",
      authority := "Classified Information Procedures Act § 1(a) (18 U.S.C. App.)",
      note := "Incorporated by § 2339B(g)(1); definiens outside the corpus slice." },
    { term := "financial institution", usedAt := "18 USC § 2339B(a)(2)",
      authority := "31 USC § 5312(a)(2)",
      note := "Incorporated by § 2339B(g)(2); definiens in another title." },
    { term := "terrorist organization / foreign terrorist organization",
      usedAt := "18 USC § 2339B(a)(1); 18 USC § 2339D(a)",
      authority := "Immigration and Nationality Act § 219 (8 USC § 1189)",
      note := "Both § 2339B(g)(6) and § 2339D(c)(4) resolve to the same INA designation act." },
    { term := "terrorist activity", usedAt := "18 USC § 2339B(a)(1); 18 USC § 2339D(a)",
      authority := "Immigration and Nationality Act § 212(a)(3)(B)",
      note := "Used in the scienter clause; never defined in ch. 113B." },
    { term := "terrorism", usedAt := "18 USC § 2339B(a)(1); 18 USC § 2339D(a)",
      authority := "Foreign Relations Authorization Act, FY 1988-89, § 140(d)(2)",
      note := "Used in the scienter clause; never defined in ch. 113B." },
    { term := "international organization", usedAt := "18 USC § 2339C(a)(1)(B)",
      authority := "18 USC § 1116(b)(5)",
      note := "Incorporated by § 2339C(e)(9); definiens outside the corpus slice." },
    { term := "serious bodily injury", usedAt := "18 USC § 2339C(a)(1)(B); 18 USC § 2339D(c)(1)",
      authority := "18 USC § 1365",
      note := "§ 2339C(e)(11) cites § 1365(g)(3) and carries the Code editors' " ++
              "'See References in Text note' marker; § 2339D(c)(2) cites § 1365(h)(3). " ++
              "The two incorporating provisions point at different subsections of § 1365; " ++
              "recorded as a dangling reference IN THE STATUTE, not repaired here." },
    { term := "national of the United States",
      usedAt := "18 USC § 2339B(d)(1)(A); 18 USC § 2339C(b)(2)(A); 18 USC § 2339D(b)(1)",
      authority := "Immigration and Nationality Act § 101(a)(22) (8 USC § 1101(a)(22))",
      note := "§ 2339D(b)(1) omits the word 'section' before 101(a)(22); the Code editors' " ++
              "footnote 1 to § 2339D supplies it, and the term is read accordingly." },
    { term := "weapon of mass destruction", usedAt := "18 USC § 2339D(c)(1)",
      authority := "18 USC § 2332a(c)(2)",
      note := "Enacted text cites 'section 2232a(c)(2)'; the Code editors' footnote 2 to " ++
              "§ 2339D states it probably should be 2332a(c)(2), and it is read that way." },
    { term := "legal entity organized under the laws of the United States",
      usedAt := "18 USC § 2339C(c)(1)(B); 18 USC § 2339C(f)",
      authority := "none",
      note := "Used but nowhere defined in the slice; a genuine coverage gap." },
    { term := "harbors or conceals", usedAt := "18 USC § 2339(a)",
      authority := "none",
      note := "Operative verb of § 2339 with no statutory definition anywhere in ch. 113B." },
    { term := "offense listed in section 2332b(g)(5)(B)", usedAt := "18 USC § 2339A(a)",
      authority := "18 USC § 2332b(g)(5)(B)",
      note := "§ 2339A(a) incorporates the (B) list only, expressly excepting §§ 2339A and 2339B." } ]






inductive MaterialSupportGenus (x : SupportItem) (c : ComplaintText) : Prop where
  | property : IsProperty x c → MaterialSupportGenus x c
  | service  : IsService x c → MaterialSupportGenus x c




structure MaterialSupportMembership (x : SupportItem) (c : ComplaintText) : Prop where
  genus                 : MaterialSupportGenus x c
  notMedicine           : ¬ IsMedicine x c
  notReligiousMaterials : ¬ IsReligiousMaterials x c
  denotes               : IsMaterialSupportOrResources x c



structure TrainingIsMaterialSupport (x : SupportItem) (c : ComplaintText) : Prop where
  species : IsTraining x c
  genus   : IsMaterialSupportOrResources x c



structure ExpertAdviceIsMaterialSupport (x : SupportItem) (c : ComplaintText) : Prop where
  species : IsExpertAdviceOrAssistance x c
  genus   : IsMaterialSupportOrResources x c


structure PersonnelIsMaterialSupport (x : SupportItem) (c : ComplaintText) : Prop where
  species : IsPersonnel x c
  genus   : IsMaterialSupportOrResources x c



structure PersonnelUnder2339B (x : SupportItem) (c : ComplaintText) : Prop where
  personnel          : IsPersonnel x c
  directionOrControl : IsPersonnelUnderOrganizationDirectionOrControl x c




structure IncorporatedMaterialSupport (x : SupportItem) (c : ComplaintText) : Prop where
  support : IsMaterialSupportOrResources x c






inductive FundsTermReading (x : FundsItem) (c : ComplaintText) : Prop where
  | under2339B : IsFundsUnder2339B x c → FundsTermReading x c
  | under2339C : IsFundsUnder2339C x c → FundsTermReading x c



structure ProceedsMembership (x : FundsItem) (c : ComplaintText) : Prop where
  species : IsProceeds x c
  genus   : IsFundsUnder2339C x c



inductive PredicateActRoute (a : PredicateAct) (c : ComplaintText) : Prop where
  | treatyOffense       : IsActWithinScopeOfSpecifiedTreaty a c → PredicateActRoute a c
  | intimidateOrCompel  : IsActIntendedToIntimidateOrCompel a c → PredicateActRoute a c


structure PredicateActMembership (a : PredicateAct) (c : ComplaintText) : Prop where
  route   : PredicateActRoute a c
  denotes : IsPredicateAct a c


inductive FundingConduct (x : Conduct) (c : ComplaintText) : Prop where
  | provides : IsProvides x c → FundingConduct x c
  | collects : IsCollects x c → FundingConduct x c



structure ArmedConflictMembership (s : ArmedConflictSituation) (c : ComplaintText) : Prop where
  conflict                : IsArmedConflict s c
  notInternalDisturbance  : ¬ IsInternalDisturbanceOrTension s c



structure GovernmentFacilityMembership (f : Facility) (s : ForeignState)
    (c : ComplaintText) : Prop where
  facility : IsGovernmentFacility f c
  state    : IsForeignState s c



structure IntergovernmentalIncludesInternational (o : Organization)
    (c : ComplaintText) : Prop where
  international     : IsInternationalOrganization o c
  intergovernmental : IsIntergovernmentalOrganization o c





structure MilitaryTypeTrainingMembership (x : SupportItem) (c : ComplaintText) : Prop where
  species : IsMilitaryTypeTraining x c
  genus   : IsTraining x c





structure Section219DesignationIdentity (o : Organization) (c : ComplaintText) : Prop where
  under2339B : IsTerroristOrganization o c
  under2339D : IsForeignTerroristOrganization o c





structure Section2339TermUse (a : PredicateAct) (x : Conduct) (c : ComplaintText) : Prop where
  underlyingOffense : IsEnumeratedTerrorismOffenseUnder2339 a c
  conduct           : IsHarborOrConcealConduct x c



structure Section2339ATermUse (x : SupportItem) (a : PredicateAct)
    (c : ComplaintText) : Prop where
  support           : IsMaterialSupportOrResources x c
  underlyingOffense : IsEnumeratedOffenseUnder2339A a c



structure Section2339BTermUse (x : SupportItem) (o : Organization)
    (c : ComplaintText) : Prop where
  support      : IsMaterialSupportOrResources x c
  organization : IsTerroristOrganization o c



structure Section2339CTermUse (f : FundsItem) (x : Conduct) (a : PredicateAct)
    (c : ComplaintText) : Prop where
  funds        : IsFundsUnder2339C f c
  fundingVerb  : FundingConduct x c
  predicateAct : IsPredicateAct a c



structure Section2339DTermUse (x : SupportItem) (o : Organization)
    (c : ComplaintText) : Prop where
  training     : IsMilitaryTypeTraining x c
  organization : IsForeignTerroristOrganization o c

end Proving.USC.T18.Ch113B.MaterialSupport.Ontology
