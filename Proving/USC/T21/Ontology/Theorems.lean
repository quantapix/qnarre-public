import Proving.USC.T21.Ontology.Types
import Proving.USC.T21.Ontology.Predicates
import Proving.USC.T21.Ontology.Statute
import Proving.USC.Common.Types









namespace Proving.USC.T21.Ontology


theorem controlledSubstanceMembership_intro {s c}
    (base : IsDrug s c ∨ IsImmediatePrecursor s c)
    (member : IsControlledSubstance s c)
    : ControlledSubstanceMembership s c := ⟨base, member⟩


theorem counterfeitSubstanceMembership_intro {s c}
    (controlled : IsControlledSubstance s c)
    (member : IsCounterfeitSubstance s c)
    : CounterfeitSubstanceMembership s c := ⟨controlled, member⟩


theorem listedChemicalMembership_intro {s c}
    (listI : IsListIChemical s c) (member : IsListedChemical s c)
    : ListedChemicalMembership s c :=
  ListedChemicalMembership.viaListI listI member


theorem dispensingMembership_intro {a deliverer recipient c}
    (delivery : IsDelivery a c)
    (byPractitioner : IsPractitioner deliverer c)
    (toUltimateUser : IsUltimateUser recipient c)
    (member : IsDispensing a c)
    : DispensingMembership a deliverer recipient c :=
  ⟨delivery, byPractitioner, toUltimateUser, member⟩


theorem distributionMembership_intro {a c}
    (delivery : IsDelivery a c)
    (notAdministering : ¬ IsAdministering a c)
    (notDispensing : ¬ IsDispensing a c)
    (member : IsDistribution a c)
    : DistributionMembership a c :=
  ⟨delivery, notAdministering, notDispensing, member⟩


theorem productionViaManufacture_intro {a c}
    (manufacture : IsManufacturing a c) (member : IsProduction a c)
    : ProductionViaManufacture a c := ⟨manufacture, member⟩


theorem narcoticDrugMembership_intro {s c}
    (opiate : IsOpiate s c) (member : IsNarcoticDrug s c)
    : NarcoticDrugMembership s c :=
  NarcoticDrugMembership.viaOpiate opiate member


theorem maintenanceTreatmentMembership_intro {a s c}
    (dispensing : IsDispensing a c) (narcotic : IsNarcoticDrug s c)
    (member : IsMaintenanceTreatment a c)
    : MaintenanceTreatmentMembership a s c := ⟨dispensing, narcotic, member⟩


theorem detoxificationTreatmentMembership_intro {a s c}
    (dispensing : IsDispensing a c) (narcotic : IsNarcoticDrug s c)
    (member : IsDetoxificationTreatment a c)
    : DetoxificationTreatmentMembership a s c := ⟨dispensing, narcotic, member⟩


theorem regulatedPersonViaListedChemical_intro {p s c}
    (chemical : IsListedChemical s c) (member : IsRegulatedPerson p c)
    : RegulatedPersonViaListedChemical p s c := ⟨chemical, member⟩


theorem felonyDrugOffenseMembership_intro {o s c}
    (narcotic : IsNarcoticDrug s c) (member : IsFelonyDrugOffense o c)
    : FelonyDrugOffenseMembership o s c :=
  FelonyDrugOffenseMembership.viaNarcotic narcotic member


theorem dateRapeDrugViaAnalogue_intro {s c}
    (analogue : IsControlledSubstanceAnalogue s c)
    (member : IsDateRapeDrug s c)
    : DateRapeDrugViaAnalogue s c := ⟨analogue, member⟩



theorem authorizedPurchaserMembership_intro {p prescriber c}
    (relationship : HasQualifyingMedicalRelationship p prescriber c)
    (prescriberPractitioner : IsPractitioner prescriber c)
    (member : IsAuthorizedPurchaser p c)
    : AuthorizedPurchaserMembership p c :=
  AuthorizedPurchaserMembership.viaPrescription relationship prescriberPractitioner member


theorem deliveryByInternetMembership_intro {a c}
    (delivery : IsDelivery a c) (member : IsDeliveryByInternet a c)
    : DeliveryByInternetMembership a c := ⟨delivery, member⟩


theorem onlinePharmacyMembership_intro {e a s c}
    (controlled : IsControlledSubstance s c)
    (internetDelivery : IsDeliveryByInternet a c)
    (member : IsOnlinePharmacy e c)
    : OnlinePharmacyMembership e a s c :=
  ⟨controlled, internetDelivery, member⟩

end Proving.USC.T21.Ontology
