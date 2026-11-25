import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch13.Reslice.Deontic.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch13.Reslice.Deontic

open Proving.USC.Common






axiom AddresseeWhoever (p : Person) (c : ComplaintText) : Prop



axiom ActedWillfully (p : Person) (c : ComplaintText) : Prop




axiom ActedIntentionally (p : Person) (c : ComplaintText) : Prop






axiom ProsecutingSovereignIsUnitedStates (pr : Prosecution) (c : ComplaintText) : Prop




axiom FederalProsecutionUndertaken (pr : Prosecution) (c : ComplaintText) : Prop






axiom AttorneyGeneralCertificationFiled245a1 (pr : Prosecution) (c : ComplaintText) : Prop




axiom CertificationFunctionDelegated245a1 (pr : Prosecution) (c : ComplaintText) : Prop




axiom FederalInvestigativeAuthorityPreserved245a2 (c : ComplaintText) : Prop






axiom ForcibleInterferenceActOccurred245b (p v : Person) (c : ComplaintText) : Prop





axiom TargetedFederallyProtectedActivity245b1
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom TargetedStateProtectedActivityByProtectedTrait245b2
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom TargetedCommerceBusinessDuringRiot245b3 (v : Person) (c : ComplaintText) : Prop






axiom TargetedNondiscriminatoryParticipationOrAffording245b4
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop






axiom TargetedCitizenAidingOrOpposing245b5
    (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop






axiom SmallLodgingProprietorExempt245b (p : Person) (c : ComplaintText) : Prop





axiom TargetBasisWithinLodgingCarve245b (v : Person) (c : ComplaintText) : Prop





axiom LawEnforcementLawfulDutyExempt245c (p : Person) (c : ComplaintText) : Prop






axiom ReligiousPropertyDamageActOccurred247a1
    (p : Person) (r : ReligiousProperty) (c : ComplaintText) : Prop




axiom MotivatedByReligiousCharacterOfProperty247a1
    (r : ReligiousProperty) (c : ComplaintText) : Prop






axiom FreeExerciseObstructionActOccurred247a2 (p v : Person) (c : ComplaintText) : Prop





axiom AffectsInterstateOrForeignCommerce (c : ComplaintText) : Prop





axiom MotivatedByRaceColorOrEthnicityOfAssociatedIndividual247c
    (r : ReligiousProperty) (c : ComplaintText) : Prop





axiom AttorneyGeneralCertificationFiled247e (pr : Prosecution) (c : ComplaintText) : Prop




axiom NoncapitalOffense247g (o : Offense) (c : ComplaintText) : Prop




axiom ProsecutionOrPunishmentPursued247g
    (o : Offense) (pr : Prosecution) (c : ComplaintText) : Prop




axiom WithinLimitationsPeriod (o : Offense) (c : ComplaintText) : Prop





axiom propertyDamageAmountUsd247 (r : ReligiousProperty) (c : ComplaintText) : Nat







axiom BodilyInjuryResulted (c : ComplaintText) : Prop




axiom DeathResulted (c : ComplaintText) : Prop





axiom AggravatingConductKidnapSexualAbuseOrAttemptToKill (c : ComplaintText) : Prop





axiom UseAttemptedOrThreatenedUseOfDangerousWeaponExplosivesOrFire
    (c : ComplaintText) : Prop




axiom ByMeansOfFireOrExplosive (c : ComplaintText) : Prop




axiom SentencingAuthority (ct : Court) (c : ComplaintText) : Prop




axiom PunishmentImposedPerStatutorySchedule
    (ct : Court) (p : Person) (c : ComplaintText) : Prop







axiom ForceOrObstructionInterferenceActOccurred248a
    (p v : Person) (c : ComplaintText) : Prop






axiom TargetedReproductiveHealthServicesParticipation248a1
    (v : Person) (c : ComplaintText) : Prop





axiom TargetedReligiousFreedomExerciseAtWorshipPlace248a2
    (v : Person) (w : WorshipPlace) (c : ComplaintText) : Prop





axiom FacilityPropertyDamageBecauseReproductiveServices248a3
    (p : Person) (f : Facility) (c : ComplaintText) : Prop




axiom WorshipPlacePropertyDamage248a3
    (p : Person) (w : WorshipPlace) (c : ComplaintText) : Prop





axiom ParentOrGuardianDirectedExclusivelyAtMinorExempt248a
    (p : Person) (c : ComplaintText) : Prop





axiom ProtectedExpressiveConduct248d1 (p : Person) (c : ComplaintText) : Prop




axiom NonviolentPhysicalObstructionOnly248b (p : Person) (c : ComplaintText) : Prop





axiom priorConvictionsUnderSection248 (p : Person) (c : ComplaintText) : Nat




axiom AggrievedByProhibitedConduct248c1 (v : Person) (c : ComplaintText) : Prop






axiom HasStandingForServicesClaim248c1 (v : Person) (c : ComplaintText) : Prop






axiom HasStandingForWorshipClaim248c1
    (v : Person) (w : WorshipPlace) (c : ComplaintText) : Prop




axiom OwnsOrOperatesWorshipPlace248c1
    (e : Entity) (w : WorshipPlace) (c : ComplaintText) : Prop





axiom ClaimOutsideSubsectionsA1AndA2 (v : Person) (c : ComplaintText) : Prop




axiom AdjudicatingCourt (ct : Court) (ca : CivilAction) (c : ComplaintText) : Prop




axiom CivilActionCommencedUnder248 (ca : CivilAction) (c : ComplaintText) : Prop




axiom ElectionMadeBeforeFinalJudgment248c1b
    (v : Person) (ca : CivilAction) (c : ComplaintText) : Prop




axiom AddresseeIsAttorneyGeneralOfUnitedStates (ag : Person) (c : ComplaintText) : Prop





axiom AttorneyGeneralReasonableCause248c2 (c : ComplaintText) : Prop




axiom AddresseeIsStateAttorneyGeneral (ag : Person) (c : ComplaintText) : Prop





axiom StateAttorneyGeneralReasonableCause248c3 (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reslice.Deontic
