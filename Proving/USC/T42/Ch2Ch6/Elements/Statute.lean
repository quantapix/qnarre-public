







import Proving.USC.T42.Ch2Ch6.Elements.Predicates

namespace Proving.USC.T42.Ch2Ch6.Elements
open Proving.USC.Common



structure Section88 (v : Vessel) (cg : Cargo) (c : ComplaintText) : Prop where
  barredFromPort : StateHealthLawProhibitsPortEntry v c
  altUnlading    : StateHealthLawPermitsAlternateUnlading v c
  cargoReported  : WholeCargoReportedToCollector cg c
  supervised     : UnladingUnderCustomsSupervision cg c
  conditions     : SecretaryConditionsObserved cg c


structure Section89 (v : Vessel) (w : Warehouse) (c : ComplaintText) : Prop where
  quarantined : VesselSubjectToQuarantine v c
  erected     : WarehousesErectedUnderPresidentialOrder w c
  located     : LocationServesRevenueAndHealthLaws w c


structure Section90 (cg : Cargo) (w : Warehouse) (c : ComplaintText) : Prop where
  unladen      : CargoUnladenUnderSections88And89 cg c
  deposited    : ArticlesDepositedInDesignatedWarehouse cg w c
  jointCustody : HeldInJointCustody cg c
  removable    : RemovableWithoutContraveningHealthLaws cg c
  dutiesPaid   : EnteredAndDutiesPaidWithStorage cg c



structure Section91 (v : Vessel) (cg : Cargo) (c : ComplaintText) : Prop where
  conformityNeeds : ConformityToQuarantineRequiresExtension v c
  subject         : VesselSubjectToQuarantineHealthLaws v c
  noUnlading      : NoUnladingExceptAsAllowed cg c



structure Section97 (v : Vessel) (o : Officer) (c : ComplaintText) : Prop where
  quarantineEstab  : StateHealthLawEstablishesQuarantine v c
  isFederalOfficer : IsFederalMaritimeOfficer o c
  withinPowers     : WithinOfficerPowersAndPrecinct o c
  observesAndAids  : ObservesAndAidsHealthLaws o c


structure Section97Proviso (c : ComplaintText) : Prop where
  noTonnageDuty : NoStateTonnageDutyWithoutCongressConsent c


structure Section98 (v : Vessel) (c : ComplaintText) : Prop where
  hhsRequest : RequestBySecretaryHHS c
  usVessel   : VesselBelongsToUSNotRequiredElsewhere v c
  gratuitous : PlacedGratuitouslyForTemporaryQuarantine v c


structure Section112 (o : Officer) (c : ComplaintText) : Prop where
  epidemic     : ContagiousOrEpidemicDiseasePrevalent c
  dangerous    : DangerousOrInconvenientToContinueDuties o c
  removed      : RemovalToConvenientPlaceNearDistrict o c
  publicNotice : PublicNoticeGiven c


structure Section191 (b : Bureau) (c : ComplaintText) : Prop where
  established : ChildrensBureauEstablishedInHHS b c


structure Section192 (p : Person) (b : Bureau) (o : Official) (c : ComplaintText) : Prop where
  chiefAppointed : ChiefAppointedByPresidentWithSenateConsent p c
  investigates   : BureauInvestigatesAndReportsChildWelfare b c
  noFamilyEntry  : NoEntryOverFamilyObjection o c


structure Section193 (p : Person) (c : ComplaintText) : Prop where
  assistantAppointed : AssistantChiefAppointedBySecretary p c




structure Section194 (b : Bureau) (n : Nat) (c : ComplaintText) : Prop where
  quarters  : QuartersFurnishedForBureau b c
  rental    : AnnualRentalIs n c
  withinCap : n ≤ 2000

end Proving.USC.T42.Ch2Ch6.Elements
