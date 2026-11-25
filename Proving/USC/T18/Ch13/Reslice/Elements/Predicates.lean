








import Proving.USC.T18.Ch13.Reslice.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch13.Reslice.Elements








axiom AttorneyGeneralCertification245 (c : ComplaintText) : Prop




axiom UsedForceOrThreatOfForce (d : Person) (a : Act) (c : ComplaintText) : Prop





axiom InjuredIntimidatedOrInterfered
    (d : Person) (v : Person) (a : Act) (c : ComplaintText) : Prop





axiom LawfullyCarryingOutLawEnforcementDuties
    (d : Person) (a : Act) (c : ComplaintText) : Prop





axiom SmallLodgingProprietorExemptionApplies
    (d : Person) (a : Act) (c : ComplaintText) : Prop





axiom VotingOrElectionActivity (act : Activity) (c : ComplaintText) : Prop




axiom FederalBenefitOrProgram (act : Activity) (c : ComplaintText) : Prop




axiom FederalEmployment (act : Activity) (c : ComplaintText) : Prop




axiom FederalJuryService (act : Activity) (c : ComplaintText) : Prop




axiom FederallyAssistedProgram (act : Activity) (c : ComplaintText) : Prop





axiom TargetedBecauseOfOrToDeterActivity
    (d : Person) (v : Person) (act : Activity) (c : ComplaintText) : Prop





axiom TargetedBecauseOfActivity
    (d : Person) (v : Person) (act : Activity) (c : ComplaintText) : Prop




axiom PublicSchoolOrCollegeAttendance (act : Activity) (c : ComplaintText) : Prop





axiom StateBenefitOrProgram (act : Activity) (c : ComplaintText) : Prop






axiom EmploymentOrLaborOrganization (act : Activity) (c : ComplaintText) : Prop




axiom StateJuryService (act : Activity) (c : ComplaintText) : Prop





axiom InterstateTravelOrCommonCarrier (act : Activity) (c : ComplaintText) : Prop








axiom EnjoymentOfPublicAccommodation (act : Activity) (c : ComplaintText) : Prop




axiom DuringOrIncidentToRiotOrCivilDisorder (a : Act) (c : ComplaintText) : Prop





axiom VictimEngagedInBusiness
    (v : Person) (b : Entity) (c : ComplaintText) : Prop





axiom ParticipatingWithoutDiscrimination
    (v : Person) (act : Activity) (c : ComplaintText) : Prop




axiom AffordingOpportunityOrProtectionToParticipate
    (v : Person) (c : ComplaintText) : Prop




axiom IsCitizen (v : Person) (c : ComplaintText) : Prop





axiom LawfullyAidingOrEncouragingParticipation
    (v : Person) (act : Activity) (c : ComplaintText) : Prop








axiom ParticipatingLawfullyInSpeechOrAssembly
    (v : Person) (c : ComplaintText) : Prop








axiom AttorneyGeneralCertification247 (c : ComplaintText) : Prop






axiom OffenseAffectsInterstateCommerce (a : Act) (c : ComplaintText) : Prop




axiom IsReligiousRealProperty (rp : ReligiousProperty) (c : ComplaintText) : Prop




axiom DefacedDamagedOrDestroyedProperty
    (d : Person) (rp : ReligiousProperty) (a : Act) (c : ComplaintText) : Prop




axiom BecauseOfReligiousCharacterOfProperty
    (d : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop





axiom ObstructedEnjoymentOfFreeExercise
    (d : Person) (v : Person) (a : Act) (c : ComplaintText) : Prop





axiom MotiveDirectedAtIndividualAssociatedWithProperty
    (d : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop






axiom WithinSevenYearLimitations
    (d : Person) (a : Act) (c : ComplaintText) : Prop








axiom UsedPhysicalObstruction (d : Person) (a : Act) (c : ComplaintText) : Prop






axiom TargetedBecauseOfOrToDeterReproductiveHealthServices
    (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom LawfullyExercisingReligiousFreedomAtWorshipPlace
    (v : Person) (w : WorshipPlace) (c : ComplaintText) : Prop




axiom FacilityProvidesReproductiveHealthServices
    (f : Facility) (c : ComplaintText) : Prop




axiom DamagedOrDestroyedFacilityProperty
    (d : Person) (f : Facility) (a : Act) (c : ComplaintText) : Prop




axiom BecauseFacilityProvidesReproductiveHealthServices
    (d : Person) (f : Facility) (c : ComplaintText) : Prop





axiom DamagedOrDestroyedWorshipPlaceProperty
    (d : Person) (w : WorshipPlace) (a : Act) (c : ComplaintText) : Prop






axiom ParentOrGuardianActingExclusivelyTowardMinor
    (d : Person) (a : Act) (c : ComplaintText) : Prop






axiom ProtectedFirstAmendmentExpressiveConduct
    (d : Person) (a : Act) (c : ComplaintText) : Prop






axiom InvolvedInProvidingOrObtainingServices
    (pl : Person) (c : ComplaintText) : Prop





axiom OwnsOrOperatesPlaceOfWorship
    (pl : Person) (w : WorshipPlace) (c : ComplaintText) : Prop




axiom AggrievedByProhibitedConduct
    (pl : Person) (a : Act) (c : ComplaintText) : Prop





axiom ReasonableCauseToBelieveInjury (c : ComplaintText) : Prop




axiom ParensPatriaeOnBehalfOfResidents (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reslice.Elements
