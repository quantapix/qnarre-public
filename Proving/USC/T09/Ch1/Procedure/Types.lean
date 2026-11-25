







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Procedure

open Proving.USC.Common




opaque ArbitrationAgreement : Type




opaque Award : Type



opaque CourtOrder : Type



opaque Arbitrator : Type





inductive State where

  | AgreementFormed

  | DisputeArisen


  | SuitPending

  | StayGranted

  | CompelPetitionFiled

  | ArbitrationOrdered


  | ProceedingDismissed

  | ArbitratorsAppointed

  | ArbitrationHeld

  | AwardMade

  | ConfirmationSought

  | VacaturSought

  | ModificationSought

  | AwardConfirmed

  | AwardVacated

  | AwardModified

  | JudgmentEntered

  | AppealTaken
  deriving DecidableEq, Repr

end Proving.USC.T09.Ch1.Procedure
