








import Proving.USC.T18.Ch13.Reslice.Procedure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Procedure

open Proving.USC.Common





axiom Section245OffenseCharged (o : Offense) (t : ComplaintText) : Prop




axiom Section247OffenseCharged (o : Offense) (t : ComplaintText) : Prop



axiom Section248OffenseCharged (o : Offense) (t : ComplaintText) : Prop






axiom FederalProsecutionUndertaken (o : Offense) (t : ComplaintText) : Prop




axiom CertificationInWritingExecuted (k : Certification) (t : ComplaintText) : Prop





axiom CertifierIsSection245DesignatedOfficial (k : Certification) (t : ComplaintText) : Prop




axiom CertifierIsAttorneyGeneralOrDesignee (k : Certification) (t : ComplaintText) : Prop





axiom CertificationJudgmentPublicInterestAndSubstantialJustice
    (k : Certification) (t : ComplaintText) : Prop





axiom CertificationFunctionDelegated (k : Certification) (t : ComplaintText) : Prop




axiom CertificationCoversOffense
    (k : Certification) (o : Offense) (t : ComplaintText) : Prop







axiom StateWouldHaveJurisdictionAbsentSection (o : Offense) (t : ComplaintText) : Prop




axiom FederalInvestigationConducted (o : Offense) (t : ComplaintText) : Prop







axiom ActorIsLawEnforcementOfficer (p : Person) (t : ComplaintText) : Prop




axiom LawEnforcementOfficerLawfullyCarryingOutDuties (p : Person) (t : ComplaintText) : Prop






axiom BodilyInjuryResulted (o : Offense) (t : ComplaintText) : Prop




axiom DangerousWeaponExplosivesOrFireUsed (o : Offense) (t : ComplaintText) : Prop




axiom DeathResulted (o : Offense) (t : ComplaintText) : Prop





axiom KidnappingOrAggravatedSexualAbuseOrAttemptToKill (o : Offense) (t : ComplaintText) : Prop




axiom ViolationByMeansOfFireOrExplosive (o : Offense) (t : ComplaintText) : Prop





axiom propertyDamageAmountDollars (o : Offense) (t : ComplaintText) : Nat




axiom OffenseInvolvedExclusivelyNonviolentPhysicalObstruction
    (o : Offense) (t : ComplaintText) : Prop





axiom priorConvictionsUnderSectionBeforeOffense (o : Offense) (t : ComplaintText) : Nat






axiom OffenseInOrAffectingInterstateCommerce (o : Offense) (t : ComplaintText) : Prop






axiom ChargingInstrumentInstituted (o : Offense) (t : ComplaintText) : Prop




axiom NoncapitalOffenseCharged (o : Offense) (t : ComplaintText) : Prop





axiom offenseCommittedDay (o : Offense) (t : ComplaintText) : Nat




axiom chargingInstrumentDay (o : Offense) (t : ComplaintText) : Nat






axiom ParentOrGuardianActingExclusivelyTowardOwnMinor (p : Person) (t : ComplaintText) : Prop





axiom ExpressiveConductProtectedByFirstAmendment (p : Person) (t : ComplaintText) : Prop




axiom StateOrLocalPenaltyOrRemedyAvailable (o : Offense) (t : ComplaintText) : Prop





axiom CivilActionCommenced (a : CivilAction) (t : ComplaintText) : Prop




axiom ActionCommencedInUnitedStatesDistrictCourt (a : CivilAction) (t : ComplaintText) : Prop




axiom PersonAggrievedByProhibitedConduct (p : Person) (t : ComplaintText) : Prop




axiom ClaimPredicatedOnReproductiveHealthServicesInterference
    (a : CivilAction) (t : ComplaintText) : Prop





axiom ClaimPredicatedOnReligiousFreedomInterference
    (a : CivilAction) (t : ComplaintText) : Prop





axiom ClaimPredicatedOnPropertyDamage (a : CivilAction) (t : ComplaintText) : Prop





axiom PlaintiffInvolvedWithReproductiveHealthServicesAtFacility
    (p : Person) (t : ComplaintText) : Prop





axiom PlaintiffExercisingReligiousFreedomAtPlaceOfWorship
    (p : Person) (t : ComplaintText) : Prop




axiom PlaintiffOwnsOrOperatesPlaceOfReligiousWorship
    (p : Person) (t : ComplaintText) : Prop




axiom PlaintiffIsUnitedStatesAttorneyGeneral (p : Person) (t : ComplaintText) : Prop



axiom PlaintiffIsStateAttorneyGeneral (p : Person) (t : ComplaintText) : Prop





axiom ReasonableCauseToBelievePersonsInjuredByViolation (p : Person) (t : ComplaintText) : Prop




axiom ActionBroughtAsParensPatriaeForStateResidents (a : CivilAction) (t : ComplaintText) : Prop






axiom StatutoryDamagesElected (a : CivilAction) (t : ComplaintText) : Prop





axiom statutoryDamagesElectionDay (a : CivilAction) (t : ComplaintText) : Nat




axiom finalJudgmentRenderedDay (a : CivilAction) (t : ComplaintText) : Nat





axiom violationCount (a : CivilAction) (t : ComplaintText) : Nat

end Proving.USC.T18.Ch13.Reslice.Procedure
