






import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology

open Proving.USC.Common





axiom IsPersonDesignatedInSection1114 (p : Person) (c : ComplaintText) : Prop




axiom IsDeadlyOrDangerousWeapon (w : Weapon) (c : ComplaintText) : Prop



axiom IsForeignOfficial (p : Person) (c : ComplaintText) : Prop



axiom IsOfficialGuest (p : Person) (c : ComplaintText) : Prop



axiom IsInternationallyProtectedPerson (p : Person) (c : ComplaintText) : Prop



axiom IsForeignGovernment (g : Government) (c : ComplaintText) : Prop



axiom IsInternationalOrganization (o : Organization) (c : ComplaintText) : Prop





axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom IsProtectedOfficialPremises (pm : Premises) (c : ComplaintText) : Prop




axiom IsWithinSpecialMaritimeAndTerritorialJurisdiction
    (x : Conduct) (c : ComplaintText) : Prop



axiom IsSubstantialBodilyInjury (i : Injury) (c : ComplaintText) : Prop



axiom IsTemporaryButSubstantialDisfigurement (i : Injury) (c : ComplaintText) : Prop



axiom IsTemporaryButSubstantialLossOfBodilyFunction
    (i : Injury) (c : ComplaintText) : Prop




axiom IsSeriousBodilyInjury (i : Injury) (c : ComplaintText) : Prop





axiom IsDatingPartner (p q : Person) (c : ComplaintText) : Prop




axiom IsSpouseOrIntimatePartner (p q : Person) (c : ComplaintText) : Prop



axiom IsStrangling (x : Conduct) (c : ComplaintText) : Prop



axiom IsSuffocating (x : Conduct) (c : ComplaintText) : Prop




axiom IsIntentionalKnowingOrReckless (x : Conduct) (c : ComplaintText) : Prop



axiom ImpedesBreathingOrCirculationByThroatPressure
    (x : Conduct) (c : ComplaintText) : Prop



axiom ImpedesBreathingByCoveringMouthOrNose (x : Conduct) (c : ComplaintText) : Prop



axiom IsTorture (x : Conduct) (c : ComplaintText) : Prop



axiom IsFederalLawEnforcementOfficer (p : Person) (c : ComplaintText) : Prop




axiom IsImmediateFamilyMemberOf (p q : Person) (c : ComplaintText) : Prop



axiom IsSpouseParentSiblingChildOrInLocoParentis
    (p q : Person) (c : ComplaintText) : Prop



axiom IsHouseholdMemberRelatedByBloodOrMarriage
    (p q : Person) (c : ComplaintText) : Prop



axiom IsUnitedStatesJudge (p : Person) (c : ComplaintText) : Prop



axiom IsUnitedStatesOfficial (p : Person) (c : ComplaintText) : Prop



axiom IsFemaleGenitalMutilation (pr : Procedure) (c : ComplaintText) : Prop



axiom IsPerformedForNonMedicalReasons (pr : Procedure) (c : ComplaintText) : Prop




axiom IsRemovalOfOrInjuryToExternalFemaleGenitalia
    (pr : Procedure) (c : ComplaintText) : Prop



axiom IsClitoridectomy (pr : Procedure) (c : ComplaintText) : Prop



axiom IsExcisionOfLabia (pr : Procedure) (c : ComplaintText) : Prop



axiom IsInfibulation (pr : Procedure) (c : ComplaintText) : Prop



axiom IsOtherHarmfulGenitalProcedure (pr : Procedure) (c : ComplaintText) : Prop




axiom IsLicensedMedicalPractitioner (p : Person) (c : ComplaintText) : Prop




axiom IsMedicallyNecessaryOperation (pr : Procedure) (c : ComplaintText) : Prop




axiom IsChildbirthRelatedOperation (pr : Procedure) (c : ComplaintText) : Prop





axiom IsInterstateOrForeignCommerceNexus (x : Conduct) (c : ComplaintText) : Prop



axiom IsDomesticAssault (x : Conduct) (c : ComplaintText) : Prop




axiom IsAssault (x : Conduct) (c : ComplaintText) : Prop





axiom IsDomesticRelationToVictim (p q : Person) (c : ComplaintText) : Prop



axiom IsWithinIndianCountry (x : Conduct) (c : ComplaintText) : Prop





axiom IsFederalLawEnforcementAgent (p : Person) (c : ComplaintText) : Prop




axiom IsProtectiveFunctionDuty (x : Conduct) (c : ComplaintText) : Prop



axiom IsRestrictedPersonalInformation (i : Information) (c : ComplaintText) : Prop




axiom IsEnumeratedPersonalDataItem (i : Information) (c : ComplaintText) : Prop



axiom IsIdentifiableToIndividual (i : Information) (p : Person) (c : ComplaintText) : Prop



axiom IsCoveredPerson (p : Person) (c : ComplaintText) : Prop



axiom IsCourtOfficerJurorOrWitness (p : Person) (c : ComplaintText) : Prop



axiom IsFederalInvestigationInformantOrWitness (p : Person) (c : ComplaintText) : Prop



axiom IsStateOrLocalOfficerAssistingFederalInvestigation
    (p : Person) (c : ComplaintText) : Prop



axiom IsCrimeOfViolence (x : Conduct) (c : ComplaintText) : Prop





axiom IsDebtor (p : Person) (c : ComplaintText) : Prop



axiom IsPetitionFiledUnderTitle11 (d : Document) (c : ComplaintText) : Prop



axiom PetitionConcernsPerson (d : Document) (p : Person) (c : ComplaintText) : Prop




axiom IsCaseUnderTitle11 (k : BankruptcyCase) (c : ComplaintText) : Prop




axiom IsEstateOfDebtor (e : Estate) (p : Person) (c : ComplaintText) : Prop



axiom IsPropertyBelongingToEstate (pr : Property) (e : Estate) (c : ComplaintText) : Prop




axiom IsCourtOfficerCustodianOrTrustee (p : Person) (c : ComplaintText) : Prop




axiom IsUnitedStatesTrustee (p : Person) (c : ComplaintText) : Prop




axiom IsEstateAdministrationInsider (p : Person) (e : Estate) (c : ComplaintText) : Prop




axiom HasAccessToEstatePropertyOrDocuments
    (p : Person) (e : Estate) (c : ComplaintText) : Prop






axiom ParticipatesInEstateAdministration
    (p : Person) (e : Estate) (c : ComplaintText) : Prop




axiom IsPartyInInterest (p : Person) (c : ComplaintText) : Prop



axiom IsCreditor (p : Person) (c : ComplaintText) : Prop



axiom IsReceiver (p : Person) (c : ComplaintText) : Prop



axiom IsAttorneyForPartyInInterest (p q : Person) (c : ComplaintText) : Prop



axiom IsBankruptcyPetitionPreparer (p : Person) (c : ComplaintText) : Prop



axiom PreparesDocumentForCompensation
    (p : Person) (d : Document) (c : ComplaintText) : Prop




axiom IsDebtorsAttorneyOrEmployee (p : Person) (c : ComplaintText) : Prop



axiom IsDocumentForFiling (d : Document) (c : ComplaintText) : Prop




axiom IsPreparedForFilingByDebtor (d : Document) (c : ComplaintText) : Prop




axiom IsFiledInUnitedStatesBankruptcyOrDistrictCourt
    (d : Document) (c : ComplaintText) : Prop




axiom IsRecordedInformation (i : Information) (c : ComplaintText) : Prop




axiom IsSchemeOrArtificeToDefraud (s : Scheme) (c : ComplaintText) : Prop





axiom IsBiologicalAgent (a : Agent) (c : ComplaintText) : Prop





axiom IsMicroorganismOrInfectiousSubstance (a : Agent) (c : ComplaintText) : Prop




axiom IsCapableOfCausingBiologicalHarm (a : Agent) (c : ComplaintText) : Prop



axiom IsToxin (t : Toxin) (c : ComplaintText) : Prop




axiom IsToxicMaterialOrProduct (t : Toxin) (c : ComplaintText) : Prop





axiom IsBiologicalOrSynthesizedOrigin (t : Toxin) (c : ComplaintText) : Prop



axiom IsDeliverySystem (ds : DeliverySystem) (c : ComplaintText) : Prop





axiom IsApparatusDesignedToDisseminate (ds : DeliverySystem) (c : ComplaintText) : Prop



axiom IsVectorDeliverySystem (ds : DeliverySystem) (c : ComplaintText) : Prop



axiom IsVector (v : Vector) (c : ComplaintText) : Prop




axiom IsLivingOrganismOrMolecule (v : Vector) (c : ComplaintText) : Prop




axiom IsCapableOfCarryingAgentOrToxinToHost (v : Vector) (c : ComplaintText) : Prop



axiom IsForUseAsAWeapon (x : Conduct) (c : ComplaintText) : Prop




axiom IsPeacefulPurpose (pu : Purpose) (c : ComplaintText) : Prop





axiom IsNaturallyOccurringUnextracted (a : Agent) (c : ComplaintText) : Prop



axiom IsSelectAgent (a : Agent) (c : ComplaintText) : Prop




axiom IsListedSelectBiologicalAgentOrToxin (a : Agent) (c : ComplaintText) : Prop




axiom IsExcludedOrExemptedUnderPart73 (a : Agent) (c : ComplaintText) : Prop



axiom IsRestrictedPerson (p : Person) (c : ComplaintText) : Prop



axiom IsUnderIndictmentForFelony (p : Person) (c : ComplaintText) : Prop



axiom IsConvictedOfFelony (p : Person) (c : ComplaintText) : Prop



axiom IsFugitiveFromJustice (p : Person) (c : ComplaintText) : Prop



axiom IsUnlawfulUserOfControlledSubstance (p : Person) (c : ComplaintText) : Prop



axiom IsAlienUnlawfullyInTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsAdjudicatedMentalDefectiveOrCommitted (p : Person) (c : ComplaintText) : Prop






axiom IsNationalOfTerrorismSupportingCountry (p : Person) (c : ComplaintText) : Prop



axiom IsDishonorablyDischarged (p : Person) (c : ComplaintText) : Prop



axiom IsAffiliatedWithTerroristOrganization (p : Person) (c : ComplaintText) : Prop



axiom IsAlien (p : Person) (c : ComplaintText) : Prop



axiom IsLawfullyAdmittedForPermanentResidence (p : Person) (c : ComplaintText) : Prop




axiom IsTerroristOrganization (o : Organization) (c : ComplaintText) : Prop




axiom IsRegisteredUnderSelectAgentRegulations (p : Person) (c : ComplaintText) : Prop



axiom IsVariolaVirus (v : Virus) (c : ComplaintText) : Prop



axiom CausesHumanSmallpox (v : Virus) (c : ComplaintText) : Prop





axiom IsVariolaGeneSequenceDerivative (v : Virus) (c : ComplaintText) : Prop



axiom IsExigentCircumstance (x : Conduct) (c : ComplaintText) : Prop




axiom IsReasonableTypeAndQuantityForPurpose
    (a : Agent) (pu : Purpose) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology
