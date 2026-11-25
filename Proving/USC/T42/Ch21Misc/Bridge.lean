









































import Proving.USC.T42.Ch21Misc.Elements.Theorems
import Proving.USC.T42.Ch21Misc.Deontic.Theorems
import Proving.USC.T42.Ch21Misc.Ontology.Theorems
import Proving.USC.T42.Ch21Misc.Procedure.Theorems
import Proving.USC.T42.Ch21Misc.Structure.Theorems
import Proving.TitleVI.Statute

namespace Proving.USC.T42.Ch21Misc.Bridge
open Proving.USC.Common
open Proving.USC.T42.Ch21Misc








axiom mapEntD      : Entity → Deontic.Entity
axiom mapEmployerO : Entity → Ontology.Employer
axiom mapCorpO     : Entity → Ontology.Corporation
axiom mapLawED     : Elements.Law → Deontic.Law
axiom mapLawEO     : Elements.Law → Ontology.Law
axiom mapContractED : Elements.GovContract → Deontic.GovContract
axiom mapPlanPO    : Procedure.AffirmativeActionPlan → Ontology.AffirmativeActionPlan



axiom agencyD      : Elements.GovContract → Deontic.Entity


axiom mapEmpOE  : Ontology.Employer → Entity
axiom mapCorpOE : Ontology.Corporation → Entity













axiom corr_d4a_stateLocal {e : Entity} {c : ComplaintText} :
    Elements.IsStateOrLocalInstrumentality e c → Ontology.IsGovernmentalOperation e c
axiom corr_d4a_education {e : Entity} {c : ComplaintText} :
    Elements.IsEducationalEntity e c → Ontology.IsEducationalOperation e c
axiom corr_d4a_privateOrg {e : Entity} {c : ComplaintText} :
    Elements.IsCoveredPrivateOrganization e c → Ontology.IsPrivateOrganizationOperation e c


axiom corr_d4a_facility {e : Entity} {c : ComplaintText} :
    Elements.IsPlantOrSeparateFacility e c → Ontology.IsPrivateOrganizationOperation e c
axiom corr_d4a_joint {e : Entity} {c : ComplaintText} :
    Elements.IsJointlyEstablishedEntity e c → Ontology.IsJointlyEstablishedEntity e c
axiom corr_d4a_ffa {e : Entity} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance e c → Ontology.ReceivesFederalFinancialAssistance e c



theorem s2000d4a_elements_implies_ontology {e : Entity} {c : ComplaintText}
    (h : Elements.ProgramOrActivity e c) : Ontology.ProgramOrActivityMembership e c := by
  cases h with
  | stateLocal hi ha => exact .govt (corr_d4a_stateLocal hi) (corr_d4a_ffa ha)
  | education hi ha => exact .education (corr_d4a_education hi) (corr_d4a_ffa ha)
  | privateOrganization hi ha => exact .privateOrg (corr_d4a_privateOrg hi) (corr_d4a_ffa ha)
  | separateFacility hi ha => exact .privateOrg (corr_d4a_facility hi) (corr_d4a_ffa ha)
  | jointEntity hi ha => exact .joint (corr_d4a_joint hi) (corr_d4a_ffa ha)




axiom mapEnt : Procedure.CoveredEntity → Entity






axiom corr_d4a_funded {e : Procedure.CoveredEntity} {c : ComplaintText} :
    Procedure.FundingExtendedToPart e c → Elements.ReceivesFederalFinancialAssistance (mapEnt e) c








axiom corr_d4a_category {e : Procedure.CoveredEntity} {c : ComplaintText} :
    Procedure.OperativeCategoryMatched e c → Elements.IsStateOrLocalInstrumentality (mapEnt e) c
















theorem s2000d4a_procedure_implies_elements {e : Procedure.CoveredEntity} {c : ComplaintText}
    (h : Procedure.WithinCoverage e c) : Elements.ProgramOrActivity (mapEnt e) c :=
  .stateLocal (corr_d4a_category h.category) (corr_d4a_funded h.funded)



axiom corr_d4a_classifier {e : Entity} {c : ComplaintText} :
    Ontology.ProgramOrActivityMembership e c → Deontic.IsProgramOrActivity (mapEntD e) c


theorem s2000d4a_ontology_implies_deontic {e : Entity} {c : ComplaintText}
    (h : Ontology.ProgramOrActivityMembership e c) : Deontic.IsProgramOrActivity (mapEntD e) c :=
  corr_d4a_classifier h



theorem s2000d4a_elements_implies_deontic {e : Entity} {c : ComplaintText}
    (h : Elements.ProgramOrActivity e c) : Deontic.IsProgramOrActivity (mapEntD e) c :=
  corr_d4a_classifier (s2000d4a_elements_implies_ontology h)









axiom mapEntDC : Deontic.Entity → Entity




axiom corr_e1a_gate {e : Deontic.Entity} {p : Person} {c : ComplaintText} :
    Deontic.IsExemptEmploymentEntity2000e1a e c → Deontic.ExemptionConditionMet2000e1a e p c →
    Procedure.EmploysAliensOutsideAnyState (mapEntDC e) c ∨
      Procedure.IsReligiousEntityEmployingCoreligionists (mapEntDC e) c



theorem s2000e1a_deontic_implies_procedure {e : Deontic.Entity} {p : Person} {c : ComplaintText}
    (h : Deontic.Permission2000e1a e p c) :
    Procedure.Section2000e1ExemptionGate (mapEntDC e) c := by
  cases corr_e1a_gate h.addressee h.condition with
  | inl ha => exact .aliensAbroad ha
  | inr hr => exact .religiousEntity hr

axiom corr_e1b_gate {e : Deontic.Entity} {p : Person} {c : ComplaintText} :
    Deontic.ComplianceWouldViolateForeignLaw2000e1b e p c →
    Procedure.ForeignLawComplianceConflict (mapEntDC e) c


theorem s2000e1b_deontic_implies_procedure {e : Deontic.Entity} {p : Person} {c : ComplaintText}
    (h : Deontic.Permission2000e1b e p c) :
    Procedure.Section2000e1ExemptionGate (mapEntDC e) c :=
  .foreignLawDefense (corr_e1b_gate h.condition)

axiom mapEntDO : Deontic.Entity → Ontology.Employer
axiom corr_e1c2_carveout {e : Deontic.Entity} {c : ComplaintText} :
    Deontic.IsForeignPersonEmployer2000e1c2 e c → Deontic.NotControlledByAmericanEmployer2000e1c2 e c →
    Ontology.IsForeignPersonNotAmericanControlled (mapEntDO e) c


theorem s2000e1c2_deontic_implies_ontology {e : Deontic.Entity} {c : ComplaintText}
    (h : Deontic.Permission2000e1c2 e c) :
    Ontology.ForeignEmployerCarveOut (mapEntDO e) c :=
  ⟨corr_e1c2_carveout h.addressee h.condition⟩




axiom corr_e1_alien_pe {e : Entity} {p : Person} {c : ComplaintText} :
    Procedure.EmploysAliensOutsideAnyState e c → Elements.EmploysAliensOutsideUS e p c
axiom corr_e1_relig_pe {e : Entity} {p : Person} {c : ComplaintText} :
    Procedure.IsReligiousEntityEmployingCoreligionists e c →
    Elements.ReligiousEntityReligionBasedEmployment e p c
axiom corr_e1_foreignlaw_pe {e : Entity} {p : Person} {c : ComplaintText} :
    Procedure.ForeignLawComplianceConflict e c → Elements.ForeignWorkplaceLawConflict e p c
axiom corr_e1_foreignperson_pe {e : Entity} {c : ComplaintText} :
    Procedure.IsForeignPersonNotControlledByAmericanEmployer e c →
    Elements.ForeignPersonNotAmericanControlled e c





theorem s2000e1_elements_overcome_excludes_procedure_gate {e : Entity} {p : Person}
    {c : ComplaintText} (h : Elements.Section2000e1Overcome e p c) :
    ¬ Procedure.Section2000e1ExemptionGate e c := by
  intro hg
  cases hg with
  | aliensAbroad ha => exact h.notAlienAbroad (corr_e1_alien_pe ha)
  | religiousEntity hr => exact h.notReligiousEmployment (corr_e1_relig_pe hr)
  | foreignLawDefense hf => exact h.notForeignLawConflict (corr_e1_foreignlaw_pe hf)
  | foreignEmployer hp => exact h.notForeignPersonOps (corr_e1_foreignperson_pe hp)

axiom corr_e1c1_controls_ep {e corp : Entity} {c : ComplaintText} :
    Elements.ControlsForeignCorporation e corp c → Procedure.EmployerControlsForeignCorporation e corp c
axiom corr_e1c1_practice_ep {corp : Entity} {pr : Elements.EmploymentPractice} {c : ComplaintText} :
    Elements.EngagedInProhibitedPractice corp pr c → Procedure.PracticeEngagedInByForeignCorporation corp c


theorem s2000e1c1_elements_implies_procedure {e corp : Entity} {pr : Elements.EmploymentPractice}
    {c : ComplaintText} (h : Elements.Section2000e1c1Attribution e corp pr c) :
    Procedure.Section2000e1Attribution e corp c :=
  ⟨corr_e1c1_controls_ep h.controls, corr_e1c1_practice_ep h.prohibitedPractice⟩



axiom corr_e1c3_control {er : Ontology.Employer} {corp : Ontology.Corporation} {c : ComplaintText} :
    Ontology.EmployerControlsCorporation er corp c →
    Elements.ControlsForeignCorporation (mapEmpOE er) (mapCorpOE corp) c





theorem s2000e1c1_ontology_implies_elements_modulo_gaps {er : Ontology.Employer}
    {corp : Ontology.Corporation} {pr : Elements.EmploymentPractice} {c : ComplaintText}
    (h : Ontology.ForeignPracticeAttribution er corp c)
    (gap_practice : Elements.EngagedInProhibitedPractice (mapCorpOE corp) pr c) :
    Elements.Section2000e1c1Attribution (mapEmpOE er) (mapCorpOE corp) pr c :=
  ⟨corr_e1c3_control h.control, gap_practice⟩







axiom corr_e7_imposes {l : Elements.Law} {c : ComplaintText} :
    Elements.StateLawImposesLiability l c → Procedure.StateLawImposesLiabilityOrPenalty c
axiom corr_e7_noulp {l : Elements.Law} {c : ComplaintText} :
    ¬ Elements.StateLawRequiresOrPermitsUnlawfulPractice l c →
    Procedure.StateLawDoesNotRequireUnlawfulPractice c




theorem s2000e7_elements_implies_procedure {l : Elements.Law} {c : ComplaintText}
    (h : Elements.Section2000e7Preserved l c) : Procedure.Section2000e7StateLawPreserved c :=
  ⟨corr_e7_imposes h.imposesLiability, corr_e7_noulp h.notUnlawfulMandate⟩

axiom corr_e7_purports {l : Elements.Law} {c : ComplaintText} :
    Ontology.PurportsToRequireUnlawfulEmploymentPractice (mapLawEO l) c →
    Elements.StateLawRequiresOrPermitsUnlawfulPractice l c




theorem s2000e7_elements_excludes_ontology_preempted {l : Elements.Law} {c : ComplaintText}
    (h : Elements.Section2000e7Preserved l c) : ¬ Ontology.PreemptedStateLaw (mapLawEO l) c :=
  fun hp => h.notUnlawfulMandate (corr_e7_purports hp.purports)

axiom corr_e7_notreq {l : Elements.Law} {c : ComplaintText} :
    ¬ Elements.StateLawRequiresOrPermitsUnlawfulPractice l c →
    Deontic.StateLawNotRequiringUnlawfulPractice2000e7 (mapLawED l) c





theorem s2000e7_elements_implies_deontic_modulo_gaps {l : Elements.Law} {p : Person}
    {c : ComplaintText} (h : Elements.Section2000e7Preserved l c)
    (gap_subject : Deontic.SubjectToStateLawDuty2000e7 p (mapLawED l) c) :
    Deontic.Prohibition2000e7 p (mapLawED l) c :=
  ⟨gap_subject, corr_e7_notreq h.notUnlawfulMandate⟩





axiom corr_e10_covered {e : Entity} {c : ComplaintText} :
    Elements.IsCoveredPostingEntity e c → Deontic.IsCoveredPostingEntity2000e10 (mapEntD e) c
axiom corr_e10_failed {e : Entity} {c : ComplaintText} :
    Elements.FailedToPostRequiredNotice e c → ¬ Deontic.PostedAndKeptPostedNotice2000e10 (mapEntD e) c
axiom corr_e10_willful {e : Entity} {c : ComplaintText} :
    Elements.ActedWithScienter e c → Deontic.ViolationWasWillful2000e10b (mapEntD e) c


theorem s2000e10a_elements_implies_deontic {e : Entity} {c : ComplaintText}
    (h : Elements.Section2000e10a e c) : Deontic.ObligationBreached2000e10a (mapEntD e) c :=
  ⟨⟨corr_e10_covered h.coveredEntity⟩, corr_e10_failed h.failedToPost⟩


theorem s2000e10b_elements_implies_deontic {e : Entity} {c : ComplaintText}
    (h : Elements.Section2000e10b e c) : Deontic.WillfulOffense2000e10b (mapEntD e) c :=
  ⟨s2000e10a_elements_implies_deontic h.violation, corr_e10_willful h.willful⟩

axiom corr_e10_duty {e : Entity} {c : ComplaintText} :
    Procedure.NoticePostingDutyApplies e c → Deontic.IsCoveredPostingEntity2000e10 (mapEntD e) c
axiom corr_e10_wf_notposted {e : Entity} {c : ComplaintText} :
    Procedure.WillfulFailureToPost e c → ¬ Deontic.PostedAndKeptPostedNotice2000e10 (mapEntD e) c
axiom corr_e10_wf_willful {e : Entity} {c : ComplaintText} :
    Procedure.WillfulFailureToPost e c → Deontic.ViolationWasWillful2000e10b (mapEntD e) c




theorem s2000e10b_procedure_implies_deontic {e : Entity} {c : ComplaintText}
    (h : Procedure.Section2000e10PenaltyTrigger e c) : Deontic.WillfulOffense2000e10b (mapEntD e) c :=
  ⟨⟨⟨corr_e10_duty h.duty⟩, corr_e10_wf_notposted h.willful⟩, corr_e10_wf_willful h.willful⟩

axiom corr_e10_willfulviol {e : Entity} {c : ComplaintText} :
    Elements.FailedToPostRequiredNotice e c → Elements.ActedWithScienter e c →
    Ontology.WillfulPostingViolation e c


theorem s2000e10b_elements_implies_ontology {e : Entity} {c : ComplaintText}
    (h : Elements.Section2000e10b e c) : Ontology.PostingViolation e c :=
  ⟨corr_e10_willfulviol h.violation.failedToPost h.willful⟩





axiom corr_e11_vetlaw_o {l : Elements.Law} {c : ComplaintText} :
    Elements.CreatesVeteransPreference l c → Ontology.IsVeteransPreferenceLaw (mapLawEO l) c
axiom corr_e11_vetlaw_p {l : Elements.Law} {c : ComplaintText} :
    Elements.CreatesVeteransPreference l c → Procedure.LawCreatesVeteransPreference c
axiom corr_e11_vetlaw_d {l : Elements.Law} {c : ComplaintText} :
    Elements.CreatesVeteransPreference l c → Deontic.LawCreatesVeteransPreference2000e11 (mapLawED l) c


theorem s2000e11_elements_implies_ontology {l : Elements.Law} {c : ComplaintText}
    (h : Elements.Section2000e11Preserved l c) : Ontology.VeteransPreferenceSaving (mapLawEO l) c :=
  ⟨corr_e11_vetlaw_o h.veteransPreference⟩


theorem s2000e11_elements_implies_procedure {l : Elements.Law} {c : ComplaintText}
    (h : Elements.Section2000e11Preserved l c) : Procedure.Section2000e11VeteransPreferenceSaved c :=
  ⟨corr_e11_vetlaw_p h.veteransPreference⟩


theorem s2000e11_elements_implies_deontic {l : Elements.Law} {c : ComplaintText}
    (h : Elements.Section2000e11Preserved l c) : Deontic.Prohibition2000e11 (mapLawED l) c :=
  ⟨corr_e11_vetlaw_d h.veteransPreference⟩





axiom corr_e13_victim_d {v : Person} {c : ComplaintText} :
    Elements.IsCommissionPersonnel v c → Elements.EngagedInOrOnAccountOfOfficialDuties v c →
    Deontic.VictimEngagedInOfficialFunctions2000e13 v c
axiom corr_e13_killed_d {d v : Person} {c : ComplaintText} :
    Elements.KillsInViolationOf1114 d v c → Elements.EngagedInOrOnAccountOfOfficialDuties v c →
    Deontic.KilledPersonPerformingOfficialFunctions2000e13 d v c



theorem s2000e13_elements_implies_deontic {d v : Person} {c : ComplaintText}
    (h : Elements.Section2000e13Offense d v c) : Deontic.ProhibitionViolated2000e13 d v c :=
  ⟨⟨corr_e13_victim_d h.commissionPersonnel h.officialFunctionNexus⟩,
   corr_e13_killed_d h.killing h.officialFunctionNexus⟩

axiom corr_e13_victim_p {v : Person} {c : ComplaintText} :
    Elements.IsCommissionPersonnel v c → Elements.EngagedInOrOnAccountOfOfficialDuties v c →
    Procedure.VictimWasCommissionPersonnelOnOfficialDuty v c
axiom corr_e13_killing_p {d v : Person} {c : ComplaintText} :
    Elements.KillsInViolationOf1114 d v c → Procedure.KillingInViolationOfSection1114 d v c


theorem s2000e13_elements_implies_procedure {d v : Person} {c : ComplaintText}
    (h : Elements.Section2000e13Offense d v c) : Procedure.Section2000e13PenaltyTrigger d v c :=
  ⟨corr_e13_victim_p h.commissionPersonnel h.officialFunctionNexus, corr_e13_killing_p h.killing⟩

axiom corr_e13_personnel_o {v : Person} {c : ComplaintText} :
    Elements.IsCommissionPersonnel v c → Ontology.IsCommissionPersonnel v c


theorem s2000e13_elements_implies_ontology {d v : Person} {c : ComplaintText}
    (h : Elements.Section2000e13Offense d v c) : Ontology.CommissionPersonnelProtection v c :=
  ⟨corr_e13_personnel_o h.commissionPersonnel⟩







axiom corr_e14_transmit {e : Entity} {c : ComplaintText} :
    Elements.TransmitsAnnualReport e c → Procedure.AnnualReportTransmitted c
axiom corr_e14_deadline {e : Entity} {c : ComplaintText} :
    Elements.TransmitsAnnualReport e c → Procedure.TransmittedOnOrBeforeOctoberFirst c


theorem s2000e14_elements_implies_procedure {e : Entity} {c : ComplaintText}
    (h : Elements.Section2000e14Compliance e c) : Procedure.Section2000e14TimelyAnnualReport c :=
  ⟨corr_e14_transmit h.annualReport, corr_e14_deadline h.annualReport⟩

axiom corr_e14_coord {e : Entity} {c : ComplaintText} :
    Elements.DevelopsCoordinationPolicies e c → Deontic.DevelopedCoordinationAgreements2000e14 (mapEntD e) c
axiom corr_e14_report {e : Entity} {c : ComplaintText} :
    Elements.TransmitsAnnualReport e c → Deontic.TransmittedAnnualReportByOctober1_2000e14 (mapEntD e) c




theorem s2000e14_elements_excludes_deontic_breach {e : Entity} {c : ComplaintText}
    (h : Elements.Section2000e14Compliance e c) :
    ¬ Deontic.ObligationBreached2000e14Coord (mapEntD e) c ∧
      ¬ Deontic.ObligationBreached2000e14Report (mapEntD e) c :=
  ⟨fun ⟨_, hno⟩ => hno (corr_e14_coord h.coordination),
   fun ⟨_, hno⟩ => hno (corr_e14_report h.annualReport)⟩





axiom corr_e15_convene {p : Person} {c : ComplaintText} :
    Elements.ConvenesLeadershipConferences p c → Procedure.ConferenceConvened c
axiom corr_e15_invite_p {p : Person} {c : ComplaintText} :
    Elements.InvitesEnumeratedParticipants p c → Procedure.RequiredParticipantsInvited c





theorem s2000e15_elements_implies_procedure_modulo_gaps {p : Person} {c : ComplaintText}
    (h : Elements.Section2000e15Compliance p c)
    (gap_timely : Procedure.ConvenedAsSoonAsFeasibleAfterEnactment c) :
    Procedure.Section2000e15TimelyConference c :=
  ⟨corr_e15_convene h.convenes, gap_timely, corr_e15_invite_p h.invites⟩

axiom corr_e15_invite_d {p : Person} {c : ComplaintText} :
    Elements.InvitesEnumeratedParticipants p c → Deontic.InvitedRequiredParticipants2000e15 p c






theorem s2000e15_elements_excludes_deontic_invite_breach {p : Person} {c : ComplaintText}
    (h : Elements.Section2000e15Compliance p c) :
    ¬ Deontic.ObligationBreached2000e15Invite p c :=
  fun ⟨_, hno⟩ => hno (corr_e15_invite_d h.invites)





axiom corr_e17_agency {e : Entity} {k : Elements.GovContract} {c : ComplaintText} :
    Elements.ContractActionTaken k e c → Deontic.IsFederalContractingAgency2000e17 (agencyD k) c
axiom corr_e17_plan {e : Entity} {k : Elements.GovContract} {pl : Elements.AffirmativeActionPlan}
    {c : ComplaintText} :
    Elements.HasAcceptedAffirmativeActionPlan e pl c → Elements.PlanForSameFacility pl c →
    Elements.AcceptedWithinTwelveMonths pl c → Elements.PlanDeemedAccepted pl c →
    Deontic.HasAcceptedAAPlanWithin12Months2000e17 (mapContractED k) c
axiom corr_e17_nodev {e : Entity} {k : Elements.GovContract} {pl : Elements.AffirmativeActionPlan}
    {c : ComplaintText} :
    ¬ Elements.SubstantialDeviationFromPlan e pl c →
    Deontic.EmployerNotSubstantiallyDeviated2000e17 (mapContractED k) c
axiom corr_e17_denied {e : Entity} {k : Elements.GovContract} {c : ComplaintText} :
    Elements.ContractActionTaken k e c → ¬ Elements.AccordedFullHearing e k c →
    Deontic.DeniedContractWithoutHearing2000e17 (agencyD k) (mapContractED k) c




theorem s2000e17_elements_implies_deontic {e : Entity} {k : Elements.GovContract}
    {pl : Elements.AffirmativeActionPlan} {c : ComplaintText}
    (h : Elements.Section2000e17Violation e k pl c) :
    Deontic.ProhibitionViolated2000e17 (agencyD k) (mapContractED k) c :=
  ⟨⟨corr_e17_agency h.actionTaken,
    corr_e17_plan h.planAccepted h.sameFacility h.withinTwelveMonths h.deemedAccepted,
    corr_e17_nodev (e := e) (k := k) h.noSubstantialDeviation⟩,
   corr_e17_denied h.actionTaken h.noFullHearing⟩

axiom corr_e17_hearing_pe {e : Entity} {k : Elements.GovContract} {c : ComplaintText} :
    Procedure.FullHearingAndAdjudicationAccorded e c → Elements.AccordedFullHearing e k c





theorem s2000e17_elements_excludes_procedure_lawful {e : Entity} {k : Elements.GovContract}
    {pl : Elements.AffirmativeActionPlan} {c : ComplaintText}
    (h : Elements.Section2000e17Violation e k pl c)
    (k' : Procedure.GovernmentContract) (pl' : Procedure.AffirmativeActionPlan) :
    ¬ Procedure.Section2000e17LawfulContractAction k' pl' e c :=
  fun hl => h.noFullHearing (corr_e17_hearing_pe (k := k) hl.hearing)

axiom corr_e17_accepted_po {pl : Procedure.AffirmativeActionPlan} {e : Entity} {c : ComplaintText} :
    Procedure.Section2000e17PlanDeemedAccepted pl e c →
    Procedure.AcceptanceWithinPastTwelveMonths pl e c →
    Ontology.IsAcceptedAffirmativeActionPlan (mapPlanPO pl) c
axiom corr_e17_nodev_po {pl : Procedure.AffirmativeActionPlan} {e : Entity} {c : ComplaintText} :
    Procedure.NoSubstantialDeviationFromPlan pl e c →
    ¬ Ontology.HasSubstantiallyDeviatedFromPlan (mapEmployerO e) (mapPlanPO pl) c



theorem s2000e17_procedure_implies_ontology {pl : Procedure.AffirmativeActionPlan} {e : Entity}
    {c : ComplaintText} (h : Procedure.Section2000e17HearingProtection pl e c) :
    Ontology.AcceptedPlanContractorProtection (mapEmployerO e) (mapPlanPO pl) c :=
  ⟨corr_e17_accepted_po h.deemedAccepted h.recent, corr_e17_nodev_po h.noDeviation⟩













namespace GoldenD4a

axiom gmapRecipient : Entity → Proving.TitleVI.Recipient
axiom gmapProgram   : Entity → Proving.TitleVI.Program
axiom gmapComplaint : ComplaintText → Proving.TitleVI.ComplaintText



axiom gcorr_recipient {e : Entity} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance e c →
    Proving.TitleVI.IsRecipient (gmapRecipient e) (gmapComplaint c)
axiom gcorr_ffa {e : Entity} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance e c →
    Proving.TitleVI.ReceivesFederalFinancialAssistance (gmapRecipient e) (gmapComplaint c)
axiom gcorr_program_stateLocal {e : Entity} {c : ComplaintText} :
    Elements.IsStateOrLocalInstrumentality e c →
    Proving.TitleVI.IsProgramOfRecipient (gmapProgram e) (gmapRecipient e) (gmapComplaint c)
axiom gcorr_program_education {e : Entity} {c : ComplaintText} :
    Elements.IsEducationalEntity e c →
    Proving.TitleVI.IsProgramOfRecipient (gmapProgram e) (gmapRecipient e) (gmapComplaint c)
axiom gcorr_program_privateOrg {e : Entity} {c : ComplaintText} :
    Elements.IsCoveredPrivateOrganization e c →
    Proving.TitleVI.IsProgramOfRecipient (gmapProgram e) (gmapRecipient e) (gmapComplaint c)
axiom gcorr_program_facility {e : Entity} {c : ComplaintText} :
    Elements.IsPlantOrSeparateFacility e c →
    Proving.TitleVI.IsProgramOfRecipient (gmapProgram e) (gmapRecipient e) (gmapComplaint c)
axiom gcorr_program_joint {e : Entity} {c : ComplaintText} :
    Elements.IsJointlyEstablishedEntity e c →
    Proving.TitleVI.IsProgramOfRecipient (gmapProgram e) (gmapRecipient e) (gmapComplaint c)





theorem s2000d4a_elements_implies_golden_fragment {e : Entity} {c : ComplaintText}
    (h : Elements.ProgramOrActivity e c) :
    Proving.TitleVI.IsRecipient (gmapRecipient e) (gmapComplaint c) ∧
    Proving.TitleVI.ReceivesFederalFinancialAssistance (gmapRecipient e) (gmapComplaint c) ∧
    Proving.TitleVI.IsProgramOfRecipient (gmapProgram e) (gmapRecipient e) (gmapComplaint c) := by
  cases h with
  | stateLocal hi ha =>
      exact ⟨gcorr_recipient ha, gcorr_ffa ha, gcorr_program_stateLocal hi⟩
  | education hi ha =>
      exact ⟨gcorr_recipient ha, gcorr_ffa ha, gcorr_program_education hi⟩
  | privateOrganization hi ha =>
      exact ⟨gcorr_recipient ha, gcorr_ffa ha, gcorr_program_privateOrg hi⟩
  | separateFacility hi ha =>
      exact ⟨gcorr_recipient ha, gcorr_ffa ha, gcorr_program_facility hi⟩
  | jointEntity hi ha =>
      exact ⟨gcorr_recipient ha, gcorr_ffa ha, gcorr_program_joint hi⟩







theorem s2000d4a_elements_implies_golden_coverage_modulo_gaps {e : Entity} {c : ComplaintText}
    (h : Elements.ProgramOrActivity e c)
    (plaintiff : Proving.TitleVI.Person) (a : Proving.TitleVI.Action)
    (gap_personInUS : Proving.TitleVI.IsPersonInUS plaintiff (gmapComplaint c))
    (gap_notInstrumentality : Proving.TitleVI.NotAStateInstrumentality plaintiff (gmapComplaint c))
    (gap_underProgram : Proving.TitleVI.OccursUnderProgram a (gmapProgram e) (gmapComplaint c)) :
    Proving.TitleVI.TitleVICoverage plaintiff (gmapRecipient e) (gmapProgram e) a (gmapComplaint c) :=
  have frag := s2000d4a_elements_implies_golden_fragment h
  ⟨gap_personInUS, gap_notInstrumentality, frag.1, frag.2.1, frag.2.2, gap_underProgram⟩

end GoldenD4a

end Proving.USC.T42.Ch21Misc.Bridge
