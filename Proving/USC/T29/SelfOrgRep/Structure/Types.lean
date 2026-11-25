













import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T29.SelfOrgRep.Structure

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




def Ref.toCommon (r : Ref) : Proving.USC.Common.StructRef where
  source := r.source
  target := r.target
  kind := match r.kind with
      | .Incorporates     => "Incorporates"
      | .SubjectTo        => "SubjectTo"
      | .Notwithstanding  => "Notwithstanding"
      | .ExceptAsProvided => "ExceptAsProvided"
      | .Savings          => "Savings"
      | .LexSpecialis     => "LexSpecialis"

end Proving.USC.T29.SelfOrgRep.Structure
