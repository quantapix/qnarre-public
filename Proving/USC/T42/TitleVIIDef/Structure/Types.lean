

















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVIIDef.Structure

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



def EdgeKind.tag : EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"



def Ref.toCommon (r : Ref) : StructRef :=
  { source := r.source, target := r.target, kind := r.kind.tag }

end Proving.USC.T42.TitleVIIDef.Structure
