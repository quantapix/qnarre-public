














import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Procedure

open Proving.USC.Common




inductive Stage where

  | notCommenced


  | commencedInStateCourt

  | processTransmitted


  | removedToDistrictCourt


  | remandedToStateCourt


  | dismissedForAlternativeRemedy

  | applicationFiled

  | determinationMade

  | remediesExhausted

  | reportOrTransferMade


  | bodyConstituted

  | obligationDischarged

  | timeBarred
  deriving DecidableEq, Repr



opaque AdvisoryCouncil : Type


opaque CouncilMember : Type



opaque ServiceAndSupplyTransaction : Type



opaque CivilAction : Type



opaque DeemingApplication : Type



opaque CompensationRequest : Type



opaque FiscalCycle : Type


opaque EmergencyResponse : Type



opaque MultigrantProject : Type


opaque OrphanProductsBoard : Type



opaque ServiceAppointment : Type


opaque WomensHealthOffice : Type



opaque HospitalUseAgreement : Type



opaque AssistedFacility : Type


opaque FiscalAgentContract : Type

end Proving.USC.T42.Ch6ASchI.Reslice.Procedure
