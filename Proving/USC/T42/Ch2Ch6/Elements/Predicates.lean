






import Proving.USC.T42.Ch2Ch6.Elements.Types

namespace Proving.USC.T42.Ch2Ch6.Elements
open Proving.USC.Common






axiom StateHealthLawProhibitsPortEntry (v : Vessel) (c : ComplaintText) : Prop


axiom StateHealthLawPermitsAlternateUnlading (v : Vessel) (c : ComplaintText) : Prop


axiom WholeCargoReportedToCollector (cg : Cargo) (c : ComplaintText) : Prop


axiom UnladingUnderCustomsSupervision (cg : Cargo) (c : ComplaintText) : Prop


axiom SecretaryConditionsObserved (cg : Cargo) (c : ComplaintText) : Prop






axiom VesselSubjectToQuarantine (v : Vessel) (c : ComplaintText) : Prop


axiom WarehousesErectedUnderPresidentialOrder (w : Warehouse) (c : ComplaintText) : Prop


axiom LocationServesRevenueAndHealthLaws (w : Warehouse) (c : ComplaintText) : Prop






axiom CargoUnladenUnderSections88And89 (cg : Cargo) (c : ComplaintText) : Prop


axiom ArticlesDepositedInDesignatedWarehouse (cg : Cargo) (w : Warehouse) (c : ComplaintText) : Prop


axiom HeldInJointCustody (cg : Cargo) (c : ComplaintText) : Prop


axiom RemovableWithoutContraveningHealthLaws (cg : Cargo) (c : ComplaintText) : Prop


axiom EnteredAndDutiesPaidWithStorage (cg : Cargo) (c : ComplaintText) : Prop






axiom ConformityToQuarantineRequiresExtension (v : Vessel) (c : ComplaintText) : Prop

axiom VesselSubjectToQuarantineHealthLaws (v : Vessel) (c : ComplaintText) : Prop


axiom NoUnladingExceptAsAllowed (cg : Cargo) (c : ComplaintText) : Prop






axiom StateHealthLawEstablishesQuarantine (v : Vessel) (c : ComplaintText) : Prop


axiom IsFederalMaritimeOfficer (o : Officer) (c : ComplaintText) : Prop


axiom WithinOfficerPowersAndPrecinct (o : Officer) (c : ComplaintText) : Prop


axiom ObservesAndAidsHealthLaws (o : Officer) (c : ComplaintText) : Prop


axiom NoStateTonnageDutyWithoutCongressConsent (c : ComplaintText) : Prop






axiom RequestBySecretaryHHS (c : ComplaintText) : Prop


axiom VesselBelongsToUSNotRequiredElsewhere (v : Vessel) (c : ComplaintText) : Prop


axiom PlacedGratuitouslyForTemporaryQuarantine (v : Vessel) (c : ComplaintText) : Prop






axiom ContagiousOrEpidemicDiseasePrevalent (c : ComplaintText) : Prop


axiom DangerousOrInconvenientToContinueDuties (o : Officer) (c : ComplaintText) : Prop


axiom RemovalToConvenientPlaceNearDistrict (o : Officer) (c : ComplaintText) : Prop

axiom PublicNoticeGiven (c : ComplaintText) : Prop






axiom ChildrensBureauEstablishedInHHS (b : Bureau) (c : ComplaintText) : Prop







axiom ChiefAppointedByPresidentWithSenateConsent (p : Person) (c : ComplaintText) : Prop


axiom BureauInvestigatesAndReportsChildWelfare (b : Bureau) (c : ComplaintText) : Prop



axiom NoEntryOverFamilyObjection (o : Official) (c : ComplaintText) : Prop





axiom AssistantChiefAppointedBySecretary (p : Person) (c : ComplaintText) : Prop






axiom QuartersFurnishedForBureau (b : Bureau) (c : ComplaintText) : Prop



axiom AnnualRentalIs (n : Nat) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch2Ch6.Elements
