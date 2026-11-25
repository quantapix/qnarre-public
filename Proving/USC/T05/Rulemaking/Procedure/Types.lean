



















import Proving.USC.Common.Types

namespace Proving.USC.T05.Rulemaking.Procedure

open Proving.USC.Common



opaque Rule : Type


opaque Agency : Type



inductive State
  | Initiated
  | NoticePublished
  | CommentPeriodOpen
  | RuleAdopted
  | Effective
  | Exempt
  deriving DecidableEq, Repr

end Proving.USC.T05.Rulemaking.Procedure
