









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Structure

open Proving.USC.Common






abbrev Cite := String









inductive EdgeKind where

  | Incorporates

  | SubjectTo

  | Notwithstanding

  | ExceptAsProvided

  | Savings

  | LexSpecialis


  | DeemedReference


structure Ref where

  source : Cite

  target : Cite

  kind : EdgeKind




inductive TargetStatus where

  | Extant


  | RepealedTarget

  | UncodifiedNote

  | OutsideTitle

  | UnnamedOtherLaw



structure RefAudit where
  ref : Ref
  status : TargetStatus

end Proving.USC.T42.Ch6ASchI.Reearn.Structure
