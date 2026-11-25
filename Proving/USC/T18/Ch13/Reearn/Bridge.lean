





































import Proving.USC.T18.Ch13.Reearn.Elements.Statute
import Proving.USC.T18.Ch13.Reearn.Deontic.Statute
import Proving.USC.T18.Ch13.Reearn.Scienter.Statute
import Proving.USC.T18.Ch13.Reearn.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Bridge

open Proving.USC.Common









axiom mapActivity : Elements.Activity → Deontic.ProtectedActivity


axiom mapReligiousProperty : Elements.ReligiousProperty → Deontic.ReligiousProperty


axiom mapFacility : Elements.Facility → Deontic.Facility




axiom mapWorship : Elements.PlaceOfWorship → Deontic.Facility


axiom mapProsecution : Procedure.Prosecution → Deontic.Prosecution


axiom mapCivilAction : Procedure.CivilAction → Deontic.CivilAction



namespace S245





axiom corr_regulatedAct {d v : Person} {c : ComplaintText} :
    Elements.UsedForceOrThreatOfForce d c →
    Elements.InjuredIntimidatedOrInterfered d v c →
    ActedWithScienter d c →
    Deontic.RegulatedActOccurred245b d v c

axiom corr_nexus_b1 {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b1 d v a c →
    Deontic.FederalElectoralOrBenefitNexus245b1 v (mapActivity a) c

axiom corr_nexus_b2 {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b2 d v a c →
    Deontic.RacialOrReligiousStatusNexus245b2 v (mapActivity a) c

axiom corr_nexus_b3 {d v : Person} {e : Entity} {a : Elements.Activity}
    {c : ComplaintText} :
    Elements.Section245b3 d v e c →
    Deontic.RiotOrCivilDisorderCommerceNexus245b3 v (mapActivity a) c

axiom corr_nexus_b4 {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b4 d v a c →
    Deontic.NondiscriminatoryParticipationNexus245b4 v (mapActivity a) c

axiom corr_nexus_b5 {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b5 d v a c →
    Deontic.CitizenEncouragementNexus245b5 v (mapActivity a) c




axiom corr_officer {p : Person} {c : ComplaintText} :
    Deontic.LawEnforcementDutyExemption245c p c →
    Elements.LawfullyActingLawEnforcementOfficer p c










theorem s245b_elements_implies_deontic_modulo_gaps
    {d v : Person} {a : Elements.Activity} {e : Entity} {c : ComplaintText}
    (gap_addresseeInClass245b : Deontic.AddresseeInClass245b d c)
    (gap_smallLodgingProvisoNotHoisted :
      ¬ Deontic.SmallLodgingProprietorExemption245b d (mapActivity a) c)
    (h : Elements.Section245b d v a e c) :
    Deontic.ProhibitionViolated245b d v (mapActivity a) c :=
  ⟨⟨gap_addresseeInClass245b,
    (show Deontic.ConditionMet245b v (mapActivity a) c from
      match h.theory with
      | .federalActivity h1 => .federalNexus (corr_nexus_b1 h1)
      | .discriminatoryDenial h2 => .protectedStatus (corr_nexus_b2 h2)
      | .riotAgainstCommerce h3 => .riotCommerce (corr_nexus_b3 h3)
      | .participationWithoutDiscrimination h4 => .participation (corr_nexus_b4 h4)
      | .citizenSupport h5 => .citizenEncouragement (corr_nexus_b5 h5))⟩,
   corr_regulatedAct h.forceOrThreat h.interference h.willful,
   fun hx => h.notLawfullyActingOfficer (corr_officer hx),
   gap_smallLodgingProvisoNotHoisted⟩





axiom corr_willful {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Scienter.DemandSatisfied d .s245b_forceConduct c

axiom corr_exclusion {p : Person} {c : ComplaintText} :
    Scienter.LawEnforcementLawfulDutyExclusion p c →
    Elements.LawfullyActingLawEnforcementOfficer p c

axiom corr_motive_b1 {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b1 d v a c → Scienter.DemandSatisfied d .s245b1_motive c

axiom corr_motive_b2_class {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b2 d v a c →
    Scienter.DemandSatisfied d .s245b2_protectedClassMotive c

axiom corr_motive_b2_activity {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b2 d v a c →
    Scienter.DemandSatisfied d .s245b2_activityMotive c

axiom corr_motive_b4 {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b4 d v a c → Scienter.DemandSatisfied d .s245b4_motive c

axiom corr_motive_b5 {d v : Person} {a : Elements.Activity} {c : ComplaintText} :
    Elements.Section245b5 d v a c → Scienter.DemandSatisfied d .s245b5_motive c


private theorem chapeau {d v : Person} {a : Elements.Activity} {e : Entity}
    {c : ComplaintText} (h : Elements.Section245b d v a e c) :
    Scienter.Scienter245bChapeau d c :=
  { willfulForce := corr_willful h.willful,
    notLawfulOfficerDuty := fun hx => h.notLawfullyActingOfficer (corr_exclusion hx) }







theorem s245b_elements_implies_scienter
    {d v : Person} {a : Elements.Activity} {e : Entity} {c : ComplaintText}
    (h : Elements.Section245b d v a e c) : Scienter.Scienter245b d c :=
  match h.theory with
  | .federalActivity h1 =>
      .federalActivity (chapeau h) ⟨rfl, corr_motive_b1 h1⟩
  | .discriminatoryDenial h2 =>
      .protectedClassActivity (chapeau h)
        ⟨rfl, corr_motive_b2_class h2⟩ ⟨rfl, corr_motive_b2_activity h2⟩
  | .riotAgainstCommerce _ =>
      .riotCommercialTarget (chapeau h) ⟨rfl, trivial⟩
  | .participationWithoutDiscrimination h4 =>
      .nondiscriminatoryParticipation (chapeau h) ⟨rfl, corr_motive_b4 h4⟩
  | .citizenSupport h5 =>
      .citizenAiding (chapeau h) ⟨rfl, corr_motive_b5 h5⟩



axiom corr_act_willful {d v : Person} {c : ComplaintText} :
    Deontic.RegulatedActOccurred245b d v c →
    Scienter.DemandSatisfied d .s245b_forceConduct c

axiom corr_exclusion_deontic {p : Person} {c : ComplaintText} :
    Scienter.LawEnforcementLawfulDutyExclusion p c →
    Deontic.LawEnforcementDutyExemption245c p c

axiom corr_dnexus_b1 {d v : Person} {a : Deontic.ProtectedActivity} {c : ComplaintText} :
    Deontic.FederalElectoralOrBenefitNexus245b1 v a c →
    Scienter.DemandSatisfied d .s245b1_motive c




axiom corr_dnexus_b2_class {d v : Person} {a : Deontic.ProtectedActivity} {c : ComplaintText} :
    Deontic.RacialOrReligiousStatusNexus245b2 v a c →
    Scienter.DemandSatisfied d .s245b2_protectedClassMotive c

axiom corr_dnexus_b2_activity {d v : Person} {a : Deontic.ProtectedActivity} {c : ComplaintText} :
    Deontic.RacialOrReligiousStatusNexus245b2 v a c →
    Scienter.DemandSatisfied d .s245b2_activityMotive c

axiom corr_dnexus_b4 {d v : Person} {a : Deontic.ProtectedActivity} {c : ComplaintText} :
    Deontic.NondiscriminatoryParticipationNexus245b4 v a c →
    Scienter.DemandSatisfied d .s245b4_motive c

axiom corr_dnexus_b5 {d v : Person} {a : Deontic.ProtectedActivity} {c : ComplaintText} :
    Deontic.CitizenEncouragementNexus245b5 v a c →
    Scienter.DemandSatisfied d .s245b5_motive c


theorem s245b_deontic_implies_scienter
    {d v : Person} {a : Deontic.ProtectedActivity} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated245b d v a c) : Scienter.Scienter245b d c :=
  let ch : Scienter.Scienter245bChapeau d c :=
    { willfulForce := corr_act_willful h.2.1,
      notLawfulOfficerDuty := fun hx => h.2.2.1 (corr_exclusion_deontic hx) }
  match h.1.condition with
  | .federalNexus h1 => .federalActivity ch ⟨rfl, corr_dnexus_b1 h1⟩
  | .protectedStatus h2 =>
      .protectedClassActivity ch
        ⟨rfl, corr_dnexus_b2_class h2⟩ ⟨rfl, corr_dnexus_b2_activity h2⟩
  | .riotCommerce _ => .riotCommercialTarget ch ⟨rfl, trivial⟩
  | .participation h4 => .nondiscriminatoryParticipation ch ⟨rfl, corr_dnexus_b4 h4⟩
  | .citizenEncouragement h5 => .citizenAiding ch ⟨rfl, corr_dnexus_b5 h5⟩







axiom corr_cert245 {cert : Procedure.Certification} {pr : Procedure.Prosecution}
    {o : Person} {c : ComplaintText} :
    Procedure.ValidCertification245 cert o c →
    Procedure.CertificationPrecedesProsecution245 cert pr c →
    Deontic.CertificationRequirementSatisfied245a1 (mapProsecution pr) c



theorem s245a1_procedure_implies_not_deontic_violation
    {pr : Procedure.Prosecution} {cert : Procedure.Certification} {o : Person}
    {c : ComplaintText} (h : Procedure.AuthorizedProsecution245 pr cert o c) :
    ¬ Deontic.ProhibitionViolated245a1 (mapProsecution pr) c :=
  fun hv => hv.1.uncertified (corr_cert245 h.certification h.certificationFirst)











axiom corr_cert245_elements {cert : Procedure.Certification} {o : Person}
    {c : ComplaintText} :
    Procedure.ValidCertification245 cert o c → Elements.AttorneyGeneralCertification c


theorem s245a1_procedure_implies_elements_certification
    {cert : Procedure.Certification} {o : Person} {c : ComplaintText}
    (h : Procedure.ValidCertification245 cert o c) :
    Elements.AttorneyGeneralCertification c :=
  corr_cert245_elements h

axiom corr_cert245_scienter {cert : Procedure.Certification} {o : Person}
    {c : ComplaintText} :
    Procedure.ValidCertification245 cert o c →
    Scienter.UnclassifiedDemandMet o .s245a1_certification c





theorem s245a1_procedure_implies_scienter_certification
    {cert : Procedure.Certification} {o : Person} {c : ComplaintText}
    (h : Procedure.ValidCertification245 cert o c) :
    Scienter.Scienter245aCertification o c :=
  { certifyingJudgment := corr_cert245_scienter h }

end S245




namespace S247



axiom corr_act_a1 {d : Person} {rp : Elements.ReligiousProperty} {c : ComplaintText} :
    Elements.Section247a1 d rp c →
    Deontic.RegulatedActOccurred247a1 d (mapReligiousProperty rp) c

axiom corr_act_a2 {d v : Person} {c : ComplaintText} :
    Elements.Section247a2 d v c → Deontic.RegulatedActOccurred247a2 d v c

axiom corr_act_c {d : Person} {rp : Elements.ReligiousProperty} {c : ComplaintText} :
    Elements.Section247c d rp c →
    Deontic.RegulatedActOccurred247c d (mapReligiousProperty rp) c




axiom corr_commerce {c : ComplaintText} :
    Elements.OffenseInOrAffectingInterstateCommerce c →
    Deontic.InterstateOrForeignCommerceCircumstance247b c




theorem s247_elements_implies_deontic_modulo_gaps
    {d v : Person} {rp : Elements.ReligiousProperty} {c : ComplaintText}
    (gap_addresseeInClass247a : Deontic.AddresseeInClass247a d c)
    (gap_addresseeInClass247c : Deontic.AddresseeInClass247c d c)
    (h : Elements.Section247Violation d v rp c) :
    Deontic.ProhibitionViolated247a d v (mapReligiousProperty rp) c ∨
      Deontic.ProhibitionViolated247c d (mapReligiousProperty rp) c :=
  match h with
  | .religiousCharacterDamage h1 =>
      Or.inl ⟨⟨gap_addresseeInClass247a, corr_commerce h1.commerceCircumstance⟩,
              .propertyDamage (corr_act_a1 h1)⟩
  | .freeExerciseObstruction h2 =>
      Or.inl ⟨⟨gap_addresseeInClass247a, corr_commerce h2.commerceCircumstance⟩,
              .freeExerciseObstruction (corr_act_a2 h2)⟩
  | .raceOrEthnicityDamage h3 =>
      Or.inr ⟨⟨gap_addresseeInClass247c⟩, corr_act_c h3⟩



axiom corr_scienter_a1_conduct {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Scienter.DemandSatisfied d .s247a1_conduct c

axiom corr_scienter_a1_motive {d : Person} {rp : Elements.ReligiousProperty}
    {c : ComplaintText} :
    Elements.BecauseOfReligiousCharacterOfProperty d rp c →
    Scienter.DemandSatisfied d .s247a1_religiousCharacterMotive c

axiom corr_scienter_a2_conduct {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Scienter.DemandSatisfied d .s247a2_conduct c

axiom corr_scienter_c_conduct {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Scienter.DemandSatisfied d .s247c_conduct c

axiom corr_scienter_c_motive {d : Person} {rp : Elements.ReligiousProperty}
    {c : ComplaintText} :
    Elements.BecauseOfRaceColorOrEthnicityOfAssociatedIndividual d rp c →
    Scienter.DemandSatisfied d .s247c_protectedClassMotive c





theorem s247_elements_implies_scienter
    {d v : Person} {rp : Elements.ReligiousProperty} {c : ComplaintText}
    (h : Elements.Section247Violation d v rp c) : Scienter.Scienter247 d c :=
  match h with
  | .religiousCharacterDamage h1 =>
      .religiousPropertyDamage
        { intentionalDamage := corr_scienter_a1_conduct h1.intentional,
          religiousCharacterMotive := corr_scienter_a1_motive h1.religiousCharacterMotive,
          commerceCircumstance := trivial }
  | .freeExerciseObstruction h2 =>
      .freeExerciseObstruction
        { intentionalObstruction := corr_scienter_a2_conduct h2.intentional,
          commerceCircumstance := trivial }
  | .raceOrEthnicityDamage h3 =>
      .raceMotivatedPropertyDamage
        { intentionalDamage := corr_scienter_c_conduct h3.intentional,
          protectedClassMotive := corr_scienter_c_motive h3.raceColorOrEthnicityMotive }



axiom corr_dact_a1_conduct {d : Person} {rp : Deontic.ReligiousProperty} {c : ComplaintText} :
    Deontic.RegulatedActOccurred247a1 d rp c →
    Scienter.DemandSatisfied d .s247a1_conduct c

axiom corr_dact_a1_motive {d : Person} {rp : Deontic.ReligiousProperty} {c : ComplaintText} :
    Deontic.RegulatedActOccurred247a1 d rp c →
    Scienter.DemandSatisfied d .s247a1_religiousCharacterMotive c

axiom corr_dact_a2_conduct {d v : Person} {c : ComplaintText} :
    Deontic.RegulatedActOccurred247a2 d v c →
    Scienter.DemandSatisfied d .s247a2_conduct c

axiom corr_dact_c_conduct {d : Person} {rp : Deontic.ReligiousProperty} {c : ComplaintText} :
    Deontic.RegulatedActOccurred247c d rp c →
    Scienter.DemandSatisfied d .s247c_conduct c

axiom corr_dact_c_motive {d : Person} {rp : Deontic.ReligiousProperty} {c : ComplaintText} :
    Deontic.RegulatedActOccurred247c d rp c →
    Scienter.DemandSatisfied d .s247c_protectedClassMotive c


theorem s247_deontic_implies_scienter
    {d v : Person} {rp : Deontic.ReligiousProperty} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated247a d v rp c ∨
         Deontic.ProhibitionViolated247c d rp c) :
    Scienter.Scienter247 d c :=
  match h with
  | .inl ha =>
      match ha.2 with
      | .propertyDamage h1 =>
          .religiousPropertyDamage
            { intentionalDamage := corr_dact_a1_conduct h1,
              religiousCharacterMotive := corr_dact_a1_motive h1,
              commerceCircumstance := trivial }
      | .freeExerciseObstruction h2 =>
          .freeExerciseObstruction
            { intentionalObstruction := corr_dact_a2_conduct h2,
              commerceCircumstance := trivial }
  | .inr hc =>
      .raceMotivatedPropertyDamage
        { intentionalDamage := corr_dact_c_conduct hc.2,
          protectedClassMotive := corr_dact_c_motive hc.2 }












axiom corr_elapsed {d : Person} {ci : Procedure.ChargingInstrument}
    {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.chargingInstrumentDay247 ci c ≤
      Procedure.offenseCommissionDay247 pr c + Elements.daysFromOffenseToCharge d c




theorem s247g_window_elements_implies_procedure
    {d : Person} {ci : Procedure.ChargingInstrument} {pr : Procedure.Prosecution}
    {c : ComplaintText} (h : Elements.WithinSevenYearLimitation247 d c) :
    Procedure.WithinSevenYearsOfOffense247 ci pr c :=
  Nat.le_trans corr_elapsed
    (Nat.add_le_add_left h (Procedure.offenseCommissionDay247 pr c))









theorem s247g_elements_implies_procedure_modulo_gaps
    {d v : Person} {rp : Elements.ReligiousProperty}
    {ci : Procedure.ChargingInstrument} {pr : Procedure.Prosecution}
    {c : ComplaintText}
    (gap_noncapitalOffense247 : Procedure.NoncapitalOffense247 pr c)
    (gap_indictmentFoundOrInformationInstituted :
      Procedure.IndictmentFoundOrInformationInstituted247 ci pr c)
    (h : Elements.TimelyNoncapitalProsecution247 d v rp c) :
    Procedure.TimelyChargingInstrument247 ci pr c :=
  { noncapital := gap_noncapitalOffense247,
    instituted := gap_indictmentFoundOrInformationInstituted,
    withinPeriod := s247g_window_elements_implies_procedure h.timely }



axiom corr_cert247 {cert : Procedure.Certification} {pr : Procedure.Prosecution}
    {o : Person} {c : ComplaintText} :
    Procedure.ValidCertification247 cert o c →
    Deontic.CertificationRequirementSatisfied247e (mapProsecution pr) c

axiom corr_timely247 {ci : Procedure.ChargingInstrument} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.WithinSevenYearsOfOffense247 ci pr c →
    Deontic.ChargedWithinSevenYears247g (mapProsecution pr) c




theorem s247_procedure_implies_no_deontic_bar
    {ci : Procedure.ChargingInstrument} {pr : Procedure.Prosecution}
    {cert : Procedure.Certification} {o : Person} {c : ComplaintText}
    (h : Procedure.ProsecutionPermitted247 ci pr cert o c) :
    ¬ Deontic.ProhibitionViolated247e (mapProsecution pr) c ∧
      ¬ Deontic.ProhibitionViolated247g (mapProsecution pr) c :=
  ⟨fun hv => hv.1.uncertified (corr_cert247 h.authorized.certification),
   fun hv => hv.1.untimely (corr_timely247 h.timely.withinPeriod)⟩





axiom corr_cert247_scienter {cert : Procedure.Certification} {o : Person}
    {c : ComplaintText} :
    Procedure.ValidCertification247 cert o c →
    Scienter.UnclassifiedDemandMet o .s247e_certification c


theorem s247e_procedure_implies_scienter_certification
    {cert : Procedure.Certification} {o : Person} {c : ComplaintText}
    (h : Procedure.ValidCertification247 cert o c) :
    Scienter.Scienter247eCertification o c :=
  { certifyingJudgment := corr_cert247_scienter h }

end S247



namespace S248



axiom corr_act_a1 {d v : Person} {c : ComplaintText} :
    Elements.Section248a1 d v c → Deontic.ReproductiveHealthServicesInterference248a1 d v c

axiom corr_act_a2 {d v : Person} {pw : Elements.PlaceOfWorship} {c : ComplaintText} :
    Elements.Section248a2 d v pw c → Deontic.ReligiousExerciseInterference248a2 d v c

axiom corr_act_a3_facility {d : Person} {f : Elements.Facility}
    {pw : Elements.PlaceOfWorship} {c : ComplaintText} :
    Elements.Section248a3 d f pw c → Deontic.ProtectedPropertyDamage248a3 d (mapFacility f) c

axiom corr_act_a3_worship {d : Person} {f : Elements.Facility}
    {pw : Elements.PlaceOfWorship} {c : ComplaintText} :
    Elements.Section248a3 d f pw c → Deontic.ProtectedPropertyDamage248a3 d (mapWorship pw) c

axiom corr_parental {d v : Person} {c : ComplaintText} :
    Deontic.ParentalGuardianExemption248a d v c →
    Elements.ParentOrGuardianActingExclusivelyTowardMinor d v c

axiom corr_firstAmendment {d : Person} {c : ComplaintText} :
    Deontic.FirstAmendmentProtectedExpressiveConduct248d1 d c →
    Elements.ProtectedFirstAmendmentExpressiveConduct d c










theorem s248a_elements_implies_deontic_modulo_gaps
    {d v : Person} {f : Elements.Facility} {pw : Elements.PlaceOfWorship}
    {c : ComplaintText}
    (gap_addresseeInClass248a : Deontic.AddresseeInClass248a d c)
    (gap_notParentalOnPropertyRoute : ¬ Deontic.ParentalGuardianExemption248a d v c)
    (h : Elements.Section248Violation d v f pw c) :
    Deontic.ProhibitionViolated248a d v (mapFacility f) c ∨
      Deontic.ProhibitionViolated248a d v (mapWorship pw) c :=
  match h with
  | .reproductiveHealthServices h1 =>
      Or.inl ⟨⟨gap_addresseeInClass248a⟩, .reproductiveHealth (corr_act_a1 h1),
              fun hx => h1.notParentalCarveOut (corr_parental hx),
              fun hx => h1.notProtectedExpression (corr_firstAmendment hx)⟩
  | .religiousFreedom h2 =>
      Or.inl ⟨⟨gap_addresseeInClass248a⟩, .religiousExercise (corr_act_a2 h2),
              fun hx => h2.notParentalCarveOut (corr_parental hx),
              fun hx => h2.notProtectedExpression (corr_firstAmendment hx)⟩
  | .propertyDamage h3 =>
      match h3.target with
      | .reproductiveHealthFacility _ _ =>
          Or.inl ⟨⟨gap_addresseeInClass248a⟩, .propertyDamage (corr_act_a3_facility h3),
                  gap_notParentalOnPropertyRoute,
                  fun hx => h3.notProtectedExpression (corr_firstAmendment hx)⟩
      | .placeOfWorship _ _ =>
          Or.inr ⟨⟨gap_addresseeInClass248a⟩, .propertyDamage (corr_act_a3_worship h3),
                  gap_notParentalOnPropertyRoute,
                  fun hx => h3.notProtectedExpression (corr_firstAmendment hx)⟩



axiom corr_sc_a1_conduct {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Scienter.DemandSatisfied d .s248a1_conduct c

axiom corr_sc_a1_motive {d v : Person} {c : ComplaintText} :
    Elements.ReproductiveServicesNexus248 d v c →
    Scienter.DemandSatisfied d .s248a1_reproductiveServicesMotive c

axiom corr_sc_a2_conduct {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Scienter.DemandSatisfied d .s248a2_conduct c

axiom corr_sc_a3_conduct {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Scienter.DemandSatisfied d .s248a3_conduct c

axiom corr_sc_parental {d v : Person} {c : ComplaintText} :
    Scienter.ParentalGuardianExclusion d c →
    Elements.ParentOrGuardianActingExclusivelyTowardMinor d v c










theorem s248a_elements_implies_scienter_modulo_gaps
    {d v : Person} {f : Elements.Facility} {pw : Elements.PlaceOfWorship}
    {c : ComplaintText}
    (gap_facilityMotive248a3 : Scienter.DemandSatisfied d .s248a3_facilityMotive c)
    (gap_notParentalOnPropertyRoute : ¬ Scienter.ParentalGuardianExclusion d c)
    (h : Elements.Section248Violation d v f pw c) : Scienter.Scienter248 d c :=
  match h with
  | .reproductiveHealthServices h1 =>
      .reproductiveServicesInterference
        { intentionalInterference := corr_sc_a1_conduct h1.intentional,
          servicesMotive := corr_sc_a1_motive h1.nexus,
          notParentalGuardian := fun hx => h1.notParentalCarveOut (corr_sc_parental hx) }
  | .religiousFreedom h2 =>
      .worshipInterference
        { intentionalInterference := corr_sc_a2_conduct h2.intentional,
          notParentalGuardian := fun hx => h2.notParentalCarveOut (corr_sc_parental hx) }
  | .propertyDamage h3 =>
      match h3.target with
      | .reproductiveHealthFacility _ _ =>
          .facilityPropertyDamage
            { intentionalDamage := corr_sc_a3_conduct h3.intentional,
              facilityMotive := gap_facilityMotive248a3,
              notParentalGuardian := gap_notParentalOnPropertyRoute }
      | .placeOfWorship _ _ =>
          .worshipPropertyDamage
            { intentionalDamage := corr_sc_a3_conduct h3.intentional,
              notParentalGuardian := gap_notParentalOnPropertyRoute }



axiom corr_dsc_a1_conduct {d v : Person} {c : ComplaintText} :
    Deontic.ReproductiveHealthServicesInterference248a1 d v c →
    Scienter.DemandSatisfied d .s248a1_conduct c

axiom corr_dsc_a1_motive {d v : Person} {c : ComplaintText} :
    Deontic.ReproductiveHealthServicesInterference248a1 d v c →
    Scienter.DemandSatisfied d .s248a1_reproductiveServicesMotive c

axiom corr_dsc_a2_conduct {d v : Person} {c : ComplaintText} :
    Deontic.ReligiousExerciseInterference248a2 d v c →
    Scienter.DemandSatisfied d .s248a2_conduct c

axiom corr_dsc_a3_conduct {d : Person} {f : Deontic.Facility} {c : ComplaintText} :
    Deontic.ProtectedPropertyDamage248a3 d f c →
    Scienter.DemandSatisfied d .s248a3_conduct c

axiom corr_dsc_parental {d v : Person} {c : ComplaintText} :
    Scienter.ParentalGuardianExclusion d c →
    Deontic.ParentalGuardianExemption248a d v c







theorem s248a_deontic_implies_scienter_modulo_gaps
    {d v : Person} {f : Deontic.Facility} {c : ComplaintText}
    (gap_facilityMotive248a3 : Scienter.DemandSatisfied d .s248a3_facilityMotive c)
    (h : Deontic.ProhibitionViolated248a d v f c) : Scienter.Scienter248 d c :=
  match h.2.1 with
  | .reproductiveHealth h1 =>
      .reproductiveServicesInterference
        { intentionalInterference := corr_dsc_a1_conduct h1,
          servicesMotive := corr_dsc_a1_motive h1,
          notParentalGuardian := fun hx => h.2.2.1 (corr_dsc_parental hx) }
  | .religiousExercise h2 =>
      .worshipInterference
        { intentionalInterference := corr_dsc_a2_conduct h2,
          notParentalGuardian := fun hx => h.2.2.1 (corr_dsc_parental hx) }
  | .propertyDamage h3 =>
      .facilityPropertyDamage
        { intentionalDamage := corr_dsc_a3_conduct h3,
          facilityMotive := gap_facilityMotive248a3,
          notParentalGuardian := fun hx => h.2.2.1 (corr_dsc_parental hx) }



axiom corr_violation {d v : Person} {f : Elements.Facility}
    {pw : Elements.PlaceOfWorship} {c : ComplaintText} :
    Elements.Section248Violation d v f pw c →
    Procedure.ConductProhibitedBySubsectionA248 d c

axiom corr_aggrieved {pl : Person} {c : ComplaintText} :
    Elements.IsPersonAggrieved pl c → Procedure.PersonAggrievedByProhibitedConduct248 pl c

axiom corr_standing_services {pl : Person} {f : Elements.Facility} {c : ComplaintText} :
    Elements.InvolvedInProvidingOrObtainingServices pl f c →
    Procedure.PlaintiffProvidesOrObtainsReproductiveHealthServices248 pl c

axiom corr_standing_worship {pl : Person} {pw : Elements.PlaceOfWorship}
    {c : ComplaintText} :
    Elements.WorshipperOrOwnerOfPlaceOfWorship pl pw c →
    Procedure.PlaintiffExercisingReligiousFreedomAtPlaceOfWorship248 pl c











theorem s248c_elements_implies_procedure_modulo_gaps
    {pl d v : Person} {f : Elements.Facility} {pw : Elements.PlaceOfWorship}
    {act : Procedure.CivilAction} {c : ComplaintText}
    (gap_civilActionCommenced : Procedure.CivilActionCommenced248 act pl c)
    (gap_noParentalExemption :
      ¬ Procedure.ParentOrGuardianActivityDirectedExclusivelyAtMinor248 d c)
    (h : Elements.ValidSection248CivilClaim pl d v f pw c) :
    Procedure.PrivateCivilAction248 act pl d c :=
  { prohibitedConduct := corr_violation h.violation,
    aggrieved := corr_aggrieved h.aggrieved,
    standing :=
      match h.standing with
      | .servicesParticipant hs => .reproductiveServices (corr_standing_services hs)
      | .worshipperOrOwner hw => .religiousExercise (corr_standing_worship hw),
    commenced := gap_civilActionCommenced,
    noParentalExemption := gap_noParentalExemption }



axiom corr_p_aggrieved {pl : Person} {c : ComplaintText} :
    Procedure.PersonAggrievedByProhibitedConduct248 pl c →
    Deontic.AggrievedByProhibitedConduct248c1 pl c

axiom corr_p_standing {pl : Person} {c : ComplaintText} :
    Procedure.PrivateStanding248 pl c → Deontic.StandingLimitationSatisfied248c1 pl c

axiom corr_p_commenced {act : Procedure.CivilAction} {pl : Person} {c : ComplaintText} :
    Procedure.CivilActionCommenced248 act pl c →
    Deontic.CivilActionCommenced248c1 pl (mapCivilAction act) c



theorem s248c1_procedure_implies_deontic
    {act : Procedure.CivilAction} {pl d : Person} {c : ComplaintText}
    (h : Procedure.PrivateCivilAction248 act pl d c) :
    Deontic.PermissionExercised248c1 pl (mapCivilAction act) c :=
  ⟨⟨corr_p_aggrieved h.aggrieved, corr_p_standing h.standing⟩,
   corr_p_commenced h.commenced⟩



axiom corr_reasonableCause {p : Person} {c : ComplaintText} :
    Procedure.AttorneyGeneralHasReasonableCause248 c →
    Scienter.MentalStateProvenAt p .s248c2_attorneyGeneralBelief .Negligence c




theorem s248c2_procedure_implies_scienter
    {p : Person} {c : ComplaintText}
    (h : Procedure.AttorneyGeneralHasReasonableCause248 c) :
    Scienter.ScienterEnforcementAuthorization p c :=
  .federal ⟨MentalState.Negligence, MentalState.atLeast_refl _, corr_reasonableCause h⟩

end S248

end Proving.USC.T18.Ch13.Reearn.Bridge
