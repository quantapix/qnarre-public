














import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Part2.Structure

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






def edge_19_incorporates_3571 : Ref :=
  { source := "18 USC § 19", target := "18 USC § 3571", kind := .Incorporates }



def edge_20_incorporates_27 : Ref :=
  { source := "18 USC § 20", target := "18 USC § 27", kind := .Incorporates }



def edge_20_incorporates_12_1422 : Ref :=
  { source := "18 USC § 20", target := "12 USC § 1422", kind := .Incorporates }



def edge_21_incorporates_115 : Ref :=
  { source := "18 USC § 21", target := "18 USC § 115", kind := .Incorporates }




def edge_24_incorporates_1347 : Ref :=
  { source := "18 USC § 24", target := "18 USC § 1347", kind := .Incorporates }



def edge_24_incorporates_42_1320a7b : Ref :=
  { source := "18 USC § 24", target := "42 USC § 1320a-7b", kind := .Incorporates }


def edge_25_incorporates_16 : Ref :=
  { source := "18 USC § 25", target := "18 USC § 16", kind := .Incorporates }



def edge_25_incorporates_23 : Ref :=
  { source := "18 USC § 25", target := "18 USC § 23", kind := .Incorporates }



def edge_27_incorporates_18 : Ref :=
  { source := "18 USC § 27", target := "18 USC § 18", kind := .Incorporates }



def edge_28_incorporates_3771A : Ref :=
  { source := "18 USC § 28", target := "18 USC § 3771A", kind := .Incorporates }



def edge_28_incorporates_22_7102 : Ref :=
  { source := "18 USC § 28", target := "22 USC § 7102", kind := .Incorporates }



def edge_23_exceptAsProvided : Ref :=
  { source := "18 USC § 23", target := "18 USC (title-wide express provision)", kind := .ExceptAsProvided }

end Proving.USC.T18.Ch1.Part2.Structure
