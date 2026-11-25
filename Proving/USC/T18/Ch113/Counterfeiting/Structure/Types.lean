












import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch113.Counterfeiting.Structure

open Proving.USC.Common




inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
deriving DecidableEq, Repr


structure Ref where
  source : String
  target : String
  kind   : EdgeKind
deriving Repr





def edge_2318_incorporates_2320f : Ref :=
  { source := "18 USC § 2318(b)(2)", target := "18 USC § 2320(f)", kind := .Incorporates }



def edge_2318_incorporates_t17_101 : Ref :=
  { source := "18 USC § 2318(b)(3)", target := "17 USC § 101", kind := .Incorporates }



def edge_2318_incorporates_t49_46501 : Ref :=
  { source := "18 USC § 2318(c)(1)", target := "49 USC § 46501", kind := .Incorporates }



def edge_2318_subjectTo_2323 : Ref :=
  { source := "18 USC § 2318(d)", target := "18 USC § 2323", kind := .SubjectTo }



def edge_2318_savings : Ref :=
  { source := "18 USC § 2318(d)", target := "any other similar remedies provided by law", kind := .Savings }





def edge_2319_incorporates_t17_506a : Ref :=
  { source := "18 USC § 2319(a)", target := "17 USC § 506(a)", kind := .Incorporates }



def edge_2319_incorporates_t17_101 : Ref :=
  { source := "18 USC § 2319(f)(1)", target := "17 USC § 101", kind := .Incorporates }



def edge_2319_incorporates_t17_106 : Ref :=
  { source := "18 USC § 2319(f)(2)", target := "17 USC § 106", kind := .Incorporates }



def edge_2319_subjectTo_t17_107_122 : Ref :=
  { source := "18 USC § 2319(f)(2)", target := "17 USC §§ 107–122", kind := .SubjectTo }



def edge_2319_savings : Ref :=
  { source := "18 USC § 2319(a)", target := "any other provisions of title 17 or any other law", kind := .Savings }





def edge_2320_subjectTo_2323 : Ref :=
  { source := "18 USC § 2320(c)", target := "18 USC § 2323", kind := .SubjectTo }



def edge_2320_incorporates_lanham : Ref :=
  { source := "18 USC § 2320(d)", target := "15 USC § 1051 et seq.", kind := .Incorporates }



def edge_2320_incorporates_t36_220506 : Ref :=
  { source := "18 USC § 2320(f)(1)(B)", target := "36 USC § 220506", kind := .Incorporates }



def edge_2320_incorporates_t21_321 : Ref :=
  { source := "18 USC § 2320(f)(6)", target := "21 USC § 321", kind := .Incorporates }



def edge_2320_incorporates_t28_522 : Ref :=
  { source := "18 USC § 2320(h)(1)", target := "28 USC § 522", kind := .Incorporates }



def edge_2320_incorporates_2318_2319 : Ref :=
  { source := "18 USC § 2320(h)(1)", target := "18 USC §§ 2318, 2319", kind := .Incorporates }




def edge_2320_exceptAsProvided_repackaging : Ref :=
  { source := "18 USC § 2320(g)", target := "18 USC § 2320(a)", kind := .ExceptAsProvided }

end Proving.USC.T18.Ch113.Counterfeiting.Structure
