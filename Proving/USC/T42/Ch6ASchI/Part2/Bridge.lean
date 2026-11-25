













































import Proving.USC.T42.Ch6ASchI.Part2.Elements.Statute
import Proving.USC.T42.Ch6ASchI.Part2.Deontic.Statute
import Proving.USC.T42.Ch6ASchI.Part2.Ontology.Statute
import Proving.USC.T42.Ch6ASchI.Part2.Procedure.Statute
import Proving.USC.T42.Ch6ASchI.Part2.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Part2.Bridge

open Proving.USC.Common









axiom e2dOfficer211 : Elements.Officer → Deontic.Officer
axiom e2pPerson211 : Elements.Officer → Person
axiom d2pPerson211 : Deontic.Officer → Person

axiom thr211E : Elements.Officer → ComplaintText → Nat
axiom thr211D : Deontic.Officer → ComplaintText → Nat

axiom corr211_ed_addressee {o : Elements.Officer} {c : ComplaintText} :
    Elements.FoundQualifiedForPromotion o c → Deontic.AddresseeQualifiedOfficer211 (e2dOfficer211 o) c
axiom corr211_ed_condition {o : Elements.Officer} {c : ComplaintText} :
    Elements.MeetsLengthOfServiceRequirement o c → Deontic.CompletedRequiredServiceYears211 (e2dOfficer211 o) c
axiom corr211_ep_qualified {o : Elements.Officer} {c : ComplaintText} :
    Elements.FoundQualifiedForPromotion o c → Procedure.FoundQualified (e2pPerson211 o) c
axiom corr211_ep_threshold {o : Elements.Officer} {c : ComplaintText} :
    Elements.MeetsLengthOfServiceRequirement o c →
      Procedure.MeetsPromotionServiceThreshold (e2pPerson211 o) c (thr211E o c)
axiom corr211_dp_qualified {o : Deontic.Officer} {c : ComplaintText} :
    Deontic.AddresseeQualifiedOfficer211 o c → Procedure.FoundQualified (d2pPerson211 o) c
axiom corr211_dp_threshold {o : Deontic.Officer} {c : ComplaintText} :
    Deontic.CompletedRequiredServiceYears211 o c →
      Procedure.MeetsPromotionServiceThreshold (d2pPerson211 o) c (thr211D o c)


theorem s211_elements_implies_deontic {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.Section211d2Promotion o c) :
    Deontic.Obligation211 (e2dOfficer211 o) c :=
  ⟨corr211_ed_addressee h.qualified, corr211_ed_condition h.meetsService⟩


theorem s211_elements_implies_procedure {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.Section211d2Promotion o c) :
    Procedure.TimelyPermanentPromotion (e2pPerson211 o) c (thr211E o c) :=
  ⟨corr211_ep_qualified h.qualified, corr211_ep_threshold h.meetsService⟩


theorem s211_deontic_implies_procedure {o : Deontic.Officer} {c : ComplaintText}
    (h : Deontic.Obligation211 o c) :
    Procedure.TimelyPermanentPromotion (d2pPerson211 o) c (thr211D o c) :=
  ⟨corr211_dp_qualified h.addressee, corr211_dp_threshold h.condition⟩








axiom e2dOfficer211c : Elements.Officer → Deontic.Officer
axiom corr211c_ed_addressee {o : Elements.Officer} {c : ComplaintText} :
    Elements.IsMedicalOfficerRegularCorps o c → Deontic.AddresseeQualifyingMedicalOfficer211c (e2dOfficer211c o) c
axiom corr211c_ed_nocredit {o : Elements.Officer} {c : ComplaintText} :
    (¬ Elements.ReceivedSimilarInternshipCreditUnderOtherLaw o c) →
      Deontic.NoSimilarCreditReceived211c (e2dOfficer211c o) c



theorem s211c_elements_implies_deontic {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.Section211cInternshipCredit o c) :
    Deontic.Obligation211c (e2dOfficer211c o) c :=
  ⟨corr211c_ed_addressee h.medicalOfficer, corr211c_ed_nocredit h.noOtherCredit⟩










axiom e2dOfficer212 : Elements.Officer → Deontic.Officer
axiom e2pPerson212 : Elements.Officer → Person
axiom d2pPerson212 : Deontic.Officer → Person

axiom corr212_ed_addressee {o : Elements.Officer} {c : ComplaintText} :
    Elements.IsRegularCorpsCommissionedOfficer o c → Deontic.AddresseeOfficerRegularCorps212 (e2dOfficer212 o) c
axiom corr212_ed_applied {o : Elements.Officer} {c : ComplaintText} :
    Elements.AppliedForRetirement o c → Deontic.AppliedForRetirement212 (e2dOfficer212 o) c
axiom corr212_ed_age {o : Elements.Officer} {c : ComplaintText} :
    Elements.AttainedRetirementAge o c → Deontic.AttainedRetirementAge212 (e2dOfficer212 o) c
axiom corr212_ed_service {o : Elements.Officer} {c : ComplaintText} :
    Elements.CompletedThirtyYearsActiveService o c → Deontic.CompletedThirtyYearsService212 (e2dOfficer212 o) c

axiom corr212_ep_applied {o : Elements.Officer} {c : ComplaintText} :
    Elements.AppliedForRetirement o c → Procedure.AppliedForRetirement (e2pPerson212 o) c
axiom corr212_ep_age {o : Elements.Officer} {c : ComplaintText} :
    Elements.AttainedRetirementAge o c → Procedure.AgeInYears (e2pPerson212 o) c ≥ 64
axiom corr212_ep_service {o : Elements.Officer} {c : ComplaintText} :
    Elements.CompletedThirtyYearsActiveService o c → Procedure.YearsOfActiveService (e2pPerson212 o) c ≥ 30

axiom corr212_dp_applied {o : Deontic.Officer} {c : ComplaintText} :
    Deontic.AppliedForRetirement212 o c → Procedure.AppliedForRetirement (d2pPerson212 o) c
axiom corr212_dp_age {o : Deontic.Officer} {c : ComplaintText} :
    Deontic.AttainedRetirementAge212 o c → Procedure.AgeInYears (d2pPerson212 o) c ≥ 64



theorem s212_elements_implies_procedure {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.RetirementOnApplication o c) :
    Procedure.RetirementEligible (e2pPerson212 o) c :=
  match h with
  | .byAge applied _ age => .byAge ⟨corr212_ep_applied applied, corr212_ep_age age⟩
  | .byService applied _ service => .byFullService ⟨corr212_ep_applied applied, corr212_ep_service service⟩




theorem s212_elements_implies_deontic {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.RetirementOnApplication o c) :
    Deontic.Obligation212 (e2dOfficer212 o) c ∨ Deontic.Power212 (e2dOfficer212 o) c :=
  match h with
  | .byAge applied officer age =>
      Or.inl ⟨corr212_ed_addressee officer, corr212_ed_age age, corr212_ed_applied applied⟩
  | .byService _ officer service =>
      Or.inr ⟨corr212_ed_addressee officer, corr212_ed_service service⟩



theorem s212_deontic_implies_procedure {o : Deontic.Officer} {c : ComplaintText}
    (h : Deontic.Obligation212 o c) :
    Procedure.RetirementEligible (d2pPerson212 o) c :=
  .byAge ⟨corr212_dp_applied h.application, corr212_dp_age h.age⟩













axiom e2dOfficer213 : Elements.Officer → Deontic.Officer
axiom e2pPerson213 : Elements.Officer → Person

axiom corr213_ed_addressee {o : Elements.Officer} {c : ComplaintText} :
    Elements.IsCommissionedOfficerOrSurvivingBeneficiary o c → Deontic.AddresseeCommissionedOfficer213 (e2dOfficer213 o) c
axiom corr213_ed_war {o : Elements.Officer} {c : ComplaintText} :
    Elements.ServicePerformedInTimeOfWar o c → Deontic.ServedInTimeOfWar213 (e2dOfficer213 o) c
axiom corr213_ed_detail {o : Elements.Officer} {c : ComplaintText} :
    Elements.ServicePerformedOnMilitaryDetail o c → Deontic.ServedOnDetailWithArmedForces213 (e2dOfficer213 o) c
axiom corr213_ed_mil {o : Elements.Officer} {c : ComplaintText} :
    Elements.ServicePerformedWhilePartOfMilitaryForces o c → Deontic.ServedWhileServiceInMilitaryForces213 (e2dOfficer213 o) c

axiom corr213_ep_war {o : Elements.Officer} {c : ComplaintText} :
    Elements.ServicePerformedInTimeOfWar o c → Procedure.ServiceInWartimeOrOnMilitaryDetail (e2pPerson213 o) c
axiom corr213_ep_detail {o : Elements.Officer} {c : ComplaintText} :
    Elements.ServicePerformedOnMilitaryDetail o c → Procedure.ServiceInWartimeOrOnMilitaryDetail (e2pPerson213 o) c
axiom corr213_ep_mil {o : Elements.Officer} {c : ComplaintText} :
    Elements.ServicePerformedWhilePartOfMilitaryForces o c → Procedure.ServiceInWartimeOrOnMilitaryDetail (e2pPerson213 o) c



theorem s213_elements_implies_deontic {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.Section213MilitaryBenefit o c) :
    Deontic.Obligation213 (e2dOfficer213 o) c :=
  ⟨corr213_ed_addressee h.officerOrBeneficiary,
   match h.circumstance with
   | .war hw => Or.inl (corr213_ed_war hw)
   | .detail hd => Or.inr (Or.inl (corr213_ed_detail hd))
   | .militaryForces hm => Or.inr (Or.inr (corr213_ed_mil hm))⟩


theorem s213_elements_implies_procedure {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.Section213MilitaryBenefit o c) :
    Procedure.MilitaryBenefitEntitlement (e2pPerson213 o) c :=
  ⟨match h.circumstance with
   | .war hw => corr213_ep_war hw
   | .detail hd => corr213_ep_detail hd
   | .militaryForces hm => corr213_ep_mil hm⟩







theorem s213_coverage_implies_benefit_modulo_gaps {o : Elements.Officer} {c : ComplaintText}
    (gap_s213_benefit_apodosis :
      Elements.Section213MilitaryBenefit o c → Deontic.MilitaryBenefitsAccorded213 (e2dOfficer213 o) c)
    (h : Elements.Section213MilitaryBenefit o c) :
    Deontic.MilitaryBenefitsAccorded213 (e2dOfficer213 o) c :=
  gap_s213_benefit_apodosis h








axiom e2dOfficer213a : Elements.Officer → Deontic.Officer
axiom corr213a_ed_beneficiary {o : Elements.Officer} {c : ComplaintText} :
    Elements.IsCommissionedOfficerOrSurvivingBeneficiary o c → Deontic.AddresseeCommissionedOfficer213a (e2dOfficer213a o) c


theorem s213a_elements_implies_deontic {o : Elements.Officer} {b : Elements.Benefit} {c : ComplaintText}
    (h : Elements.Section213aRightsEntitlement o b c) :
    Deontic.Obligation213a (e2dOfficer213a o) c :=
  ⟨corr213a_ed_beneficiary h.officerOrBeneficiary⟩







axiom e2dOfficer214 : Elements.Officer → Deontic.Officer
axiom e2pPerson214 : Elements.Officer → Person
axiom d2pPerson214 : Deontic.Officer → Person

axiom corr214_ed_released {o : Elements.Officer} {c : ComplaintText} :
    Elements.ReleasedFromActiveServiceForRetirement o c → Deontic.AddresseeReleasedForRetirement214 (e2dOfficer214 o) c
axiom corr214_ed_noprior {o : Elements.Officer} {c : ComplaintText} :
    (¬ Elements.PreviouslyPresentedUnitedStatesFlag o c) → ¬ Deontic.PreviouslyPresentedFlag214 (e2dOfficer214 o) c
axiom corr214_ep_released {o : Elements.Officer} {c : ComplaintText} :
    Elements.ReleasedFromActiveServiceForRetirement o c → Procedure.ReleasedForRetirement (e2pPerson214 o) c
axiom corr214_ep_noprior {o : Elements.Officer} {c : ComplaintText} :
    (¬ Elements.PreviouslyPresentedUnitedStatesFlag o c) → ¬ Procedure.PreviouslyPresentedFlag (e2pPerson214 o) c
axiom corr214_dp_released {o : Deontic.Officer} {c : ComplaintText} :
    Deontic.AddresseeReleasedForRetirement214 o c → Procedure.ReleasedForRetirement (d2pPerson214 o) c
axiom corr214_dp_noprior {o : Deontic.Officer} {c : ComplaintText} :
    (¬ Deontic.PreviouslyPresentedFlag214 o c) → ¬ Procedure.PreviouslyPresentedFlag (d2pPerson214 o) c


theorem s214_elements_implies_deontic {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.Section214FlagPresentation o c) :
    Deontic.Obligation214 (e2dOfficer214 o) c :=
  ⟨corr214_ed_released h.released, corr214_ed_noprior h.notPreviouslyPresented⟩


theorem s214_elements_implies_procedure {o : Elements.Officer} {c : ComplaintText}
    (h : Elements.Section214FlagPresentation o c) :
    Procedure.FlagPresentationRequired (e2pPerson214 o) c :=
  ⟨corr214_ep_released h.released, corr214_ep_noprior h.notPreviouslyPresented⟩


theorem s214_deontic_implies_procedure {o : Deontic.Officer} {c : ComplaintText}
    (h : Deontic.Obligation214 o c) :
    Procedure.FlagPresentationRequired (d2pPerson214 o) c :=
  ⟨corr214_dp_released h.released, corr214_dp_noprior h.notPrevious⟩









axiom e2pPerson215 : Elements.Detail → Person
axiom cToPerson215 : ComplaintText → Person

axiom corr215_ed_request {d : Elements.Detail} {c : ComplaintText} :
    Elements.RequestByExecutiveDepartmentHead d c → Deontic.RequestByExecutiveDepartmentHead215 c
axiom corr215_ep_request {d : Elements.Detail} {c : ComplaintText} :
    Elements.RequestByExecutiveDepartmentHead d c → Procedure.DetailRequestMade (e2pPerson215 d) c
axiom corr215_dp_request {c : ComplaintText} :
    Deontic.RequestByExecutiveDepartmentHead215 c → Procedure.DetailRequestMade (cToPerson215 c) c



theorem s215_elements_implies_deontic {d : Elements.Detail} {c : ComplaintText}
    (h : Elements.Section215aDetailAuthority d c) :
    Deontic.Power215 c :=
  ⟨corr215_ed_request h.request⟩


theorem s215_elements_implies_procedure {d : Elements.Detail} {c : ComplaintText}
    (h : Elements.Section215aDetailAuthority d c) :
    Procedure.ValidDetail (e2pPerson215 d) c :=
  ⟨corr215_ep_request h.request⟩


theorem s215_deontic_implies_procedure {c : ComplaintText}
    (h : Deontic.Power215 c) :
    Procedure.ValidDetail (cToPerson215 c) c :=
  ⟨corr215_dp_request h.request⟩









axiom e2dReg216 : Elements.Regulation → Deontic.Regulation
axiom corr216c_de_preference {r : Elements.Regulation} {c : ComplaintText} :
    Deontic.GivesPreferenceToSchoolOfMedicine216 (e2dReg216 r) c → Elements.RegulationGivesPreferenceToSchoolOfMedicine r c
axiom corr216a_pd_prescribed {p : Person} {c : ComplaintText} :
    Procedure.RegulationsPrescribed p c → Deontic.PresidentPrescribedRegulations216 c



theorem s216c_elements_negates_deontic_violation {r : Elements.Regulation} {c : ComplaintText}
    (h : Elements.Section216cCompliantRegulation r c) :
    ¬ Deontic.Prohibition216Violated (e2dReg216 r) c :=
  fun hV => h.noPreference (corr216c_de_preference hV.2)



theorem s216a_procedure_negates_deontic_breach {p : Person} {c : ComplaintText}
    (h : Procedure.RegulationsPrescribed p c) :
    ¬ Deontic.Obligation216Breached c :=
  fun hB => hB.2 (corr216a_pd_prescribed h)








axiom cToPerson217 : ComplaintText → Person
axiom dToPerson217 : ComplaintText → Person

axiom corr217_ed_war {c : ComplaintText} :
    Elements.TimeOfWar c → Deontic.InTimeOfWarOrEmergencyProclaimed217 c
axiom corr217_ed_emergency {c : ComplaintText} :
    Elements.EmergencyInvolvingNationalDefenseProclaimed c → Deontic.InTimeOfWarOrEmergencyProclaimed217 c
axiom corr217_ed_eo {c : ComplaintText} :
    Elements.ExecutiveOrderDeclaringCorpsMilitaryService c → Deontic.PresidentDeclaredCorpsMilitaryService217 c
axiom corr217_ep_war {c : ComplaintText} :
    Elements.TimeOfWar c → Procedure.WarOrEmergencyProclaimed (cToPerson217 c) c
axiom corr217_ep_emergency {c : ComplaintText} :
    Elements.EmergencyInvolvingNationalDefenseProclaimed c → Procedure.WarOrEmergencyProclaimed (cToPerson217 c) c
axiom corr217_ep_eo {c : ComplaintText} :
    Elements.ExecutiveOrderDeclaringCorpsMilitaryService c → Procedure.ExecutiveOrderMilitarizingCorps (cToPerson217 c) c
axiom corr217_dp_proclaimed {c : ComplaintText} :
    Deontic.InTimeOfWarOrEmergencyProclaimed217 c → Procedure.WarOrEmergencyProclaimed (dToPerson217 c) c
axiom corr217_dp_eo {c : ComplaintText} :
    Deontic.PresidentDeclaredCorpsMilitaryService217 c → Procedure.ExecutiveOrderMilitarizingCorps (dToPerson217 c) c


theorem s217_elements_implies_deontic {c : ComplaintText}
    (h : Elements.Section217MilitaryServiceDeclaration c) :
    Deontic.Power217Exercised c :=
  ⟨⟨match h.trigger with
    | .war hw => corr217_ed_war hw
    | .emergency he => corr217_ed_emergency he⟩,
   corr217_ed_eo h.executiveOrder⟩


theorem s217_elements_implies_procedure {c : ComplaintText}
    (h : Elements.Section217MilitaryServiceDeclaration c) :
    Procedure.CorpsMilitarization (cToPerson217 c) c :=
  ⟨match h.trigger with
   | .war hw => corr217_ep_war hw
   | .emergency he => corr217_ep_emergency he,
   corr217_ep_eo h.executiveOrder⟩


theorem s217_deontic_implies_procedure {c : ComplaintText}
    (h : Deontic.Power217Exercised c) :
    Procedure.CorpsMilitarization (dToPerson217 c) c :=
  ⟨corr217_dp_proclaimed h.1.trigger, corr217_dp_eo h.2⟩








axiom d2pPerson217a : Deontic.AdvisoryCommittee → Person
axiom corr217a_dp_appointed {a : Deontic.AdvisoryCommittee} {c : ComplaintText} :
    Deontic.SecretaryAppointedAdvisoryCouncil217a a c → Procedure.AdvisoryCommitteeAppointed (d2pPerson217a a) c



theorem s217a_deontic_implies_procedure {a : Deontic.AdvisoryCommittee} {c : ComplaintText}
    (h : Deontic.Power217aExercised a c) :
    Procedure.AdvisoryCommitteeAppointed (d2pPerson217a a) c :=
  corr217a_dp_appointed h.2









axiom e2dCommittee217a1 : Elements.Appointment → Deontic.AdvisoryCommittee
axiom p2dCommittee217a1 : Person → Deontic.AdvisoryCommittee
axiom corr217a1_de_considered {a : Elements.Appointment} {c : ComplaintText} :
    Deontic.ConsideredPoliticalAffiliation217a1 (e2dCommittee217a1 a) c → Elements.ConsideredPoliticalAffiliationInAppointment a c
axiom corr217a1_pd_considered {p : Person} {c : ComplaintText} :
    Deontic.ConsideredPoliticalAffiliation217a1 (p2dCommittee217a1 p) c → ¬ Procedure.AppointmentWithoutPoliticalAffiliation p c



theorem s217a1_elements_negates_deontic_violation {a : Elements.Appointment} {c : ComplaintText}
    (h : Elements.Section217a1CompliantAppointment a c) :
    ¬ Deontic.Prohibition217a1Violated (e2dCommittee217a1 a) c :=
  fun hV => h.apolitical (corr217a1_de_considered hV.2)



theorem s217a1_procedure_negates_deontic_violation {p : Person} {c : ComplaintText}
    (h : Procedure.ValidAdvisoryAppointment p c) :
    ¬ Deontic.Prohibition217a1Violated (p2dCommittee217a1 p) c :=
  fun hV => (corr217a1_pd_considered hV.2) h.apolitical







def s211_tierA : Prop :=
  (∀ {o c}, Elements.Section211d2Promotion o c → Deontic.Obligation211 (e2dOfficer211 o) c)
  ∧ (∀ {o c}, Elements.Section211d2Promotion o c → Procedure.TimelyPermanentPromotion (e2pPerson211 o) c (thr211E o c))
  ∧ (∀ {o c}, Deontic.Obligation211 o c → Procedure.TimelyPermanentPromotion (d2pPerson211 o) c (thr211D o c))
theorem s211_tierA_discharge : s211_tierA :=
  ⟨fun h => s211_elements_implies_deontic h,
   fun h => s211_elements_implies_procedure h,
   fun h => s211_deontic_implies_procedure h⟩

def s212_tierA : Prop :=
  (∀ {o c}, Elements.RetirementOnApplication o c → Procedure.RetirementEligible (e2pPerson212 o) c)
  ∧ (∀ {o c}, Elements.RetirementOnApplication o c →
        Deontic.Obligation212 (e2dOfficer212 o) c ∨ Deontic.Power212 (e2dOfficer212 o) c)
  ∧ (∀ {o c}, Deontic.Obligation212 o c → Procedure.RetirementEligible (d2pPerson212 o) c)
theorem s212_tierA_discharge : s212_tierA :=
  ⟨fun h => s212_elements_implies_procedure h,
   fun h => s212_elements_implies_deontic h,
   fun h => s212_deontic_implies_procedure h⟩

def s214_tierA : Prop :=
  (∀ {o c}, Elements.Section214FlagPresentation o c → Deontic.Obligation214 (e2dOfficer214 o) c)
  ∧ (∀ {o c}, Elements.Section214FlagPresentation o c → Procedure.FlagPresentationRequired (e2pPerson214 o) c)
  ∧ (∀ {o c}, Deontic.Obligation214 o c → Procedure.FlagPresentationRequired (d2pPerson214 o) c)
theorem s214_tierA_discharge : s214_tierA :=
  ⟨fun h => s214_elements_implies_deontic h,
   fun h => s214_elements_implies_procedure h,
   fun h => s214_deontic_implies_procedure h⟩

def s215_tierA : Prop :=
  (∀ {d c}, Elements.Section215aDetailAuthority d c → Deontic.Power215 c)
  ∧ (∀ {d c}, Elements.Section215aDetailAuthority d c → Procedure.ValidDetail (e2pPerson215 d) c)
  ∧ (∀ {c}, Deontic.Power215 c → Procedure.ValidDetail (cToPerson215 c) c)
theorem s215_tierA_discharge : s215_tierA :=
  ⟨fun h => s215_elements_implies_deontic h,
   fun h => s215_elements_implies_procedure h,
   fun h => s215_deontic_implies_procedure h⟩

def s217_tierA : Prop :=
  (∀ {c}, Elements.Section217MilitaryServiceDeclaration c → Deontic.Power217Exercised c)
  ∧ (∀ {c}, Elements.Section217MilitaryServiceDeclaration c → Procedure.CorpsMilitarization (cToPerson217 c) c)
  ∧ (∀ {c}, Deontic.Power217Exercised c → Procedure.CorpsMilitarization (dToPerson217 c) c)
theorem s217_tierA_discharge : s217_tierA :=
  ⟨fun h => s217_elements_implies_deontic h,
   fun h => s217_elements_implies_procedure h,
   fun h => s217_deontic_implies_procedure h⟩

end Proving.USC.T42.Ch6ASchI.Part2.Bridge
