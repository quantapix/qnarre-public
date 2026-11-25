





import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Procedure

open Proving.USC.Common



opaque District : Type



opaque Offense : Type



opaque Proceeding : Type



opaque FinancialInstitution : Type


opaque Funds : Type


opaque Investigation : Type


opaque Referral : Type




opaque Sentence : Type



opaque LegalEntity : Type




opaque Organization : Type







inductive Stage where

  | ConductOccurred


  | JurisdictionEstablished

  | InvestigationOpened


  | ReferredToAttorneyGeneral

  | ActionCommenced

  | ClassifiedProcedureOrdered

  | InterlocutoryAppealPending

  | Adjudicated


  | PenaltyImposed

  | Barred
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch113B.MaterialSupport.Procedure
