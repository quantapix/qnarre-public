import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.MaterialSupport.Elements.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch113B.MaterialSupport.Elements

open Proving.USC.Common





axiom HarborsOrConceals (d : Person) (t : Person) (c : ComplaintText) : Prop






axiom IsEnumeratedOffenseUnder2339 (o : PredicateOffense) (c : ComplaintText) : Prop




axiom CommittedOrAboutToCommitOffense (t : Person) (o : PredicateOffense) (c : ComplaintText) : Prop




axiom KnowsOfOffenseStatus (d : Person) (t : Person) (c : ComplaintText) : Prop




axiom HasReasonableGroundsToBelieveOffenseStatus (d : Person) (t : Person) (c : ComplaintText) : Prop








axiom IsPropertyTangibleOrIntangible (s : Support) (c : ComplaintText) : Prop




axiom IsServiceOrListedResource (s : Support) (c : ComplaintText) : Prop




axiom IsTrainingSpecificSkill (s : Support) (c : ComplaintText) : Prop





axiom IsExpertAdviceOrAssistance (s : Support) (c : ComplaintText) : Prop




axiom IsPersonnelProvided (s : Support) (c : ComplaintText) : Prop




axiom IsMedicineOrReligiousMaterials (s : Support) (c : ComplaintText) : Prop






axiom ProvidesMaterialSupport (d : Person) (s : Support) (c : ComplaintText) : Prop





axiom ConcealsOrDisguisesMaterialSupport (d : Person) (s : Support) (c : ComplaintText) : Prop






axiom IsEnumeratedPredicateOffenseUnder2339A (o : PredicateOffense) (c : ComplaintText) : Prop





axiom KnowsOrIntendsSupportUsedForOffense
    (d : Person) (s : Support) (o : PredicateOffense) (c : ComplaintText) : Prop





axiom KnowsOrIntendsSupportUsedToConcealEscape
    (d : Person) (s : Support) (o : PredicateOffense) (c : ComplaintText) : Prop



axiom AttemptsToProvideMaterialSupport (d : Person) (s : Support) (c : ComplaintText) : Prop




axiom DeathResultedFromOffense (d : Person) (c : ComplaintText) : Prop






axiom ProvidesMaterialSupportToOrganization
    (d : Person) (s : Support) (o : Organization) (c : ComplaintText) : Prop




axiom AttemptsToProvideSupportToOrganization
    (d : Person) (s : Support) (o : Organization) (c : ComplaintText) : Prop




axiom IsDesignatedForeignTerroristOrganization (o : Organization) (c : ComplaintText) : Prop




axiom KnowsOrganizationIsDesignated (d : Person) (o : Organization) (c : ComplaintText) : Prop





axiom KnowsOrganizationEngagesInTerroristActivity
    (d : Person) (o : Organization) (c : ComplaintText) : Prop





axiom KnowsOrganizationEngagesInTerrorism (d : Person) (o : Organization) (c : ComplaintText) : Prop





axiom SecretaryApprovedProvisionOfSupport (d : Person) (o : Organization) (c : ComplaintText) : Prop





axiom IsIndependentAdvocacyProtectedByFirstAmendment (d : Person) (c : ComplaintText) : Prop





axiom ProvidedPersonnelUnderDirectionOrControl
    (d : Person) (o : Organization) (c : ComplaintText) : Prop





axiom ActsEntirelyIndependentlyOfOrganization
    (d : Person) (o : Organization) (c : ComplaintText) : Prop







axiom OffenderIsUSNationalOrLawfulPermanentResident (d : Person) (c : ComplaintText) : Prop




axiom OffenderIsStatelessHabitualResidentOfUS (d : Person) (c : ComplaintText) : Prop




axiom OffenderBroughtIntoOrFoundInUS (d : Person) (c : ComplaintText) : Prop




axiom OffenseOccursInWholeOrPartInUS (d : Person) (c : ComplaintText) : Prop





axiom OffenseAffectsInterstateOrForeignCommerce (d : Person) (c : ComplaintText) : Prop




axiom AidsAbetsOrConspiresWithPersonSubjectToJurisdiction (d : Person) (c : ComplaintText) : Prop






axiom IsFinancialInstitution (fi : Person) (c : ComplaintText) : Prop





axiom AwareOfPossessionOrControlOfOrganizationFunds
    (fi : Person) (f : Funds) (o : Organization) (c : ComplaintText) : Prop




axiom AuthorizedBySecretary (fi : Person) (f : Funds) (c : ComplaintText) : Prop




axiom KnowinglyFailsToRetainFunds (fi : Person) (f : Funds) (c : ComplaintText) : Prop





axiom KnowinglyFailsToReportFundsToSecretary (fi : Person) (f : Funds) (c : ComplaintText) : Prop





axiom EngagedOrAboutToEngageInViolation (d : Person) (c : ComplaintText) : Prop






axiom ProvidesOrCollectsFunds (d : Person) (f : Funds) (c : ComplaintText) : Prop




axiom ActsUnlawfullyAndWillfully (d : Person) (c : ComplaintText) : Prop




axiom IntendsOrKnowsFundsUsedForPredicateAct
    (d : Person) (f : Funds) (pa : PredicateAct) (c : ComplaintText) : Prop





axiom IsTreatyOffenseUnderSection2339Ce7 (pa : PredicateAct) (c : ComplaintText) : Prop




axiom IntendedToCauseDeathOrSeriousBodilyInjury (pa : PredicateAct) (c : ComplaintText) : Prop





axiom TargetIsCivilianOrPersonNotTakingActivePart (pa : PredicateAct) (c : ComplaintText) : Prop





axiom PurposeToIntimidatePopulationOrCompelGovernment (pa : PredicateAct) (c : ComplaintText) : Prop




axiom OffenseInUSWithForeignOrPredicateNexus (d : Person) (c : ComplaintText) : Prop




axiom OffenseOutsideUSWithUnitedStatesNexus (d : Person) (c : ComplaintText) : Prop





axiom CommittedOnVesselOrAircraftOfUnitedStates (d : Person) (c : ComplaintText) : Prop




axiom CommittedOnAircraftOperatedByUnitedStates (d : Person) (c : ComplaintText) : Prop





axiom DirectedAtCompellingUnitedStates (d : Person) (c : ComplaintText) : Prop




axiom IsOutsideUSAndUSNationalOrEntity (d : Person) (c : ComplaintText) : Prop





axiom KnowinglyConcealsOrDisguisesSupportOrFunds (d : Person) (c : ComplaintText) : Prop





axiom KnowsOrIntendsSupportProvidedInViolationOf2339B (d : Person) (c : ComplaintText) : Prop





axiom KnowsOrIntendsFundsProvidedInViolationOf2339Ca (d : Person) (c : ComplaintText) : Prop





axiom IsLegalEntityLocatedInOrOrganizedUnderUSLaw (le : LegalEntity) (c : ComplaintText) : Prop




axiom IsResponsibleForManagementOrControl (d : Person) (le : LegalEntity) (c : ComplaintText) : Prop




axiom CommittedOffenseInThatCapacity (d : Person) (le : LegalEntity) (c : ComplaintText) : Prop






axiom ReceivesMilitaryTypeTraining
    (d : Person) (t : Training) (o : Organization) (c : ComplaintText) : Prop









axiom IsMilitaryTypeTraining (t : Training) (c : ComplaintText) : Prop





axiom OrganizationDesignatedAtTimeOfTraining
    (o : Organization) (t : Training) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.MaterialSupport.Elements
