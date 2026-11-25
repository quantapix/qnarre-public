import Proving.USC.T18.Ch13.Reslice.Deontic.Predicates

set_option autoImplicit false




















namespace Proving.USC.T18.Ch13.Reslice.Deontic

open Proving.USC.Common





def modality245a1 : Modality := Modality.prohibition



structure Prohibition245a1 (pr : Prosecution) (c : ComplaintText) : Prop where
  addressee : ProsecutingSovereignIsUnitedStates pr c
  condition : FederalProsecutionUndertaken pr c



def Prohibition245a1Violated (pr : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition245a1 pr c ∧ ¬ AttorneyGeneralCertificationFiled245a1 pr c



def modality245a1Nondelegation : Modality := Modality.prohibition


structure Prohibition245a1Nondelegation (pr : Prosecution) (c : ComplaintText) : Prop where
  addressee : ProsecutingSovereignIsUnitedStates pr c



def Prohibition245a1NondelegationViolated (pr : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition245a1Nondelegation pr c ∧ CertificationFunctionDelegated245a1 pr c




def modality245a2 : Modality := Modality.power



structure Power245a2 (c : ComplaintText) : Prop where
  authority : FederalInvestigativeAuthorityPreserved245a2 c




def modality245b : Modality := Modality.prohibition



inductive TargetBasis245b (v : Person) (c : ComplaintText) : Prop where

  | federallyProtectedActivity (a : ProtectedActivity)
      (h : TargetedFederallyProtectedActivity245b1 v a c)

  | protectedTraitAndActivity (a : ProtectedActivity)
      (h : TargetedStateProtectedActivityByProtectedTrait245b2 v a c)

  | riotOrCivilDisorderCommerce (h : TargetedCommerceBusinessDuringRiot245b3 v c)

  | nondiscriminatoryParticipation (a : ProtectedActivity)
      (h : TargetedNondiscriminatoryParticipationOrAffording245b4 v a c)

  | citizenAidingOrOpposing (a : ProtectedActivity)
      (h : TargetedCitizenAidingOrOpposing245b5 v a c)




def LodgingExemptionApplies245b (p v : Person) (c : ComplaintText) : Prop :=
  SmallLodgingProprietorExempt245b p c ∧ TargetBasisWithinLodgingCarve245b v c



structure Prohibition245b (p v : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : TargetBasis245b v c




def Prohibition245bViolated (p v : Person) (c : ComplaintText) : Prop :=
  Prohibition245b p v c
    ∧ ForcibleInterferenceActOccurred245b p v c
    ∧ ActedWillfully p c
    ∧ ¬ LawEnforcementLawfulDutyExempt245c p c
    ∧ ¬ LodgingExemptionApplies245b p v c


inductive PenaltyTier245b (c : ComplaintText) : Prop where

  | capitalDeath (h : DeathResulted c)

  | capitalAggravated (h : AggravatingConductKidnapSexualAbuseOrAttemptToKill c)

  | enhancedBodilyInjury (h : BodilyInjuryResulted c)

  | enhancedWeapon (h : UseAttemptedOrThreatenedUseOfDangerousWeaponExplosivesOrFire c)

  | base (h1 : ¬ DeathResulted c)
      (h2 : ¬ AggravatingConductKidnapSexualAbuseOrAttemptToKill c)
      (h3 : ¬ BodilyInjuryResulted c)
      (h4 : ¬ UseAttemptedOrThreatenedUseOfDangerousWeaponExplosivesOrFire c)



def modality245bSentence : Modality := Modality.obligation


structure Obligation245bSentence (ct : Court) (p v : Person) (c : ComplaintText) : Prop where
  addressee : SentencingAuthority ct c
  condition : Prohibition245bViolated p v c
  tier : PenaltyTier245b c



def Obligation245bSentenceBreached (ct : Court) (p v : Person) (c : ComplaintText) : Prop :=
  Obligation245bSentence ct p v c ∧ ¬ PunishmentImposedPerStatutorySchedule ct p c




def modality247a1 : Modality := Modality.prohibition



structure Prohibition247a1 (p : Person) (r : ReligiousProperty) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : AffectsInterstateOrForeignCommerce c



def Prohibition247a1Violated (p : Person) (r : ReligiousProperty) (c : ComplaintText) : Prop :=
  Prohibition247a1 p r c
    ∧ ReligiousPropertyDamageActOccurred247a1 p r c
    ∧ ActedIntentionally p c
    ∧ MotivatedByReligiousCharacterOfProperty247a1 r c


def modality247a2 : Modality := Modality.prohibition


structure Prohibition247a2 (p v : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : AffectsInterstateOrForeignCommerce c



def Prohibition247a2Violated (p v : Person) (c : ComplaintText) : Prop :=
  Prohibition247a2 p v c
    ∧ FreeExerciseObstructionActOccurred247a2 p v c
    ∧ ActedIntentionally p c


def modality247c : Modality := Modality.prohibition




structure Prohibition247c (p : Person) (r : ReligiousProperty) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c




def Prohibition247cViolated (p : Person) (r : ReligiousProperty) (c : ComplaintText) : Prop :=
  Prohibition247c p r c
    ∧ ReligiousPropertyDamageActOccurred247a1 p r c
    ∧ ActedIntentionally p c
    ∧ MotivatedByRaceColorOrEthnicityOfAssociatedIndividual247c r c


inductive Prohibition247Violated (p : Person) (c : ComplaintText) : Prop where

  | religiousCharacterDamage (r : ReligiousProperty) (h : Prohibition247a1Violated p r c)

  | freeExerciseObstruction (v : Person) (h : Prohibition247a2Violated p v c)

  | raceOrEthnicityDamage (r : ReligiousProperty) (h : Prohibition247cViolated p r c)


inductive PunishmentTier247d (r : ReligiousProperty) (c : ComplaintText) : Prop where

  | capitalDeath (h : DeathResulted c)

  | capitalAggravated (h : AggravatingConductKidnapSexualAbuseOrAttemptToKill c)

  | fireOrExplosiveInjury (h1 : BodilyInjuryResulted c) (h2 : ByMeansOfFireOrExplosive c)

  | bodilyInjury (h : BodilyInjuryResulted c)

  | dangerousWeapon (h : UseAttemptedOrThreatenedUseOfDangerousWeaponExplosivesOrFire c)

  | propertyDamageOverThreshold (h : propertyDamageAmountUsd247 r c > 5000)

  | residual (h1 : ¬ DeathResulted c)
      (h2 : ¬ AggravatingConductKidnapSexualAbuseOrAttemptToKill c)
      (h3 : ¬ BodilyInjuryResulted c)
      (h4 : ¬ UseAttemptedOrThreatenedUseOfDangerousWeaponExplosivesOrFire c)
      (h5 : ¬ (propertyDamageAmountUsd247 r c > 5000))


def modality247d : Modality := Modality.obligation


structure Obligation247d (ct : Court) (p : Person) (r : ReligiousProperty)
    (c : ComplaintText) : Prop where
  addressee : SentencingAuthority ct c
  condition : Prohibition247Violated p c
  tier : PunishmentTier247d r c


def Obligation247dBreached (ct : Court) (p : Person) (r : ReligiousProperty)
    (c : ComplaintText) : Prop :=
  Obligation247d ct p r c ∧ ¬ PunishmentImposedPerStatutorySchedule ct p c


def modality247e : Modality := Modality.prohibition


structure Prohibition247e (pr : Prosecution) (c : ComplaintText) : Prop where
  addressee : ProsecutingSovereignIsUnitedStates pr c
  condition : FederalProsecutionUndertaken pr c



def Prohibition247eViolated (pr : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition247e pr c ∧ ¬ AttorneyGeneralCertificationFiled247e pr c


def modality247g : Modality := Modality.prohibition



structure Prohibition247g (o : Offense) (pr : Prosecution) (c : ComplaintText) : Prop where
  addressee : ProsecutingSovereignIsUnitedStates pr c
  condition : NoncapitalOffense247g o c




def Prohibition247gViolated (o : Offense) (pr : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition247g o pr c
    ∧ ProsecutionOrPunishmentPursued247g o pr c
    ∧ ¬ WithinLimitationsPeriod o c




def modality248a1 : Modality := Modality.prohibition


structure Prohibition248a1 (p v : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : TargetedReproductiveHealthServicesParticipation248a1 v c


def Prohibition248a1Violated (p v : Person) (c : ComplaintText) : Prop :=
  Prohibition248a1 p v c
    ∧ ForceOrObstructionInterferenceActOccurred248a p v c
    ∧ ActedIntentionally p c


def modality248a2 : Modality := Modality.prohibition


structure Prohibition248a2 (p v : Person) (w : WorshipPlace) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : TargetedReligiousFreedomExerciseAtWorshipPlace248a2 v w c


def Prohibition248a2Violated (p v : Person) (w : WorshipPlace) (c : ComplaintText) : Prop :=
  Prohibition248a2 p v w c
    ∧ ForceOrObstructionInterferenceActOccurred248a p v c
    ∧ ActedIntentionally p c


def modality248a3 : Modality := Modality.prohibition


structure Prohibition248a3 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


inductive Prohibition248a3Violated (p : Person) (c : ComplaintText) : Prop where

  | facilityProperty (f : Facility) (hAddr : Prohibition248a3 p c)
      (hAct : FacilityPropertyDamageBecauseReproductiveServices248a3 p f c)
      (hIntent : ActedIntentionally p c)

  | worshipProperty (w : WorshipPlace) (hAddr : Prohibition248a3 p c)
      (hAct : WorshipPlacePropertyDamage248a3 p w c)
      (hIntent : ActedIntentionally p c)


inductive Prohibition248Violated (p : Person) (c : ComplaintText) : Prop where

  | reproductiveHealthInterference (v : Person) (h : Prohibition248a1Violated p v c)

  | religiousFreedomInterference (v : Person) (w : WorshipPlace)
      (h : Prohibition248a2Violated p v w c)

  | propertyDestruction (h : Prohibition248a3Violated p c)






def Liability248 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition248Violated p c
    ∧ ¬ ParentOrGuardianDirectedExclusivelyAtMinorExempt248a p c
    ∧ ¬ ProtectedExpressiveConduct248d1 p c


inductive PenaltyTier248b (p : Person) (c : ComplaintText) : Prop where

  | firstOffense (h : priorConvictionsUnderSection248 p c = 0)
      (hn : ¬ NonviolentPhysicalObstructionOnly248b p c)

  | subsequentOffense (h : priorConvictionsUnderSection248 p c ≠ 0)
      (hn : ¬ NonviolentPhysicalObstructionOnly248b p c)

  | nonviolentFirstOffense (h : priorConvictionsUnderSection248 p c = 0)
      (hn : NonviolentPhysicalObstructionOnly248b p c)

  | nonviolentSubsequentOffense (h : priorConvictionsUnderSection248 p c ≠ 0)
      (hn : NonviolentPhysicalObstructionOnly248b p c)

  | bodilyInjuryEnhancement (h : BodilyInjuryResulted c)

  | deathEnhancement (h : DeathResulted c)


def modality248b : Modality := Modality.obligation


structure Obligation248b (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : SentencingAuthority ct c
  condition : Liability248 p c
  tier : PenaltyTier248b p c


def Obligation248bBreached (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation248b ct p c ∧ ¬ PunishmentImposedPerStatutorySchedule ct p c


def modality248c1 : Modality := Modality.power



inductive StandingForCivilAction248c1 (v : Person) (c : ComplaintText) : Prop where

  | servicesParticipant (h : HasStandingForServicesClaim248c1 v c)

  | worshipParticipant (w : WorshipPlace) (h : HasStandingForWorshipClaim248c1 v w c)

  | otherClaim (h : ClaimOutsideSubsectionsA1AndA2 v c)



structure Power248c1 (v : Person) (c : ComplaintText) : Prop where
  addressee : AggrievedByProhibitedConduct248c1 v c
  condition : StandingForCivilAction248c1 v c



structure Power248c1Entity (e : Entity) (w : WorshipPlace) (c : ComplaintText) : Prop where
  addressee : OwnsOrOperatesWorshipPlace248c1 e w c


def modality248c1b : Modality := Modality.permission




structure Permission248c1b (v : Person) (ca : CivilAction) (c : ComplaintText) : Prop where
  condition : ElectionMadeBeforeFinalJudgment248c1b v ca c



def modality248CourtRelief : Modality := Modality.power


structure Power248CourtRelief (ct : Court) (ca : CivilAction) (c : ComplaintText) : Prop where
  addressee : AdjudicatingCourt ct ca c
  condition : CivilActionCommencedUnder248 ca c


def modality248c2 : Modality := Modality.power



structure Power248c2 (ag : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneralOfUnitedStates ag c
  condition : AttorneyGeneralReasonableCause248c2 c


def modality248c3 : Modality := Modality.power



structure Power248c3 (ag : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsStateAttorneyGeneral ag c
  condition : StateAttorneyGeneralReasonableCause248c3 c













def modalityDefinitionalClauses : Modality := Modality.definition

end Proving.USC.T18.Ch13.Reslice.Deontic
