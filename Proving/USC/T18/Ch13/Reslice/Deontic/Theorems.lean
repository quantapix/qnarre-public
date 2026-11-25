import Proving.USC.T18.Ch13.Reslice.Deontic.Statute

set_option autoImplicit false














namespace Proving.USC.T18.Ch13.Reslice.Deontic

open Proving.USC.Common



theorem prohibition245a1_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : ProsecutingSovereignIsUnitedStates pr c)
    (hCond : FederalProsecutionUndertaken pr c) :
    Prohibition245a1 pr c :=
  ⟨hAddr, hCond⟩

theorem prohibition245a1Violated_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : ProsecutingSovereignIsUnitedStates pr c)
    (hCond : FederalProsecutionUndertaken pr c)
    (hNoCert : ¬ AttorneyGeneralCertificationFiled245a1 pr c) :
    Prohibition245a1Violated pr c :=
  ⟨⟨hAddr, hCond⟩, hNoCert⟩

theorem prohibition245a1Nondelegation_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : ProsecutingSovereignIsUnitedStates pr c) :
    Prohibition245a1Nondelegation pr c :=
  ⟨hAddr⟩

theorem prohibition245a1NondelegationViolated_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : ProsecutingSovereignIsUnitedStates pr c)
    (hDelegated : CertificationFunctionDelegated245a1 pr c) :
    Prohibition245a1NondelegationViolated pr c :=
  ⟨⟨hAddr⟩, hDelegated⟩

theorem power245a2_intro (c : ComplaintText)
    (hAuth : FederalInvestigativeAuthorityPreserved245a2 c) :
    Power245a2 c :=
  ⟨hAuth⟩





theorem targetBasis245b_intro (v : Person) (a : ProtectedActivity) (c : ComplaintText)
    (h : TargetedFederallyProtectedActivity245b1 v a c) :
    TargetBasis245b v c :=
  TargetBasis245b.federallyProtectedActivity a h

theorem lodgingExemptionApplies245b_intro (p v : Person) (c : ComplaintText)
    (hProprietor : SmallLodgingProprietorExempt245b p c)
    (hCarve : TargetBasisWithinLodgingCarve245b v c) :
    LodgingExemptionApplies245b p v c :=
  ⟨hProprietor, hCarve⟩

theorem prohibition245b_intro (p v : Person) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c) (hCond : TargetBasis245b v c) :
    Prohibition245b p v c :=
  ⟨hAddr, hCond⟩

theorem prohibition245bViolated_intro (p v : Person) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c) (hCond : TargetBasis245b v c)
    (hAct : ForcibleInterferenceActOccurred245b p v c)
    (hWillful : ActedWillfully p c)
    (hNotLeo : ¬ LawEnforcementLawfulDutyExempt245c p c)
    (hNotLodging : ¬ LodgingExemptionApplies245b p v c) :
    Prohibition245bViolated p v c :=
  ⟨⟨hAddr, hCond⟩, hAct, hWillful, hNotLeo, hNotLodging⟩



theorem penaltyTier245b_intro (c : ComplaintText) (h : DeathResulted c) :
    PenaltyTier245b c :=
  PenaltyTier245b.capitalDeath h

theorem obligation245bSentence_intro (ct : Court) (p v : Person) (c : ComplaintText)
    (hAddr : SentencingAuthority ct c)
    (hCond : Prohibition245bViolated p v c)
    (hTier : PenaltyTier245b c) :
    Obligation245bSentence ct p v c :=
  ⟨hAddr, hCond, hTier⟩

theorem obligation245bSentenceBreached_intro (ct : Court) (p v : Person) (c : ComplaintText)
    (hAddr : SentencingAuthority ct c)
    (hCond : Prohibition245bViolated p v c)
    (hTier : PenaltyTier245b c)
    (hNotImposed : ¬ PunishmentImposedPerStatutorySchedule ct p c) :
    Obligation245bSentenceBreached ct p v c :=
  ⟨⟨hAddr, hCond, hTier⟩, hNotImposed⟩



theorem prohibition247a1_intro (p : Person) (r : ReligiousProperty) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCond : AffectsInterstateOrForeignCommerce c) :
    Prohibition247a1 p r c :=
  ⟨hAddr, hCond⟩

theorem prohibition247a1Violated_intro (p : Person) (r : ReligiousProperty)
    (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCond : AffectsInterstateOrForeignCommerce c)
    (hAct : ReligiousPropertyDamageActOccurred247a1 p r c)
    (hIntent : ActedIntentionally p c)
    (hMotive : MotivatedByReligiousCharacterOfProperty247a1 r c) :
    Prohibition247a1Violated p r c :=
  ⟨⟨hAddr, hCond⟩, hAct, hIntent, hMotive⟩

theorem prohibition247a2_intro (p v : Person) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCond : AffectsInterstateOrForeignCommerce c) :
    Prohibition247a2 p v c :=
  ⟨hAddr, hCond⟩

theorem prohibition247a2Violated_intro (p v : Person) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCond : AffectsInterstateOrForeignCommerce c)
    (hAct : FreeExerciseObstructionActOccurred247a2 p v c)
    (hIntent : ActedIntentionally p c) :
    Prohibition247a2Violated p v c :=
  ⟨⟨hAddr, hCond⟩, hAct, hIntent⟩

theorem prohibition247c_intro (p : Person) (r : ReligiousProperty) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c) :
    Prohibition247c p r c :=
  ⟨hAddr⟩

theorem prohibition247cViolated_intro (p : Person) (r : ReligiousProperty)
    (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hAct : ReligiousPropertyDamageActOccurred247a1 p r c)
    (hIntent : ActedIntentionally p c)
    (hMotive : MotivatedByRaceColorOrEthnicityOfAssociatedIndividual247c r c) :
    Prohibition247cViolated p r c :=
  ⟨⟨hAddr⟩, hAct, hIntent, hMotive⟩



theorem prohibition247Violated_intro (p : Person) (r : ReligiousProperty)
    (c : ComplaintText) (h : Prohibition247a1Violated p r c) :
    Prohibition247Violated p c :=
  Prohibition247Violated.religiousCharacterDamage r h



theorem punishmentTier247d_intro (r : ReligiousProperty) (c : ComplaintText)
    (h : DeathResulted c) :
    PunishmentTier247d r c :=
  PunishmentTier247d.capitalDeath h

theorem obligation247d_intro (ct : Court) (p : Person) (r : ReligiousProperty)
    (c : ComplaintText)
    (hAddr : SentencingAuthority ct c)
    (hCond : Prohibition247Violated p c)
    (hTier : PunishmentTier247d r c) :
    Obligation247d ct p r c :=
  ⟨hAddr, hCond, hTier⟩

theorem obligation247dBreached_intro (ct : Court) (p : Person) (r : ReligiousProperty)
    (c : ComplaintText)
    (hAddr : SentencingAuthority ct c)
    (hCond : Prohibition247Violated p c)
    (hTier : PunishmentTier247d r c)
    (hNotImposed : ¬ PunishmentImposedPerStatutorySchedule ct p c) :
    Obligation247dBreached ct p r c :=
  ⟨⟨hAddr, hCond, hTier⟩, hNotImposed⟩

theorem prohibition247e_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : ProsecutingSovereignIsUnitedStates pr c)
    (hCond : FederalProsecutionUndertaken pr c) :
    Prohibition247e pr c :=
  ⟨hAddr, hCond⟩

theorem prohibition247eViolated_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : ProsecutingSovereignIsUnitedStates pr c)
    (hCond : FederalProsecutionUndertaken pr c)
    (hNoCert : ¬ AttorneyGeneralCertificationFiled247e pr c) :
    Prohibition247eViolated pr c :=
  ⟨⟨hAddr, hCond⟩, hNoCert⟩

theorem prohibition247g_intro (o : Offense) (pr : Prosecution) (c : ComplaintText)
    (hAddr : ProsecutingSovereignIsUnitedStates pr c)
    (hCond : NoncapitalOffense247g o c) :
    Prohibition247g o pr c :=
  ⟨hAddr, hCond⟩

theorem prohibition247gViolated_intro (o : Offense) (pr : Prosecution) (c : ComplaintText)
    (hAddr : ProsecutingSovereignIsUnitedStates pr c)
    (hCond : NoncapitalOffense247g o c)
    (hAct : ProsecutionOrPunishmentPursued247g o pr c)
    (hUntimely : ¬ WithinLimitationsPeriod o c) :
    Prohibition247gViolated o pr c :=
  ⟨⟨hAddr, hCond⟩, hAct, hUntimely⟩



theorem prohibition248a1_intro (p v : Person) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCond : TargetedReproductiveHealthServicesParticipation248a1 v c) :
    Prohibition248a1 p v c :=
  ⟨hAddr, hCond⟩

theorem prohibition248a1Violated_intro (p v : Person) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCond : TargetedReproductiveHealthServicesParticipation248a1 v c)
    (hAct : ForceOrObstructionInterferenceActOccurred248a p v c)
    (hIntent : ActedIntentionally p c) :
    Prohibition248a1Violated p v c :=
  ⟨⟨hAddr, hCond⟩, hAct, hIntent⟩

theorem prohibition248a2_intro (p v : Person) (w : WorshipPlace) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCond : TargetedReligiousFreedomExerciseAtWorshipPlace248a2 v w c) :
    Prohibition248a2 p v w c :=
  ⟨hAddr, hCond⟩

theorem prohibition248a2Violated_intro (p v : Person) (w : WorshipPlace)
    (c : ComplaintText)
    (hAddr : AddresseeWhoever p c)
    (hCond : TargetedReligiousFreedomExerciseAtWorshipPlace248a2 v w c)
    (hAct : ForceOrObstructionInterferenceActOccurred248a p v c)
    (hIntent : ActedIntentionally p c) :
    Prohibition248a2Violated p v w c :=
  ⟨⟨hAddr, hCond⟩, hAct, hIntent⟩

theorem prohibition248a3_intro (p : Person) (c : ComplaintText)
    (hAddr : AddresseeWhoever p c) :
    Prohibition248a3 p c :=
  ⟨hAddr⟩



theorem prohibition248a3Violated_intro (p : Person) (f : Facility) (c : ComplaintText)
    (hAddr : Prohibition248a3 p c)
    (hAct : FacilityPropertyDamageBecauseReproductiveServices248a3 p f c)
    (hIntent : ActedIntentionally p c) :
    Prohibition248a3Violated p c :=
  Prohibition248a3Violated.facilityProperty f hAddr hAct hIntent



theorem prohibition248Violated_intro (p v : Person) (c : ComplaintText)
    (h : Prohibition248a1Violated p v c) :
    Prohibition248Violated p c :=
  Prohibition248Violated.reproductiveHealthInterference v h

theorem liability248_intro (p : Person) (c : ComplaintText)
    (hViolation : Prohibition248Violated p c)
    (hNotParent : ¬ ParentOrGuardianDirectedExclusivelyAtMinorExempt248a p c)
    (hNotProtected : ¬ ProtectedExpressiveConduct248d1 p c) :
    Liability248 p c :=
  ⟨hViolation, hNotParent, hNotProtected⟩




theorem penaltyTier248b_intro (p : Person) (c : ComplaintText)
    (hFirst : priorConvictionsUnderSection248 p c = 0)
    (hNotNonviolent : ¬ NonviolentPhysicalObstructionOnly248b p c) :
    PenaltyTier248b p c :=
  PenaltyTier248b.firstOffense hFirst hNotNonviolent

theorem obligation248b_intro (ct : Court) (p : Person) (c : ComplaintText)
    (hAddr : SentencingAuthority ct c)
    (hCond : Liability248 p c)
    (hTier : PenaltyTier248b p c) :
    Obligation248b ct p c :=
  ⟨hAddr, hCond, hTier⟩

theorem obligation248bBreached_intro (ct : Court) (p : Person) (c : ComplaintText)
    (hAddr : SentencingAuthority ct c)
    (hCond : Liability248 p c)
    (hTier : PenaltyTier248b p c)
    (hNotImposed : ¬ PunishmentImposedPerStatutorySchedule ct p c) :
    Obligation248bBreached ct p c :=
  ⟨⟨hAddr, hCond, hTier⟩, hNotImposed⟩




theorem standingForCivilAction248c1_intro (v : Person) (c : ComplaintText)
    (h : HasStandingForServicesClaim248c1 v c) :
    StandingForCivilAction248c1 v c :=
  StandingForCivilAction248c1.servicesParticipant h

theorem power248c1_intro (v : Person) (c : ComplaintText)
    (hAddr : AggrievedByProhibitedConduct248c1 v c)
    (hCond : StandingForCivilAction248c1 v c) :
    Power248c1 v c :=
  ⟨hAddr, hCond⟩

theorem power248c1Entity_intro (e : Entity) (w : WorshipPlace) (c : ComplaintText)
    (hAddr : OwnsOrOperatesWorshipPlace248c1 e w c) :
    Power248c1Entity e w c :=
  ⟨hAddr⟩

theorem permission248c1b_intro (v : Person) (ca : CivilAction) (c : ComplaintText)
    (hCond : ElectionMadeBeforeFinalJudgment248c1b v ca c) :
    Permission248c1b v ca c :=
  ⟨hCond⟩

theorem power248CourtRelief_intro (ct : Court) (ca : CivilAction) (c : ComplaintText)
    (hAddr : AdjudicatingCourt ct ca c)
    (hCond : CivilActionCommencedUnder248 ca c) :
    Power248CourtRelief ct ca c :=
  ⟨hAddr, hCond⟩

theorem power248c2_intro (ag : Person) (c : ComplaintText)
    (hAddr : AddresseeIsAttorneyGeneralOfUnitedStates ag c)
    (hCond : AttorneyGeneralReasonableCause248c2 c) :
    Power248c2 ag c :=
  ⟨hAddr, hCond⟩

theorem power248c3_intro (ag : Person) (c : ComplaintText)
    (hAddr : AddresseeIsStateAttorneyGeneral ag c)
    (hCond : StateAttorneyGeneralReasonableCause248c3 c) :
    Power248c3 ag c :=
  ⟨hAddr, hCond⟩









theorem prohibition245bViolated_excludes_lawEnforcementExemption
    (p v : Person) (c : ComplaintText) (h : Prohibition245bViolated p v c) :
    ¬ LawEnforcementLawfulDutyExempt245c p c :=
  h.2.2.2.1



theorem prohibition245bViolated_excludes_lodgingExemption
    (p v : Person) (c : ComplaintText) (h : Prohibition245bViolated p v c) :
    ¬ LodgingExemptionApplies245b p v c :=
  h.2.2.2.2



theorem prohibition245a1Violated_excludes_certification
    (pr : Prosecution) (c : ComplaintText) (h : Prohibition245a1Violated pr c) :
    ¬ AttorneyGeneralCertificationFiled245a1 pr c :=
  h.2


theorem prohibition247gViolated_excludes_timeliness
    (o : Offense) (pr : Prosecution) (c : ComplaintText)
    (h : Prohibition247gViolated o pr c) :
    ¬ WithinLimitationsPeriod o c :=
  h.2.2



theorem liability248_implies_prohibition248Violated
    (p : Person) (c : ComplaintText) (h : Liability248 p c) :
    Prohibition248Violated p c :=
  h.1



theorem liability248_excludes_parentalProviso
    (p : Person) (c : ComplaintText) (h : Liability248 p c) :
    ¬ ParentOrGuardianDirectedExclusivelyAtMinorExempt248a p c :=
  h.2.1



theorem liability248_excludes_protectedExpression
    (p : Person) (c : ComplaintText) (h : Liability248 p c) :
    ¬ ProtectedExpressiveConduct248d1 p c :=
  h.2.2



theorem obligation248bBreached_implies_liability248
    (ct : Court) (p : Person) (c : ComplaintText) (h : Obligation248bBreached ct p c) :
    Liability248 p c :=
  h.1.condition

end Proving.USC.T18.Ch13.Reslice.Deontic
