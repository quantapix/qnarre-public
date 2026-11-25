import Proving.USC.T21.Ontology.Types
import Proving.USC.Common.Types









namespace Proving.USC.T21.Ontology

open Proving.USC.Common (Person Entity ComplaintText)


axiom IsAddict (p : Person) (c : ComplaintText) : Prop


axiom IsAdministering (a : DrugAct) (c : ComplaintText) : Prop


axiom IsAgentOfRegistrant (p : Person) (c : ComplaintText) : Prop


axiom IsControlAction (a : DrugAct) (c : ComplaintText) : Prop


axiom IsControlledSubstance (s : Substance) (c : ComplaintText) : Prop


axiom IsCounterfeitSubstance (s : Substance) (c : ComplaintText) : Prop


axiom IsDelivery (a : DrugAct) (c : ComplaintText) : Prop


axiom IsDepressantOrStimulantSubstance (s : Substance) (c : ComplaintText) : Prop


axiom IsDispensing (a : DrugAct) (c : ComplaintText) : Prop


axiom IsDispenser (p : Person) (c : ComplaintText) : Prop


axiom IsDistribution (a : DrugAct) (c : ComplaintText) : Prop


axiom IsDistributor (p : Person) (c : ComplaintText) : Prop


axiom IsDrug (s : Substance) (c : ComplaintText) : Prop


axiom IsFelony (o : Offense) (c : ComplaintText) : Prop


axiom IsIsomer (s : Substance) (c : ComplaintText) : Prop


axiom IsManufacturing (a : DrugAct) (c : ComplaintText) : Prop


axiom IsManufacturer (p : Person) (c : ComplaintText) : Prop


axiom IsMarihuana (s : Substance) (c : ComplaintText) : Prop


axiom IsNarcoticDrug (s : Substance) (c : ComplaintText) : Prop


axiom IsOpiate (s : Substance) (c : ComplaintText) : Prop


axiom IsOpiumPoppy (s : Substance) (c : ComplaintText) : Prop


axiom IsPoppyStraw (s : Substance) (c : ComplaintText) : Prop


axiom IsPractitioner (p : Person) (c : ComplaintText) : Prop


axiom IsProduction (a : DrugAct) (c : ComplaintText) : Prop


axiom IsImmediatePrecursor (s : Substance) (c : ComplaintText) : Prop


axiom IsSeriousBodilyInjury (i : Injury) (c : ComplaintText) : Prop


axiom IsStateJurisdiction (e : Entity) (c : ComplaintText) : Prop


axiom IsUltimateUser (p : Person) (c : ComplaintText) : Prop


axiom IsUnitedStatesPlace (pl : Place) (c : ComplaintText) : Prop


axiom IsMaintenanceTreatment (a : DrugAct) (c : ComplaintText) : Prop


axiom IsDetoxificationTreatment (a : DrugAct) (c : ComplaintText) : Prop


axiom IsControlledSubstanceAnalogue (s : Substance) (c : ComplaintText) : Prop


axiom IsListedChemical (s : Substance) (c : ComplaintText) : Prop


axiom IsListIChemical (s : Substance) (c : ComplaintText) : Prop


axiom IsListIIChemical (s : Substance) (c : ComplaintText) : Prop


axiom IsRegularCustomer (p : Person) (c : ComplaintText) : Prop


axiom IsRegularImporter (p : Person) (c : ComplaintText) : Prop


axiom IsRegulatedPerson (p : Person) (c : ComplaintText) : Prop


axiom IsRegulatedTransaction (t : Transaction) (c : ComplaintText) : Prop


axiom IsChemicalMixture (s : Substance) (c : ComplaintText) : Prop


axiom IsAnabolicSteroid (s : Substance) (c : ComplaintText) : Prop


axiom IsInternationalTransaction (t : Transaction) (c : ComplaintText) : Prop


axiom IsBrokerOrTrader (p : Person) (c : ComplaintText) : Prop


axiom IsFelonyDrugOffense (o : Offense) (c : ComplaintText) : Prop


axiom IsScheduledListedChemicalProduct (s : Substance) (c : ComplaintText) : Prop


axiom IsRegulatedSeller (p : Person) (c : ComplaintText) : Prop


axiom IsMobileRetailVendor (e : Entity) (c : ComplaintText) : Prop


axiom IsAtRetailTransaction (t : Transaction) (c : ComplaintText) : Prop


axiom IsRetailDistributor (e : Entity) (c : ComplaintText) : Prop


axiom IsDeliveryByInternet (a : DrugAct) (c : ComplaintText) : Prop


axiom IsOnlinePharmacy (e : Entity) (c : ComplaintText) : Prop


axiom IsPracticeOfTelemedicine (a : DrugAct) (c : ComplaintText) : Prop


axiom IsRefillPrescriptionScheduleIIIToV (a : DrugAct) (c : ComplaintText) : Prop


axiom IsNewPrescriptionFillScheduleIIIToV (a : DrugAct) (c : ComplaintText) : Prop


axiom IsSuspiciousOrder (t : Transaction) (c : ComplaintText) : Prop


axiom IsSeriousDrugFelony (o : Offense) (c : ComplaintText) : Prop


axiom IsSeriousViolentFelony (o : Offense) (c : ComplaintText) : Prop


axiom IsFentanylRelatedSubstance (s : Substance) (c : ComplaintText) : Prop


axiom IsBoobytrap (d : Device) (c : ComplaintText) : Prop


axiom IsDateRapeDrug (s : Substance) (c : ComplaintText) : Prop


axiom IsAuthorizedPurchaser (p : Person) (c : ComplaintText) : Prop


axiom HasQualifyingMedicalRelationship (p : Person) (prescriber : Person) (c : ComplaintText) : Prop


axiom WithoutIndividualsKnowledge (victim : Person) (a : DrugAct) (c : ComplaintText) : Prop

end Proving.USC.T21.Ontology
