







import Proving.USC.T42.Ch2Ch6.Procedure.Predicates

namespace Proving.USC.T42.Ch2Ch6.Procedure

open Proving.USC.Common






def WithinExtendedEntryWindow (c : ComplaintText) : Prop :=
  actualEntryDay c ≤ entryDeadlineDay c + extensionDays c



def RentalWithinStatutoryCap (c : ComplaintText) : Prop :=
  annualRentalDollars c ≤ 2000






structure LawfulQuarantineDischarge (c : ComplaintText) : Prop where
  prohibited : StateHealthLawProhibitsPort c
  reported   : CargoReportMade c
  warranted  : UnladingWarrantGranted c
  supervised : UnladingUnderSupervision c







structure LawfulWarehouseRemoval (c : ComplaintText) : Prop where
  unladen      : CargoUnladenElsewhere c
  deposited    : ArticlesDepositedInDesignatedWarehouse c
  jointCustody : JointCustodyMaintained c
  removable    : SafelyRemovableWithoutContravening c
  dutiesPaid   : DutiesPaid c
  storagePaid  : StorageRatePaid c
  permitted    : RemovalPermitGranted c






structure TimelyExtendedEntry (c : ComplaintText) : Prop where
  conformity  : ConformityRequiresExtension c
  extended    : EntryTimeExtensionGranted c
  inWindow    : WithinExtendedEntryWindow c
  unladingOk  : UnladingOnlyAsPermitted c





structure QuarantineObservedByOfficers (c : ComplaintText) : Prop where
  established : StateQuarantineEstablished c
  observedAid : OfficersObserveAndAidQuarantine c






structure QuarantineVesselProvided (c : ComplaintText) : Prop where
  requested : QuarantineAuthorityRequest c
  placed    : NavyVesselPlacedAtDisposal c





structure LawfulRevenueOfficerRemoval (c : ComplaintText) : Prop where
  epidemic : EpidemicNearPort c
  directed : RevenueOfficerRemovalDirected c
  noticed  : PublicNoticeGiven c





structure LawfulResidenceEntry (c : ComplaintText) : Prop where
  entered    : ResidenceEntryOccurred c
  noObjection : NoObjectionByHeadOfFamily c


structure BureauReportingComplete (c : ComplaintText) : Prop where
  investigated : BureauInvestigatedWelfare c
  reported     : ReportedToSecretary c


structure ChiefAppointment (c : ComplaintText) : Prop where
  appointed : AppointedWithSenateAdviceAndConsent c




structure AssistantChiefAppointment (c : ComplaintText) : Prop where
  appointed : AssistantChiefAppointed c




structure LawfulQuartersProvision (c : ComplaintText) : Prop where
  furnished     : QuartersFurnished c
  rentalWithinCap : RentalWithinStatutoryCap c

end Proving.USC.T42.Ch2Ch6.Procedure
