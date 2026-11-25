











import Proving.USC.Common.Types

namespace Proving.USC.T28.Structure


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis



structure Ref where
  source : String
  target : String
  kind   : EdgeKind












def edge_1343a1_incorporates_1985 : Ref :=
  { source := "28 USC § 1343(a)(1)", target := "42 USC § 1985", kind := .Incorporates }




def edge_1343a2_incorporates_1985 : Ref :=
  { source := "28 USC § 1343(a)(2)", target := "42 USC § 1985", kind := .Incorporates }



def edge_1343a3_incorporates_constitution : Ref :=
  { source := "28 USC § 1343(a)(3)", target := "U.S. Const. (rights secured)", kind := .Incorporates }




def edge_1343a3_incorporates_equalRightsActs : Ref :=
  { source := "28 USC § 1343(a)(3)", target := "Acts of Congress providing for equal rights (class)", kind := .Incorporates }



def edge_1343a4_incorporates_civilRightsActs : Ref :=
  { source := "28 USC § 1343(a)(4)", target := "Acts of Congress protecting civil rights, incl. right to vote (class)", kind := .Incorporates }






def edge_1343a_incorporates_1343b : Ref :=
  { source := "28 USC § 1343(a)", target := "28 USC § 1343(b)", kind := .Incorporates }











def edge_1746p1_incorporates_perjuryLaw : Ref :=
  { source := "28 USC § 1746(1)", target := "laws of the United States of America (federal perjury regime, unnamed)", kind := .Incorporates }




def edge_1746p2_incorporates_perjuryLaw : Ref :=
  { source := "28 USC § 1746(2)", target := "penalty of perjury (federal law, unnamed)", kind := .Incorporates }

end Proving.USC.T28.Structure
