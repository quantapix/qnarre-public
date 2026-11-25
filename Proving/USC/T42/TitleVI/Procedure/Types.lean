















import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Procedure

open Proving.USC.Common



opaque Agency : Type



opaque Proceeding : Type






inductive State

  | Covered

  | Advised


  | VoluntaryFailed


  | FindingOnRecord


  | ReportFiled


  | Effective
  deriving DecidableEq

end Proving.USC.T42.TitleVI.Procedure
