














import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch42.Structure

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









def edge_892_incorporates_891 : Ref :=
  { source := "18 USC § 892", target := "18 USC § 891", kind := .Incorporates }



def edge_893_incorporates_891 : Ref :=
  { source := "18 USC § 893", target := "18 USC § 891", kind := .Incorporates }




def edge_894_incorporates_891 : Ref :=
  { source := "18 USC § 894", target := "18 USC § 891", kind := .Incorporates }




def edge_894_incorporates_892 : Ref :=
  { source := "18 USC § 894", target := "18 USC § 892(b)", kind := .Incorporates }


def edges : List Ref :=
  [ edge_892_incorporates_891
  , edge_893_incorporates_891
  , edge_894_incorporates_891
  , edge_894_incorporates_892 ]

end Proving.USC.T18.Ch42.Structure
