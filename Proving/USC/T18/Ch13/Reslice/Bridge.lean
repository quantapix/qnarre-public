



































import Proving.USC.T18.Ch13.Reslice.Deontic.Statute
import Proving.USC.T18.Ch13.Reslice.Elements.Statute
import Proving.USC.T18.Ch13.Reslice.Ontology.Statute
import Proving.USC.T18.Ch13.Reslice.Procedure.Statute
import Proving.USC.T18.Ch13.Reslice.Scienter.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Bridge

open Proving.USC.Common








axiom mapActOffense : Elements.Act → Procedure.Offense

axiom mapActivityED : Elements.Activity → Deontic.ProtectedActivity

axiom mapRPropED : Elements.ReligiousProperty → Deontic.ReligiousProperty

axiom mapFacilityED : Elements.Facility → Deontic.Facility

axiom mapWorshipED : Elements.WorshipPlace → Deontic.WorshipPlace

axiom mapRPropEO : Ontology.RealProperty → Elements.ReligiousProperty

axiom mapFacilityOE : Ontology.Facility → Elements.Facility

axiom mapActivityOE : Ontology.ProtectedActivity → Elements.Activity

axiom mapOffenseDP : Deontic.Offense → Procedure.Offense

axiom mapProsecutionDP : Deontic.Prosecution → Procedure.Offense




axiom offence245Of : Person → Person → ComplaintText → Procedure.Offense

axiom offence248Of : Person → ComplaintText → Procedure.Offense

axiom cert247Of : ComplaintText → Procedure.Certification





namespace S245

open Proving.USC.T18.Ch13.Reslice





axiom corr_forcibleAct (d v : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.UsedForceOrThreatOfForce d a c →
    Elements.InjuredIntimidatedOrInterfered d v a c →
    Deontic.ForcibleInterferenceActOccurred245b d v c



axiom corr_willful (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Deontic.ActedWillfully d c



axiom corr_leoExempt (d : Person) (a : Elements.Act) (c : ComplaintText) :
    Deontic.LawEnforcementLawfulDutyExempt245c d c →
    Elements.LawfullyCarryingOutLawEnforcementDuties d a c



axiom corr_targetBasis (d v : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.ProtectedActivityTheory245b d v a c → Deontic.TargetBasis245b v c

















theorem s245_elements_implies_deontic_modulo_gaps
    (d v : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section245b d v a c)
    (gap_addressee : Deontic.AddresseeWhoever d c)
    (gap_lodgingCarveScope : ¬ Deontic.LodgingExemptionApplies245b d v c) :
    Deontic.Prohibition245bViolated d v c :=
  ⟨{ addressee := gap_addressee
     condition := corr_targetBasis d v a c h.theory },
   corr_forcibleAct d v a c h.forceOrThreat h.interference,
   corr_willful d c h.willful,
   fun hExempt => h.notLawEnforcement (corr_leoExempt d a c hExempt),
   gap_lodgingCarveScope⟩





axiom corr_willfulRung (p : Person) (c : ComplaintText) :
    Deontic.ActedWillfully p c → Scienter.Scienter245b p c


axiom corr_aim245b1 (p v : Person) (act : Deontic.ProtectedActivity)
    (c : ComplaintText) :
    Deontic.TargetedFederallyProtectedActivity245b1 v act c →
    Scienter.Scienter245b p c → Scienter.Scienter245b1 p c

axiom corr_aim245b2 (p v : Person) (act : Deontic.ProtectedActivity)
    (c : ComplaintText) :
    Deontic.TargetedStateProtectedActivityByProtectedTrait245b2 v act c →
    Scienter.Scienter245b p c → Scienter.Scienter245b2 p c

axiom corr_aim245b3 (p v : Person) (c : ComplaintText) :
    Deontic.TargetedCommerceBusinessDuringRiot245b3 v c →
    Scienter.Scienter245b p c → Scienter.Scienter245b3 p c

axiom corr_aim245b4 (p v : Person) (act : Deontic.ProtectedActivity)
    (c : ComplaintText) :
    Deontic.TargetedNondiscriminatoryParticipationOrAffording245b4 v act c →
    Scienter.Scienter245b p c → Scienter.Scienter245b4 p c

axiom corr_aim245b5 (p v : Person) (act : Deontic.ProtectedActivity)
    (c : ComplaintText) :
    Deontic.TargetedCitizenAidingOrOpposing245b5 v act c →
    Scienter.Scienter245b p c → Scienter.Scienter245b5 p c




theorem s245_deontic_implies_scienter
    (p v : Person) (c : ComplaintText)
    (h : Deontic.Prohibition245bViolated p v c) :
    Scienter.Scienter245Culpable p c :=
  let hw : Scienter.Scienter245b p c := corr_willfulRung p c h.2.2.1
  match h.1.condition with
  | .federallyProtectedActivity act hb =>
      .federallyProtectedActivity (corr_aim245b1 p v act c hb hw)
  | .protectedTraitAndActivity act hb =>
      .protectedActivityWithAnimus (corr_aim245b2 p v act c hb hw)
  | .riotOrCivilDisorderCommerce hb =>
      .riotOrCivilDisorder (corr_aim245b3 p v c hb hw)
  | .nondiscriminatoryParticipation act hb =>
      .nondiscriminatoryParticipation (corr_aim245b4 p v act c hb hw)
  | .citizenAidingOrOpposing act hb =>
      .aidingOrEncouragingParticipation (corr_aim245b5 p v act c hb hw)





axiom corr_elemWillfulRung (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Scienter.Scienter245b d c


axiom corr_elemAim245b1 (d v : Person) (act : Elements.Activity)
    (c : ComplaintText) :
    Elements.Theory245b1 d v act c →
    Scienter.Scienter245b d c → Scienter.Scienter245b1 d c

axiom corr_elemAim245b2 (d v : Person) (a : Elements.Act) (act : Elements.Activity)
    (c : ComplaintText) :
    Elements.Theory245b2 d v a act c →
    Scienter.Scienter245b d c → Scienter.Scienter245b2 d c

axiom corr_elemAim245b3 (d v : Person) (a : Elements.Act) (b : Entity)
    (c : ComplaintText) :
    Elements.Theory245b3 d v a b c →
    Scienter.Scienter245b d c → Scienter.Scienter245b3 d c

axiom corr_elemAim245b4 (d v : Person) (a : Elements.Act) (act : Elements.Activity)
    (c : ComplaintText) :
    Elements.Theory245b4 d v a act c →
    Scienter.Scienter245b d c → Scienter.Scienter245b4 d c

axiom corr_elemAim245b5 (d v : Person) (act : Elements.Activity)
    (c : ComplaintText) :
    Elements.Theory245b5 d v act c →
    Scienter.Scienter245b d c → Scienter.Scienter245b5 d c


theorem s245_elements_implies_scienter
    (d v : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section245b d v a c) :
    Scienter.Scienter245Culpable d c :=
  let hw : Scienter.Scienter245b d c := corr_elemWillfulRung d c h.willful
  match h.theory with
  | .federal act ht => .federallyProtectedActivity (corr_elemAim245b1 d v act c ht hw)
  | .stateOrPrivate act ht =>
      .protectedActivityWithAnimus (corr_elemAim245b2 d v a act c ht hw)
  | .riotBusiness b ht => .riotOrCivilDisorder (corr_elemAim245b3 d v a b c ht hw)
  | .nondiscriminatory act ht =>
      .nondiscriminatoryParticipation (corr_elemAim245b4 d v a act c ht hw)
  | .citizenSupport act ht =>
      .aidingOrEncouragingParticipation (corr_elemAim245b5 d v act c ht hw)





axiom corr_procOfficerDeontic (p : Person) (c : ComplaintText) :
    Procedure.ActorIsLawEnforcementOfficer p c →
    Procedure.LawEnforcementOfficerLawfullyCarryingOutDuties p c →
    Deontic.LawEnforcementLawfulDutyExempt245c p c

axiom corr_procOfficerElements (d : Person) (a : Elements.Act) (c : ComplaintText) :
    Procedure.ActorIsLawEnforcementOfficer d c →
    Procedure.LawEnforcementOfficerLawfullyCarryingOutDuties d c →
    Elements.LawfullyCarryingOutLawEnforcementDuties d a c



axiom corr_deonCharged245 (p v : Person) (c : ComplaintText) :
    Deontic.Prohibition245bViolated p v c →
    Procedure.Section245OffenseCharged (offence245Of p v c) c

axiom corr_elemCharged245 (d v : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.ProtectedActivityTheory245b d v a c →
    Procedure.Section245OffenseCharged (mapActOffense a) c





theorem s245_deontic_implies_procedure
    (p v : Person) (c : ComplaintText)
    (h : Deontic.Prohibition245bViolated p v c) :
    Procedure.Section245ViolationAttributable p (offence245Of p v c) c :=
  ⟨corr_deonCharged245 p v c h,
   fun hOff => h.2.2.2.1 (corr_procOfficerDeontic p c hOff.1 hOff.2)⟩


theorem s245_elements_implies_procedure
    (d v : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section245b d v a c) :
    Procedure.Section245ViolationAttributable d (mapActOffense a) c :=
  ⟨corr_elemCharged245 d v a c h.theory,
   fun hOff => h.notLawEnforcement (corr_procOfficerElements d a c hOff.1 hOff.2)⟩







axiom corr_deonCert245Charged (pr : Deontic.Prosecution) (c : ComplaintText) :
    Deontic.Prohibition245a1 pr c →
    Procedure.Section245OffenseCharged (mapProsecutionDP pr) c

axiom corr_deonCert245Undertaken (pr : Deontic.Prosecution) (c : ComplaintText) :
    Deontic.FederalProsecutionUndertaken pr c →
    Procedure.FederalProsecutionUndertaken (mapProsecutionDP pr) c


axiom corr_deonCert245Filed (pr : Deontic.Prosecution) (k : Procedure.Certification)
    (c : ComplaintText) :
    Procedure.Section245CertificationPrerequisite k (mapProsecutionDP pr) c →
    Deontic.AttorneyGeneralCertificationFiled245a1 pr c





theorem s245a1_deontic_implies_procedure
    (pr : Deontic.Prosecution) (c : ComplaintText)
    (h : Deontic.Prohibition245a1Violated pr c) :
    Procedure.Section245UncertifiedProsecutionDefect (mapProsecutionDP pr) c :=
  ⟨corr_deonCert245Charged pr c h.1,
   corr_deonCert245Undertaken pr c h.1.condition,
   fun k hk => h.2 (corr_deonCert245Filed pr k c hk)⟩













theorem s245_scienter_implies_procedure_modulo_gaps
    (p : Person) (o : Procedure.Offense) (c : ComplaintText)
    (_h : Scienter.Scienter245Culpable p c)
    (gap_charge : Procedure.Section245OffenseCharged o c)
    (gap_safeHarbour :
      ¬ (Procedure.ActorIsLawEnforcementOfficer p c ∧
         Procedure.LawEnforcementOfficerLawfullyCarryingOutDuties p c)) :
    Procedure.Section245ViolationAttributable p o c :=
  ⟨gap_charge, gap_safeHarbour⟩

end S245





namespace S247

open Proving.USC.T18.Ch13.Reslice





axiom corr_commerce (a : Elements.Act) (c : ComplaintText) :
    Elements.OffenseAffectsInterstateCommerce a c →
    Deontic.AffectsInterstateOrForeignCommerce c


axiom corr_intentional (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Deontic.ActedIntentionally d c



axiom corr_damageAct (d : Person) (rp : Elements.ReligiousProperty)
    (a : Elements.Act) (c : ComplaintText) :
    Elements.IsReligiousRealProperty rp c →
    Elements.DefacedDamagedOrDestroyedProperty d rp a c →
    Deontic.ReligiousPropertyDamageActOccurred247a1 d (mapRPropED rp) c


axiom corr_religiousMotive (d : Person) (rp : Elements.ReligiousProperty)
    (c : ComplaintText) :
    Elements.BecauseOfReligiousCharacterOfProperty d rp c →
    Deontic.MotivatedByReligiousCharacterOfProperty247a1 (mapRPropED rp) c



axiom corr_obstructionAct (d v : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.UsedForceOrThreatOfForce d a c →
    Elements.ObstructedEnjoymentOfFreeExercise d v a c →
    Deontic.FreeExerciseObstructionActOccurred247a2 d v c



axiom corr_raceMotive (d : Person) (rp : Elements.ReligiousProperty)
    (c : ComplaintText) :
    IntentToDiscriminate d c →
    Elements.MotiveDirectedAtIndividualAssociatedWithProperty d rp c →
    Deontic.MotivatedByRaceColorOrEthnicityOfAssociatedIndividual247c
      (mapRPropED rp) c













theorem s247_elements_implies_deontic_modulo_gaps
    (d : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section247Violation d a c)
    (gap_addressee : Deontic.AddresseeWhoever d c) :
    Deontic.Prohibition247Violated d c :=
  match h with
  | .religiousCharacter rp hs =>
      .religiousCharacterDamage (mapRPropED rp)
        ⟨{ addressee := gap_addressee
           condition := corr_commerce a c hs.commerce },
         corr_damageAct d rp a c hs.religiousProperty hs.damage,
         corr_intentional d c hs.intent,
         corr_religiousMotive d rp c hs.motive⟩
  | .freeExercise v hs =>
      .freeExerciseObstruction v
        ⟨{ addressee := gap_addressee
           condition := corr_commerce a c hs.commerce },
         corr_obstructionAct d v a c hs.forceOrThreat hs.obstruction,
         corr_intentional d c hs.intent⟩
  | .raceColorEthnicity rp hs =>
      .raceOrEthnicityDamage (mapRPropED rp)
        ⟨{ addressee := gap_addressee },
         corr_damageAct d rp a c hs.religiousProperty hs.damage,
         corr_intentional d c hs.intent,
         corr_raceMotive d rp c hs.protectedGroundMotive hs.associatedIndividual⟩




axiom corr_intentRung247a1 (p : Person) (c : ComplaintText) :
    Deontic.ActedIntentionally p c → (Scienter.demand247a1 p).MetBy c

axiom corr_intentRung247a2 (p : Person) (c : ComplaintText) :
    Deontic.ActedIntentionally p c → (Scienter.demand247a2 p).MetBy c

axiom corr_intentRung247c (p : Person) (c : ComplaintText) :
    Deontic.ActedIntentionally p c → (Scienter.demand247c p).MetBy c



axiom corr_scienterReligiousMotive (p : Person) (r : Deontic.ReligiousProperty)
    (c : ComplaintText) :
    Deontic.MotivatedByReligiousCharacterOfProperty247a1 r c →
    Scienter.ActedBecauseOf p .religiousCharacterOfProperty c

axiom corr_scienterFreeExercise (p v : Person) (c : ComplaintText) :
    Deontic.FreeExerciseObstructionActOccurred247a2 p v c →
    Scienter.IntendedResult p .freeExerciseOfReligion c

axiom corr_scienterRaceAnimus (p : Person) (r : Deontic.ReligiousProperty)
    (c : ComplaintText) :
    Deontic.MotivatedByRaceColorOrEthnicityOfAssociatedIndividual247c r c →
    Scienter.AnimusWithin p Scienter.classes247c c







theorem s247_deontic_implies_scienter
    (p : Person) (c : ComplaintText)
    (h : Deontic.Prohibition247Violated p c) :
    Scienter.Scienter247Culpable p c :=
  match h with
  | .religiousCharacterDamage r hs =>
      .damageBecauseOfReligiousCharacter
        { intentional := corr_intentRung247a1 p c hs.2.2.1
          becauseOfReligiousCharacter := corr_scienterReligiousMotive p r c hs.2.2.2
          commerceCircumstance := True.intro }
  | .freeExerciseObstruction v hs =>
      .obstructionOfFreeExercise
        { intentional := corr_intentRung247a2 p c hs.2.2
          objectOfIntent := corr_scienterFreeExercise p v c hs.2.1
          commerceCircumstance := True.intro }
  | .raceOrEthnicityDamage r hs =>
      .damageBecauseOfRaceColorOrEthnicity
        { intentional := corr_intentRung247c p c hs.2.2.1
          animus := corr_scienterRaceAnimus p r c hs.2.2.2 }




axiom corr_elemRung247a1 (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → (Scienter.demand247a1 d).MetBy c

axiom corr_elemRung247a2 (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → (Scienter.demand247a2 d).MetBy c

axiom corr_elemRung247c (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → (Scienter.demand247c d).MetBy c

axiom corr_elemReligiousMotive (d : Person) (rp : Elements.ReligiousProperty)
    (c : ComplaintText) :
    Elements.BecauseOfReligiousCharacterOfProperty d rp c →
    Scienter.ActedBecauseOf d .religiousCharacterOfProperty c

axiom corr_elemFreeExercise (d v : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.ObstructedEnjoymentOfFreeExercise d v a c →
    Scienter.IntendedResult d .freeExerciseOfReligion c

axiom corr_elemRaceAnimus (d : Person) (rp : Elements.ReligiousProperty)
    (c : ComplaintText) :
    IntentToDiscriminate d c →
    Elements.MotiveDirectedAtIndividualAssociatedWithProperty d rp c →
    Scienter.AnimusWithin d Scienter.classes247c c


theorem s247_elements_implies_scienter
    (d : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section247Violation d a c) :
    Scienter.Scienter247Culpable d c :=
  match h with
  | .religiousCharacter rp hs =>
      .damageBecauseOfReligiousCharacter
        { intentional := corr_elemRung247a1 d c hs.intent
          becauseOfReligiousCharacter := corr_elemReligiousMotive d rp c hs.motive
          commerceCircumstance := True.intro }
  | .freeExercise v hs =>
      .obstructionOfFreeExercise
        { intentional := corr_elemRung247a2 d c hs.intent
          objectOfIntent := corr_elemFreeExercise d v a c hs.obstruction
          commerceCircumstance := True.intro }
  | .raceColorEthnicity rp hs =>
      .damageBecauseOfRaceColorOrEthnicity
        { intentional := corr_elemRung247c d c hs.intent
          animus := corr_elemRaceAnimus d rp c hs.protectedGroundMotive
                      hs.associatedIndividual }










axiom corr_noncapital247g (o : Deontic.Offense) (c : ComplaintText) :
    Deontic.NoncapitalOffense247g o c →
    Procedure.NoncapitalOffenseCharged (mapOffenseDP o) c


axiom corr_timely247g (o : Deontic.Offense) (c : ComplaintText) :
    Procedure.WithinSevenYearLimitation (mapOffenseDP o) c →
    Deontic.WithinLimitationsPeriod o c



theorem s247g_deontic_implies_procedure
    (o : Deontic.Offense) (pr : Deontic.Prosecution) (c : ComplaintText)
    (h : Deontic.Prohibition247gViolated o pr c) :
    Procedure.Section247LimitationBar (mapOffenseDP o) c :=
  ⟨corr_noncapital247g o c h.1.condition,
   fun hIn => h.2.2 (corr_timely247g o c hIn)⟩




axiom corr_elemCharged247 (d : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.Section247Violation d a c →
    Procedure.Section247OffenseCharged (mapActOffense a) c

axiom corr_procCommerce247 (a : Elements.Act) (c : ComplaintText) :
    Elements.OffenseAffectsInterstateCommerce a c →
    Procedure.OffenseInOrAffectingInterstateCommerce (mapActOffense a) c

axiom corr_procTimely247 (d : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.WithinSevenYearLimitations d a c →
    Procedure.WithinSevenYearLimitation (mapActOffense a) c


axiom corr_procCert247 (a : Elements.Act) (c : ComplaintText) :
    Elements.AttorneyGeneralCertification247 c →
    Procedure.Section247CertificationPrerequisite (cert247Of c) (mapActOffense a) c













theorem s247_elements_implies_procedure_modulo_gaps
    (d : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section247Violation d a c)
    (hTimely : Elements.WithinSevenYearLimitations d a c)
    (hCert : Elements.AttorneyGeneralCertification247 c)
    (gap_commerce247c : Elements.OffenseAffectsInterstateCommerce a c)
    (gap_instrumentInstituted :
      Procedure.ChargingInstrumentInstituted (mapActOffense a) c)
    (gap_noncapital : Procedure.NoncapitalOffenseCharged (mapActOffense a) c) :
    Procedure.Section247ProsecutionAuthorized (cert247Of c) (mapActOffense a) c :=
  { timely :=
      { charged := corr_elemCharged247 d a c h
        commerceNexus := corr_procCommerce247 a c gap_commerce247c
        instrumentInstituted := gap_instrumentInstituted
        noncapital := gap_noncapital
        withinLimitation := corr_procTimely247 d a c hTimely }
    certified := corr_procCert247 a c hCert }




theorem s247_scienter_implies_procedure_modulo_gaps
    (p : Person) (o : Procedure.Offense) (c : ComplaintText)
    (_h : Scienter.Scienter247Culpable p c)
    (gap_charge : Procedure.Section247OffenseCharged o c)
    (gap_commerce : Procedure.OffenseInOrAffectingInterstateCommerce o c)
    (gap_instrument : Procedure.ChargingInstrumentInstituted o c)
    (gap_noncapital : Procedure.NoncapitalOffenseCharged o c)
    (gap_timely : Procedure.WithinSevenYearLimitation o c) :
    Procedure.Section247ProsecutionTimely o c :=
  { charged := gap_charge
    commerceNexus := gap_commerce
    instrumentInstituted := gap_instrument
    noncapital := gap_noncapital
    withinLimitation := gap_timely }

end S247





namespace S248

open Proving.USC.T18.Ch13.Reslice




axiom corr_intentional (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Deontic.ActedIntentionally d c




axiom corr_meansAct (d v : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.Means248a d a c →
    Elements.InjuredIntimidatedOrInterfered d v a c →
    Deontic.ForceOrObstructionInterferenceActOccurred248a d v c


axiom corr_target248a1 (d v : Person) (c : ComplaintText) :
    Elements.TargetedBecauseOfOrToDeterReproductiveHealthServices d v c →
    Deontic.TargetedReproductiveHealthServicesParticipation248a1 v c

axiom corr_target248a2 (v : Person) (w : Elements.WorshipPlace)
    (c : ComplaintText) :
    Elements.LawfullyExercisingReligiousFreedomAtWorshipPlace v w c →
    Deontic.TargetedReligiousFreedomExerciseAtWorshipPlace248a2 v
      (mapWorshipED w) c




axiom corr_facilityDamage (d : Person) (f : Elements.Facility)
    (a : Elements.Act) (c : ComplaintText) :
    Elements.FacilityProvidesReproductiveHealthServices f c →
    Elements.DamagedOrDestroyedFacilityProperty d f a c →
    Elements.BecauseFacilityProvidesReproductiveHealthServices d f c →
    Deontic.FacilityPropertyDamageBecauseReproductiveServices248a3 d
      (mapFacilityED f) c



axiom corr_worshipDamage (d : Person) (w : Elements.WorshipPlace)
    (a : Elements.Act) (c : ComplaintText) :
    Elements.DamagedOrDestroyedWorshipPlaceProperty d w a c →
    Deontic.WorshipPlacePropertyDamage248a3 d (mapWorshipED w) c



axiom corr_parental (d : Person) (a : Elements.Act) (c : ComplaintText) :
    Deontic.ParentOrGuardianDirectedExclusivelyAtMinorExempt248a d c →
    Elements.ParentOrGuardianActingExclusivelyTowardMinor d a c


axiom corr_expressive (d : Person) (a : Elements.Act) (c : ComplaintText) :
    Deontic.ProtectedExpressiveConduct248d1 d c →
    Elements.ProtectedFirstAmendmentExpressiveConduct d a c












theorem s248_elements_implies_deontic_modulo_gaps
    (d : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section248a d a c)
    (gap_addressee : Deontic.AddresseeWhoever d c) :
    Deontic.Liability248 d c :=
  ⟨(match h.conduct with
    | .reproductiveHealth v hc =>
        .reproductiveHealthInterference v
          ⟨{ addressee := gap_addressee
             condition := corr_target248a1 d v c hc.nexus },
           corr_meansAct d v a c hc.means hc.interference,
           corr_intentional d c hc.intent⟩
    | .religiousFreedom v w hc =>
        .religiousFreedomInterference v (mapWorshipED w)
          ⟨{ addressee := gap_addressee
             condition := corr_target248a2 v w c hc.exercising },
           corr_meansAct d v a c hc.means hc.interference,
           corr_intentional d c hc.intent⟩
    | .propertyDamage hc =>
        .propertyDestruction
          (match hc with
           | .facility f hProvides hIntent hDamage hMotive =>
               .facilityProperty (mapFacilityED f)
                 { addressee := gap_addressee }
                 (corr_facilityDamage d f a c hProvides hDamage hMotive)
                 (corr_intentional d c hIntent)
           | .worshipPlace w hIntent hDamage =>
               .worshipProperty (mapWorshipED w)
                 { addressee := gap_addressee }
                 (corr_worshipDamage d w a c hDamage)
                 (corr_intentional d c hIntent))),
   fun hp => h.notParentalException (corr_parental d a c hp),
   fun he => h.notProtectedSpeech (corr_expressive d a c he)⟩




axiom corr_intentRung248a1 (p : Person) (c : ComplaintText) :
    Deontic.ActedIntentionally p c → (Scienter.demand248a1 p).MetBy c

axiom corr_intentRung248a2 (p : Person) (c : ComplaintText) :
    Deontic.ActedIntentionally p c → (Scienter.demand248a2 p).MetBy c

axiom corr_intentRung248a3 (p : Person) (c : ComplaintText) :
    Deontic.ActedIntentionally p c → (Scienter.demand248a3 p).MetBy c


axiom corr_scienterAim248a1 (p v : Person) (c : ComplaintText) :
    Deontic.TargetedReproductiveHealthServicesParticipation248a1 v c →
    Scienter.ActedBecauseOf p .reproductiveHealthServices c

axiom corr_scienterAim248a2 (p v : Person) (w : Deontic.WorshipPlace)
    (c : ComplaintText) :
    Deontic.TargetedReligiousFreedomExerciseAtWorshipPlace248a2 v w c →
    Scienter.IntendedResult p .freeExerciseOfReligion c


axiom corr_scienterAim248a3Facility (p : Person) (f : Deontic.Facility)
    (c : ComplaintText) :
    Deontic.FacilityPropertyDamageBecauseReproductiveServices248a3 p f c →
    Scienter.ActedBecauseOf p .reproductiveHealthServices c


axiom corr_scienterAim248a3Worship (p : Person) (w : Deontic.WorshipPlace)
    (c : ComplaintText) :
    Deontic.WorshipPlacePropertyDamage248a3 p w c →
    Scienter.IntendedResult p .placeOfReligiousWorship c


theorem s248_deontic_implies_scienter
    (p : Person) (c : ComplaintText)
    (h : Deontic.Prohibition248Violated p c) :
    Scienter.Scienter248Culpable p c :=
  match h with
  | .reproductiveHealthInterference v hs =>
      .reproductiveHealthAccess
        { intentional := corr_intentRung248a1 p c hs.2.2
          aim := Or.inl (corr_scienterAim248a1 p v c hs.1.condition) }
  | .religiousFreedomInterference v w hs =>
      .religiousFreedomExercise
        { intentional := corr_intentRung248a2 p c hs.2.2
          objectOfIntent := corr_scienterAim248a2 p v w c hs.1.condition }
  | .propertyDestruction hs =>
      .propertyOfFacilityOrWorshipPlace
        (match hs with
         | .facilityProperty f _ hAct hIntent =>
             .facilityBecauseOfServices (corr_intentRung248a3 p c hIntent)
               (corr_scienterAim248a3Facility p f c hAct)
         | .worshipProperty w _ hAct hIntent =>
             .placeOfReligiousWorship (corr_intentRung248a3 p c hIntent)
               (corr_scienterAim248a3Worship p w c hAct))




axiom corr_elemRung248a1 (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → (Scienter.demand248a1 d).MetBy c

axiom corr_elemRung248a2 (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → (Scienter.demand248a2 d).MetBy c

axiom corr_elemRung248a3 (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → (Scienter.demand248a3 d).MetBy c

axiom corr_elemAim248a1 (d v : Person) (c : ComplaintText) :
    Elements.TargetedBecauseOfOrToDeterReproductiveHealthServices d v c →
    Scienter.ActedBecauseOf d .reproductiveHealthServices c

axiom corr_elemAim248a2 (d v : Person) (w : Elements.WorshipPlace)
    (c : ComplaintText) :
    Elements.LawfullyExercisingReligiousFreedomAtWorshipPlace v w c →
    Scienter.IntendedResult d .freeExerciseOfReligion c

axiom corr_elemAim248a3Facility (d : Person) (f : Elements.Facility)
    (c : ComplaintText) :
    Elements.BecauseFacilityProvidesReproductiveHealthServices d f c →
    Scienter.ActedBecauseOf d .reproductiveHealthServices c

axiom corr_elemAim248a3Worship (d : Person) (w : Elements.WorshipPlace)
    (a : Elements.Act) (c : ComplaintText) :
    Elements.DamagedOrDestroyedWorshipPlaceProperty d w a c →
    Scienter.IntendedResult d .placeOfReligiousWorship c


theorem s248_elements_implies_scienter
    (d : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section248a d a c) :
    Scienter.Scienter248Culpable d c :=
  match h.conduct with
  | .reproductiveHealth v hc =>
      .reproductiveHealthAccess
        { intentional := corr_elemRung248a1 d c hc.intent
          aim := Or.inl (corr_elemAim248a1 d v c hc.nexus) }
  | .religiousFreedom v w hc =>
      .religiousFreedomExercise
        { intentional := corr_elemRung248a2 d c hc.intent
          objectOfIntent := corr_elemAim248a2 d v w c hc.exercising }
  | .propertyDamage hc =>
      .propertyOfFacilityOrWorshipPlace
        (match hc with
         | .facility f _ hIntent _ hMotive =>
             .facilityBecauseOfServices (corr_elemRung248a3 d c hIntent)
               (corr_elemAim248a3Facility d f c hMotive)
         | .worshipPlace w hIntent hDamage =>
             .placeOfReligiousWorship (corr_elemRung248a3 d c hIntent)
               (corr_elemAim248a3Worship d w a c hDamage))




axiom corr_deonCharged248 (p : Person) (c : ComplaintText) :
    Deontic.Prohibition248Violated p c →
    Procedure.Section248OffenseCharged (offence248Of p c) c

axiom corr_elemCharged248 (d : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.ProhibitedConduct248a d a c →
    Procedure.Section248OffenseCharged (mapActOffense a) c


axiom corr_procParentalDeontic (p : Person) (c : ComplaintText) :
    Procedure.ParentOrGuardianActingExclusivelyTowardOwnMinor p c →
    Deontic.ParentOrGuardianDirectedExclusivelyAtMinorExempt248a p c

axiom corr_procExpressiveDeontic (p : Person) (c : ComplaintText) :
    Procedure.ExpressiveConductProtectedByFirstAmendment p c →
    Deontic.ProtectedExpressiveConduct248d1 p c

axiom corr_procParentalElements (d : Person) (a : Elements.Act)
    (c : ComplaintText) :
    Procedure.ParentOrGuardianActingExclusivelyTowardOwnMinor d c →
    Elements.ParentOrGuardianActingExclusivelyTowardMinor d a c

axiom corr_procExpressiveElements (d : Person) (a : Elements.Act)
    (c : ComplaintText) :
    Procedure.ExpressiveConductProtectedByFirstAmendment d c →
    Elements.ProtectedFirstAmendmentExpressiveConduct d a c




theorem s248_deontic_implies_procedure
    (p : Person) (c : ComplaintText)
    (h : Deontic.Liability248 p c) :
    Procedure.Section248SanctionsAvailable p (offence248Of p c) c :=
  ⟨corr_deonCharged248 p c h.1,
   fun hp => h.2.1 (corr_procParentalDeontic p c hp),
   fun he => h.2.2 (corr_procExpressiveDeontic p c he)⟩


theorem s248_elements_implies_procedure
    (d : Person) (a : Elements.Act) (c : ComplaintText)
    (h : Elements.Section248a d a c) :
    Procedure.Section248SanctionsAvailable d (mapActOffense a) c :=
  ⟨corr_elemCharged248 d a c h.conduct,
   fun hp => h.notParentalException (corr_procParentalElements d a c hp),
   fun he => h.notProtectedSpeech (corr_procExpressiveElements d a c he)⟩







axiom corr_aggrieved248 (pl : Person) (a : Elements.Act) (c : ComplaintText) :
    Elements.AggrievedByProhibitedConduct pl a c →
    Procedure.PersonAggrievedByProhibitedConduct pl c

axiom corr_standingServices (pl : Person) (c : ComplaintText) :
    Elements.InvolvedInProvidingOrObtainingServices pl c →
    Procedure.PlaintiffInvolvedWithReproductiveHealthServicesAtFacility pl c

axiom corr_standingWorshipper (pl : Person) (w : Elements.WorshipPlace)
    (c : ComplaintText) :
    Elements.LawfullyExercisingReligiousFreedomAtWorshipPlace pl w c →
    Procedure.PlaintiffExercisingReligiousFreedomAtPlaceOfWorship pl c

axiom corr_standingEntity (pl : Person) (w : Elements.WorshipPlace)
    (c : ComplaintText) :
    Elements.OwnsOrOperatesPlaceOfWorship pl w c →
    Procedure.PlaintiffOwnsOrOperatesPlaceOfReligiousWorship pl c












theorem s248c1_elements_implies_procedure_modulo_gaps
    (pl d : Person) (a : Elements.Act) (ca : Procedure.CivilAction)
    (c : ComplaintText)
    (h : Elements.ValidFaceActClaim pl d a c)
    (gap_commenced : Procedure.CivilActionCommenced ca c)
    (gap_predicateSubsection :
      Procedure.ClaimPredicatedOnReproductiveHealthServicesInterference ca c)
    (gap_standingIsServices : Elements.InvolvedInProvidingOrObtainingServices pl c) :
    Procedure.Section248PrivateAction pl ca c :=
  .reproductiveHealth
    { aggrieved := corr_aggrieved248 pl a c h.aggrieved
      commenced := gap_commenced
      predicateSubsection := gap_predicateSubsection
      standing := corr_standingServices pl c gap_standingIsServices }




theorem s248_scienter_implies_procedure_modulo_gaps
    (p : Person) (o : Procedure.Offense) (c : ComplaintText)
    (_h : Scienter.Scienter248Culpable p c)
    (gap_charge : Procedure.Section248OffenseCharged o c)
    (gap_notParental :
      ¬ Procedure.ParentOrGuardianActingExclusivelyTowardOwnMinor p c)
    (gap_notExpressive :
      ¬ Procedure.ExpressiveConductProtectedByFirstAmendment p c) :
    Procedure.Section248SanctionsAvailable p o c :=
  ⟨gap_charge, gap_notParental, gap_notExpressive⟩

end S248









namespace OntologyTerms

open Proving.USC.T18.Ch13.Reslice








axiom corr_voting (a : Ontology.ProtectedActivity) (c : ComplaintText) :
    Ontology.IsVotingOrElectionParticipation a c →
    Elements.VotingOrElectionActivity (mapActivityOE a) c

axiom corr_federalBenefit (a : Ontology.ProtectedActivity) (c : ComplaintText) :
    Ontology.IsFederallyProvidedBenefitOrService a c →
    Elements.FederalBenefitOrProgram (mapActivityOE a) c

axiom corr_federalEmployment (a : Ontology.ProtectedActivity) (c : ComplaintText) :
    Ontology.IsFederalEmploymentOrPerquisite a c →
    Elements.FederalEmployment (mapActivityOE a) c

axiom corr_federalJury (a : Ontology.ProtectedActivity) (c : ComplaintText) :
    Ontology.IsFederalJuryService a c →
    Elements.FederalJuryService (mapActivityOE a) c

axiom corr_federallyAssisted (a : Ontology.ProtectedActivity) (c : ComplaintText) :
    Ontology.IsFederallyAssistedProgramOrActivity a c →
    Elements.FederallyAssistedProgram (mapActivityOE a) c




theorem s245b1_ontology_implies_elements
    (a : Ontology.ProtectedActivity) (c : ComplaintText)
    (h : Ontology.FederalBenefitOrActivityMembership a c) :
    Elements.FederalActivity245b1 (mapActivityOE a) c :=
  match h with
  | .votingOrElection hx => .voting (corr_voting a c hx)
  | .federallyProvidedBenefit hx => .federalBenefit (corr_federalBenefit a c hx)
  | .federalEmployment hx => .federalEmployment (corr_federalEmployment a c hx)
  | .federalJuryService hx => .federalJury (corr_federalJury a c hx)
  | .federallyAssistedProgram hx =>
      .federallyAssisted (corr_federallyAssisted a c hx)








axiom corr_religiousRealProperty (rp : Ontology.RealProperty) (c : ComplaintText) :
    Ontology.ReligiousRealPropertyMembership rp c →
    Elements.IsReligiousRealProperty (mapRPropEO rp) c




theorem s247f_ontology_implies_elements
    (rp : Ontology.RealProperty) (c : ComplaintText)
    (h : Ontology.ReligiousRealPropertyMembership rp c) :
    Elements.IsReligiousRealProperty (mapRPropEO rp) c :=
  corr_religiousRealProperty rp c h





axiom corr_facility (f : Ontology.Facility) (c : ComplaintText) :
    Ontology.FacilityMembership f c →
    Elements.FacilityProvidesReproductiveHealthServices (mapFacilityOE f) c



theorem s248e1_ontology_implies_elements
    (f : Ontology.Facility) (c : ComplaintText)
    (h : Ontology.FacilityMembership f c) :
    Elements.FacilityProvidesReproductiveHealthServices (mapFacilityOE f) c :=
  corr_facility f c h

end OntologyTerms

end Proving.USC.T18.Ch13.Reslice.Bridge
