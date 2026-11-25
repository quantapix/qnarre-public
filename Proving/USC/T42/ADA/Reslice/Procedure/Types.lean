











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Procedure

open Proving.USC.Common


opaque CoveredEntity : Type


opaque MedicalExamination : Type



opaque QualificationStandard : Type



opaque EmploymentTest : Type



opaque ForeignCorporation : Type







inductive EmploymentStage

  | JobApplication

  | PostOfferPreCommencement

  | Employment
  deriving DecidableEq, Repr




structure StageTransition where
  fromStage : EmploymentStage
  toStage   : EmploymentStage
  guard     : Prop

end Proving.USC.T42.ADA.Reslice.Procedure
