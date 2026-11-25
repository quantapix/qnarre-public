import Proving.USC.T18.Ch13.Reearn.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false













namespace Proving.USC.T18.Ch13.Reearn.Elements

open Proving.USC.Common







axiom UsedForceOrThreatOfForce (d : Person) (c : ComplaintText) : Prop





axiom InjuredIntimidatedOrInterfered (d : Person) (v : Person) (c : ComplaintText) : Prop






axiom VictimEngagedInProtectedActivity (v : Person) (a : Activity) (c : ComplaintText) : Prop




axiom IntentToIntimidateFromProtectedActivity
    (d : Person) (v : Person) (a : Activity) (c : ComplaintText) : Prop






axiom VotingOrElectionActivity (a : Activity) (c : ComplaintText) : Prop




axiom FederalBenefitOrProgramParticipation (a : Activity) (c : ComplaintText) : Prop




axiom FederalEmploymentActivity (a : Activity) (c : ComplaintText) : Prop




axiom FederalJuryService (a : Activity) (c : ComplaintText) : Prop




axiom FederallyAssistedProgramParticipation (a : Activity) (c : ComplaintText) : Prop






axiom PublicSchoolOrCollegeAttendance (a : Activity) (c : ComplaintText) : Prop





axiom StateBenefitOrProgramParticipation (a : Activity) (c : ComplaintText) : Prop





axiom EmploymentOrLaborOrganizationActivity (a : Activity) (c : ComplaintText) : Prop




axiom StateJuryService (a : Activity) (c : ComplaintText) : Prop





axiom InterstateTravelOrCommonCarrierUse (a : Activity) (c : ComplaintText) : Prop






axiom PublicAccommodationEnjoyment (a : Activity) (c : ComplaintText) : Prop







axiom SmallLodgingProprietorExempt (d : Person) (c : ComplaintText) : Prop






axiom DuringOrIncidentToRiotOrCivilDisorder (c : ComplaintText) : Prop




axiom VictimEngagedInBusiness (v : Person) (e : Entity) (c : ComplaintText) : Prop







axiom ParticipatedWithoutDiscrimination (v : Person) (a : Activity) (c : ComplaintText) : Prop




axiom AffordedOpportunityOrProtectionToParticipate
    (v : Person) (a : Activity) (c : ComplaintText) : Prop



axiom IsCitizen (v : Person) (c : ComplaintText) : Prop





axiom LawfullyAidedOrEncouragedParticipation
    (v : Person) (a : Activity) (c : ComplaintText) : Prop




axiom ParticipatedInSpeechOrPeacefulAssemblyOpposingDenial
    (v : Person) (c : ComplaintText) : Prop







axiom AidedAbettedOrIncitedRiotOrViolence (v : Person) (c : ComplaintText) : Prop









axiom AttorneyGeneralCertification (c : ComplaintText) : Prop





axiom LawfullyActingLawEnforcementOfficer (d : Person) (c : ComplaintText) : Prop





axiom IsReligiousRealProperty (rp : ReligiousProperty) (c : ComplaintText) : Prop




axiom DefacedDamagedOrDestroyedProperty
    (d : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop




axiom BecauseOfReligiousCharacterOfProperty
    (d : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop




axiom ObstructedFreeExerciseOfReligion (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom BecauseOfRaceColorOrEthnicityOfAssociatedIndividual
    (d : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop




axiom OffenseInOrAffectingInterstateCommerce (c : ComplaintText) : Prop





axiom daysFromOffenseToCharge (d : Person) (c : ComplaintText) : Nat








axiom UsedPhysicalObstruction (d : Person) (c : ComplaintText) : Prop




axiom ObtainedOrProvidedReproductiveHealthServices (v : Person) (c : ComplaintText) : Prop





axiom IntentToIntimidateFromReproductiveHealthServices
    (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom LawfullyExercisingReligiousFreedomAtPlaceOfWorship
    (v : Person) (pw : PlaceOfWorship) (c : ComplaintText) : Prop




axiom DamagedOrDestroyedFacilityProperty
    (d : Person) (f : Facility) (c : ComplaintText) : Prop




axiom FacilityProvidesReproductiveHealthServices (f : Facility) (c : ComplaintText) : Prop




axiom DamagedOrDestroyedWorshipProperty
    (d : Person) (pw : PlaceOfWorship) (c : ComplaintText) : Prop



axiom IsPlaceOfReligiousWorship (pw : PlaceOfWorship) (c : ComplaintText) : Prop





axiom ParentOrGuardianActingExclusivelyTowardMinor
    (d : Person) (v : Person) (c : ComplaintText) : Prop






axiom ProtectedFirstAmendmentExpressiveConduct (d : Person) (c : ComplaintText) : Prop




axiom IsPersonAggrieved (pl : Person) (c : ComplaintText) : Prop





axiom InvolvedInProvidingOrObtainingServices
    (pl : Person) (f : Facility) (c : ComplaintText) : Prop






axiom WorshipperOrOwnerOfPlaceOfWorship
    (pl : Person) (pw : PlaceOfWorship) (c : ComplaintText) : Prop





axiom ReasonableCauseToBelievePersonsInjured (c : ComplaintText) : Prop




axiom NaturalPersonsResidingInStateInjured (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reearn.Elements
