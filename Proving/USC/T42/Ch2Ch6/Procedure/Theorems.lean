







import Proving.USC.T42.Ch2Ch6.Procedure.Statute

namespace Proving.USC.T42.Ch2Ch6.Procedure

open Proving.USC.Common





theorem withinExtendedEntryWindow_intro {c}
    (h : actualEntryDay c ≤ entryDeadlineDay c + extensionDays c) :
    WithinExtendedEntryWindow c := h


theorem rentalWithinStatutoryCap_intro {c}
    (h : annualRentalDollars c ≤ 2000) : RentalWithinStatutoryCap c := h




theorem lawfulQuarantineDischarge_intro {c}
    (hProhibited : StateHealthLawProhibitsPort c) (hReported : CargoReportMade c)
    (hWarranted : UnladingWarrantGranted c) (hSupervised : UnladingUnderSupervision c) :
    LawfulQuarantineDischarge c :=
  ⟨hProhibited, hReported, hWarranted, hSupervised⟩


theorem lawfulWarehouseRemoval_intro {c}
    (hUnladen : CargoUnladenElsewhere c)
    (hDeposited : ArticlesDepositedInDesignatedWarehouse c)
    (hJoint : JointCustodyMaintained c)
    (hRemovable : SafelyRemovableWithoutContravening c)
    (hDuties : DutiesPaid c) (hStorage : StorageRatePaid c)
    (hPermit : RemovalPermitGranted c) :
    LawfulWarehouseRemoval c :=
  ⟨hUnladen, hDeposited, hJoint, hRemovable, hDuties, hStorage, hPermit⟩


theorem timelyExtendedEntry_intro {c}
    (hConformity : ConformityRequiresExtension c)
    (hExtended : EntryTimeExtensionGranted c)
    (hWindow : WithinExtendedEntryWindow c)
    (hUnlading : UnladingOnlyAsPermitted c) :
    TimelyExtendedEntry c :=
  ⟨hConformity, hExtended, hWindow, hUnlading⟩


theorem quarantineObservedByOfficers_intro {c}
    (hEstablished : StateQuarantineEstablished c)
    (hObservedAid : OfficersObserveAndAidQuarantine c) :
    QuarantineObservedByOfficers c :=
  ⟨hEstablished, hObservedAid⟩


theorem quarantineVesselProvided_intro {c}
    (hRequested : QuarantineAuthorityRequest c)
    (hPlaced : NavyVesselPlacedAtDisposal c) :
    QuarantineVesselProvided c :=
  ⟨hRequested, hPlaced⟩


theorem lawfulRevenueOfficerRemoval_intro {c}
    (hEpidemic : EpidemicNearPort c)
    (hDirected : RevenueOfficerRemovalDirected c)
    (hNoticed : PublicNoticeGiven c) :
    LawfulRevenueOfficerRemoval c :=
  ⟨hEpidemic, hDirected, hNoticed⟩


theorem lawfulResidenceEntry_intro {c}
    (hEntered : ResidenceEntryOccurred c)
    (hNoObjection : NoObjectionByHeadOfFamily c) :
    LawfulResidenceEntry c :=
  ⟨hEntered, hNoObjection⟩


theorem bureauReportingComplete_intro {c}
    (hInvestigated : BureauInvestigatedWelfare c)
    (hReported : ReportedToSecretary c) :
    BureauReportingComplete c :=
  ⟨hInvestigated, hReported⟩


theorem chiefAppointment_intro {c}
    (hAppointed : AppointedWithSenateAdviceAndConsent c) :
    ChiefAppointment c :=
  ⟨hAppointed⟩


theorem assistantChiefAppointment_intro {c}
    (hAppointed : AssistantChiefAppointed c) :
    AssistantChiefAppointment c :=
  ⟨hAppointed⟩


theorem lawfulQuartersProvision_intro {c}
    (hFurnished : QuartersFurnished c) (hCap : RentalWithinStatutoryCap c) :
    LawfulQuartersProvision c :=
  ⟨hFurnished, hCap⟩

end Proving.USC.T42.Ch2Ch6.Procedure
