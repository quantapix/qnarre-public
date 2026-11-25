












































import Proving.USC.T09.Ch1.Elements.Statute
import Proving.USC.T09.Ch1.Deontic.Statute
import Proving.USC.T09.Ch1.Ontology.Statute
import Proving.USC.T09.Ch1.Procedure.Statute
import Proving.USC.T09.Ch1.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T09.Ch1
namespace Bridge

open Proving.USC.Common










axiom epAg : Elements.ArbitrationAgreement → Procedure.ArbitrationAgreement

axiom epAward : Elements.Award → Procedure.Award

axiom epOrder : Elements.CourtOrder → Procedure.CourtOrder


axiom epParty : Elements.CourtApplication → Person


axiom edContract : Elements.ArbitrationAgreement → Deontic.Contract

axiom edAg : Elements.ArbitrationAgreement → Deontic.ArbitrationAgreement

axiom edAward : Elements.Award → Deontic.Award

axiom edProceeding : Elements.Suit → Deontic.Proceeding

axiom edOrder : Elements.CourtOrder → Deontic.Order


axiom eoAg : Elements.ArbitrationAgreement → Ontology.ArbitrationAgreement

axiom eoContract : Elements.ArbitrationAgreement → Ontology.Contract


axiom eoEmp : Elements.ArbitrationAgreement → Ontology.EmploymentContract

axiom eoTx : Elements.Transaction → Ontology.Transaction

axiom eoOrder : Elements.CourtOrder → Ontology.CourtOrder

axiom eoProcOfOrder : Elements.CourtOrder → Ontology.Proceeding


axiom eoReliefAg : Elements.ReliefRequest → Ontology.ArbitrationAgreement


axiom eoReliefAward : Elements.ReliefRequest → Ontology.Award


axiom eoReliefJudgment : Elements.ReliefRequest → Ontology.Judgment


axiom pdContract : Procedure.ArbitrationAgreement → Deontic.Contract

axiom pdAg : Procedure.ArbitrationAgreement → Deontic.ArbitrationAgreement

axiom pdAward : Procedure.Award → Deontic.Award

axiom pdOrder : Procedure.CourtOrder → Deontic.Order


axiom pdProceeding : Person → Deontic.Proceeding


axiom doAg : Deontic.ArbitrationAgreement → Ontology.ArbitrationAgreement

axiom doContract : Deontic.Contract → Ontology.Contract

axiom doTx : Deontic.Contract → Ontology.Transaction

axiom doControversy : Deontic.Contract → Ontology.Controversy

axiom doCourt : Deontic.Court → Ontology.Court

axiom doProceeding : Deontic.Proceeding → Ontology.Proceeding

axiom doIssue : Deontic.Proceeding → Ontology.Issue

axiom doApplication : Deontic.Proceeding → Ontology.Application

axiom doAward : Deontic.Award → Ontology.Award

axiom doOrder : Deontic.Order → Ontology.CourtOrder

axiom doProcOfOrder : Deontic.Order → Ontology.Proceeding


axiom dpAg : Deontic.ArbitrationAgreement → Procedure.ArbitrationAgreement

axiom dpAward : Deontic.Award → Procedure.Award

axiom dpOrder : Deontic.Order → Procedure.CourtOrder


axiom poAg : Procedure.ArbitrationAgreement → Ontology.ArbitrationAgreement

axiom poAward : Procedure.Award → Ontology.Award

axiom poOrder : Procedure.CourtOrder → Ontology.CourtOrder


axiom odEmpContract : Ontology.EmploymentContract → Deontic.Contract

axiom opEmpAg : Ontology.EmploymentContract → Procedure.ArbitrationAgreement

axiom odOrder : Ontology.CourtOrder → Deontic.Order

axiom opOrder : Ontology.CourtOrder → Procedure.CourtOrder

axiom opContract : Ontology.Contract → Procedure.ArbitrationAgreement

axiom oeContract : Ontology.Contract → Elements.ArbitrationAgreement















axiom corr_eo_exempt_umbrella {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.IsContractOfEmploymentOrWork ag c →
    Elements.WorkerClassEngagedInInterstateTransportation ag c →
    Ontology.IsExemptEmploymentContract (eoEmp ag) c


axiom corr_eo_exempt_kind {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.WorkerClassEngagedInInterstateTransportation ag c →
    Ontology.IsOtherClassOfWorkersEngagedInForeignOrInterstateCommerce (eoEmp ag) c




theorem s1_elements_implies_ontology {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} (h : Elements.ExcludedWorkerContract ag c) :
    Ontology.Section1ExcludedEmploymentContract (eoEmp ag) c :=
  ⟨corr_eo_exempt_umbrella h.employmentOrWork h.transportationClass,
   .otherEngagedWorkers (corr_eo_exempt_kind h.transportationClass)⟩


axiom corr_ed_exempt {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.IsContractOfEmploymentOrWork ag c →
    Elements.WorkerClassEngagedInInterstateTransportation ag c →
    Deontic.IsExemptWorkerEmploymentContract (edContract ag) c




theorem s1_elements_implies_deontic {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} (h : Elements.ExcludedWorkerContract ag c) :
    ¬ Deontic.ChapterOneApplies (edContract ag) c :=
  fun hApp => hApp.notExemptWorkerContract
    (corr_ed_exempt h.employmentOrWork h.transportationClass)


axiom corr_ep_exempt {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.IsContractOfEmploymentOrWork ag c →
    Elements.WorkerClassEngagedInInterstateTransportation ag c →
    Procedure.IsExemptTransportationWorkerContract (epAg ag) c



theorem s1_elements_implies_procedure {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} (h : Elements.ExcludedWorkerContract ag c) :
    ¬ Procedure.EnforceableArbitrationAgreement (epAg ag) c :=
  fun hEnf => hEnf.notExemptWorker
    (corr_ep_exempt h.employmentOrWork h.transportationClass)



axiom corr_od_exempt {k : Ontology.EmploymentContract} {c : ComplaintText} :
    Ontology.IsExemptEmploymentContract k c →
    Ontology.ExemptEmploymentContractKind k c →
    Deontic.IsExemptWorkerEmploymentContract (odEmpContract k) c


theorem s1_ontology_implies_deontic {k : Ontology.EmploymentContract}
    {c : ComplaintText} (h : Ontology.Section1ExcludedEmploymentContract k c) :
    ¬ Deontic.ChapterOneApplies (odEmpContract k) c :=
  fun hApp => hApp.notExemptWorkerContract (corr_od_exempt h.umbrella h.kind)



axiom corr_op_exempt {k : Ontology.EmploymentContract} {c : ComplaintText} :
    Ontology.IsExemptEmploymentContract k c →
    Ontology.ExemptEmploymentContractKind k c →
    Procedure.IsExemptTransportationWorkerContract (opEmpAg k) c


theorem s1_ontology_implies_procedure {k : Ontology.EmploymentContract}
    {c : ComplaintText} (h : Ontology.Section1ExcludedEmploymentContract k c) :
    ¬ Procedure.EnforceableArbitrationAgreement (opEmpAg k) c :=
  fun hEnf => hEnf.notExemptWorker (corr_op_exempt h.umbrella h.kind)








axiom corr_ep_maritime {ag : Elements.ArbitrationAgreement}
    {tx : Elements.Transaction} {c : ComplaintText} :
    Elements.IsMaritimeTransaction tx c →
    Elements.ProvisionContainedInTransaction ag tx c →
    Procedure.IsMaritimeTransaction (epAg ag) c



axiom corr_ep_commerce {ag : Elements.ArbitrationAgreement}
    {tx : Elements.Transaction} {c : ComplaintText} :
    Elements.TransactionEngagedInInterstateCommerce tx c →
    Elements.ContractEvidencesTransaction ag tx c →
    Procedure.InvolvesCommerce (epAg ag) c



axiom corr_ep_written_provision {ag : Elements.ArbitrationAgreement}
    {d : Elements.Controversy} {c : ComplaintText} :
    Elements.IsWrittenArbitrationProvision ag c →
    Elements.ControversyArisingAfterAgreement d ag c →
    Procedure.WrittenArbitrationProvisionInContract (epAg ag) c



axiom corr_ep_written_submission {ag : Elements.ArbitrationAgreement}
    {d : Elements.Controversy} {c : ComplaintText} :
    Elements.IsWrittenArbitrationProvision ag c →
    Elements.ExistingControversySubmittedInWriting d ag c →
    Procedure.AgreementToSubmitExistingControversy (epAg ag) c



axiom corr_pe_exempt_back {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.IsExemptTransportationWorkerContract (epAg ag) c →
    Elements.ExcludedWorkerContract ag c



axiom corr_pe_revocation_back {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.GroundsForRevocationExist (epAg ag) c →
    Elements.GroundsForRevocationOfAnyContract ag c


axiom corr_pe_ch4_back {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.Chapter4RendersAgreementUnenforceable (epAg ag) c →
    Elements.ChapterFourInvalidationElected ag c




axiom corr_ep_year_eq {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.yearOfContractFormation ag c = Procedure.yearContractMade (epAg ag) c





theorem s2_elements_implies_procedure {ag : Elements.ArbitrationAgreement}
    {tx : Elements.Transaction} {d : Elements.Controversy} {c : ComplaintText}
    (h : Elements.Section2 ag tx d c)
    (aux_s14 : Elements.Section14TitleApplies ag c) :
    Procedure.EnforceableArbitrationAgreement (epAg ag) c where
  covered :=
    match h.covered with
    | .maritime hTx hIn => .maritime (corr_ep_maritime hTx hIn)
    | .commerce hTx hEv => .commerce (corr_ep_commerce hTx hEv)
  inWriting :=
    match h.arbitrable with
    | .thereafter hTime _ => .provision (corr_ep_written_provision h.written hTime)
    | .existing hSubmit _ => .submission (corr_ep_written_submission h.written hSubmit)
  notExemptWorker := fun hx => h.notExcludedWorker (corr_pe_exempt_back hx)
  noRevocationGrounds := fun hx => h.noRevocationGrounds (corr_pe_revocation_back hx)
  notBarredByChapter4 := fun hx => h.noChapterFourInvalidation (corr_pe_ch4_back hx)
  temporalScope := by
    show 1926 ≤ Procedure.yearContractMade (epAg ag) c
    have hy : Elements.yearOfContractFormation ag c
        = Procedure.yearContractMade (epAg ag) c := corr_ep_year_eq
    have h14 : 1926 ≤ Elements.yearOfContractFormation ag c := aux_s14
    omega


axiom corr_pd_maritime {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.IsMaritimeTransaction ag c → Deontic.IsMaritimeTransaction (pdContract ag) c

axiom corr_pd_commerce {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.InvolvesCommerce ag c → Deontic.InvolvesCommerce (pdContract ag) c

axiom corr_dp_exempt_back {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.IsExemptWorkerEmploymentContract (pdContract ag) c →
    Procedure.IsExemptTransportationWorkerContract ag c



axiom corr_dp_pre1926_year {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.ContractMadeBeforeJanuary1926 (pdContract ag) c →
    Procedure.yearContractMade ag c < 1926

axiom corr_pd_written {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.WrittenArbitrationUndertaking ag c →
    Deontic.WrittenArbitrationProvisionExists (pdContract ag) (pdAg ag) c

axiom corr_dp_revocation_back {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.RevocationGroundExists (pdAg ag) c → Procedure.GroundsForRevocationExist ag c

axiom corr_dp_ch4_back {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.Chapter4RendersUnenforceable (pdAg ag) c →
    Procedure.Chapter4RendersAgreementUnenforceable ag c


theorem s2_procedure_implies_deontic_reach {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} (h : Procedure.EnforceableArbitrationAgreement ag c) :
    Deontic.CoveredContract (pdContract ag) c where
  reach :=
    match h.covered with
    | .maritime hm => Or.inl (corr_pd_maritime hm)
    | .commerce hc => Or.inr (corr_pd_commerce hc)
  applies :=
    { notExemptWorkerContract := fun hx => h.notExemptWorker (corr_dp_exempt_back hx)
      notPreEnactmentContract := by
        intro hpre
        have hlt : Procedure.yearContractMade ag c < 1926 := corr_dp_pre1926_year hpre
        have hge : 1926 ≤ Procedure.yearContractMade ag c := h.temporalScope
        omega }




theorem s2_procedure_implies_deontic {ct : Deontic.Court}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.EnforceableArbitrationAgreement ag c) :
    Deontic.Obligation2Enforce ct (pdAg ag) (pdContract ag) c where
  addressee := pre_forum
  covered := s2_procedure_implies_deontic_reach h
  writtenProvision := corr_pd_written h.inWriting
  noRevocationGround := fun hx => h.noRevocationGrounds (corr_dp_revocation_back hx)
  noChapterFourException := fun hx => h.notBarredByChapter4 (corr_dp_ch4_back hx)



axiom corr_do_written {agD : Deontic.ArbitrationAgreement} {k : Deontic.Contract}
    {c : ComplaintText} :
    Deontic.WrittenArbitrationProvisionExists k agD c →
    Ontology.IsAgreementInWritingToSubmitExistingControversy (doAg agD) c

axiom corr_do_maritime {k : Deontic.Contract} {c : ComplaintText} :
    Deontic.IsMaritimeTransaction k c → Ontology.IsMaritimeTransaction (doTx k) c

axiom corr_do_commerce {k : Deontic.Contract} {c : ComplaintText} :
    Deontic.InvolvesCommerce k c →
    Ontology.IsContractEvidencingTransactionInvolvingCommerce (doContract k) c



theorem s2_deontic_implies_ontology {ct : Deontic.Court}
    {agD : Deontic.ArbitrationAgreement} {k : Deontic.Contract} {c : ComplaintText}
    (h : Deontic.Obligation2Enforce ct agD k c) :
    Ontology.Section2CoveredAgreement (doAg agD) (doContract k) (doTx k)
      (doControversy k) c :=
  .existingDispute
    { written := corr_do_written h.writtenProvision
      nexus :=
        match h.covered.reach with
        | Or.inl hm => Or.inl (corr_do_maritime hm)
        | Or.inr hc => Or.inr (corr_do_commerce hc) }


theorem s2_elements_implies_deontic {ct : Deontic.Court}
    {ag : Elements.ArbitrationAgreement} {tx : Elements.Transaction}
    {d : Elements.Controversy} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section2 ag tx d c)
    (aux_s14 : Elements.Section14TitleApplies ag c) :
    Deontic.Obligation2Enforce ct (pdAg (epAg ag)) (pdContract (epAg ag)) c :=
  s2_procedure_implies_deontic pre_forum (s2_elements_implies_procedure h aux_s14)


theorem s2_procedure_implies_ontology {ct : Deontic.Court}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.EnforceableArbitrationAgreement ag c) :
    Ontology.Section2CoveredAgreement (doAg (pdAg ag)) (doContract (pdContract ag))
      (doTx (pdContract ag)) (doControversy (pdContract ag)) c :=
  s2_deontic_implies_ontology (s2_procedure_implies_deontic pre_forum h)


theorem s2_elements_implies_ontology {ct : Deontic.Court}
    {ag : Elements.ArbitrationAgreement} {tx : Elements.Transaction}
    {d : Elements.Controversy} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section2 ag tx d c)
    (aux_s14 : Elements.Section14TitleApplies ag c) :
    Ontology.Section2CoveredAgreement (doAg (pdAg (epAg ag)))
      (doContract (pdContract (epAg ag))) (doTx (pdContract (epAg ag)))
      (doControversy (pdContract (epAg ag))) c :=
  s2_deontic_implies_ontology (s2_elements_implies_deontic pre_forum h aux_s14)




axiom peAg : Procedure.ArbitrationAgreement → Elements.ArbitrationAgreement

axiom peCtrv : Procedure.ArbitrationAgreement → Elements.Controversy


axiom peApp : Person → Elements.CourtApplication

axiom peAward : Procedure.Award → Elements.Award

axiom peOrder : Procedure.CourtOrder → Elements.CourtOrder

axiom eoCourt : Elements.CourtApplication → Ontology.Court

axiom eoApp : Elements.CourtApplication → Ontology.Application

axiom eoNotice : Elements.CourtApplication → Ontology.Notice

axiom eoSummons : Elements.ArbitralSummons → Ontology.Summons

axiom eoProceeding : Elements.Suit → Ontology.Proceeding

axiom eoProperty : Elements.Suit → Ontology.Property

axiom eoAward : Elements.Award → Ontology.Award

axiom eoJudgment : Elements.CourtApplication → Ontology.Judgment

axiom doAppOf : Person → Ontology.Application

axiom doNoticeOf : Person → Ontology.Notice

axiom doSummonsOf : Person → Ontology.Summons

axiom doJudgmentOf : Person → Ontology.Judgment

axiom poSummons : Person → Ontology.Summons

axiom poProcOfOrder : Procedure.CourtOrder → Ontology.Proceeding

axiom pdPetitionerOf : Person → Person






axiom corr_ep_stay_pending {s : Elements.Suit} {app : Elements.CourtApplication}
    {c : ComplaintText} :
    Elements.StayApplicationMadeByParty app s c →
    Elements.SuitPendingInUnitedStatesCourt s c →
    Procedure.SuitPendingInUnitedStatesCourt (epParty app) c

axiom corr_ep_stay_referable {s : Elements.Suit}
    {ag : Elements.ArbitrationAgreement} {app : Elements.CourtApplication}
    {c : ComplaintText} :
    Elements.StayApplicationMadeByParty app s c →
    Elements.IssueInSuitReferableToArbitration s ag c →
    Procedure.IssueReferableToArbitration (epParty app) c


axiom corr_ep_court_satisfied {s : Elements.Suit}
    {ag : Elements.ArbitrationAgreement} {app : Elements.CourtApplication}
    {c : ComplaintText} :
    Elements.StayApplicationMadeByParty app s c →
    Elements.IssueInSuitReferableToArbitration s ag c →
    Procedure.CourtSatisfiedIssueReferable (epParty app) c

axiom corr_ep_stay_application {s : Elements.Suit}
    {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.StayApplicationMadeByParty app s c →
    Procedure.StayApplicationMadeByParty (epParty app) c

axiom corr_pe_default_back {app : Elements.CourtApplication} {c : ComplaintText} :
    Procedure.ApplicantInDefaultInProceedingWithArbitration (epParty app) c →
    Elements.ApplicantInDefaultInProceedingWithArbitration app c


theorem s3_elements_implies_procedure {s : Elements.Suit}
    {ag : Elements.ArbitrationAgreement} {tx : Elements.Transaction}
    {d : Elements.Controversy} {app : Elements.CourtApplication}
    {c : ComplaintText}
    (h : Elements.Section3 s ag app c)
    (aux_s2 : Elements.Section2 ag tx d c)
    (aux_s14 : Elements.Section14TitleApplies ag c) :
    Procedure.StayOfProceedings (epParty app) (epAg ag) c where
  suitPending := corr_ep_stay_pending h.onApplication h.pending
  referable := corr_ep_stay_referable h.onApplication h.referable
  agreement := s2_elements_implies_procedure aux_s2 aux_s14
  courtSatisfied := corr_ep_court_satisfied h.onApplication h.referable
  application := corr_ep_stay_application h.onApplication
  notInDefault := fun hx => h.applicantNotInDefault (corr_pe_default_back hx)


axiom corr_pd_suit_pending {p : Person} {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} :
    Procedure.SuitPendingInUnitedStatesCourt p c →
    Procedure.IssueReferableToArbitration p c →
    Deontic.SuitPendingOnReferableIssue (pdProceeding p) (pdAg ag) c

axiom corr_pd_court_satisfied {ct : Deontic.Court} {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Procedure.CourtSatisfiedIssueReferable p c →
    Deontic.CourtSatisfiedIssueReferable ct (pdProceeding p) (pdAg ag) c

axiom corr_pd_stay_applied {p : Person} {c : ComplaintText} :
    Procedure.StayApplicationMadeByParty p c →
    Deontic.PartyAppliedForStay p (pdProceeding p) c

axiom corr_dp_default_back {p : Person} {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} :
    Deontic.ApplicantInDefaultInArbitration p (pdAg ag) c →
    Procedure.ApplicantInDefaultInProceedingWithArbitration p c


theorem s3_procedure_implies_deontic {ct : Deontic.Court} {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.StayOfProceedings p ag c) :
    Deontic.Obligation3Stay ct (pdProceeding p) (pdAg ag) p (pdContract ag) c where
  addressee := pre_forum
  covered := s2_procedure_implies_deontic_reach h.agreement
  suitPending := corr_pd_suit_pending h.suitPending h.referable
  courtSatisfied := corr_pd_court_satisfied pre_forum h.courtSatisfied
  applied := corr_pd_stay_applied h.application
  applicantNotInDefault := fun hx => h.notInDefault (corr_dp_default_back hx)


axiom corr_do_us_court {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c → Ontology.IsCourtOfTheUnitedStates (doCourt ct) c


axiom corr_do_pending {ct : Deontic.Court} {pr : Deontic.Proceeding}
    {ag : Deontic.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Deontic.SuitPendingOnReferableIssue pr ag c →
    Ontology.IsSuitOrProceedingPendingInCourt (doProceeding pr) (doCourt ct) c

axiom corr_do_referable {pr : Deontic.Proceeding}
    {ag : Deontic.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.SuitPendingOnReferableIssue pr ag c →
    Ontology.IsIssueReferableToArbitration (doIssue pr) (doAg ag) c

axiom corr_do_applied {p : Person} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.PartyAppliedForStay p pr c →
    Ontology.IsApplicationOfOneOfTheParties (doApplication pr) c

axiom corr_od_default_back {p : Person} {ag : Deontic.ArbitrationAgreement}
    {c : ComplaintText} :
    Ontology.IsInDefaultInProceedingWithArbitration p c →
    Deontic.ApplicantInDefaultInArbitration p ag c


theorem s3_deontic_implies_ontology {ct : Deontic.Court} {pr : Deontic.Proceeding}
    {ag : Deontic.ArbitrationAgreement} {p : Person} {k : Deontic.Contract}
    {c : ComplaintText} (h : Deontic.Obligation3Stay ct pr ag p k c) :
    Ontology.Section3ReferableIssue (doProceeding pr) (doCourt ct) (doIssue pr)
      (doAg ag) (doApplication pr) p c where
  federalForum := corr_do_us_court h.addressee
  pending := corr_do_pending h.addressee h.suitPending
  referable := corr_do_referable h.suitPending
  applied := corr_do_applied h.applied
  notInDefault := fun hx => h.applicantNotInDefault (corr_od_default_back hx)


theorem s3_elements_implies_deontic {ct : Deontic.Court} {s : Elements.Suit}
    {ag : Elements.ArbitrationAgreement} {tx : Elements.Transaction}
    {d : Elements.Controversy} {app : Elements.CourtApplication}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section3 s ag app c)
    (aux_s2 : Elements.Section2 ag tx d c)
    (aux_s14 : Elements.Section14TitleApplies ag c) :
    Deontic.Obligation3Stay ct (pdProceeding (epParty app)) (pdAg (epAg ag))
      (epParty app) (pdContract (epAg ag)) c :=
  s3_procedure_implies_deontic pre_forum (s3_elements_implies_procedure h aux_s2 aux_s14)


theorem s3_procedure_implies_ontology {ct : Deontic.Court} {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.StayOfProceedings p ag c) :
    Ontology.Section3ReferableIssue (doProceeding (pdProceeding p)) (doCourt ct)
      (doIssue (pdProceeding p)) (doAg (pdAg ag))
      (doApplication (pdProceeding p)) p c :=
  s3_deontic_implies_ontology (s3_procedure_implies_deontic pre_forum h)


theorem s3_elements_implies_ontology {ct : Deontic.Court} {s : Elements.Suit}
    {ag : Elements.ArbitrationAgreement} {tx : Elements.Transaction}
    {d : Elements.Controversy} {app : Elements.CourtApplication}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section3 s ag app c)
    (aux_s2 : Elements.Section2 ag tx d c)
    (aux_s14 : Elements.Section14TitleApplies ag c) :
    Ontology.Section3ReferableIssue (doProceeding (pdProceeding (epParty app)))
      (doCourt ct) (doIssue (pdProceeding (epParty app)))
      (doAg (pdAg (epAg ag))) (doApplication (pdProceeding (epParty app)))
      (epParty app) c :=
  s3_deontic_implies_ontology (s3_elements_implies_deontic pre_forum h aux_s2 aux_s14)









axiom corr_pe_s4_aggrieved {p : Person} {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} :
    Procedure.PartyAggrievedByFailureNeglectOrRefusalToArbitrate p c →
    Procedure.EnforceableArbitrationAgreement ag c →
    Elements.AggrievedByFailureNeglectOrRefusalToArbitrate p (peAg ag) c

axiom corr_pe_written {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.WrittenArbitrationUndertaking ag c →
    Elements.IsWrittenArbitrationProvision (peAg ag) c

axiom corr_pe_jurisdiction {p : Person} {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} :
    Procedure.CourtHasSubjectMatterJurisdictionUnderTitle28 p c →
    Procedure.EnforceableArbitrationAgreement ag c →
    Elements.FederalJurisdictionalNexusSaveForAgreement (peCtrv ag) c

axiom corr_pe_notice_days_eq {p : Person} {c : ComplaintText} :
    Procedure.daysNoticeBeforeReturnDay p c
      = Elements.daysOfWrittenNoticeServedOnDefaultingParty (peApp p) c

axiom corr_pe_service_manner {p : Person} {c : ComplaintText} :
    Procedure.ServiceMadeUnderFederalRulesOfCivilProcedure p c →
    Elements.NoticeServedUnderFederalRules (peApp p) c

axiom corr_pe_not_in_issue {p : Person} {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} :
    Procedure.EnforceableArbitrationAgreement ag c →
    ¬ Procedure.MakingOfAgreementOrFailureToComplyInIssue p c →
    ¬ Elements.MakingOfAgreementOrFailureToComplyInIssue (peAg ag) c

axiom corr_pe_venue {p : Person} {c : ComplaintText} :
    Procedure.HearingAndProceedingsWithinDistrictOfPetition p c →
    Elements.HearingWithinDistrictOfPetition (peApp p) c


theorem s4_procedure_implies_elements {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (h : Procedure.OrderCompellingArbitration p ag c) :
    Elements.Section4 p (peAg ag) (peCtrv ag) (peApp p) c where
  aggrieved := corr_pe_s4_aggrieved h.aggrieved h.agreement
  written := corr_pe_written h.agreement.inWriting
  jurisdiction := corr_pe_jurisdiction h.jurisdiction h.agreement
  fiveDaysNotice := by
    show 5 ≤ Elements.daysOfWrittenNoticeServedOnDefaultingParty (peApp p) c
    have hy : Procedure.daysNoticeBeforeReturnDay p c
        = Elements.daysOfWrittenNoticeServedOnDefaultingParty (peApp p) c :=
      corr_pe_notice_days_eq
    have h5 : 5 ≤ Procedure.daysNoticeBeforeReturnDay p c := h.notice.timely
    omega
  serviceManner := corr_pe_service_manner h.notice.manner
  basis := .uncontested (corr_pe_not_in_issue h.agreement h.notInIssue)
  venue := corr_pe_venue h.venue


axiom corr_pd_s4_aggrieved {p : Person} {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} :
    Procedure.PartyAggrievedByFailureNeglectOrRefusalToArbitrate p c →
    Deontic.IsAggrievedByFailureToArbitrate p (pdAg ag) c


axiom corr_pd_s4_jurisdiction {ct : Deontic.Court} {p : Person} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Procedure.CourtHasSubjectMatterJurisdictionUnderTitle28 p c →
    Deontic.CourtWouldHaveJurisdictionSaveForAgreement ct c


theorem s4_procedure_implies_deontic {ct : Deontic.Court} {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.OrderCompellingArbitration p ag c) :
    Deontic.Permission4Petition p ct (pdAg ag) (pdContract ag) c where
  addressee := corr_pd_s4_aggrieved h.aggrieved
  covered := s2_procedure_implies_deontic_reach h.agreement
  jurisdictionSaveForAgreement := corr_pd_s4_jurisdiction pre_forum h.jurisdiction


axiom corr_ed_s4_aggrieved {p : Person} {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} :
    Elements.AggrievedByFailureNeglectOrRefusalToArbitrate p ag c →
    Deontic.IsAggrievedByFailureToArbitrate p (pdAg (epAg ag)) c


axiom corr_ed_s4_jurisdiction {ct : Deontic.Court} {d : Elements.Controversy}
    {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Elements.FederalJurisdictionalNexusSaveForAgreement d c →
    Deontic.CourtWouldHaveJurisdictionSaveForAgreement ct c




theorem s4_elements_implies_deontic {ct : Deontic.Court} {p : Person}
    {ag : Elements.ArbitrationAgreement} {tx : Elements.Transaction}
    {d : Elements.Controversy} {app : Elements.CourtApplication}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section4 p ag d app c)
    (aux_s2 : Elements.Section2 ag tx d c)
    (aux_s14 : Elements.Section14TitleApplies ag c) :
    Deontic.Permission4Petition p ct (pdAg (epAg ag)) (pdContract (epAg ag)) c where
  addressee := corr_ed_s4_aggrieved h.aggrieved
  covered :=
    s2_procedure_implies_deontic_reach (s2_elements_implies_procedure aux_s2 aux_s14)
  jurisdictionSaveForAgreement := corr_ed_s4_jurisdiction pre_forum h.jurisdiction


axiom corr_eo_s4_aggrieved {p : Person} {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} :
    Elements.AggrievedByFailureNeglectOrRefusalToArbitrate p ag c →
    Ontology.IsPartyAggrievedByFailureToArbitrate p c

axiom corr_eo_written {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.IsWrittenArbitrationProvision ag c →
    Ontology.IsWrittenProvisionToSettleByArbitration (eoAg ag) c

axiom corr_eo_s4_forum {d : Elements.Controversy}
    {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.HearingWithinDistrictOfPetition app c →
    Elements.FederalJurisdictionalNexusSaveForAgreement d c →
    Ontology.IsUnitedStatesDistrictCourtWithSubjectMatterJurisdiction (eoCourt app) c

axiom corr_eo_s4_petition {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.HearingWithinDistrictOfPetition app c →
    Ontology.IsPetitionForOrderDirectingArbitration (eoApp app) c

axiom corr_eo_s4_notice {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.FiveDaysWrittenNoticeGiven app c →
    Elements.NoticeServedUnderFederalRules app c →
    Ontology.IsFiveDaysWrittenNoticeServedOnPartyInDefault (eoNotice app) c


theorem s4_elements_implies_ontology {p : Person}
    {ag : Elements.ArbitrationAgreement} {d : Elements.Controversy}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (h : Elements.Section4 p ag d app c) :
    Ontology.Section4CompelPetition p (eoCourt app) (eoApp app) (eoNotice app)
      (eoAg ag) c where
  aggrieved := corr_eo_s4_aggrieved h.aggrieved
  written := corr_eo_written h.written
  forum := corr_eo_s4_forum h.venue h.jurisdiction
  petition := corr_eo_s4_petition h.venue
  notice := corr_eo_s4_notice h.fiveDaysNotice h.serviceManner


theorem s4_procedure_implies_ontology {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (h : Procedure.OrderCompellingArbitration p ag c) :
    Ontology.Section4CompelPetition p (eoCourt (peApp p)) (eoApp (peApp p))
      (eoNotice (peApp p)) (eoAg (peAg ag)) c :=
  s4_elements_implies_ontology (s4_procedure_implies_elements h)


axiom corr_do_s4_aggrieved {p : Person} {ag : Deontic.ArbitrationAgreement}
    {c : ComplaintText} :
    Deontic.IsAggrievedByFailureToArbitrate p ag c →
    Ontology.IsPartyAggrievedByFailureToArbitrate p c

axiom corr_do_s4_written {agD : Deontic.ArbitrationAgreement}
    {k : Deontic.Contract} {c : ComplaintText} :
    Deontic.WrittenArbitrationProvisionExists k agD c →
    Ontology.IsWrittenProvisionToSettleByArbitration (doAg agD) c


axiom corr_do_s4_forum {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.CourtWouldHaveJurisdictionSaveForAgreement ct c →
    Ontology.IsUnitedStatesDistrictCourtWithSubjectMatterJurisdiction (doCourt ct) c

axiom corr_do_s4_petition {p : Person} {ct : Deontic.Court}
    {ag : Deontic.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.PetitionToCompelArbitrationFiled p ct ag c →
    Ontology.IsPetitionForOrderDirectingArbitration (doAppOf p) c

axiom corr_do_s4_notice {p : Person} {c : ComplaintText} :
    Deontic.FiveDaysWrittenNoticeServedOnPartyInDefault p c →
    Deontic.ServiceMadeUnderFederalRulesOfCivilProcedure p c →
    Ontology.IsFiveDaysWrittenNoticeServedOnPartyInDefault (doNoticeOf p) c




theorem s4_deontic_implies_ontology {ct : Deontic.Court} {p : Person}
    {agD : Deontic.ArbitrationAgreement} {k : Deontic.Contract}
    {c : ComplaintText}
    (h : Deontic.Permission4PetitionExercised p ct agD k c)
    (aux_s2 : Deontic.Obligation2Enforce ct agD k c)
    (aux_notice : Deontic.Obligation4NoticeComplied p ct agD c) :
    Ontology.Section4CompelPetition p (doCourt ct) (doAppOf p) (doNoticeOf p)
      (doAg agD) c where
  aggrieved := corr_do_s4_aggrieved h.1.addressee
  written := corr_do_s4_written aux_s2.writtenProvision
  forum := corr_do_s4_forum h.1.jurisdictionSaveForAgreement
  petition := corr_do_s4_petition h.2
  notice := corr_do_s4_notice aux_notice.2.1 aux_notice.2.2
















axiom corr_pe_s5_no_method {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    ¬ Procedure.AgreementProvidesMethodOfAppointingArbitrator ag c →
    ¬ Elements.AgreementProvidesArbitratorAppointmentMethod (peAg ag) c

axiom corr_pe_s5_failed {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.PartyFailedToAvailOfAppointmentMethod ag c →
    Elements.PartyFailedToAvailOfAppointmentMethod (peAg ag) c

axiom corr_pe_s5_lapse {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.LapseInNamingArbitratorOrFillingVacancy ag c →
    Elements.LapseInNamingArbitratorOrFillingVacancy (peAg ag) c

axiom corr_pe_s5_application {p : Person} {c : ComplaintText} :
    Procedure.ApplicationForCourtAppointmentMade p c →
    Elements.ApplicationByPartyToControversy (peApp p) c




theorem s5_procedure_implies_elements {p : Person} {ar : Procedure.Arbitrator}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (h : Procedure.CourtAppointmentOfArbitrator p ar ag c)
    (aux_enf : Procedure.EnforceableArbitrationAgreement ag c) :
    Elements.Section5 (peAg ag) (peApp p) c where
  written := corr_pe_written aux_enf.inWriting
  trigger :=
    match h.trigger with
    | .noMethod hn => .noMethodProvided (corr_pe_s5_no_method hn)
    | .failedToAvail _ hf => .partyFailedToAvail (corr_pe_s5_failed hf)
    | .lapse hl => .lapse (corr_pe_s5_lapse hl)
  onApplication := corr_pe_s5_application h.application





axiom corr_pd_s5_lapse {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.CourtAppointmentTrigger ag c →
    Deontic.LapseInNamingArbitratorOrFillingVacancy (pdAg ag) c

axiom corr_pd_s5_applied {p : Person} {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} :
    Procedure.ApplicationForCourtAppointmentMade p c →
    Deontic.PartyAppliedForAppointment p (pdAg ag) c


theorem s5_procedure_implies_deontic {ct : Deontic.Court} {p : Person}
    {ar : Procedure.Arbitrator} {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.CourtAppointmentOfArbitrator p ar ag c) :
    Deontic.Obligation5CourtAppoint ct p (pdAg ag) c where
  addressee := pre_forum
  lapse := corr_pd_s5_lapse h.trigger
  applied := corr_pd_s5_applied h.application



axiom corr_ed_s5_lapse {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.ArbitratorAppointmentTrigger ag c →
    Deontic.LapseInNamingArbitratorOrFillingVacancy (edAg ag) c

axiom corr_ed_s5_applied {p : Person} {ag : Elements.ArbitrationAgreement}
    {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.ApplicationByPartyToControversy app c →
    Deontic.PartyAppliedForAppointment p (edAg ag) c


theorem s5_elements_implies_deontic {ct : Deontic.Court} {p : Person}
    {ag : Elements.ArbitrationAgreement} {app : Elements.CourtApplication}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section5 ag app c) :
    Deontic.Obligation5CourtAppoint ct p (edAg ag) c where
  addressee := pre_forum
  lapse := corr_ed_s5_lapse h.trigger
  applied := corr_ed_s5_applied h.onApplication












axiom corr_ep_s6_as_motion {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.ApplicationMadeAndHeardAsMotion app c →
    Procedure.ApplicationMadeAndHeardAsMotion (epParty app) c

axiom corr_pe_s6_exception_back {app : Elements.CourtApplication} {c : ComplaintText} :
    Procedure.ChapterExpresslyProvidesOtherManner (epParty app) c →
    Elements.TitleExpresslyProvidesOtherwiseForApplication app c


theorem s6_elements_implies_procedure {app : Elements.CourtApplication}
    {c : ComplaintText} (h : Elements.Section6 app c) :
    Procedure.ApplicationHeardAsMotion (epParty app) c where
  asMotion := corr_ep_s6_as_motion h.asMotion
  noExpressException := fun hx => h.noExpressException (corr_pe_s6_exception_back hx)



axiom corr_pd_s6_under_title {ct : Deontic.Court} {p : Person} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Procedure.ApplicationMadeAndHeardAsMotion p c →
    Deontic.ApplicationMadeToCourtUnderThisTitle p ct c

axiom corr_pd_s6_as_motion {ct : Deontic.Court} {p : Person} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Procedure.ApplicationMadeAndHeardAsMotion p c →
    Deontic.ApplicationMadeAndHeardAsMotion ct c

axiom corr_dp_s6_exception_back {p : Person} {c : ComplaintText} :
    Deontic.TitleExpresslyProvidesOtherwiseForApplication c →
    Procedure.ChapterExpresslyProvidesOtherManner p c


theorem s6_procedure_implies_deontic {ct : Deontic.Court} {p : Person}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.ApplicationHeardAsMotion p c) :
    Deontic.Obligation6MotionFormComplied p ct c :=
  ⟨{ application := corr_pd_s6_under_title pre_forum h.asMotion
     noExpressException := fun hx => h.noExpressException (corr_dp_s6_exception_back hx) },
   corr_pd_s6_as_motion pre_forum h.asMotion⟩


axiom corr_do_s6_under_title {ct : Deontic.Court} {p : Person} {c : ComplaintText} :
    Deontic.ApplicationMadeToCourtUnderThisTitle p ct c →
    Ontology.IsApplicationToTheCourtUnderThisTitle (doAppOf p) c

axiom corr_do_s6_as_motion {ct : Deontic.Court} {p : Person} {c : ComplaintText} :
    Deontic.ApplicationMadeToCourtUnderThisTitle p ct c →
    Deontic.ApplicationMadeAndHeardAsMotion ct c →
    Ontology.IsHeardInMannerProvidedForMotions (doAppOf p) c


theorem s6_deontic_implies_ontology {ct : Deontic.Court} {p : Person}
    {c : ComplaintText} (h : Deontic.Obligation6MotionFormComplied p ct c) :
    Ontology.Section6ApplicationHeardAsMotion (doAppOf p) c where
  underTitle := corr_do_s6_under_title h.1.application
  asMotion := corr_do_s6_as_motion h.1.application h.2



axiom corr_os_s6_motion {ap : Ontology.Application} {c : ComplaintText} :
    Ontology.IsApplicationToTheCourtUnderThisTitle ap c →
    Ontology.IsHeardInMannerProvidedForMotions ap c →
    Structure.IncorporationHonored Structure.edge_6_incorporates_motionPractice c





theorem s6_ontology_implies_structure {ap : Ontology.Application} {c : ComplaintText}
    (pre_departures :
      Structure.ReferencedSectionExists Structure.edge_6_exceptAsProvided_chapter c)
    (h : Ontology.Section6ApplicationHeardAsMotion ap c) :
    Structure.Section6IncorporationsResolve c where
  motionPracticeHonored := corr_os_s6_motion h.underTitle h.asMotion
  expressDeparturesExist := pre_departures


theorem s6_elements_implies_deontic {ct : Deontic.Court}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c) (h : Elements.Section6 app c) :
    Deontic.Obligation6MotionFormComplied (epParty app) ct c :=
  s6_procedure_implies_deontic pre_forum (s6_elements_implies_procedure h)


theorem s6_procedure_implies_ontology {ct : Deontic.Court} {p : Person}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.ApplicationHeardAsMotion p c) :
    Ontology.Section6ApplicationHeardAsMotion (doAppOf p) c :=
  s6_deontic_implies_ontology (s6_procedure_implies_deontic pre_forum h)


theorem s6_elements_implies_ontology {ct : Deontic.Court}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c) (h : Elements.Section6 app c) :
    Ontology.Section6ApplicationHeardAsMotion (doAppOf (epParty app)) c :=
  s6_deontic_implies_ontology (s6_elements_implies_deontic pre_forum h)


theorem s6_deontic_implies_structure {ct : Deontic.Court} {p : Person}
    {c : ComplaintText}
    (pre_departures :
      Structure.ReferencedSectionExists Structure.edge_6_exceptAsProvided_chapter c)
    (h : Deontic.Obligation6MotionFormComplied p ct c) :
    Structure.Section6IncorporationsResolve c :=
  s6_ontology_implies_structure pre_departures (s6_deontic_implies_ontology h)


theorem s6_procedure_implies_structure {ct : Deontic.Court} {p : Person}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (pre_departures :
      Structure.ReferencedSectionExists Structure.edge_6_exceptAsProvided_chapter c)
    (h : Procedure.ApplicationHeardAsMotion p c) :
    Structure.Section6IncorporationsResolve c :=
  s6_ontology_implies_structure pre_departures
    (s6_procedure_implies_ontology pre_forum h)


theorem s6_elements_implies_structure {ct : Deontic.Court}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (pre_departures :
      Structure.ReferencedSectionExists Structure.edge_6_exceptAsProvided_chapter c)
    (h : Elements.Section6 app c) :
    Structure.Section6IncorporationsResolve c :=
  s6_ontology_implies_structure pre_departures
    (s6_elements_implies_ontology pre_forum h)




axiom corr_ep_s7_summoned {sm : Elements.ArbitralSummons} {p : Person}
    {c : ComplaintText} :
    Elements.SummonedPersonRefusedOrNeglectedToObey sm p c →
    Elements.SummonsIssuedInWritingByArbitratorMajority sm c →
    Procedure.ArbitratorsSummonedWitnessInWriting p c

axiom corr_ep_s7_signed {sm : Elements.ArbitralSummons} {p : Person}
    {c : ComplaintText} :
    Elements.SummonedPersonRefusedOrNeglectedToObey sm p c →
    Elements.SummonsSignedByArbitratorMajority sm c →
    Procedure.SummonsSignedByArbitratorsOrMajority p c

axiom corr_ep_s7_served {sm : Elements.ArbitralSummons} {p : Person}
    {c : ComplaintText} :
    Elements.SummonedPersonRefusedOrNeglectedToObey sm p c →
    Elements.SummonsDirectedAndServedAsSubpoena sm c →
    Procedure.SummonsDirectedToPersonAndServedAsSubpoena p c

axiom corr_ep_s7_refusal {sm : Elements.ArbitralSummons} {p : Person}
    {c : ComplaintText} :
    Elements.SummonedPersonRefusedOrNeglectedToObey sm p c →
    Procedure.SummonedPersonRefusedOrNeglectedToObey p c


axiom corr_ep_s7_petition {sm : Elements.ArbitralSummons} {p : Person}
    {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.SummonedPersonRefusedOrNeglectedToObey sm p c →
    Elements.PetitionInDistrictWhereArbitratorsSitting app c →
    Procedure.PetitionToCompelWitnessAttendanceFiled p c

axiom corr_ep_s7_venue {sm : Elements.ArbitralSummons} {p : Person}
    {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.SummonedPersonRefusedOrNeglectedToObey sm p c →
    Elements.PetitionInDistrictWhereArbitratorsSitting app c →
    Procedure.ArbitratorsSittingInDistrictOfCourt p c


theorem s7_elements_implies_procedure {sm : Elements.ArbitralSummons} {p : Person}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (h : Elements.Section7 sm p app c) :
    Procedure.OrderCompellingWitnessAttendance p c where
  summons :=
    { summoned := corr_ep_s7_summoned h.disobedience h.issuedInWriting
      signed := corr_ep_s7_signed h.disobedience h.signed
      served := corr_ep_s7_served h.disobedience h.servedAsSubpoena }
  refusal := corr_ep_s7_refusal h.disobedience
  petition := corr_ep_s7_petition h.disobedience h.venue
  venue := corr_ep_s7_venue h.disobedience h.venue


axiom corr_pd_s7_refusal {w : Person} {c : ComplaintText} :
    Procedure.SummonedPersonRefusedOrNeglectedToObey w c →
    Deontic.SummonedPersonRefusedOrNeglectedToObey w c

axiom corr_pd_s7_petition {ct : Deontic.Court} {w : Person} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Procedure.PetitionToCompelWitnessAttendanceFiled w c →
    Deontic.PetitionToCompelWitnessFiled (pdPetitionerOf w) ct c


theorem s7_procedure_implies_deontic {ct : Deontic.Court} {w : Person}
    {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.OrderCompellingWitnessAttendance w c) :
    Deontic.Power7Compel ct (pdPetitionerOf w) w c where
  addressee := pre_forum
  refusal := corr_pd_s7_refusal h.refusal
  petition := corr_pd_s7_petition pre_forum h.petition


axiom corr_do_s7_summoned {a : Deontic.Arbitrator} {w : Person} {c : ComplaintText} :
    Deontic.WitnessSummonedInWritingByArbitrators a w c →
    Ontology.IsSummonsIssuedByArbitrators (doSummonsOf w) c

axiom corr_do_s7_witness {a : Deontic.Arbitrator} {w : Person} {c : ComplaintText} :
    Deontic.WitnessSummonedInWritingByArbitrators a w c →
    Ontology.IsWitnessSummonedToAttend w c

axiom corr_do_s7_disobeyed {w : Person} {c : ComplaintText} :
    Deontic.SummonedPersonRefusedOrNeglectedToObey w c →
    Ontology.IsRefusalOrNeglectToObeySummons w c




theorem s7_deontic_implies_ontology {ct : Deontic.Court} {a : Deontic.Arbitrator}
    {pt w : Person} {c : ComplaintText}
    (h : Deontic.Power7Compel ct pt w c)
    (aux_obey : Deontic.Obligation7ObeySummonsBreached a w c) :
    Ontology.Section7Disobedience (doSummonsOf w) w c where
  summoned := corr_do_s7_summoned aux_obey.1.summonsIssued
  witness := corr_do_s7_witness aux_obey.1.summonsIssued
  disobeyed := corr_do_s7_disobeyed h.refusal


axiom corr_eo_s7_summoned {sm : Elements.ArbitralSummons} {c : ComplaintText} :
    Elements.SummonsIssuedInWritingByArbitratorMajority sm c →
    Ontology.IsSummonsIssuedByArbitrators (eoSummons sm) c

axiom corr_eo_s7_witness {sm : Elements.ArbitralSummons} {p : Person}
    {c : ComplaintText} :
    Elements.SummonedPersonRefusedOrNeglectedToObey sm p c →
    Ontology.IsWitnessSummonedToAttend p c

axiom corr_eo_s7_disobeyed {sm : Elements.ArbitralSummons} {p : Person}
    {c : ComplaintText} :
    Elements.SummonedPersonRefusedOrNeglectedToObey sm p c →
    Ontology.IsRefusalOrNeglectToObeySummons p c


theorem s7_elements_implies_ontology {sm : Elements.ArbitralSummons} {p : Person}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (h : Elements.Section7 sm p app c) :
    Ontology.Section7Disobedience (eoSummons sm) p c where
  summoned := corr_eo_s7_summoned h.issuedInWriting
  witness := corr_eo_s7_witness h.disobedience
  disobeyed := corr_eo_s7_disobeyed h.disobedience


axiom corr_po_s7_summoned {w : Person} {c : ComplaintText} :
    Procedure.ArbitratorsSummonedWitnessInWriting w c →
    Ontology.IsSummonsIssuedByArbitrators (poSummons w) c

axiom corr_po_s7_witness {w : Person} {c : ComplaintText} :
    Procedure.ArbitratorsSummonedWitnessInWriting w c →
    Ontology.IsWitnessSummonedToAttend w c

axiom corr_po_s7_disobeyed {w : Person} {c : ComplaintText} :
    Procedure.SummonedPersonRefusedOrNeglectedToObey w c →
    Ontology.IsRefusalOrNeglectToObeySummons w c


theorem s7_procedure_implies_ontology {w : Person} {c : ComplaintText}
    (h : Procedure.OrderCompellingWitnessAttendance w c) :
    Ontology.Section7Disobedience (poSummons w) w c where
  summoned := corr_po_s7_summoned h.summons.summoned
  witness := corr_po_s7_witness h.summons.summoned
  disobeyed := corr_po_s7_disobeyed h.refusal


theorem s7_elements_implies_deontic {ct : Deontic.Court}
    {sm : Elements.ArbitralSummons} {p : Person}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section7 sm p app c) :
    Deontic.Power7Compel ct (pdPetitionerOf p) p c :=
  s7_procedure_implies_deontic pre_forum (s7_elements_implies_procedure h)




axiom peSuit : Person → Elements.Suit

axiom doProcOf : Person → Ontology.Proceeding

axiom doPropOf : Person → Ontology.Property


axiom corr_ed_s8_admiralty {s : Elements.Suit} {c : ComplaintText} :
    Elements.CauseOtherwiseJusticiableInAdmiralty s c →
    Deontic.AdmiraltyJusticiableCauseOfAction c

axiom corr_ed_s8_libel {s : Elements.Suit} {p : Person} {c : ComplaintText} :
    Elements.PartyClaimingToBeAggrieved p s c →
    Elements.ProceedingBegunByLibelAndSeizure s c →
    Deontic.ProceedingBegunByLibelAndSeizure p c


theorem s8_elements_implies_deontic {ct : Deontic.Court} {p : Person}
    {s : Elements.Suit} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section8 p s c) :
    Deontic.Power8Jurisdiction ct p c where
  addressee := pre_forum
  admiraltyBasis := corr_ed_s8_admiralty h.admiralty
  begunByLibel := corr_ed_s8_libel h.aggrieved h.libelAndSeizure


axiom corr_pd_s8_admiralty {p : Person} {c : ComplaintText} :
    Procedure.CauseOfActionJusticiableInAdmiralty p c →
    Deontic.AdmiraltyJusticiableCauseOfAction c

axiom corr_pd_s8_libel {p : Person} {c : ComplaintText} :
    Procedure.ProceedingBegunByLibelAndSeizure p c →
    Deontic.ProceedingBegunByLibelAndSeizure p c


theorem s8_procedure_implies_deontic {ct : Deontic.Court} {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.AdmiraltyCommencement p ag c) :
    Deontic.Power8Jurisdiction ct p c where
  addressee := pre_forum
  admiraltyBasis := corr_pd_s8_admiralty h.justiciable
  begunByLibel := corr_pd_s8_libel h.libelAndSeizure


axiom corr_do_s8_justiciable {p : Person} {c : ComplaintText} :
    Deontic.AdmiraltyJusticiableCauseOfAction c →
    Deontic.ProceedingBegunByLibelAndSeizure p c →
    Ontology.IsCauseOfActionJusticiableInAdmiralty (doProcOf p) c

axiom corr_do_s8_libel {p : Person} {c : ComplaintText} :
    Deontic.ProceedingBegunByLibelAndSeizure p c →
    Ontology.IsProceedingBegunByLibelAndSeizure (doProcOf p) c

axiom corr_do_s8_res {p : Person} {c : ComplaintText} :
    Deontic.ProceedingBegunByLibelAndSeizure p c →
    Ontology.IsVesselOrOtherProperty (doPropOf p) c


theorem s8_deontic_implies_ontology {ct : Deontic.Court} {p : Person}
    {c : ComplaintText} (h : Deontic.Power8Jurisdiction ct p c) :
    Ontology.Section8AdmiraltyCommencement (doProcOf p) (doPropOf p) c where
  justiciable := corr_do_s8_justiciable h.admiraltyBasis h.begunByLibel
  libelAndSeizure := corr_do_s8_libel h.begunByLibel
  res := corr_do_s8_res h.begunByLibel


axiom corr_eo_s8_justiciable {s : Elements.Suit} {c : ComplaintText} :
    Elements.CauseOtherwiseJusticiableInAdmiralty s c →
    Ontology.IsCauseOfActionJusticiableInAdmiralty (eoProceeding s) c

axiom corr_eo_s8_libel {s : Elements.Suit} {c : ComplaintText} :
    Elements.ProceedingBegunByLibelAndSeizure s c →
    Ontology.IsProceedingBegunByLibelAndSeizure (eoProceeding s) c

axiom corr_eo_s8_res {s : Elements.Suit} {c : ComplaintText} :
    Elements.ProceedingBegunByLibelAndSeizure s c →
    Ontology.IsVesselOrOtherProperty (eoProperty s) c


theorem s8_elements_implies_ontology {p : Person} {s : Elements.Suit}
    {c : ComplaintText} (h : Elements.Section8 p s c) :
    Ontology.Section8AdmiraltyCommencement (eoProceeding s) (eoProperty s) c where
  justiciable := corr_eo_s8_justiciable h.admiralty
  libelAndSeizure := corr_eo_s8_libel h.libelAndSeizure
  res := corr_eo_s8_res h.libelAndSeizure


theorem s8_procedure_implies_ontology {ct : Deontic.Court} {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.AdmiraltyCommencement p ag c) :
    Ontology.Section8AdmiraltyCommencement (doProcOf p) (doPropOf p) c :=
  s8_deontic_implies_ontology (s8_procedure_implies_deontic pre_forum h)


axiom corr_pe_s8_admiralty {p : Person} {c : ComplaintText} :
    Procedure.CauseOfActionJusticiableInAdmiralty p c →
    Elements.CauseOtherwiseJusticiableInAdmiralty (peSuit p) c

axiom corr_pe_s8_libel {p : Person} {c : ComplaintText} :
    Procedure.ProceedingBegunByLibelAndSeizure p c →
    Elements.ProceedingBegunByLibelAndSeizure (peSuit p) c







theorem s8_procedure_implies_elements_modulo_gaps {p : Person}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (h : Procedure.AdmiraltyCommencement p ag c)
    (gap_party_claiming_aggrieved : Elements.PartyClaimingToBeAggrieved p (peSuit p) c) :
    Elements.Section8 p (peSuit p) c where
  admiralty := corr_pe_s8_admiralty h.justiciable
  aggrieved := gap_party_claiming_aggrieved
  libelAndSeizure := corr_pe_s8_libel h.libelAndSeizure














axiom eoAdverse : Elements.CourtApplication → Person

axiom doAdverseOf : Person → Person

axiom doArbitrator : Deontic.Award → Ontology.Arbitrator

axiom poArbitrator : Procedure.Award → Ontology.Arbitrator


axiom corr_ep_s9_consented {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.AgreementProvidesForJudgmentUponAward ag c →
    Procedure.PartiesAgreedJudgmentShallBeEnteredUponAward (epAg ag) c

axiom corr_ep_s9_award_made {app : Elements.CourtApplication}
    {ag : Elements.ArbitrationAgreement} {aw : Elements.Award} {c : ComplaintText} :
    Elements.ConfirmationForum app ag aw c →
    Procedure.AwardMade (epAward aw) c

axiom corr_ep_s9_application {app : Elements.CourtApplication}
    {ag : Elements.ArbitrationAgreement} {aw : Elements.Award} {c : ComplaintText} :
    Elements.ConfirmationForum app ag aw c →
    Procedure.ApplicationForOrderConfirmingAwardFiled (epAward aw) c


axiom corr_ep_s9_days {app : Elements.CourtApplication}
    {ag : Elements.ArbitrationAgreement} {aw : Elements.Award} {c : ComplaintText} :
    Elements.ConfirmationForum app ag aw c →
    Procedure.daysFromAwardMadeToConfirmationApplication (epAward aw) c
      ≤ Elements.daysFromAwardMadeToConfirmationApplication app c


axiom corr_ep_s9_window {aw : Elements.Award} {c : ComplaintText} :
    365 ≤ Procedure.daysInStatutoryOneYearAfterAward (epAward aw) c

axiom corr_ep_s9_specified {app : Elements.CourtApplication}
    {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.AppliedToCourtSpecifiedInAgreement app ag c →
    Procedure.AgreementSpecifiesCourt (epAg ag) c

axiom corr_pe_s9_specifies_back {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} :
    Procedure.AgreementSpecifiesCourt (epAg ag) c →
    Elements.AgreementSpecifiesConfirmingCourt ag c

axiom corr_ep_s9_district {app : Elements.CourtApplication} {aw : Elements.Award}
    {c : ComplaintText} :
    Elements.AppliedToDistrictWhereAwardMade app aw c →
    Procedure.AwardMadeWithinDistrictOfCourt (epAward aw) c

axiom corr_ep_s9_notice {app : Elements.CourtApplication} {aw : Elements.Award}
    {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.ConfirmationForum app ag aw c →
    Elements.NoticeOfApplicationServedOnAdverseParty app c →
    Procedure.NoticeOfConfirmationApplicationServedOnAdverseParty (epAward aw) c

axiom corr_ep_service_resident {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.AdversePartyResidesInDistrictWhereAwardMade app c →
    Procedure.AdversePartyIsResidentOfDistrict (epParty app) c

axiom corr_ep_service_same_court {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.ServedAsNoticeOfMotionInSameCourt app c →
    Procedure.ServiceAsNoticeOfMotionInSameCourt (epParty app) c

axiom corr_pe_resident_back {app : Elements.CourtApplication} {c : ComplaintText} :
    Procedure.AdversePartyIsResidentOfDistrict (epParty app) c →
    Elements.AdversePartyResidesInDistrictWhereAwardMade app c

axiom corr_ep_service_marshal {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.ServedByMarshalOfDistrictWhereFound app c →
    Procedure.NoticeServedByMarshalOnNonresident (epParty app) c

axiom corr_pe_disturbed_back {aw : Elements.Award} {c : ComplaintText} :
    Procedure.AwardVacatedModifiedOrCorrected (epAward aw) c →
    Elements.AwardVacatedModifiedOrCorrected aw c


theorem s12_service_elements_to_procedure {app : Elements.CourtApplication}
    {c : ComplaintText} (h : Elements.Section12ServiceManner app c) :
    Procedure.AdversePartyNoticeService (epParty app) c :=
  match h with
  | .resident hRes hSrv =>
      .resident (corr_ep_service_resident hRes) (corr_ep_service_same_court hSrv)
  | .nonresident hNon hSrv =>
      .nonresident (fun hx => hNon (corr_pe_resident_back hx))
        (corr_ep_service_marshal hSrv)




theorem s9_elements_implies_procedure {p : Person}
    {ag : Elements.ArbitrationAgreement} {aw : Elements.Award}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (h : Elements.Section9 p ag aw app c)
    (aux_s12 : Elements.Section12 app c) :
    Procedure.ConfirmationOfAward (epParty app) (epAward aw) (epAg ag) c where
  consented := corr_ep_s9_consented h.judgmentClause
  awardMade := corr_ep_s9_award_made h.forum
  application := corr_ep_s9_application h.forum
  timely := by
    show Procedure.daysFromAwardMadeToConfirmationApplication (epAward aw) c
      ≤ Procedure.daysInStatutoryOneYearAfterAward (epAward aw) c
    have hd : Procedure.daysFromAwardMadeToConfirmationApplication (epAward aw) c
        ≤ Elements.daysFromAwardMadeToConfirmationApplication app c :=
      corr_ep_s9_days h.forum
    have hw : 365 ≤ Procedure.daysInStatutoryOneYearAfterAward (epAward aw) c :=
      corr_ep_s9_window
    have ht : Elements.daysFromAwardMadeToConfirmationApplication app c ≤ 365 := h.timely
    omega
  venue :=
    match h.forum with
    | .specified hs => .specified (corr_ep_s9_specified hs)
    | .awardDistrict hNone hd =>
        .districtOfAward (fun hx => hNone (corr_pe_s9_specifies_back hx))
          (corr_ep_s9_district hd)
  noticeServed := corr_ep_s9_notice h.forum h.noticeServed
  service := s12_service_elements_to_procedure aux_s12.serviceManner
  notDisturbed := fun hx => h.notUnsettled (corr_pe_disturbed_back hx)


axiom corr_ed_s9_clause {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Elements.AgreementProvidesForJudgmentUponAward ag c →
    Deontic.AgreementProvidesForJudgmentOnAward (edAg ag) c

axiom corr_ed_s9_application {p : Person} {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} :
    Elements.ApplicantIsPartyToTheArbitration p c →
    Elements.WithinLimitationsOneYearOfAward app c →
    Deontic.ApplicationForConfirmationWithinOneYear p (edAward aw) c

axiom corr_de_disturbed_back {aw : Elements.Award} {c : ComplaintText} :
    Deontic.AwardVacatedModifiedOrCorrected (edAward aw) c →
    Elements.AwardVacatedModifiedOrCorrected aw c





theorem s9_elements_implies_deontic_modulo_gaps {ct : Deontic.Court} {p : Person}
    {ag : Elements.ArbitrationAgreement} {aw : Elements.Award}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section9 p ag aw app c)
    (gap_forum_district_of_award :
      Deontic.CourtIsForDistrictWhereAwardMade ct (edAward aw) c) :
    Deontic.Obligation9Confirm ct p (edAg ag) (edAward aw) c where
  addressee := pre_forum
  forum := gap_forum_district_of_award
  entryOfJudgmentClause := corr_ed_s9_clause h.judgmentClause
  application := corr_ed_s9_application h.byParty h.timely
  notDisturbed := fun hx => h.notUnsettled (corr_de_disturbed_back hx)


axiom corr_pd_s9_clause {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.PartiesAgreedJudgmentShallBeEnteredUponAward ag c →
    Deontic.AgreementProvidesForJudgmentOnAward (pdAg ag) c

axiom corr_pd_s9_application {p : Person} {a : Procedure.Award} {c : ComplaintText} :
    Procedure.ApplicationForOrderConfirmingAwardFiled a c →
    Procedure.ConfirmationApplicationWithinOneYear a c →
    Deontic.ApplicationForConfirmationWithinOneYear p (pdAward a) c

axiom corr_dp_disturbed_back {a : Procedure.Award} {c : ComplaintText} :
    Deontic.AwardVacatedModifiedOrCorrected (pdAward a) c →
    Procedure.AwardVacatedModifiedOrCorrected a c



theorem s9_procedure_implies_deontic_modulo_gaps {ct : Deontic.Court} {p : Person}
    {a : Procedure.Award} {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.ConfirmationOfAward p a ag c)
    (gap_forum_district_of_award :
      Deontic.CourtIsForDistrictWhereAwardMade ct (pdAward a) c) :
    Deontic.Obligation9Confirm ct p (pdAg ag) (pdAward a) c where
  addressee := pre_forum
  forum := gap_forum_district_of_award
  entryOfJudgmentClause := corr_pd_s9_clause h.consented
  application := corr_pd_s9_application h.application h.timely
  notDisturbed := fun hx => h.notDisturbed (corr_dp_disturbed_back hx)


axiom corr_do_s9_award {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ApplicationForConfirmationWithinOneYear p aw c →
    Ontology.IsAward (doAward aw) c

axiom corr_do_s9_entry {ag : Deontic.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.AgreementProvidesForJudgmentOnAward ag c →
    Ontology.IsAgreementForEntryOfJudgmentUponAward (doAg ag) c

axiom corr_do_s9_application {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ApplicationForConfirmationWithinOneYear p aw c →
    Ontology.IsApplicationForOrderConfirmingAward (doAppOf p) c

axiom corr_do_s9_timely {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ApplicationForConfirmationWithinOneYear p aw c →
    Ontology.IsWithinOneYearAfterAwardMade (doAppOf p) (doAward aw) c

axiom corr_do_s9_adverse {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ApplicationForConfirmationWithinOneYear p aw c →
    Ontology.IsAdverseParty (doAdverseOf p) c





theorem s9_deontic_implies_ontology_modulo_gaps {ct : Deontic.Court} {p : Person}
    {ag : Deontic.ArbitrationAgreement} {aw : Deontic.Award} {c : ComplaintText}
    (h : Deontic.Obligation9Confirm ct p ag aw c)
    (gap_forum_specified_in_agreement :
      Ontology.IsCourtSpecifiedInAgreement (doCourt ct) (doAg ag) c) :
    Ontology.Section9ConfirmationApplication (doAward aw) (doAg ag) (doCourt ct)
      (doAppOf p) (doAdverseOf p) c where
  award := corr_do_s9_award h.application
  entryAgreed := corr_do_s9_entry h.entryOfJudgmentClause
  forum := gap_forum_specified_in_agreement
  application := corr_do_s9_application h.application
  timely := corr_do_s9_timely h.application
  adverse := corr_do_s9_adverse h.application



theorem s9_elements_implies_ontology_modulo_gaps {ct : Deontic.Court} {p : Person}
    {ag : Elements.ArbitrationAgreement} {aw : Elements.Award}
    {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section9 p ag aw app c)
    (gap_forum_district_of_award :
      Deontic.CourtIsForDistrictWhereAwardMade ct (edAward aw) c)
    (gap_forum_specified_in_agreement :
      Ontology.IsCourtSpecifiedInAgreement (doCourt ct) (doAg (edAg ag)) c) :
    Ontology.Section9ConfirmationApplication (doAward (edAward aw))
      (doAg (edAg ag)) (doCourt ct) (doAppOf p) (doAdverseOf p) c :=
  s9_deontic_implies_ontology_modulo_gaps
    (s9_elements_implies_deontic_modulo_gaps pre_forum h gap_forum_district_of_award)
    gap_forum_specified_in_agreement


theorem s9_procedure_implies_ontology_modulo_gaps {ct : Deontic.Court} {p : Person}
    {a : Procedure.Award} {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Procedure.ConfirmationOfAward p a ag c)
    (gap_forum_district_of_award :
      Deontic.CourtIsForDistrictWhereAwardMade ct (pdAward a) c)
    (gap_forum_specified_in_agreement :
      Ontology.IsCourtSpecifiedInAgreement (doCourt ct) (doAg (pdAg ag)) c) :
    Ontology.Section9ConfirmationApplication (doAward (pdAward a))
      (doAg (pdAg ag)) (doCourt ct) (doAppOf p) (doAdverseOf p) c :=
  s9_deontic_implies_ontology_modulo_gaps
    (s9_procedure_implies_deontic_modulo_gaps pre_forum h gap_forum_district_of_award)
    gap_forum_specified_in_agreement








axiom corr_ed_s10_forum {ct : Deontic.Court} {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Elements.ApplicationInDistrictWhereAwardMade app aw c →
    Deontic.CourtIsForDistrictWhereAwardMade ct (edAward aw) c

axiom corr_ed_party {p : Person} {c : ComplaintText} :
    Elements.ApplicantIsPartyToTheArbitration p c → Deontic.IsPartyToArbitration p c

axiom corr_ed_s10_application {p : Person} {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} :
    Elements.ApplicantIsPartyToTheArbitration p c →
    Elements.ApplicationInDistrictWhereAwardMade app aw c →
    Deontic.ApplicationToVacateByParty p (edAward aw) c

axiom corr_ed_s10_corruption {aw : Elements.Award} {c : ComplaintText} :
    Elements.AwardProcuredByCorruptionFraudOrUndueMeans aw c →
    Deontic.AwardProcuredByCorruptionFraudOrUndueMeans (edAward aw) c

axiom corr_ed_s10_partiality {aw : Elements.Award} {c : ComplaintText} :
    Elements.EvidentPartialityOrCorruptionInArbitrators aw c →
    Deontic.EvidentPartialityOrCorruptionInArbitrators (edAward aw) c

axiom corr_ed_s10_misconduct_postpone {aw : Elements.Award} {c : ComplaintText} :
    Elements.RefusalToPostponeGround aw c →
    Deontic.ArbitratorMisconductPrejudicingParty (edAward aw) c
axiom corr_ed_s10_misconduct_evidence {aw : Elements.Award} {c : ComplaintText} :
    Elements.ArbitratorsRefusedToHearMaterialEvidence aw c →
    Deontic.ArbitratorMisconductPrejudicingParty (edAward aw) c
axiom corr_ed_s10_misconduct_other {aw : Elements.Award} {c : ComplaintText} :
    Elements.OtherMisbehaviorGround aw c →
    Deontic.ArbitratorMisconductPrejudicingParty (edAward aw) c

axiom corr_ed_s10_excess {aw : Elements.Award} {c : ComplaintText} :
    Elements.ArbitratorsExceededTheirPowers aw c →
    Deontic.ArbitratorsExceededOrImperfectlyExecutedPowers (edAward aw) c
axiom corr_ed_s10_imperfect {aw : Elements.Award} {c : ComplaintText} :
    Elements.ImperfectExecutionGround aw c →
    Deontic.ArbitratorsExceededOrImperfectlyExecutedPowers (edAward aw) c


theorem s10_ground_elements_to_deontic {aw : Elements.Award} {c : ComplaintText}
    (g : Elements.VacaturGround10a aw c) : Deontic.Section10Ground (edAward aw) c :=
  match g with
  | .procurement h => .corruptionFraudOrUndueMeans (corr_ed_s10_corruption h)
  | .partiality h => .evidentPartiality (corr_ed_s10_partiality h)
  | .refusalToPostpone h => .misconduct (corr_ed_s10_misconduct_postpone h)
  | .refusalToHearEvidence h => .misconduct (corr_ed_s10_misconduct_evidence h)
  | .otherMisbehavior h => .misconduct (corr_ed_s10_misconduct_other h)
  | .exceededPowers h => .excessOrImperfectExecutionOfPowers (corr_ed_s10_excess h)
  | .imperfectExecution h =>
      .excessOrImperfectExecutionOfPowers (corr_ed_s10_imperfect h)


theorem s10_elements_implies_deontic {ct : Deontic.Court} {p : Person}
    {aw : Elements.Award} {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section10a p aw app c) :
    Deontic.Power10Vacate ct p (edAward aw) c where
  addressee := pre_forum
  forum := corr_ed_s10_forum pre_forum h.venue
  applicantIsParty := corr_ed_party h.byParty
  application := corr_ed_s10_application h.byParty h.venue
  ground := s10_ground_elements_to_deontic h.ground


axiom corr_dp_s10_award_made {ct : Deontic.Court} {aw : Deontic.Award}
    {c : ComplaintText} :
    Deontic.CourtIsForDistrictWhereAwardMade ct aw c →
    Procedure.AwardMade (dpAward aw) c

axiom corr_dp_s10_venue {ct : Deontic.Court} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.CourtIsForDistrictWhereAwardMade ct aw c →
    Procedure.AwardMadeWithinDistrictOfCourt (dpAward aw) c

axiom corr_dp_s10_application {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ApplicationToVacateByParty p aw c →
    Procedure.ApplicationToVacateAwardMade (dpAward aw) c

axiom corr_dp_s10_corruption {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.AwardProcuredByCorruptionFraudOrUndueMeans aw c →
    Procedure.AwardProcuredByCorruptionFraudOrUndueMeans (dpAward aw) c
axiom corr_dp_s10_partiality {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.EvidentPartialityOrCorruptionInArbitrators aw c →
    Procedure.EvidentPartialityOrCorruptionInArbitrators (dpAward aw) c
axiom corr_dp_s10_misconduct {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ArbitratorMisconductPrejudicingParty aw c →
    Procedure.ArbitratorMisconductRefusingPostponementOrEvidence (dpAward aw) c
axiom corr_dp_s10_excess {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ArbitratorsExceededOrImperfectlyExecutedPowers aw c →
    Procedure.ArbitratorsExceededOrImperfectlyExecutedPowers (dpAward aw) c


theorem s10_ground_deontic_to_procedure {aw : Deontic.Award} {c : ComplaintText}
    (g : Deontic.Section10Ground aw c) : Procedure.VacaturGround (dpAward aw) c :=
  match g with
  | .corruptionFraudOrUndueMeans h => .corruption (corr_dp_s10_corruption h)
  | .evidentPartiality h => .partiality (corr_dp_s10_partiality h)
  | .misconduct h => .misconduct (corr_dp_s10_misconduct h)
  | .excessOrImperfectExecutionOfPowers h => .excessOfPowers (corr_dp_s10_excess h)


theorem s10_deontic_implies_procedure {ct : Deontic.Court} {p : Person}
    {aw : Deontic.Award} {c : ComplaintText} (h : Deontic.Power10Vacate ct p aw c) :
    Procedure.OrderVacatingAward (dpAward aw) c where
  awardMade := corr_dp_s10_award_made h.forum
  venue := corr_dp_s10_venue h.forum
  application := corr_dp_s10_application h.application
  ground := s10_ground_deontic_to_procedure h.ground


axiom corr_do_s10_corruption {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.AwardProcuredByCorruptionFraudOrUndueMeans aw c →
    Ontology.IsAwardProcuredByCorruptionFraudOrUndueMeans (doAward aw) c
axiom corr_do_s10_partiality {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.EvidentPartialityOrCorruptionInArbitrators aw c →
    Ontology.IsEvidentPartialityOrCorruptionInArbitrators (doArbitrator aw) (doAward aw) c
axiom corr_do_s10_misconduct {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ArbitratorMisconductPrejudicingParty aw c →
    Ontology.IsArbitratorMisconductInRefusingPostponementOrEvidence
      (doArbitrator aw) (doAward aw) c
axiom corr_do_s10_excess {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ArbitratorsExceededOrImperfectlyExecutedPowers aw c →
    Ontology.IsArbitratorExceededOrImperfectlyExecutedPowers
      (doArbitrator aw) (doAward aw) c


theorem s10_deontic_implies_ontology {ct : Deontic.Court} {p : Person}
    {aw : Deontic.Award} {c : ComplaintText} (h : Deontic.Power10Vacate ct p aw c) :
    Ontology.Section10VacaturGround (doAward aw) (doArbitrator aw) c :=
  match h.ground with
  | .corruptionFraudOrUndueMeans hg =>
      .corruptionFraudOrUndueMeans (corr_do_s10_corruption hg)
  | .evidentPartiality hg => .evidentPartiality (corr_do_s10_partiality hg)
  | .misconduct hg => .hearingMisconduct (corr_do_s10_misconduct hg)
  | .excessOrImperfectExecutionOfPowers hg => .exceededPowers (corr_do_s10_excess hg)


axiom corr_po_s10_corruption {a : Procedure.Award} {c : ComplaintText} :
    Procedure.AwardProcuredByCorruptionFraudOrUndueMeans a c →
    Ontology.IsAwardProcuredByCorruptionFraudOrUndueMeans (poAward a) c
axiom corr_po_s10_partiality {a : Procedure.Award} {c : ComplaintText} :
    Procedure.EvidentPartialityOrCorruptionInArbitrators a c →
    Ontology.IsEvidentPartialityOrCorruptionInArbitrators (poArbitrator a) (poAward a) c
axiom corr_po_s10_misconduct {a : Procedure.Award} {c : ComplaintText} :
    Procedure.ArbitratorMisconductRefusingPostponementOrEvidence a c →
    Ontology.IsArbitratorMisconductInRefusingPostponementOrEvidence
      (poArbitrator a) (poAward a) c
axiom corr_po_s10_excess {a : Procedure.Award} {c : ComplaintText} :
    Procedure.ArbitratorsExceededOrImperfectlyExecutedPowers a c →
    Ontology.IsArbitratorExceededOrImperfectlyExecutedPowers
      (poArbitrator a) (poAward a) c


theorem s10_procedure_implies_ontology {a : Procedure.Award} {c : ComplaintText}
    (h : Procedure.OrderVacatingAward a c) :
    Ontology.Section10VacaturGround (poAward a) (poArbitrator a) c :=
  match h.ground with
  | .corruption hg => .corruptionFraudOrUndueMeans (corr_po_s10_corruption hg)
  | .partiality hg => .evidentPartiality (corr_po_s10_partiality hg)
  | .misconduct hg => .hearingMisconduct (corr_po_s10_misconduct hg)
  | .excessOfPowers hg => .exceededPowers (corr_po_s10_excess hg)


theorem s10_elements_implies_procedure {ct : Deontic.Court} {p : Person}
    {aw : Elements.Award} {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section10a p aw app c) :
    Procedure.OrderVacatingAward (dpAward (edAward aw)) c :=
  s10_deontic_implies_procedure (s10_elements_implies_deontic pre_forum h)


theorem s10_elements_implies_ontology {ct : Deontic.Court} {p : Person}
    {aw : Elements.Award} {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section10a p aw app c) :
    Ontology.Section10VacaturGround (doAward (edAward aw))
      (doArbitrator (edAward aw)) c :=
  s10_deontic_implies_ontology (s10_elements_implies_deontic pre_forum h)









axiom corr_ed_s11_forum {ct : Deontic.Court} {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Elements.ApplicationInDistrictWhereAwardMade app aw c →
    Deontic.CourtIsForDistrictWhereAwardMade ct (edAward aw) c

axiom corr_ed_s11_application {p : Person} {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} :
    Elements.ApplicantIsPartyToTheArbitration p c →
    Elements.ApplicationInDistrictWhereAwardMade app aw c →
    Deontic.ApplicationToModifyByParty p (edAward aw) c

axiom corr_ed_s11_miscalc {aw : Elements.Award} {c : ComplaintText} :
    Elements.EvidentMaterialMiscalculationOfFigures aw c →
    Deontic.EvidentMaterialMiscalculationOrMistake (edAward aw) c
axiom corr_ed_s11_mistake {aw : Elements.Award} {c : ComplaintText} :
    Elements.EvidentMaterialMistakeInDescription aw c →
    Deontic.EvidentMaterialMiscalculationOrMistake (edAward aw) c

axiom corr_ed_s11_unsubmitted {aw : Elements.Award} {c : ComplaintText} :
    Elements.AwardedUponMatterNotSubmitted aw c →
    Deontic.AwardUponMatterNotSubmitted (edAward aw) c
axiom corr_ed_s11_proviso {aw : Elements.Award} {c : ComplaintText} :
    Deontic.MatterNotAffectingMeritsOfDecision (edAward aw) c →
    Elements.UnsubmittedMatterDoesNotAffectMerits aw c

axiom corr_ed_s11_form {aw : Elements.Award} {c : ComplaintText} :
    Elements.FormImperfectionGround aw c →
    Deontic.AwardImperfectInFormNotAffectingMerits (edAward aw) c


theorem s11_ground_elements_to_deontic {aw : Elements.Award} {c : ComplaintText}
    (g : Elements.ModificationGround11 aw c) : Deontic.Section11Ground (edAward aw) c :=
  match g with
  | .miscalculation h => .evidentMiscalculationOrMistake (corr_ed_s11_miscalc h)
  | .mistakenDescription h => .evidentMiscalculationOrMistake (corr_ed_s11_mistake h)
  | .unsubmittedMatter h =>
      .matterNotSubmitted (corr_ed_s11_unsubmitted h.unsubmitted)
        (fun hx => h.exceptionInapplicable (corr_ed_s11_proviso hx))
  | .formImperfection h => .imperfectInForm (corr_ed_s11_form h)


theorem s11_elements_implies_deontic {ct : Deontic.Court} {p : Person}
    {aw : Elements.Award} {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section11 p aw app c) :
    Deontic.Power11Modify ct p (edAward aw) c where
  addressee := pre_forum
  forum := corr_ed_s11_forum pre_forum h.venue
  applicantIsParty := corr_ed_party h.byParty
  application := corr_ed_s11_application h.byParty h.venue
  ground := s11_ground_elements_to_deontic h.ground


axiom corr_dp_s11_application {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.ApplicationToModifyByParty p aw c →
    Procedure.ApplicationToModifyOrCorrectAwardMade (dpAward aw) c

axiom corr_dp_s11_miscalc {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.EvidentMaterialMiscalculationOrMistake aw c →
    Procedure.EvidentMaterialMiscalculationOrMistakeInDescription (dpAward aw) c
axiom corr_dp_s11_unsubmitted {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.AwardUponMatterNotSubmitted aw c →
    Procedure.AwardUponMatterNotSubmitted (dpAward aw) c
axiom corr_pd_s11_proviso_back {aw : Deontic.Award} {c : ComplaintText} :
    Procedure.MatterNotAffectingMeritsOfDecision (dpAward aw) c →
    Deontic.MatterNotAffectingMeritsOfDecision aw c
axiom corr_dp_s11_form {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.AwardImperfectInFormNotAffectingMerits aw c →
    Procedure.AwardImperfectInFormNotAffectingMerits (dpAward aw) c


theorem s11_deontic_implies_procedure {ct : Deontic.Court} {p : Person}
    {aw : Deontic.Award} {c : ComplaintText} (h : Deontic.Power11Modify ct p aw c) :
    Procedure.OrderModifyingAward (dpAward aw) c where
  awardMade := corr_dp_s10_award_made h.forum
  venue := corr_dp_s10_venue h.forum
  application := corr_dp_s11_application h.application
  ground :=
    match h.ground with
    | .evidentMiscalculationOrMistake hg => .miscalculation (corr_dp_s11_miscalc hg)
    | .matterNotSubmitted hg hp =>
        .matterNotSubmitted (corr_dp_s11_unsubmitted hg)
          (fun hx => hp (corr_pd_s11_proviso_back hx))
    | .imperfectInForm hg => .imperfectForm (corr_dp_s11_form hg)


axiom corr_do_s11_miscalc {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.EvidentMaterialMiscalculationOrMistake aw c →
    Ontology.IsEvidentMaterialMiscalculationOrMistakeInDescription (doAward aw) c

axiom corr_do_s11_unsubmitted {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.AwardUponMatterNotSubmitted aw c →
    Ontology.IsAwardUponMatterNotSubmitted (doAward aw) c


axiom corr_do_s11_proviso {aw : Deontic.Award} {c : ComplaintText} :
    ¬ Deontic.MatterNotAffectingMeritsOfDecision aw c →
    Ontology.IsMatterAffectingTheMeritsOfTheDecision (doAward aw) c

axiom corr_do_s11_form {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.AwardImperfectInFormNotAffectingMerits aw c →
    Ontology.IsAwardImperfectInMatterOfForm (doAward aw) c


theorem s11_deontic_implies_ontology {ct : Deontic.Court} {p : Person}
    {aw : Deontic.Award} {c : ComplaintText} (h : Deontic.Power11Modify ct p aw c) :
    Ontology.Section11ModificationGround (doAward aw) c :=
  match h.ground with
  | .evidentMiscalculationOrMistake hg =>
      .miscalculationOrMistake (corr_do_s11_miscalc hg)
  | .matterNotSubmitted hg hp =>
      .matterNotSubmitted (corr_do_s11_unsubmitted hg) (corr_do_s11_proviso hp)
  | .imperfectInForm hg => .imperfectForm (corr_do_s11_form hg)


axiom corr_po_s11_miscalc {a : Procedure.Award} {c : ComplaintText} :
    Procedure.EvidentMaterialMiscalculationOrMistakeInDescription a c →
    Ontology.IsEvidentMaterialMiscalculationOrMistakeInDescription (poAward a) c

axiom corr_po_s11_unsubmitted {a : Procedure.Award} {c : ComplaintText} :
    Procedure.AwardUponMatterNotSubmitted a c →
    Ontology.IsAwardUponMatterNotSubmitted (poAward a) c

axiom corr_po_s11_proviso {a : Procedure.Award} {c : ComplaintText} :
    ¬ Procedure.MatterNotAffectingMeritsOfDecision a c →
    Ontology.IsMatterAffectingTheMeritsOfTheDecision (poAward a) c

axiom corr_po_s11_form {a : Procedure.Award} {c : ComplaintText} :
    Procedure.AwardImperfectInFormNotAffectingMerits a c →
    Ontology.IsAwardImperfectInMatterOfForm (poAward a) c


theorem s11_procedure_implies_ontology {a : Procedure.Award} {c : ComplaintText}
    (h : Procedure.OrderModifyingAward a c) :
    Ontology.Section11ModificationGround (poAward a) c :=
  match h.ground with
  | .miscalculation hg => .miscalculationOrMistake (corr_po_s11_miscalc hg)
  | .matterNotSubmitted hg hp =>
      .matterNotSubmitted (corr_po_s11_unsubmitted hg) (corr_po_s11_proviso hp)
  | .imperfectForm hg => .imperfectForm (corr_po_s11_form hg)


theorem s11_elements_implies_procedure {ct : Deontic.Court} {p : Person}
    {aw : Elements.Award} {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section11 p aw app c) :
    Procedure.OrderModifyingAward (dpAward (edAward aw)) c :=
  s11_deontic_implies_procedure (s11_elements_implies_deontic pre_forum h)


theorem s11_elements_implies_ontology {ct : Deontic.Court} {p : Person}
    {aw : Elements.Award} {app : Elements.CourtApplication} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c)
    (h : Elements.Section11 p aw app c) :
    Ontology.Section11ModificationGround (doAward (edAward aw)) c :=
  s11_deontic_implies_ontology (s11_elements_implies_deontic pre_forum h)




axiom corr_ep_s12_award_filed {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} :
    Elements.NoticeOfMotionToVacateModifyOrCorrectServed app c →
    Procedure.AwardFiledOrDelivered (epAward aw) c

axiom corr_ep_s12_served {app : Elements.CourtApplication} {aw : Elements.Award}
    {c : ComplaintText} :
    Elements.NoticeOfMotionToVacateModifyOrCorrectServed app c →
    Procedure.NoticeOfVacaturMotionServedOnAdverseParty (epAward aw) c

axiom corr_ep_s12_days {app : Elements.CourtApplication} {aw : Elements.Award}
    {c : ComplaintText} :
    Elements.NoticeOfMotionToVacateModifyOrCorrectServed app c →
    Procedure.daysFromAwardFilingToVacaturNoticeService (epAward aw) c
      ≤ Elements.daysFromAwardFiledToNoticeService app c


axiom corr_ep_s12_window {aw : Elements.Award} {c : ComplaintText} :
    90 ≤ Procedure.daysInStatutoryThreeMonthsAfterAwardFiling (epAward aw) c


theorem s12_elements_implies_procedure {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} (h : Elements.Section12 app c) :
    Procedure.TimelyVacaturNotice (epParty app) (epAward aw) c where
  awardFiled := corr_ep_s12_award_filed h.noticed
  served := corr_ep_s12_served h.noticed
  service := s12_service_elements_to_procedure h.serviceManner
  timely := by
    show Procedure.daysFromAwardFilingToVacaturNoticeService (epAward aw) c
      ≤ Procedure.daysInStatutoryThreeMonthsAfterAwardFiling (epAward aw) c
    have hd : Procedure.daysFromAwardFilingToVacaturNoticeService (epAward aw) c
        ≤ Elements.daysFromAwardFiledToNoticeService app c := corr_ep_s12_days h.noticed
    have hw : 90 ≤ Procedure.daysInStatutoryThreeMonthsAfterAwardFiling (epAward aw) c :=
      corr_ep_s12_window
    have ht : Elements.daysFromAwardFiledToNoticeService app c ≤ 90 := h.timely
    omega


axiom corr_ed_s12_motion {p : Person} {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} :
    Elements.NoticeOfMotionToVacateModifyOrCorrectServed app c →
    Deontic.MotionToVacateModifyOrCorrectMade p (edAward aw) c

axiom corr_ed_s12_timely {p : Person} {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} :
    Elements.NoticeOfMotionToVacateModifyOrCorrectServed app c →
    Elements.WithinLimitationsThreeMonthsOfAward app c →
    Deontic.NoticeOfMotionServedWithinThreeMonths p (edAward aw) c


theorem s12_elements_implies_deontic {p : Person} {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} (h : Elements.Section12 app c) :
    Deontic.Obligation12NoticeComplied p (edAward aw) c :=
  ⟨{ motionMade := corr_ed_s12_motion h.noticed },
   corr_ed_s12_timely h.noticed h.timely⟩


axiom corr_eo_s12_notice {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.NoticeOfMotionToVacateModifyOrCorrectServed app c →
    Ontology.IsNoticeOfMotionToVacateModifyOrCorrect (eoNotice app) c

axiom corr_eo_s12_adverse {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.Section12ServiceManner app c → Ontology.IsAdverseParty (eoAdverse app) c

axiom corr_eo_s12_timely {app : Elements.CourtApplication} {aw : Elements.Award}
    {c : ComplaintText} :
    Elements.NoticeOfMotionToVacateModifyOrCorrectServed app c →
    Elements.WithinLimitationsThreeMonthsOfAward app c →
    Ontology.IsWithinThreeMonthsAfterAwardFiledOrDelivered (eoNotice app) (eoAward aw) c


theorem s12_elements_implies_ontology {app : Elements.CourtApplication}
    {aw : Elements.Award} {c : ComplaintText} (h : Elements.Section12 app c) :
    Ontology.Section12TimelyNotice (eoAward aw) (eoNotice app) (eoAdverse app) c where
  notice := corr_eo_s12_notice h.noticed
  adverse := corr_eo_s12_adverse h.serviceManner
  timely := corr_eo_s12_timely h.noticed h.timely


axiom corr_pd_s12_motion {p : Person} {a : Procedure.Award} {c : ComplaintText} :
    Procedure.NoticeOfVacaturMotionServedOnAdverseParty a c →
    Deontic.MotionToVacateModifyOrCorrectMade p (pdAward a) c

axiom corr_pd_s12_timely {p : Person} {a : Procedure.Award} {c : ComplaintText} :
    Procedure.NoticeOfVacaturMotionServedOnAdverseParty a c →
    Procedure.VacaturNoticeWithinThreeMonths a c →
    Deontic.NoticeOfMotionServedWithinThreeMonths p (pdAward a) c


theorem s12_procedure_implies_deontic {p : Person} {a : Procedure.Award}
    {c : ComplaintText} (h : Procedure.TimelyVacaturNotice p a c) :
    Deontic.Obligation12NoticeComplied p (pdAward a) c :=
  ⟨{ motionMade := corr_pd_s12_motion h.served },
   corr_pd_s12_timely h.served h.timely⟩


axiom corr_do_s12_notice {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.MotionToVacateModifyOrCorrectMade p aw c →
    Ontology.IsNoticeOfMotionToVacateModifyOrCorrect (doNoticeOf p) c


axiom corr_do_s12_adverse {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.NoticeOfMotionServedWithinThreeMonths p aw c →
    Ontology.IsAdverseParty (doAdverseOf p) c

axiom corr_do_s12_timely {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.NoticeOfMotionServedWithinThreeMonths p aw c →
    Ontology.IsWithinThreeMonthsAfterAwardFiledOrDelivered (doNoticeOf p) (doAward aw) c


theorem s12_deontic_implies_ontology {p : Person} {aw : Deontic.Award}
    {c : ComplaintText} (h : Deontic.Obligation12NoticeComplied p aw c) :
    Ontology.Section12TimelyNotice (doAward aw) (doNoticeOf p) (doAdverseOf p) c where
  notice := corr_do_s12_notice h.1.motionMade
  adverse := corr_do_s12_adverse h.2
  timely := corr_do_s12_timely h.2


theorem s12_procedure_implies_ontology {p : Person} {a : Procedure.Award}
    {c : ComplaintText} (h : Procedure.TimelyVacaturNotice p a c) :
    Ontology.Section12TimelyNotice (doAward (pdAward a)) (doNoticeOf p)
      (doAdverseOf p) c :=
  s12_deontic_implies_ontology (s12_procedure_implies_deontic h)




axiom epAwardOfApp : Elements.CourtApplication → Procedure.Award

axiom pdMoverOf : Procedure.Award → Person

axiom doOrderOf : Person → Ontology.CourtOrder


axiom corr_ep_s13_agreement {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.FiledAgreementAppointmentAndExtensions app c →
    Procedure.MovingPartyFiledAgreementAppointmentAndExtensions (epAwardOfApp app) c

axiom corr_ep_s13_award {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.FiledTheAward app c →
    Procedure.MovingPartyFiledAward (epAwardOfApp app) c

axiom corr_ep_s13_orders {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.FiledApplicationPapersAndCourtOrders app c →
    Procedure.MovingPartyFiledNoticesAffidavitsAndOrders (epAwardOfApp app) c

axiom corr_ep_s13_timing {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.PapersFiledWhenOrderFiledForEntryOfJudgment app c →
    Procedure.PapersFiledAtTimeOrderFiledForEntryOfJudgment (epAwardOfApp app) c


theorem s13_elements_implies_procedure {app : Elements.CourtApplication}
    {c : ComplaintText} (h : Elements.Section13 app c) :
    Procedure.PapersFiledOnMotion (epAwardOfApp app) c where
  agreementAndAppointments := corr_ep_s13_agreement h.agreementPapers
  award := corr_ep_s13_award h.award
  noticesAndOrders := corr_ep_s13_orders h.applicationPapers
  atTimeOfFiling := corr_ep_s13_timing h.atEntryOfJudgment


axiom corr_pd_s13_mover {a : Procedure.Award} {c : ComplaintText} :
    Procedure.PapersFiledAtTimeOrderFiledForEntryOfJudgment a c →
    Deontic.IsMovingPartyForAwardOrder (pdMoverOf a) (pdAward a) c

axiom corr_pd_s13_order_filed {a : Procedure.Award} {c : ComplaintText} :
    Procedure.PapersFiledAtTimeOrderFiledForEntryOfJudgment a c →
    Deontic.OrderFiledWithClerkForEntryOfJudgment (pdMoverOf a) (pdAward a) c

axiom corr_pd_s13_agreement {a : Procedure.Award} {c : ComplaintText} :
    Procedure.MovingPartyFiledAgreementAppointmentAndExtensions a c →
    Deontic.FiledAgreementAppointmentAndExtensionPapers (pdMoverOf a) c

axiom corr_pd_s13_award {a : Procedure.Award} {c : ComplaintText} :
    Procedure.MovingPartyFiledAward a c →
    Deontic.FiledAward (pdMoverOf a) (pdAward a) c

axiom corr_pd_s13_orders {a : Procedure.Award} {c : ComplaintText} :
    Procedure.MovingPartyFiledNoticesAffidavitsAndOrders a c →
    Deontic.FiledApplicationPapersAndCourtOrders (pdMoverOf a) c


theorem s13_procedure_implies_deontic {a : Procedure.Award} {c : ComplaintText}
    (h : Procedure.PapersFiledOnMotion a c) :
    Deontic.Obligation13FilePapersComplied (pdMoverOf a) (pdAward a) c :=
  ⟨{ addressee := corr_pd_s13_mover h.atTimeOfFiling
     orderFiled := corr_pd_s13_order_filed h.atTimeOfFiling },
   { agreementAndAppointments := corr_pd_s13_agreement h.agreementAndAppointments
     award := corr_pd_s13_award h.award
     applicationPapers := corr_pd_s13_orders h.noticesAndOrders }⟩



axiom corr_do_s13_order {p : Person} {aw : Deontic.Award} {c : ComplaintText} :
    Deontic.IsMovingPartyForAwardOrder p aw c →
    Ontology.IsOrderConfirmingAward (doOrderOf p) c
    ∨ Ontology.IsOrderModifyingOrCorrectingAward (doOrderOf p) c


axiom corr_do_s13_docketed {ct : Deontic.Court} {p : Person} {aw : Deontic.Award}
    {c : ComplaintText} :
    Deontic.OrderFiledWithClerkForEntryOfJudgment p aw c →
    Deontic.JudgmentDocketedAsIfRenderedInAnAction ct aw c →
    Ontology.IsJudgmentDocketedAsInAnAction (doJudgmentOf p) c




theorem s13_deontic_implies_ontology {ct : Deontic.Court} {p : Person}
    {aw : Deontic.Award} {c : ComplaintText}
    (h : Deontic.Obligation13FilePapersComplied p aw c)
    (aux_docket : Deontic.Obligation13DocketComplied ct p aw c) :
    Ontology.Section13EnteredJudgment (doJudgmentOf p) (doOrderOf p) c where
  order := corr_do_s13_order h.1.addressee
  docketed := corr_do_s13_docketed h.1.orderFiled aux_docket.2


theorem s13_elements_implies_deontic {app : Elements.CourtApplication}
    {c : ComplaintText} (h : Elements.Section13 app c) :
    Deontic.Obligation13FilePapersComplied (pdMoverOf (epAwardOfApp app))
      (pdAward (epAwardOfApp app)) c :=
  s13_procedure_implies_deontic (s13_elements_implies_procedure h)


axiom eoOrderOfApp : Elements.CourtApplication → Ontology.CourtOrder

axiom poJudgment : Procedure.Award → Ontology.Judgment

axiom poOrderOfAward : Procedure.Award → Ontology.CourtOrder


axiom corr_eo_s13_order {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.MovingForOrderConfirmingModifyingOrCorrecting app c →
    Ontology.IsOrderConfirmingAward (eoOrderOfApp app) c
    ∨ Ontology.IsOrderModifyingOrCorrectingAward (eoOrderOfApp app) c

axiom corr_eo_s13_docketed {app : Elements.CourtApplication} {c : ComplaintText} :
    Elements.JudgmentDocketedAsIfRenderedInAnAction app c →
    Ontology.IsJudgmentDocketedAsInAnAction (eoJudgment app) c


theorem s13_elements_implies_ontology {app : Elements.CourtApplication}
    {c : ComplaintText} (h : Elements.Section13Judgment app c) :
    Ontology.Section13EnteredJudgment (eoJudgment app) (eoOrderOfApp app) c where
  order := corr_eo_s13_order h.filings.moving
  docketed := corr_eo_s13_docketed h.docketed


axiom corr_po_s13_confirming {p : Person} {a : Procedure.Award}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Procedure.ConfirmationOfAward p a ag c →
    Ontology.IsOrderConfirmingAward (poOrderOfAward a) c

axiom corr_po_s13_modifying {a : Procedure.Award} {c : ComplaintText} :
    Procedure.OrderModifyingAward a c →
    Ontology.IsOrderModifyingOrCorrectingAward (poOrderOfAward a) c

axiom corr_po_s13_docketed {a : Procedure.Award} {c : ComplaintText} :
    Procedure.JudgmentDocketedAsIfRenderedInAnAction a c →
    Ontology.IsJudgmentDocketedAsInAnAction (poJudgment a) c


theorem s13_procedure_implies_ontology {p : Person} {a : Procedure.Award}
    {ag : Procedure.ArbitrationAgreement} {c : ComplaintText}
    (h : Procedure.JudgmentOnAward p a ag c) :
    Ontology.Section13EnteredJudgment (poJudgment a) (poOrderOfAward a) c where
  order :=
    match h.order with
    | .confirming hc => Or.inl (corr_po_s13_confirming hc)
    | .modifying hm => Or.inr (corr_po_s13_modifying hm)
  docketed := corr_po_s13_docketed h.docketed
















axiom poContract : Procedure.ArbitrationAgreement → Ontology.Contract



theorem s14_elements_implies_procedure {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} (h : Elements.Section14TitleApplies ag c) :
    Procedure.ContractWithinTemporalScope (epAg ag) c := by
  show 1926 ≤ Procedure.yearContractMade (epAg ag) c
  have hy : Elements.yearOfContractFormation ag c
      = Procedure.yearContractMade (epAg ag) c := corr_ep_year_eq
  have h0 : 1926 ≤ Elements.yearOfContractFormation ag c := h
  omega



axiom corr_ed_s14_pre1926 {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Deontic.ContractMadeBeforeJanuary1926 (edContract ag) c →
    Elements.yearOfContractFormation ag c < 1926

axiom corr_eo_s14_pre1926 {ag : Elements.ArbitrationAgreement} {c : ComplaintText} :
    Ontology.IsContractMadePriorToJanuary1_1926 (eoContract ag) c →
    Elements.yearOfContractFormation ag c < 1926

axiom corr_po_s14_pre1926 {ag : Procedure.ArbitrationAgreement} {c : ComplaintText} :
    Ontology.IsContractMadePriorToJanuary1_1926 (poContract ag) c →
    Procedure.yearContractMade ag c < 1926




theorem s14_elements_implies_deontic {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} (h : Elements.Section14TitleApplies ag c) :
    ¬ Deontic.Definition14PriorContracts (edContract ag) c := by
  intro hPre
  have hlt : Elements.yearOfContractFormation ag c < 1926 :=
    corr_ed_s14_pre1926 hPre.madeBeforeCutoff
  have h0 : 1926 ≤ Elements.yearOfContractFormation ag c := h
  omega


theorem s14_elements_implies_ontology {ag : Elements.ArbitrationAgreement}
    {c : ComplaintText} (h : Elements.Section14TitleApplies ag c) :
    ¬ Ontology.Section14ExcludedContract (eoContract ag) c := by
  intro hPre
  have hlt : Elements.yearOfContractFormation ag c < 1926 :=
    corr_eo_s14_pre1926 hPre.preAct
  have h0 : 1926 ≤ Elements.yearOfContractFormation ag c := h
  omega


theorem s14_procedure_implies_deontic {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} (h : Procedure.ContractWithinTemporalScope ag c) :
    ¬ Deontic.Definition14PriorContracts (pdContract ag) c := by
  intro hPre
  have hlt : Procedure.yearContractMade ag c < 1926 :=
    corr_dp_pre1926_year hPre.madeBeforeCutoff
  have h0 : 1926 ≤ Procedure.yearContractMade ag c := h
  omega


theorem s14_procedure_implies_ontology {ag : Procedure.ArbitrationAgreement}
    {c : ComplaintText} (h : Procedure.ContractWithinTemporalScope ag c) :
    ¬ Ontology.Section14ExcludedContract (poContract ag) c := by
  intro hPre
  have hlt : Procedure.yearContractMade ag c < 1926 :=
    corr_po_s14_pre1926 hPre.preAct
  have h0 : 1926 ≤ Procedure.yearContractMade ag c := h
  omega




axiom corr_do_s14_pre1926 {k : Deontic.Contract} {c : ComplaintText} :
    Deontic.ContractMadeBeforeJanuary1926 k c →
    Ontology.IsContractMadePriorToJanuary1_1926 (doContract k) c


theorem s14_deontic_implies_ontology {k : Deontic.Contract} {c : ComplaintText}
    (h : Deontic.Definition14PriorContracts k c) :
    Ontology.Section14ExcludedContract (doContract k) c where
  preAct := corr_do_s14_pre1926 h.madeBeforeCutoff










axiom epRelief : Elements.ReliefRequest → Person

axiom eoProcOfRelief : Elements.ReliefRequest → Ontology.Proceeding

axiom doAgOfCourt : Deontic.Court → Ontology.ArbitrationAgreement

axiom doAwardOfCourt : Deontic.Court → Ontology.Award

axiom doJudgmentOfCourt : Deontic.Court → Ontology.Judgment

axiom doProcOfCourt : Deontic.Court → Ontology.Proceeding

axiom dpPartyOfCourt : Deontic.Court → Person

axiom opPartyOfProc : Ontology.Proceeding → Person



axiom corr_ed_s15_matter {r : Elements.ReliefRequest} {c : ComplaintText} :
    Elements.Section15Relief r c →
    Deontic.MatterIsArbitralEnforcementConfirmationOrExecution c

axiom corr_ed_s15_refused {ct : Deontic.Court} {r : Elements.ReliefRequest}
    {c : ComplaintText} :
    Deontic.IsUnitedStatesCourt ct c →
    Elements.RefusalRestsOnActOfStateDoctrine r c →
    Deontic.CourtRefusedOnActOfStateGround ct c


theorem s15_elements_implies_deontic {ct : Deontic.Court}
    {r : Elements.ReliefRequest} {c : ComplaintText}
    (pre_forum : Deontic.IsUnitedStatesCourt ct c) (h : Elements.Section15 r c) :
    Deontic.Prohibition15ActOfStateViolated ct c :=
  ⟨{ addressee := pre_forum, arbitralMatter := corr_ed_s15_matter h.relief },
   corr_ed_s15_refused pre_forum h.actOfStateGround⟩


axiom corr_eo_s15_agreement {r : Elements.ReliefRequest} {c : ComplaintText} :
    Elements.SeeksEnforcementOfArbitralAgreement r c →
    Ontology.IsArbitralAgreement (eoReliefAg r) c

axiom corr_eo_s15_award {r : Elements.ReliefRequest} {c : ComplaintText} :
    Elements.SeeksConfirmationOfArbitralAward r c →
    Ontology.IsArbitralAward (eoReliefAward r) c

axiom corr_eo_s15_execution {r : Elements.ReliefRequest} {c : ComplaintText} :
    Elements.SeeksExecutionUponJudgmentConfirmingAward r c →
    Ontology.IsExecutionUponJudgmentBasedOnOrderConfirmingAward (eoReliefJudgment r) c

axiom corr_eo_s15_ground {r : Elements.ReliefRequest} {c : ComplaintText} :
    Elements.RefusalRestsOnActOfStateDoctrine r c →
    Ontology.IsActOfStateDoctrineGroundAsserted (eoProcOfRelief r) c


theorem s15_elements_implies_ontology {r : Elements.ReliefRequest}
    {c : ComplaintText} (h : Elements.Section15 r c) :
    Ontology.Section15ActOfStateConfiguration (eoReliefAg r) (eoReliefAward r)
      (eoReliefJudgment r) (eoProcOfRelief r) c where
  subject :=
    match h.relief with
    | .enforcement hg => .arbitralAgreementEnforcement (corr_eo_s15_agreement hg)
    | .confirmation hg => .arbitralAwardConfirmation (corr_eo_s15_award hg)
    | .execution hg => .executionOnConfirmingJudgment (corr_eo_s15_execution hg)
  groundAsserted := corr_eo_s15_ground h.actOfStateGround



axiom corr_do_s15_subject {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.MatterIsArbitralEnforcementConfirmationOrExecution c →
    Ontology.IsArbitralAgreement (doAgOfCourt ct) c

axiom corr_do_s15_ground {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.CourtRefusedOnActOfStateGround ct c →
    Ontology.IsActOfStateDoctrineGroundAsserted (doProcOfCourt ct) c


theorem s15_deontic_implies_ontology {ct : Deontic.Court} {c : ComplaintText}
    (h : Deontic.Prohibition15ActOfStateViolated ct c) :
    Ontology.Section15ActOfStateConfiguration (doAgOfCourt ct) (doAwardOfCourt ct)
      (doJudgmentOfCourt ct) (doProcOfCourt ct) c where
  subject := .arbitralAgreementEnforcement (corr_do_s15_subject h.1.arbitralMatter)
  groundAsserted := corr_do_s15_ground h.2



axiom corr_ep_s15_sought {r : Elements.ReliefRequest} {c : ComplaintText} :
    Elements.Section15Relief r c →
    Procedure.EnforcementOrConfirmationOrExecutionSought (epRelief r) c

axiom corr_ep_s15_refused {r : Elements.ReliefRequest} {c : ComplaintText} :
    Elements.RefusalRestsOnActOfStateDoctrine r c →
    Procedure.RefusalRestedOnActOfStateDoctrine (epRelief r) c




theorem s15_elements_implies_procedure {r : Elements.ReliefRequest}
    {c : ComplaintText} (h : Elements.Section15 r c) :
    ¬ Procedure.ActOfStateNotAGroundForRefusal (epRelief r) c := by
  intro hNorm
  exact hNorm (corr_ep_s15_sought h.relief) (corr_ep_s15_refused h.actOfStateGround)


axiom corr_dp_s15_sought {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.MatterIsArbitralEnforcementConfirmationOrExecution c →
    Procedure.EnforcementOrConfirmationOrExecutionSought (dpPartyOfCourt ct) c

axiom corr_dp_s15_refused {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.CourtRefusedOnActOfStateGround ct c →
    Procedure.RefusalRestedOnActOfStateDoctrine (dpPartyOfCourt ct) c


theorem s15_deontic_implies_procedure {ct : Deontic.Court} {c : ComplaintText}
    (h : Deontic.Prohibition15ActOfStateViolated ct c) :
    ¬ Procedure.ActOfStateNotAGroundForRefusal (dpPartyOfCourt ct) c := by
  intro hNorm
  exact hNorm (corr_dp_s15_sought h.1.arbitralMatter) (corr_dp_s15_refused h.2)


axiom corr_op_s15_sought {a : Ontology.ArbitrationAgreement} {w : Ontology.Award}
    {j : Ontology.Judgment} {pr : Ontology.Proceeding} {c : ComplaintText} :
    Ontology.Section15ProtectedSubject a w j c →
    Procedure.EnforcementOrConfirmationOrExecutionSought (opPartyOfProc pr) c

axiom corr_op_s15_refused {pr : Ontology.Proceeding} {c : ComplaintText} :
    Ontology.IsActOfStateDoctrineGroundAsserted pr c →
    Procedure.RefusalRestedOnActOfStateDoctrine (opPartyOfProc pr) c


theorem s15_ontology_implies_procedure {a : Ontology.ArbitrationAgreement}
    {w : Ontology.Award} {j : Ontology.Judgment} {pr : Ontology.Proceeding}
    {c : ComplaintText} (h : Ontology.Section15ActOfStateConfiguration a w j pr c) :
    ¬ Procedure.ActOfStateNotAGroundForRefusal (opPartyOfProc pr) c := by
  intro hNorm
  exact hNorm (corr_op_s15_sought h.subject) (corr_op_s15_refused h.groundAsserted)












axiom corr_eo_s16_refusing {o : Elements.CourtOrder} {c : ComplaintText} :
    Elements.OrderRefusingStayUnderSection3 o c →
    Ontology.IsOrderRefusingStayUnderSection3 (eoOrder o) c

axiom corr_eo_s16_denying4 {o : Elements.CourtOrder} {c : ComplaintText} :
    Elements.OrderDenyingPetitionUnderSection4 o c →
    Ontology.IsOrderDenyingPetitionUnderSection4 (eoOrder o) c

axiom corr_eo_s16_denying206 {o : Elements.CourtOrder} {c : ComplaintText} :
    Elements.OrderDenyingApplicationUnderSection206 o c →
    Ontology.IsOrderDenyingApplicationUnderSection206 (eoOrder o) c

axiom corr_eo_s16_confirmation {o : Elements.CourtOrder} {c : ComplaintText} :
    Elements.OrderConfirmingOrDenyingConfirmationOfAward o c →
    Ontology.IsOrderConfirmingOrDenyingConfirmationOfAward (eoOrder o) c

axiom corr_eo_s16_modifying {o : Elements.CourtOrder} {c : ComplaintText} :
    Elements.OrderModifyingCorrectingOrVacatingAward o c →
    Ontology.IsOrderModifyingCorrectingOrVacatingAward (eoOrder o) c

axiom corr_eo_s16_injunction {o : Elements.CourtOrder} {c : ComplaintText} :
    Elements.OrderGrantingContinuingOrModifyingInjunctionAgainstArbitration o c →
    Ontology.IsInterlocutoryOrderEnjoiningArbitration (eoOrder o) c

axiom corr_eo_s16_final {o : Elements.CourtOrder} {c : ComplaintText} :
    Elements.FinalDecisionWithRespectToArbitration o c →
    Ontology.IsFinalDecisionWithRespectToArbitration (eoOrder o) c

axiom corr_eo_s16_subject {o : Elements.CourtOrder} {c : ComplaintText} :
    Elements.ArbitrationSubjectToThisTitle o c →
    Ontology.IsArbitrationSubjectToThisTitle (eoProcOfOrder o) c


theorem s16_elements_implies_ontology {o : Elements.CourtOrder} {c : ComplaintText}
    (h : Elements.AppealableOrder16a o c) :
    Ontology.Section16AppealableOrder (eoOrder o) (eoProcOfOrder o) c :=
  match h with
  | .refusingStay hg => .refusingStayUnderSection3 (corr_eo_s16_refusing hg)
  | .denyingSection4Petition hg => .denyingPetitionUnderSection4 (corr_eo_s16_denying4 hg)
  | .denyingSection206Application hg =>
      .denyingApplicationUnderSection206 (corr_eo_s16_denying206 hg)
  | .confirmationRuling hg => .confirmingOrDenyingConfirmation (corr_eo_s16_confirmation hg)
  | .modifyingOrVacating hg => .modifyingCorrectingOrVacating (corr_eo_s16_modifying hg)
  | .injunctionAgainstArbitration hg hs =>
      .interlocutoryInjunction (corr_eo_s16_injunction hg) (corr_eo_s16_subject hs)
  | .finalDecision hg hs =>
      .finalDecision (corr_eo_s16_final hg) (corr_eo_s16_subject hs)


axiom corr_od_s16_refusing {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderRefusingStayUnderSection3 o c →
    Deontic.OrderRefusingStayUnderSection3 (odOrder o) c
axiom corr_od_s16_denying4 {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderDenyingPetitionUnderSection4 o c →
    Deontic.OrderDenyingPetitionUnderSection4 (odOrder o) c
axiom corr_od_s16_denying206 {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderDenyingApplicationUnderSection206 o c →
    Deontic.OrderDenyingApplicationUnderSection206 (odOrder o) c
axiom corr_od_s16_confirmation {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderConfirmingOrDenyingConfirmationOfAward o c →
    Deontic.OrderConfirmingOrDenyingConfirmationOfAward (odOrder o) c
axiom corr_od_s16_modifying {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderModifyingCorrectingOrVacatingAward o c →
    Deontic.OrderModifyingCorrectingOrVacatingAward (odOrder o) c


axiom corr_od_s16_injunction {o : Ontology.CourtOrder} {pr : Ontology.Proceeding}
    {c : ComplaintText} :
    Ontology.IsInterlocutoryOrderEnjoiningArbitration o c →
    Ontology.IsArbitrationSubjectToThisTitle pr c →
    Deontic.InterlocutoryOrderOnInjunctionAgainstArbitration (odOrder o) c

axiom corr_od_s16_final {o : Ontology.CourtOrder} {pr : Ontology.Proceeding}
    {c : ComplaintText} :
    Ontology.IsFinalDecisionWithRespectToArbitration o c →
    Ontology.IsArbitrationSubjectToThisTitle pr c →
    Deontic.FinalDecisionWithRespectToArbitration (odOrder o) c


theorem s16_ontology_implies_deontic {o : Ontology.CourtOrder}
    {pr : Ontology.Proceeding} {c : ComplaintText}
    (h : Ontology.Section16AppealableOrder o pr c) :
    Deontic.Section16aAppealableOrder (odOrder o) c :=
  match h with
  | .refusingStayUnderSection3 hg => .refusingStayUnderSection3 (corr_od_s16_refusing hg)
  | .denyingPetitionUnderSection4 hg => .denyingPetitionUnderSection4 (corr_od_s16_denying4 hg)
  | .denyingApplicationUnderSection206 hg =>
      .denyingApplicationUnderSection206 (corr_od_s16_denying206 hg)
  | .confirmingOrDenyingConfirmation hg =>
      .confirmingOrDenyingConfirmation (corr_od_s16_confirmation hg)
  | .modifyingCorrectingOrVacating hg =>
      .modifyingCorrectingOrVacating (corr_od_s16_modifying hg)
  | .interlocutoryInjunction hg hs =>
      .injunctionAgainstArbitration (corr_od_s16_injunction hg hs)
  | .finalDecision hg hs => .finalDecision (corr_od_s16_final hg hs)


axiom corr_op_s16_refusing {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderRefusingStayUnderSection3 o c →
    Procedure.OrderRefusingStayUnderSection3 (opOrder o) c
axiom corr_op_s16_denying4 {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderDenyingPetitionUnderSection4 o c →
    Procedure.OrderDenyingPetitionUnderSection4 (opOrder o) c
axiom corr_op_s16_denying206 {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderDenyingApplicationUnderSection206 o c →
    Procedure.OrderDenyingApplicationUnderSection206 (opOrder o) c
axiom corr_op_s16_confirmation {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderConfirmingOrDenyingConfirmationOfAward o c →
    Procedure.OrderConfirmingOrDenyingConfirmationOfAward (opOrder o) c
axiom corr_op_s16_modifying {o : Ontology.CourtOrder} {c : ComplaintText} :
    Ontology.IsOrderModifyingCorrectingOrVacatingAward o c →
    Procedure.OrderModifyingCorrectingOrVacatingAward (opOrder o) c
axiom corr_op_s16_injunction {o : Ontology.CourtOrder} {pr : Ontology.Proceeding}
    {c : ComplaintText} :
    Ontology.IsInterlocutoryOrderEnjoiningArbitration o c →
    Ontology.IsArbitrationSubjectToThisTitle pr c →
    Procedure.InterlocutoryOrderEnjoiningArbitration (opOrder o) c
axiom corr_op_s16_final {o : Ontology.CourtOrder} {pr : Ontology.Proceeding}
    {c : ComplaintText} :
    Ontology.IsFinalDecisionWithRespectToArbitration o c →
    Ontology.IsArbitrationSubjectToThisTitle pr c →
    Procedure.FinalDecisionWithRespectToArbitration (opOrder o) c


theorem s16_ontology_implies_procedure {o : Ontology.CourtOrder}
    {pr : Ontology.Proceeding} {c : ComplaintText}
    (h : Ontology.Section16AppealableOrder o pr c) :
    Procedure.AppealableOrder (opOrder o) c :=
  match h with
  | .refusingStayUnderSection3 hg => .refusingStay (corr_op_s16_refusing hg)
  | .denyingPetitionUnderSection4 hg => .denyingCompelPetition (corr_op_s16_denying4 hg)
  | .denyingApplicationUnderSection206 hg => .denyingSection206 (corr_op_s16_denying206 hg)
  | .confirmingOrDenyingConfirmation hg => .confirmationRuling (corr_op_s16_confirmation hg)
  | .modifyingCorrectingOrVacating hg => .vacaturOrModification (corr_op_s16_modifying hg)
  | .interlocutoryInjunction hg hs =>
      .injunctionAgainstArbitration (corr_op_s16_injunction hg hs)
  | .finalDecision hg hs => .finalDecision (corr_op_s16_final hg hs)


axiom corr_dp_s16_refusing {o : Deontic.Order} {c : ComplaintText} :
    Deontic.OrderRefusingStayUnderSection3 o c →
    Procedure.OrderRefusingStayUnderSection3 (dpOrder o) c
axiom corr_dp_s16_denying4 {o : Deontic.Order} {c : ComplaintText} :
    Deontic.OrderDenyingPetitionUnderSection4 o c →
    Procedure.OrderDenyingPetitionUnderSection4 (dpOrder o) c
axiom corr_dp_s16_denying206 {o : Deontic.Order} {c : ComplaintText} :
    Deontic.OrderDenyingApplicationUnderSection206 o c →
    Procedure.OrderDenyingApplicationUnderSection206 (dpOrder o) c
axiom corr_dp_s16_confirmation {o : Deontic.Order} {c : ComplaintText} :
    Deontic.OrderConfirmingOrDenyingConfirmationOfAward o c →
    Procedure.OrderConfirmingOrDenyingConfirmationOfAward (dpOrder o) c
axiom corr_dp_s16_modifying {o : Deontic.Order} {c : ComplaintText} :
    Deontic.OrderModifyingCorrectingOrVacatingAward o c →
    Procedure.OrderModifyingCorrectingOrVacatingAward (dpOrder o) c
axiom corr_dp_s16_injunction {o : Deontic.Order} {c : ComplaintText} :
    Deontic.InterlocutoryOrderOnInjunctionAgainstArbitration o c →
    Procedure.InterlocutoryOrderEnjoiningArbitration (dpOrder o) c
axiom corr_dp_s16_final {o : Deontic.Order} {c : ComplaintText} :
    Deontic.FinalDecisionWithRespectToArbitration o c →
    Procedure.FinalDecisionWithRespectToArbitration (dpOrder o) c


theorem s16_deontic_implies_procedure {o : Deontic.Order} {c : ComplaintText}
    (h : Deontic.Section16aAppealableOrder o c) :
    Procedure.AppealableOrder (dpOrder o) c :=
  match h with
  | .refusingStayUnderSection3 hg => .refusingStay (corr_dp_s16_refusing hg)
  | .denyingPetitionUnderSection4 hg => .denyingCompelPetition (corr_dp_s16_denying4 hg)
  | .denyingApplicationUnderSection206 hg => .denyingSection206 (corr_dp_s16_denying206 hg)
  | .confirmingOrDenyingConfirmation hg => .confirmationRuling (corr_dp_s16_confirmation hg)
  | .modifyingCorrectingOrVacating hg => .vacaturOrModification (corr_dp_s16_modifying hg)
  | .injunctionAgainstArbitration hg => .injunctionAgainstArbitration (corr_dp_s16_injunction hg)
  | .finalDecision hg => .finalDecision (corr_dp_s16_final hg)


theorem s16_elements_implies_deontic {o : Elements.CourtOrder} {c : ComplaintText}
    (h : Elements.AppealableOrder16a o c) :
    Deontic.Section16aAppealableOrder (odOrder (eoOrder o)) c :=
  s16_ontology_implies_deontic (s16_elements_implies_ontology h)


theorem s16_elements_implies_procedure {o : Elements.CourtOrder} {c : ComplaintText}
    (h : Elements.AppealableOrder16a o c) :
    Procedure.AppealableOrder (opOrder (eoOrder o)) c :=
  s16_ontology_implies_procedure (s16_elements_implies_ontology h)

end Bridge
end Proving.USC.T09.Ch1

