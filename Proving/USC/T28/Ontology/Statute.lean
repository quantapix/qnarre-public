







import Proving.USC.T28.Ontology.Types
import Proving.USC.T28.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T28.Ontology

open Proving.USC.Common (ComplaintText Person)





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_state_dependsOn_dc : DefEdge :=
  { defined := "State", dependsOn := "District of Columbia",
    citeDefine := "28 USC § 1343(b)(1)" }



def edge_dcStatute_dependsOn_actOfCongress : DefEdge :=
  { defined := "statute of the District of Columbia",
    dependsOn := "Act of Congress", citeDefine := "28 USC § 1343(b)(2)" }



def edge_s1343a_dependsOn_civilAction : DefEdge :=
  { defined := "section 1343(a) jurisdictional action",
    dependsOn := "civil action", citeDefine := "28 USC § 1343(a)" }



def edge_s1343a_dependsOn_person : DefEdge :=
  { defined := "section 1343(a) jurisdictional action",
    dependsOn := "person", citeDefine := "28 USC § 1343(a)" }



def edge_s1343a1_dependsOn_conspiracy1985 : DefEdge :=
  { defined := "conspiracy-damages action",
    dependsOn := "conspiracy (42 USC § 1985)",
    citeDefine := "28 USC § 1343(a)(1)" }



def edge_s1343a2_dependsOn_wrongs1985 : DefEdge :=
  { defined := "neglect-to-prevent action",
    dependsOn := "wrongs (42 USC § 1985)",
    citeDefine := "28 USC § 1343(a)(2)" }



def edge_s1343a3_dependsOn_state : DefEdge :=
  { defined := "color-of-law deprivation action",
    dependsOn := "State", citeDefine := "28 USC § 1343(a)(3)" }



def edge_s1343a3_dependsOn_securedRight : DefEdge :=
  { defined := "color-of-law deprivation action",
    dependsOn := "right, privilege or immunity secured by the Constitution",
    citeDefine := "28 USC § 1343(a)(3)" }



def edge_s1343a4_dependsOn_civilRightsAct : DefEdge :=
  { defined := "civil-rights protection action",
    dependsOn := "Act of Congress providing for the protection of civil rights",
    citeDefine := "28 USC § 1343(a)(4)" }



def edge_unswornDecl_dependsOn_penaltyOfPerjury : DefEdge :=
  { defined := "unsworn declaration",
    dependsOn := "penalty of perjury", citeDefine := "28 USC § 1746" }




def edge_unswornDecl_dependsOn_unitedStates : DefEdge :=
  { defined := "unsworn declaration",
    dependsOn := "United States (geographic)", citeDefine := "28 USC § 1746" }



def defEdges : List DefEdge :=
  [ edge_state_dependsOn_dc,
    edge_dcStatute_dependsOn_actOfCongress,
    edge_s1343a_dependsOn_civilAction,
    edge_s1343a_dependsOn_person,
    edge_s1343a1_dependsOn_conspiracy1985,
    edge_s1343a2_dependsOn_wrongs1985,
    edge_s1343a3_dependsOn_state,
    edge_s1343a3_dependsOn_securedRight,
    edge_s1343a4_dependsOn_civilRightsAct,
    edge_unswornDecl_dependsOn_penaltyOfPerjury,
    edge_unswornDecl_dependsOn_unitedStates ]







structure DCTreatedAsState (s : State) (c : ComplaintText) : Prop where
  isDC  : IsDistrictOfColumbia s c
  state : IsStateForSection1343 s c



structure DCExclusiveActAsDCStatute (a : ActOfCongress) (c : ComplaintText) : Prop where
  exclusiveToDC : IsActExclusiveToDC a c
  dcStatute     : IsStatuteOfDC a c



inductive Section1343Basis (act : CivilAction) (c : ComplaintText) : Prop

  | conspiracyDamages   (h : IsConspiracyDamagesAction act c)   : Section1343Basis act c

  | neglectToPrevent    (h : IsNeglectToPreventAction act c)    : Section1343Basis act c

  | colorOfLawDeprivation (h : IsColorOfLawDeprivationAction act c) : Section1343Basis act c

  | civilRightsProtection (h : IsCivilRightsProtectionAction act c) : Section1343Basis act c




structure Section1343Jurisdiction (act : CivilAction) (p : Person) (c : ComplaintText) : Prop where
  authorized  : IsCivilActionAuthorizedByLaw act c
  commencedBy : CommencedByPerson act p c
  basis       : Section1343Basis act c






inductive PerjuryForm (d : Declaration) (c : ComplaintText) : Prop


  | withoutUS (hLoc : ExecutedWithoutUnitedStates d c)
              (hLaws : RecitesLawsOfUnitedStates d c) : PerjuryForm d c


  | withinUS  (hLoc : ExecutedWithinUnitedStates d c) : PerjuryForm d c





structure UnswornDeclarationDef (d : Declaration) (c : ComplaintText) : Prop where
  declares       : DeclaresUnderPenaltyOfPerjury d c
  trueAndCorrect : AssertsTrueAndCorrect d c
  dated          : StatesExecutionDate d c
  signed         : BearsSignature d c
  form           : PerjuryForm d c
  member         : IsUnswornDeclaration d c

end Proving.USC.T28.Ontology
