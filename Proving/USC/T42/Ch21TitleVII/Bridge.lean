
































import Proving.USC.T42.Ch21TitleVII.Elements.Theorems
import Proving.USC.T42.Ch21TitleVII.Deontic.Theorems
import Proving.USC.T42.Ch21TitleVII.Ontology.Theorems
import Proving.USC.T42.Ch21TitleVII.Procedure.Theorems
import Proving.USC.T42.Ch21TitleVII.Remedy.Theorems
import Proving.USC.T42.Ch21TitleVII.Scienter.Theorems
import Proving.USC.T42.Ch21TitleVII.Structure.Theorems
import Proving.TitleVII.Statute
import Proving.TitleVII.PatternOrPractice.Statute
import Proving.TitleVII.FederalSector.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Bridge

open Proving.USC.Common (Person ComplaintText)








axiom mapChargeElDe : Elements.Charge → Deontic.Charge
axiom mapChargeElRe : Elements.Charge → Remedy.Charge
axiom mapChargeElOn : Elements.Charge → Ontology.Charge
axiom mapBasisElDe : Elements.ProtectedBasis → Deontic.ProtectedTrait
axiom mapBasisElOn : Elements.ProtectedBasis → Ontology.Basis
axiom mapPracticeElOn : Elements.EmploymentPractice → Ontology.EmploymentPractice
axiom mapPracticeElDe : Elements.EmploymentPractice → Deontic.EmploymentPractice
axiom mapJudgmentElPr : Elements.ConsentJudgment → Procedure.Judgment
axiom mapJudgmentElRe : Elements.ConsentJudgment → Remedy.ConsentJudgment
axiom mapPlanElPr : Elements.AffirmativeActionPlan → Procedure.AffirmativeActionPlan
axiom mapPlanElDe : Elements.AffirmativeActionPlan → Deontic.AffirmativeActionPlan
axiom mapPlanElOn : Elements.AffirmativeActionPlan → Ontology.AffirmativeActionPlan
axiom mapAdElDe : Elements.Advertisement → Deontic.Notice
axiom mapPersonnelActionOn : Elements.FederalUnit → Ontology.PersonnelAction
axiom mapRespondentPr : Elements.Respondent → Procedure.Respondent



axiom gPerson : Person → Proving.TitleVII.Person
axiom gComplaint : ComplaintText → Proving.TitleVII.ComplaintText
axiom gCharge : Elements.Charge → Proving.TitleVII.Charge
axiom gRespondent : Elements.Respondent → Proving.TitleVII.Respondent
axiom gFederalEmployee : Person → Proving.TitleVII.FederalSector.FederalEmployee
axiom gAgencyHead : Elements.FederalUnit → Proving.TitleVII.FederalSector.AgencyHead
axiom gPersonnelAction : Elements.FederalUnit → Proving.TitleVII.FederalSector.PersonnelAction





def gGround : Elements.ProtectedBasis → Proving.TitleVII.FederalSector.ProtectedGround
  | .race => .race
  | .color => .color
  | .religion => .religion
  | .sex => .sex
  | .nationalOrigin => .nationalOrigin








axiom corr_2000e_employerIsPerson {e : Elements.Employer} {c : ComplaintText} (p : Person) :
    Elements.EmployerIsStatutoryPerson e c → Ontology.IsPerson p c
axiom corr_2000e_industry {e : Elements.Employer} {c : ComplaintText}
    (p : Person) (i : Ontology.Industry) :
    Elements.EngagedInIndustryAffectingCommerce e c →
    Ontology.IsIndustryAffectingCommerce i c ∧ Ontology.EngagedInIndustry p i c
axiom corr_2000e_headcount {e : Elements.Employer} {c : ComplaintText} (p : Person) :
    Elements.CalendarWeeksWithFifteenEmployees e c ≥ 20 →
    Ontology.HasFifteenOrMoreEmployees p c
axiom corr_2000e_exclusion {e : Elements.Employer} {c : ComplaintText} (p : Person) :
    ¬ Elements.EmployerStatutoryExclusion e c →
    ¬ Ontology.IsExemptFromEmployerDefinition p c





theorem s2000e_elements_coverage_implies_ontology_membership
    {e : Elements.Employer} {c : ComplaintText}
    (p : Person) (i : Ontology.Industry)
    (h : Elements.CoveredEmployer e c) :
    Ontology.EmployerMembership p i c :=
  { isPerson := corr_2000e_employerIsPerson p h.isPerson
    industryInCommerce := (corr_2000e_industry p i h.affectingCommerce).1
    engagedIn := (corr_2000e_industry p i h.affectingCommerce).2
    numerosity := corr_2000e_headcount p h.headcount
    notCarvedOut := corr_2000e_exclusion p h.notExcluded }



axiom corr_2000e1_control {e : Elements.Employer} {c : ComplaintText} (p q : Person) :
    Elements.InterrelationOfOperations e c → Elements.CommonManagement e c →
    Elements.CentralizedControlOfLaborRelations e c →
    Elements.CommonOwnershipOrFinancialControl e c →
    Deontic.EmployerControlsForeignCorporation p q c



theorem s2000e1_elements_implies_deontic_control
    {e : Elements.Employer} {c : ComplaintText} (p q : Person)
    (h : Elements.EmployerControlsForeignCorporation e c) :
    Deontic.PracticeAttributedToEmployer2000e1c1 p q c :=
  corr_2000e1_control p q h.interrelation h.management h.laborRelations h.ownership

axiom corr_2000e1_aliensAbroad {p : Person} {c : ComplaintText} (q : Person) :
    Elements.EmploymentOfAliensOutsideAnyState p c →
    Deontic.AliensEmployedOutsideAnyState q p c
axiom corr_2000e1_religiousOrg {r : Elements.Respondent} {c : ComplaintText} (q i : Person) :
    Elements.IsReligiousOrganizationEmployingCoreligionists r c →
    Deontic.ReligiousOrganizationReligiousPreference q i c
axiom corr_2000e1_foreignLaw {r : Elements.Respondent} {p : Person} {c : ComplaintText}
    (q : Person) :
    Elements.ForeignWorkplaceComplianceWouldViolateForeignLaw r p c →
    Deontic.ForeignLawComplianceConflict q c
axiom corr_2000e1_notControlled {r : Elements.Respondent} {c : ComplaintText}
    (q : Person) :
    Elements.IsForeignPersonNotControlledByAmericanEmployer r c →
    Deontic.IsForeignPersonNotControlledByAmericanEmployer q c




theorem s2000e1_elements_aliensAbroad_implies_deontic_exempt
    {p : Person} {c : ComplaintText} (q : Person)
    (h : Elements.EmploymentOfAliensOutsideAnyState p c) :
    Deontic.Exempt2000e1 q p c :=
  Or.inl (corr_2000e1_aliensAbroad q h)

theorem s2000e1_elements_foreignLaw_implies_deontic_exempt
    {r : Elements.Respondent} {p : Person} {c : ComplaintText} (q i : Person)
    (h : Elements.ForeignLawDefense r p c) :
    Deontic.Exempt2000e1 q i c :=
  Or.inr (Or.inr (Or.inl (corr_2000e1_foreignLaw q h.conflict)))






theorem s2000e1_elements_implies_scienter_attribution_modulo_gaps
    {e : Elements.Employer} {c : ComplaintText}
    (actor corp : Person) (elem : Scienter.ScienterElement) (rung : Scienter.MentalState)
    (hControl : Elements.EmployerControlsForeignCorporation e c)
    (corr_control : Scienter.ControlsForeignCorporation actor corp c)
    (gap_provenRungOfControlledCorp : Scienter.ProvenMentalState corp elem rung c) :
    Scienter.AttributedMentalState actor elem rung c :=
  let _ := hControl
  Or.inr (Or.inl ⟨corp, corr_control, gap_provenRungOfControlledCorp⟩)



axiom corr_2000e2_coveredEmployer {e : Elements.Employer} {c : ComplaintText} (p : Person) :
    Elements.IsCoveredEmployer e c → Deontic.IsCoveredEmployer p c
axiom corr_2000e2_protectedBasis {b : Elements.ProtectedBasis} {c : ComplaintText} :
    Deontic.IsProtectedTrait (mapBasisElDe b) c
axiom corr_2000e2_causation {p : Person} {b : Elements.ProtectedBasis} {c : ComplaintText}
    (q : Person) :
    Elements.BecauseOfProtectedBasis p b c →
    Deontic.BecauseOfProtectedTrait q p (mapBasisElDe b) c
axiom corr_2000e2_refusalToHire {e : Elements.Employer} {p : Person} {c : ComplaintText}
    (q : Person) :
    Elements.FailedOrRefusedToHire e p c → Deontic.FailedOrRefusedToHireOrDischarged q p c
axiom corr_2000e2_discharge {e : Elements.Employer} {p : Person} {c : ComplaintText}
    (q : Person) :
    Elements.DischargedIndividual e p c → Deontic.FailedOrRefusedToHireOrDischarged q p c
axiom corr_2000e2_terms {e : Elements.Employer} {p : Person} {c : ComplaintText} (q : Person) :
    Elements.DiscriminatedInCompensationTermsConditionsPrivileges e p c →
    Deontic.DiscriminatedInCompensationTermsOrConditions q p c





theorem s2000e2a1_elements_implies_deontic
    {e : Elements.Employer} {p : Person} {b : Elements.ProtectedBasis} {c : ComplaintText}
    (q : Person) (h : Elements.Section2000e2a1 e p b c) :
    Deontic.ProhibitionViolated2000e2a1 q p (mapBasisElDe b) c :=
  ⟨{ addressee := corr_2000e2_coveredEmployer q h.coveredEmployer
     trait := corr_2000e2_protectedBasis
     condition := corr_2000e2_causation q h.causation },
   match h.adverseAction with
   | .refusalToHire ha => Or.inl (corr_2000e2_refusalToHire q ha)
   | .discharge ha => Or.inl (corr_2000e2_discharge q ha)
   | .termsConditionsPrivileges ha => Or.inr (corr_2000e2_terms q ha)⟩





theorem s2000e2a1_deontic_implies_elements_modulo_gaps
    {e : Elements.Employer} {p : Person} {b : Elements.ProtectedBasis} {c : ComplaintText}
    (q : Person)
    (hDe : Deontic.ProhibitionViolated2000e2a1 q p (mapBasisElDe b) c)
    (gap_coveredEmployer : Elements.IsCoveredEmployer e c)
    (gap_coveredIndividual : Elements.CoveredIndividual p e c)
    (gap_adverseAction : Elements.EmployerAdverseAction e p c)
    (gap_discriminatoryIntent : Proving.USC.Common.IntentToDiscriminate p c)
    (gap_causation : Elements.BecauseOfProtectedBasis p b c)
    (gap_noException :
      ¬ Elements.UnlawfulPracticeException (.employer e) p b c) :
    Elements.Section2000e2a1 e p b c :=
  let _ := hDe
  { coveredEmployer := gap_coveredEmployer
    coveredIndividual := gap_coveredIndividual
    adverseAction := gap_adverseAction
    discriminatoryIntent := gap_discriminatoryIntent
    causation := gap_causation
    noException := gap_noException }

axiom corr_2000e2k_particular {r : Elements.Respondent} {pr : Elements.EmploymentPractice}
    {c : ComplaintText} :
    Elements.RespondentUsesParticularEmploymentPractice r pr c →
    Ontology.IsParticularEmploymentPractice (mapPracticeElOn pr) c
axiom corr_2000e2k_impact {pr : Elements.EmploymentPractice} {b : Elements.ProtectedBasis}
    {c : ComplaintText} :
    Elements.PracticeCausesDisparateImpactOnBasis pr b c →
    Ontology.CausesDisparateImpact (mapPracticeElOn pr) (mapBasisElOn b) c
axiom corr_2000e2k_basisProtected {b : Elements.ProtectedBasis} {c : ComplaintText} :
    Ontology.IsProtectedBasis (mapBasisElOn b) c
axiom corr_2000e2k_notJobRelated {pr : Elements.EmploymentPractice} {c : ComplaintText} :
    ¬ Elements.PracticeJobRelatedAndConsistentWithBusinessNecessity pr c →
    ¬ Ontology.IsJobRelatedAndConsistentWithBusinessNecessity (mapPracticeElOn pr) c
axiom corr_2000e2k_showing {r : Elements.Respondent} {pr : Elements.EmploymentPractice}
    {c : ComplaintText} (complainant : Person) (s : Ontology.Showing) :
    Elements.DisparateImpactParticularity r pr c → Ontology.Demonstrates complainant s c



theorem s2000e2k_elements_implies_ontology_disparate_impact
    {r : Elements.Respondent} {pr : Elements.EmploymentPractice}
    {b : Elements.ProtectedBasis} {c : ComplaintText}
    (complainant : Person) (s : Ontology.Showing)
    (h : Elements.DisparateImpactBusinessNecessityRoute r pr b c) :
    Ontology.DisparateImpactEstablished (mapPracticeElOn pr) (mapBasisElOn b)
      complainant s c :=
  { protectedBasis := corr_2000e2k_basisProtected
    particularPractice := corr_2000e2k_particular h.uses
    complainantShows := corr_2000e2k_showing complainant s h.particularity
    causesImpact := corr_2000e2k_impact h.impact
    notJobRelated := corr_2000e2k_notJobRelated h.notJustified }

axiom corr_2000e2m_motivating {p : Person} {b : Elements.ProtectedBasis}
    {pr : Elements.EmploymentPractice} {c : ComplaintText} :
    Elements.ProtectedBasisWasMotivatingFactor p b c →
    Ontology.IsMotivatingFactor (mapBasisElOn b) (mapPracticeElOn pr) c
axiom corr_2000e2m_showing {p : Person} {b : Elements.ProtectedBasis} {c : ComplaintText}
    (s : Ontology.Showing) :
    Elements.ProtectedBasisWasMotivatingFactor p b c → Ontology.Demonstrates p s c



theorem s2000e2m_elements_implies_ontology
    {r : Elements.Respondent} {p : Person} {pr : Elements.EmploymentPractice}
    {b : Elements.ProtectedBasis} {c : ComplaintText} (s : Ontology.Showing)
    (h : Elements.Section2000e2m r p pr b c) :
    Ontology.MotivatingFactorEstablished (mapBasisElOn b) (mapPracticeElOn pr) p s c :=
  { protectedBasis := corr_2000e2k_basisProtected
    motivating := corr_2000e2m_motivating h.motivatingFactor
    complainantShows := corr_2000e2m_showing s h.motivatingFactor }

axiom corr_2000e2n_implements {pr : Elements.EmploymentPractice}
    {j : Elements.ConsentJudgment} {c : ComplaintText} :
    Elements.PracticeImplementsAndWithinScopeOfJudgment pr j c →
    Procedure.PracticeImplementsConsentJudgment (mapJudgmentElPr j) c
axiom corr_2000e2n_notice {p : Person} {j : Elements.ConsentJudgment} {c : ComplaintText} :
    Elements.HadActualNoticeOfProposedJudgment p j c →
    Procedure.ActualNoticeOfProposedJudgment p (mapJudgmentElPr j) c
axiom corr_2000e2n_opportunity {p : Person} {j : Elements.ConsentJudgment}
    {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObject p j c →
    Procedure.ReasonableOpportunityToObject p (mapJudgmentElPr j) c



theorem s2000e2n_elements_implies_procedure_preclusion_modulo_gaps
    {p : Person} {pr : Elements.EmploymentPractice} {j : Elements.ConsentJudgment}
    {c : ComplaintText}
    (hScope : Elements.PracticeImplementsAndWithinScopeOfJudgment pr j c)
    (hNotice : Elements.HadActualNoticeOfProposedJudgment p j c)
    (hOpp : Elements.HadReasonableOpportunityToObject p j c)
    (gap_notPartyOrClassMember :
      ¬ Procedure.PartyOrClassMemberInPriorAction p (mapJudgmentElPr j) c) :
    Procedure.ChallengePrecludedByNotice p (mapJudgmentElPr j) c :=
  { withinScope := corr_2000e2n_implements hScope
    actualNotice := corr_2000e2n_notice hNotice
    opportunity := corr_2000e2n_opportunity hOpp
    notCarvedOut := gap_notPartyOrClassMember }

axiom corr_2000e2n_remedyBar {p : Person} {pr : Elements.EmploymentPractice}
    {j : Elements.ConsentJudgment} {c : ComplaintText} :
    Elements.ConsentJudgmentPreclusion p pr j c →
    Remedy.PrecludedByPriorConsentJudgment p (mapJudgmentElRe j) c




theorem s2000e2n_elements_implies_remedy_bar
    {p : Person} {pr : Elements.EmploymentPractice} {j : Elements.ConsentJudgment}
    {c : ComplaintText} (h : Elements.ConsentJudgmentPreclusion p pr j c) :
    Remedy.PreclusionBar2000e2n p (mapJudgmentElRe j) c :=
  { precluded := corr_2000e2n_remedyBar h }

axiom corr_2000e2h_abilityTestIntent {pr : Elements.EmploymentPractice} {c : ComplaintText}
    (actor : Person) :
    Elements.TestDesignedIntendedOrUsedToDiscriminate pr c →
    Scienter.ProvenMentalState actor .abilityTestDesign2000e2h .specific c




theorem s2000e2h_elements_implies_scienter_abilityTest
    {pr : Elements.EmploymentPractice} {c : ComplaintText} (actor : Person)
    (h : Elements.TestDesignedIntendedOrUsedToDiscriminate pr c) :
    Scienter.Culpable actor .abilityTestDesign2000e2h c :=
  ⟨rfl, fun req hreq => by
      cases hreq
      exact ⟨.specific, Scienter.MentalState.specific_top _,
        Or.inl (corr_2000e2h_abilityTestIntent actor h)⟩⟩



axiom corr_2000e3_addressee {r : Elements.Respondent} {c : ComplaintText} (q : Person) :
    Deontic.Addressee2000e3 q c
axiom corr_2000e3_opposition {p : Person} {c : ComplaintText} :
    Elements.OpposedPracticeMadeUnlawful p c → Deontic.OpposedUnlawfulEmploymentPractice p c
axiom corr_2000e3_participation {p : Person} {c : ComplaintText} :
    Elements.MadeChargeTestifiedAssistedOrParticipated p c →
    Deontic.ParticipatedInTitleVIIProceeding p c
axiom corr_2000e3_adverse {r : Elements.Respondent} {p : Person} {c : ComplaintText}
    (q : Person) :
    Elements.RetaliatoryAdverseAction r p c →
    Elements.AdverseActionBecauseOfProtectedActivity r p c →
    Deontic.DiscriminatedAgainstForProtectedActivity q p c




theorem s2000e3a_elements_implies_deontic
    {r : Elements.Respondent} {p : Person} {c : ComplaintText} (q : Person)
    (h : Elements.Section2000e3a r p c) :
    Deontic.ProhibitionViolated2000e3a q p c :=
  ⟨{ addressee := corr_2000e3_addressee (r := r) q
     condition :=
       match h.protectedActivity with
       | .opposition ha => Or.inl (corr_2000e3_opposition ha)
       | .participation ha => Or.inr (corr_2000e3_participation ha) },
   corr_2000e3_adverse q h.adverseAction h.causation⟩

axiom corr_2000e3_practiceClass {r : Elements.Respondent} {p : Person} {c : ComplaintText}
    (pr : Ontology.EmploymentPractice) :
    Elements.Section2000e3a r p c → Ontology.IsRetaliationPractice pr c





theorem s2000e3a_elements_implies_ontology_practice_class
    {r : Elements.Respondent} {p : Person} {c : ComplaintText}
    (pr : Ontology.EmploymentPractice) (h : Elements.Section2000e3a r p c) :
    Ontology.UnlawfulEmploymentPracticeClass pr c :=
  .retaliation (corr_2000e3_practiceClass pr h)

axiom corr_2000e3b_strict {r : Elements.Respondent} {ad : Elements.Advertisement}
    {b : Elements.ProtectedBasis} {c : ComplaintText} (actor : Person) :
    Elements.PrintedOrPublishedNoticeOrAdvertisement r ad c →
    Elements.AdvertisementIndicatesPreferenceOnProtectedBasis ad b c →
    Scienter.ProvenMentalState actor .discriminatoryAdvertisement2000e3b
      .strictLiability c



theorem s2000e3b_elements_implies_scienter
    {r : Elements.Respondent} {ad : Elements.Advertisement} {b : Elements.ProtectedBasis}
    {c : ComplaintText} (actor : Person)
    (h : Elements.Section2000e3b r ad b c) :
    Scienter.Culpable actor .discriminatoryAdvertisement2000e3b c :=
  ⟨rfl, fun req hreq => by
      cases hreq
      exact ⟨.strictLiability, Scienter.MentalState.strictLiability_bot _,
        Or.inl (corr_2000e3b_strict actor h.published h.indicatesPreference)⟩⟩



axiom corr_2000e4_annualReport {c : ComplaintText} :
    Deontic.TransmittedAnnualReportToCongressAndPresident c →
    Procedure.AnnualReportToCongressMade c





theorem s2000e4_deontic_implies_procedure_annual_report
    {c : ComplaintText} (h : Deontic.TransmittedAnnualReportToCongressAndPresident c) :
    Procedure.AnnualReportToCongressMade c :=
  corr_2000e4_annualReport h



axiom corr_2000e5_chargeFiled {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c →
    Remedy.ChargeFiledWithCommission (mapChargeElRe ch) c
axiom corr_2000e5_byClaimant {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c →
    Remedy.ChargeFiledByOrOnBehalfOfAggrieved p (mapChargeElRe ch) c
axiom corr_2000e5_timely {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.TimelyCharge ch p c → Remedy.ChargeTimelyFiled (mapChargeElRe ch) c
axiom corr_2000e5_deferral {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.StateDeferralSatisfied ch p c →
    Remedy.DeferralRequirementSatisfied (mapChargeElRe ch) c
axiom corr_2000e5_rightToSue {p : Person} {c : ComplaintText} :
    Elements.ReceivedNoticeOfRightToSue p c → Remedy.RightToSueNoticeGiven p c
axiom corr_2000e5_ninetyDays {p : Person} {c : ComplaintText} :
    Elements.DaysFromRightToSueNoticeToCivilAction p c ≤ 90 →
    Remedy.CivilActionFiledWithinNinetyDays p c



theorem s2000e5_elements_implies_remedy_exhaustion
    {ch : Elements.Charge} {p : Person} {c : ComplaintText}
    (h : Elements.AdministrativeExhaustion ch p c) :
    Remedy.Exhaustion2000e5 p (mapChargeElRe ch) c :=
  { chargeFiled := corr_2000e5_chargeFiled h.chargeFiled
    byClaimant := corr_2000e5_byClaimant h.chargeFiled
    timely := corr_2000e5_timely h.timely
    deferral := corr_2000e5_deferral h.deferral
    noticeGiven := corr_2000e5_rightToSue h.rightToSue
    suitTimely := corr_2000e5_ninetyDays h.suitWithinNinetyDays }

axiom corr_2000e5_complainingParty {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c →
    Deontic.IsComplainingParty p c
axiom corr_2000e5_deTimely {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.TimelyCharge ch p c →
    Deontic.ChargeFiledWithinLimitationsPeriod (mapChargeElDe ch) c
axiom corr_2000e5_deNotice {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ReceivedNoticeOfRightToSue p c →
    Deontic.RightToSueNoticeGiven p (mapChargeElDe ch) c
axiom corr_2000e5_deWindow {p : Person} {c : ComplaintText} :
    Elements.DaysFromRightToSueNoticeToCivilAction p c ≤ 90 →
    Deontic.CivilActionFiledWithinNinetyDays p c



theorem s2000e5_elements_implies_deontic_private_permission
    {ch : Elements.Charge} {p : Person} {c : ComplaintText}
    (h : Elements.AdministrativeExhaustion ch p c) :
    Deontic.Permission2000e5f1Private p (mapChargeElDe ch) c :=
  { addressee := corr_2000e5_complainingParty h.chargeFiled
    timelyCharge := corr_2000e5_deTimely h.timely
    notice := corr_2000e5_deNotice (ch := ch) h.rightToSue
    window := corr_2000e5_deWindow h.suitWithinNinetyDays }

axiom corr_2000e5_onCharge {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ChargeInWritingUnderOathOrAffirmation ch c →
    Ontology.IsCharge (mapChargeElOn ch) c
axiom corr_2000e5_onAggrieved {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c →
    Ontology.IsAggrievedPerson p c



theorem s2000e5_elements_implies_ontology_charge
    {ch : Elements.Charge} {p : Person} {c : ComplaintText}
    (h : Elements.AdministrativeExhaustion ch p c) :
    Ontology.ChargeByAggrievedPerson (mapChargeElOn ch) p c :=
  { isCharge := corr_2000e5_onCharge (p := p) h.underOath
    isAggrieved := corr_2000e5_onAggrieved h.chargeFiled }

axiom corr_2000e5_prForm {ch : Elements.Charge} {c : ComplaintText} :
    Elements.ChargeInWritingUnderOathOrAffirmation ch c →
    Procedure.ChargeInWritingUnderOath c
axiom corr_2000e5_prFiler {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c →
    Procedure.ChargeFiledByAggrievedOrCommissioner p c
axiom corr_2000e5_prDeferralJurisdiction {p : Person} {c : ComplaintText} :
    Elements.InstitutedProceedingsWithStateOrLocalAgency p c →
    Procedure.DeferralJurisdiction c ∧ Procedure.StateProceedingCommenced c
axiom corr_2000e5_prDeferralWindow {ch : Elements.Charge} {c : ComplaintText} :
    Elements.DaysFromUnlawfulPracticeToChargeFiling ch c ≤ 300 →
    Elements.DaysFromStateTerminationNoticeToChargeFiling ch c ≤ 30 →
    Procedure.ChargeFiledWithinDeferralDeadline c
axiom corr_2000e5_prDeferralSatisfied {ch : Elements.Charge} {p : Person}
    {c : ComplaintText} :
    Elements.StateDeferralSatisfied ch p c → Procedure.StateDeferralSatisfied c





theorem s2000e5_elements_deferral_implies_procedure_timely_charge
    {ch : Elements.Charge} {p : Person} {c : ComplaintText}
    (hForm : Elements.ChargeInWritingUnderOathOrAffirmation ch c)
    (hFiler : Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c)
    (hInstituted : Elements.InstitutedProceedingsWithStateOrLocalAgency p c)
    (h300 : Elements.DaysFromUnlawfulPracticeToChargeFiling ch c ≤ 300)
    (h30 : Elements.DaysFromStateTerminationNoticeToChargeFiling ch c ≤ 30)
    (hDefSat : Elements.StateDeferralSatisfied ch p c) :
    Procedure.TimelyCharge p c :=
  .deferral
    { form := { inWriting := corr_2000e5_prForm hForm
                properFiler := corr_2000e5_prFiler hFiler }
      deferral := (corr_2000e5_prDeferralJurisdiction hInstituted).1
      proceedingCommenced := (corr_2000e5_prDeferralJurisdiction hInstituted).2
      deferralSatisfied := corr_2000e5_prDeferralSatisfied hDefSat
      withinWindow := corr_2000e5_prDeferralWindow h300 h30 }








theorem s2000e5_elements_implies_procedure_exhaustion_modulo_gaps
    {ch : Elements.Charge} {p : Person} {c : ComplaintText}
    (hTimely : Procedure.TimelyCharge p c)
    (hEl : Elements.AdministrativeExhaustion ch p c)
    (gap_commissionProcessing : Procedure.CommissionProcessing c)
    (gap_administrativeTermination :
      Procedure.ChargeDismissedForNoReasonableCause c ∨ Procedure.ConciliationExhausted c)
    (corr_rightToSue : Procedure.RightToSueNoticeGiven c) :
    Procedure.AdministrativeExhaustion p c :=
  let _ := hEl
  { timelyCharge := hTimely
    processing := gap_commissionProcessing
    terminated := gap_administrativeTermination
    rightToSue := corr_rightToSue }

axiom corr_2000e5_elFiled {p : Person} {c : ComplaintText} (ch : Elements.Charge) :
    Procedure.ChargeFiledByAggrievedOrCommissioner p c →
    Procedure.ChargeInWritingUnderOath c →
    Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c ∧
      Elements.ChargeInWritingUnderOathOrAffirmation ch c
axiom corr_2000e5_elTimely {p : Person} {c : ComplaintText} (ch : Elements.Charge) :
    Procedure.TimelyCharge p c → Elements.TimelyCharge ch p c
axiom corr_2000e5_elDeferral {p : Person} {c : ComplaintText} (ch : Elements.Charge) :
    Procedure.TimelyCharge p c → Elements.StateDeferralSatisfied ch p c
axiom corr_2000e5_elRightToSue {p : Person} {c : ComplaintText} :
    Procedure.RightToSueNoticeGiven c → Elements.ReceivedNoticeOfRightToSue p c
axiom corr_2000e5_elNinety {p : Person} {c : ComplaintText} :
    Procedure.SuitFiledWithinNinetyDays c →
    Elements.DaysFromRightToSueNoticeToCivilAction p c ≤ 90






theorem s2000e5_procedure_implies_elements_exhaustion
    {p : Person} {r : Procedure.Respondent} {d : Procedure.JudicialDistrict}
    {c : ComplaintText} (ch : Elements.Charge)
    (h : Procedure.TimelyPrivateCivilAction p r d c)
    (hNinety : Procedure.SuitFiledWithinNinetyDays c) :
    Elements.AdministrativeExhaustion ch p c :=
  { chargeFiled :=
      (corr_2000e5_elFiled ch
        (match h.exhausted.timelyCharge with
         | .nonDeferral t => t.form.properFiler
         | .deferral t => t.form.properFiler)
        (match h.exhausted.timelyCharge with
         | .nonDeferral t => t.form.inWriting
         | .deferral t => t.form.inWriting)).1
    underOath :=
      (corr_2000e5_elFiled ch
        (match h.exhausted.timelyCharge with
         | .nonDeferral t => t.form.properFiler
         | .deferral t => t.form.properFiler)
        (match h.exhausted.timelyCharge with
         | .nonDeferral t => t.form.inWriting
         | .deferral t => t.form.inWriting)).2
    accrual := .ordinary
    timely := corr_2000e5_elTimely ch h.exhausted.timelyCharge
    deferral := corr_2000e5_elDeferral ch h.exhausted.timelyCharge
    rightToSue := corr_2000e5_elRightToSue h.exhausted.rightToSue
    suitWithinNinetyDays := corr_2000e5_elNinety hNinety }

axiom corr_2000e5g1_intentional {r : Elements.Respondent} {c : ComplaintText}
    (actor : Person) :
    Elements.RespondentIntentionallyEngagedInUnlawfulPractice r c →
    Scienter.ProvenMentalState actor .remedialIntentionalPractice2000e5g1 .specific c




theorem s2000e5g1_elements_implies_scienter
    {r : Elements.Respondent} {p : Person} {c : ComplaintText} (actor : Person)
    (h : Elements.ReliefAvailable r p c) :
    Scienter.Culpable actor .remedialIntentionalPractice2000e5g1 c :=
  ⟨rfl, fun req hreq => by
      cases hreq
      exact ⟨.specific, Scienter.MentalState.specific_top _,
        Or.inl (corr_2000e5g1_intentional actor h.intentional)⟩⟩







axiom gcorr_5_aggrieved {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c →
    Proving.TitleVII.IsAggrievedPerson (gPerson p) (gComplaint c)
axiom gcorr_5_filed {ch : Elements.Charge} {p : Person} {c : ComplaintText}
    (r : Elements.Respondent) :
    Elements.ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c →
    Elements.ChargeInWritingUnderOathOrAffirmation ch c →
    Proving.TitleVII.ChargeFiledWithEEOC (gCharge ch) (gPerson p) (gRespondent r)
      (gComplaint c)
axiom gcorr_5_alleges {ch : Elements.Charge} {c : ComplaintText} (r : Elements.Respondent) :
    Elements.TitleVIIViolationTheory c →
    Proving.TitleVII.ChargeAllegesUnlawfulPractice (gCharge ch) (gRespondent r)
      (gComplaint c)
axiom gcorr_5_timely {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.TimelyCharge ch p c → Elements.AccrualRule p c →
    Proving.TitleVII.ChargeTimelyFiled (gCharge ch) (gComplaint c)
axiom gcorr_5_exhausted {ch : Elements.Charge} {p : Person} {c : ComplaintText} :
    Elements.ReceivedNoticeOfRightToSue p c →
    Elements.StateDeferralSatisfied ch p c →
    Proving.TitleVII.RightToSueExhausted (gPerson p) (gCharge ch) (gComplaint c)
axiom gcorr_5_timelySuit {p : Person} {c : ComplaintText} :
    Elements.DaysFromRightToSueNoticeToCivilAction p c ≤ 90 →
    Proving.TitleVII.SuitTimelyFiled (gPerson p) (gComplaint c)





theorem s2000e5_elements_implies_golden_private_right
    {ch : Elements.Charge} {p : Person} {c : ComplaintText} (r : Elements.Respondent)
    (h : Elements.Section2000e5Prerequisites ch p c)
    (hTheory : Elements.TitleVIIViolationTheory c) :
    Proving.TitleVII.ValidTitleVIIEnforcement (gPerson p) (gRespondent r) (gCharge ch)
      (gComplaint c) :=
  .viaPrivateRight
    { charge :=
        { aggrieved := gcorr_5_aggrieved h.exhaustion.chargeFiled
          filed := gcorr_5_filed r h.exhaustion.chargeFiled h.exhaustion.underOath
          alleges := gcorr_5_alleges r hTheory
          timely := gcorr_5_timely h.exhaustion.timely h.exhaustion.accrual }
      exhausted := gcorr_5_exhausted h.exhaustion.rightToSue h.exhaustion.deferral
      timelySuit := gcorr_5_timelySuit h.exhaustion.suitWithinNinetyDays }



axiom corr_2000e6_ag {c : ComplaintText} (p : Person) :
    Elements.ComplaintSignedByAttorneyGeneral c → Deontic.IsAttorneyGeneral p c
axiom corr_2000e6_cause {c : ComplaintText} :
    Elements.AttorneyGeneralHasReasonableCauseToBelieve c →
    Deontic.AttorneyGeneralReasonableCause c
axiom corr_2000e6_pattern {c : ComplaintText} (q : Person) :
    Elements.PatternOrPracticeOfResistanceToRightsSecured c →
    Deontic.PatternOrPracticeOfResistance q c



theorem s2000e6_elements_implies_deontic
    {c : ComplaintText} (p q : Person) (h : Elements.Section2000e6a c) :
    Deontic.Power2000e6a p q c :=
  { addressee := corr_2000e6_ag p h.signed
    reasonableCause := corr_2000e6_cause h.reasonableCause
    condition := corr_2000e6_pattern q h.patternOrPractice }

axiom corr_2000e6_prCause {c : ComplaintText} :
    Elements.AttorneyGeneralHasReasonableCauseToBelieve c →
    Procedure.AttorneyGeneralReasonableCauseBelief c
axiom corr_2000e6_prSigned {c : ComplaintText} :
    Elements.ComplaintSignedByAttorneyGeneral c → Procedure.PatternOrPracticeComplaintSigned c
axiom corr_2000e6_prFacts {c : ComplaintText} :
    Elements.ComplaintSetsForthPatternOrPracticeFacts c →
    Procedure.PatternOrPracticeFactsSetForth c
axiom corr_2000e6_prRelief {c : ComplaintText} :
    Elements.ComplaintRequestsRelief c → Procedure.PatternOrPracticeReliefRequested c



theorem s2000e6_elements_implies_procedure
    {c : ComplaintText} (h : Elements.Section2000e6a c) :
    Procedure.PatternOrPracticeAction c :=
  { reasonableCause := corr_2000e6_prCause h.reasonableCause
    signed := corr_2000e6_prSigned h.signed
    factsSetForth := corr_2000e6_prFacts h.setsForthFacts
    reliefRequested := corr_2000e6_prRelief h.requestsRelief }

axiom corr_2000e6_rePattern {c : ComplaintText} (r : Person) :
    Elements.PatternOrPracticeOfResistanceToRightsSecured c →
    Remedy.PatternOrPracticeOfResistance r c
axiom corr_2000e6_reCause {c : ComplaintText} (r : Person) :
    Elements.AttorneyGeneralHasReasonableCauseToBelieve c →
    Remedy.ReasonableCauseDetermined r c


theorem s2000e6_elements_implies_remedy
    {c : ComplaintText} (r : Person) (h : Elements.Section2000e6a c) :
    Remedy.PatternOrPracticeAction2000e6 r c :=
  { patternOrPractice := corr_2000e6_rePattern r h.patternOrPractice
    reasonableCause := corr_2000e6_reCause r h.reasonableCause }

axiom corr_2000e6_onAg {c : ComplaintText} (ag : Person) :
    Elements.ComplaintSignedByAttorneyGeneral c → Ontology.IsAttorneyGeneral ag c
axiom corr_2000e6_onPattern {c : ComplaintText} (pr : Ontology.EmploymentPractice) :
    Elements.PatternOrPracticeOfResistanceToRightsSecured c →
    Ontology.IsPatternOrPracticeOfResistance pr c


theorem s2000e6_elements_implies_ontology
    {c : ComplaintText} (pr : Ontology.EmploymentPractice) (ag : Person)
    (h : Elements.Section2000e6a c) :
    Ontology.PatternOrPracticeAction pr ag c :=
  { isAttorneyGeneral := corr_2000e6_onAg ag h.signed
    patternOrPractice := corr_2000e6_onPattern pr h.patternOrPractice }

axiom corr_2000e6_scIntent {c : ComplaintText} (actor : Person) :
    Elements.PatternIntendedToDenyFullExerciseOfRights c →
    Scienter.ProvenMentalState actor .patternOrPractice2000e6a .specific c



theorem s2000e6_elements_implies_scienter
    {c : ComplaintText} (actor : Person) (h : Elements.Section2000e6a c) :
    Scienter.Culpable actor .patternOrPractice2000e6a c :=
  ⟨rfl, fun req hreq => by
      cases hreq
      exact ⟨.specific, Scienter.MentalState.specific_top _,
        Or.inl (corr_2000e6_scIntent actor h.intent)⟩⟩






axiom gcorr_6_authorized {c : ComplaintText} (e : Proving.TitleVII.Enforcer) :
    Elements.ComplaintSignedByAttorneyGeneral c →
    Proving.TitleVII.PatternOrPractice.IsAuthorizedPatternOrPracticeEnforcer e
      (gComplaint c)
axiom gcorr_6_cause {c : ComplaintText} (e : Proving.TitleVII.Enforcer)
    (r : Elements.Respondent) :
    Elements.AttorneyGeneralHasReasonableCauseToBelieve c →
    Proving.TitleVII.PatternOrPractice.EnforcerHasReasonableCause e (gRespondent r)
      (gComplaint c)
axiom gcorr_6_pattern {c : ComplaintText} (r : Elements.Respondent) :
    Elements.PatternOrPracticeOfResistanceToRightsSecured c →
    Proving.TitleVII.PatternOrPractice.PatternOrPracticeOfResistance (gRespondent r)
      (gComplaint c)
axiom gcorr_6_intent {c : ComplaintText} (r : Elements.Respondent) :
    Elements.PatternIntendedToDenyFullExerciseOfRights c →
    Proving.TitleVII.PatternOrPractice.IntendedToDenyRights (gRespondent r) (gComplaint c)



axiom gcorr_6_brings {c : ComplaintText} (e : Proving.TitleVII.Enforcer)
    (r : Elements.Respondent) :
    Elements.ComplaintSignedByAttorneyGeneral c →
    Elements.ComplaintSetsForthPatternOrPracticeFacts c →
    Elements.ComplaintRequestsRelief c →
    Proving.TitleVII.PatternOrPractice.EnforcerBringsPatternOrPracticeAction e
      (gRespondent r) (gComplaint c)




theorem s2000e6_elements_implies_golden_pattern_or_practice
    {c : ComplaintText} (r : Elements.Respondent)
    (h : Elements.Section2000e6a c) :
    Proving.TitleVII.PatternOrPractice.ValidPatternOrPracticeAction (gRespondent r)
      (gComplaint c) :=
  .viaEnforcer Proving.TitleVII.Enforcer.attorneyGeneral
    { authorizedEnforcer := gcorr_6_authorized _ h.signed
      reasonableCause := gcorr_6_cause _ r h.reasonableCause
      patternOrPractice := gcorr_6_pattern r h.patternOrPractice
      intentToDeny := gcorr_6_intent r h.intent
      brings := gcorr_6_brings _ r h.signed h.setsForthFacts h.requestsRelief }



axiom corr_2000e7_notSaved {sl : Elements.StateLaw} {c : ComplaintText}
    (l : Deontic.StateOrLocalLaw) :
    Elements.StateLawPurportsToRequireOrPermitUnlawfulPractice sl c →
    Deontic.StateLawRequiresOrPermitsUnlawfulPractice l c




theorem s2000e7_elements_implies_deontic
    {sl : Elements.StateLaw} {c : ComplaintText} (l : Deontic.StateOrLocalLaw)
    (h : Elements.StateLawNotSaved sl c) :
    Deontic.StateLawNotPreserved2000e7 l c :=
  corr_2000e7_notSaved l h.requiresOrPermits

axiom corr_2000e7_preserved {l : Deontic.StateOrLocalLaw} {c : ComplaintText} (r : Person) :
    Deontic.StateLawPreserved2000e7 l c → Remedy.StateLawLiabilityPreserved r c


theorem s2000e7_deontic_implies_remedy
    {l : Deontic.StateOrLocalLaw} {c : ComplaintText} (r : Person)
    (h : Deontic.StateLawPreserved2000e7 l c) :
    Remedy.StateRemedyUnaffected2000e7 r c :=
  { preserved := corr_2000e7_preserved r h }



axiom corr_2000e8e_officer {p : Person} {c : ComplaintText} :
    Elements.IsCommissionOfficerOrEmployee p c → Deontic.IsCommissionOfficerOrEmployee p c
axiom corr_2000e8e_provenance {p : Person} {c : ComplaintText} (info : Deontic.Information) :
    Elements.MadePublicInformationObtainedUnderThisSection p c →
    Deontic.InformationObtainedUnderInvestigativeAuthority info c
axiom corr_2000e8e_priorToProceeding {p : Person} {c : ComplaintText} :
    Elements.DisclosurePriorToInstitutionOfProceeding p c → ¬ Deontic.ProceedingInstituted c
axiom corr_2000e8e_disclosure {p : Person} {c : ComplaintText} (info : Deontic.Information) :
    Elements.MadePublicInformationObtainedUnderThisSection p c →
    Deontic.MadePublicInvestigativeInformation p info c



theorem s2000e8e_elements_implies_deontic
    {p : Person} {c : ComplaintText} (info : Deontic.Information)
    (h : Elements.Section2000e8e p c) :
    Deontic.ProhibitionViolated2000e8e p info c :=
  ⟨{ addressee := corr_2000e8e_officer h.commissionPersonnel
     provenance := corr_2000e8e_provenance info h.disclosure
     condition := corr_2000e8e_priorToProceeding h.priorToProceeding },
   corr_2000e8e_disclosure info h.disclosure⟩

axiom corr_2000e8e_remedy {p : Person} {c : ComplaintText} :
    Elements.Section2000e8e p c → Remedy.CommissionConfidentialityBreached p c




theorem s2000e8e_elements_implies_remedy
    {p : Person} {c : ComplaintText} (h : Elements.Section2000e8e p c) :
    Remedy.ConfidentialityOffense2000e8e p c :=
  { breach := corr_2000e8e_remedy h }

axiom corr_2000e8e_scienter {p : Person} {c : ComplaintText} (actor : Person) :
    Elements.Section2000e8e p c →
    Scienter.ProvenMentalState actor .commissionOfficerDisclosure2000e8e
      .strictLiability c



theorem s2000e8e_elements_implies_scienter
    {p : Person} {c : ComplaintText} (actor : Person) (h : Elements.Section2000e8e p c) :
    Scienter.Culpable actor .commissionOfficerDisclosure2000e8e c :=
  ⟨rfl, fun req hreq => by
      cases hreq
      exact ⟨.strictLiability, Scienter.MentalState.strictLiability_bot _,
        Or.inl (corr_2000e8e_scienter actor h)⟩⟩

axiom corr_2000e8c_records {c : ComplaintText} (p : Person) (r : Deontic.EmploymentRecord) :
    Procedure.RecordsMadeAndKept c → Procedure.RecordsPreservedForPrescribedPeriod c →
    Procedure.ReportsFurnishedAsPrescribed c →
    Deontic.MadeAndKeptRequiredRecords p r c



theorem s2000e8c_procedure_implies_deontic
    {c : ComplaintText} (p : Person) (r : Deontic.EmploymentRecord)
    (h : Procedure.RecordkeepingCompliance c) :
    Deontic.MadeAndKeptRequiredRecords p r c :=
  corr_2000e8c_records p r h.made h.preserved h.reported








axiom corr_2000e9_hearing {c : ComplaintText} :
    Structure.S2000e9IncorporationsResolve c → Deontic.CommissionHearingOrInvestigation c




theorem s2000e9_structure_implies_deontic_power_modulo_gaps
    {c : ComplaintText} (p : Person)
    (h : Structure.S2000e9IncorporationsResolve c)
    (gap_commissionAddressee : Deontic.IsCommission p c) :
    Deontic.Power2000e9 p c :=
  { addressee := gap_commissionAddressee
    condition := corr_2000e9_hearing h }



axiom corr_2000e10_addressee {r : Elements.Respondent} {c : ComplaintText} (p : Person) :
    Deontic.Addressee2000e8c p c
axiom corr_2000e10_failedToPost {r : Elements.Respondent} {c : ComplaintText}
    (p : Person) (n : Deontic.Notice) :
    Elements.FailedToPostRequiredNotice r c → ¬ Deontic.PostedRequiredNotice p n c



theorem s2000e10a_elements_implies_deontic
    {r : Elements.Respondent} {c : ComplaintText} (p : Person) (n : Deontic.Notice)
    (h : Elements.Section2000e10a r c) :
    Deontic.ObligationBreached2000e10a p n c :=
  ⟨{ addressee := corr_2000e10_addressee (r := r) (c := c) p },
   corr_2000e10_failedToPost p n h.failedToPost⟩

axiom corr_2000e10b_willful {p : Person} {c : ComplaintText} (r : Person) :
    Proving.USC.Common.ActedWithScienter p c → Remedy.WillfulPostingViolation r c





theorem s2000e10b_elements_implies_remedy
    {r : Elements.Respondent} {p : Person} {c : ComplaintText} (q : Person)
    (h : Elements.Section2000e10b r p c) :
    Remedy.PostingPenalty2000e10 q c :=
  { willful := corr_2000e10b_willful q h.willful }






theorem s2000e10b_elements_implies_scienter_modulo_gaps
    {r : Elements.Respondent} {p : Person} {c : ComplaintText} (actor : Person)
    (h : Elements.Section2000e10b r p c)
    (gap_specificRung :
      Scienter.ProvenMentalState actor .noticePosting2000e10 .specific c) :
    Scienter.Culpable actor .noticePosting2000e10 c :=
  let _ := h
  ⟨rfl, fun req hreq => by
      cases hreq
      exact ⟨.specific, Scienter.MentalState.specific_top _, Or.inl gap_specificRung⟩⟩

axiom corr_2000e10_prPosted {c : ComplaintText} (p : Person) (n : Deontic.Notice) :
    Procedure.StatutoryNoticePosted c → Deontic.PostedRequiredNotice p n c



theorem s2000e10_procedure_implies_deontic
    {c : ComplaintText} (p : Person) (n : Deontic.Notice)
    (h : Procedure.NoticePostingCompliance c) :
    Deontic.PostedRequiredNotice p n c :=
  corr_2000e10_prPosted p n h.posted



axiom corr_2000e12b_immunity {r : Elements.Respondent} {c : ComplaintText} (p : Person) :
    Elements.ActInGoodFaith r c →
    Elements.ActInConformityWithCommissionWrittenInterpretation r c →
    Elements.ActInRelianceOnCommissionWrittenInterpretation r c →
    Deontic.GoodFaithRelianceOnCommissionInterpretation p c



theorem s2000e12b_elements_implies_deontic
    {r : Elements.Respondent} {c : ComplaintText} (p : Person)
    (h : Elements.GoodFaithRelianceDefense r c) :
    Deontic.Immunity2000e12b p c :=
  corr_2000e12b_immunity p h.goodFaith h.conformity h.reliance

axiom corr_2000e12b_remedy {r : Elements.Respondent} {c : ComplaintText} (q : Person) :
    Elements.GoodFaithRelianceDefense r c →
    Remedy.GoodFaithRelianceOnCommissionInterpretation q c


theorem s2000e12b_elements_implies_remedy
    {r : Elements.Respondent} {c : ComplaintText} (q : Person)
    (h : Elements.GoodFaithRelianceDefense r c) :
    Remedy.RelianceDefense2000e12b q c :=
  { goodFaithReliance := corr_2000e12b_remedy q h }

axiom corr_2000e12b_scienter {r : Elements.Respondent} {c : ComplaintText} (actor : Person) :
    Elements.GoodFaithRelianceDefense r c →
    Scienter.GoodFaithRelianceOnCommissionInterpretation actor c



theorem s2000e12b_elements_implies_scienter
    {r : Elements.Respondent} {c : ComplaintText} (actor : Person)
    (h : Elements.GoodFaithRelianceDefense r c) :
    Scienter.GoodFaithBar2000e12b actor c :=
  Or.inl (corr_2000e12b_scienter actor h)

axiom corr_2000e12b_procedure {r : Elements.Respondent} {c : ComplaintText} :
    Procedure.GoodFaithRelianceDefense c →
    Elements.ActInGoodFaith r c ∧
      Elements.ActInConformityWithCommissionWrittenInterpretation r c ∧
      Elements.ActInRelianceOnCommissionWrittenInterpretation r c



theorem s2000e12b_procedure_implies_elements
    {c : ComplaintText} (r : Elements.Respondent)
    (h : Procedure.GoodFaithRelianceDefense c) :
    Elements.GoodFaithRelianceDefense r c :=
  { goodFaith := (corr_2000e12b_procedure h).1
    conformity := (corr_2000e12b_procedure h).2.1
    reliance := (corr_2000e12b_procedure h).2.2 }



axiom corr_2000e13_victimClass {victim : Person} {c : ComplaintText} :
    Elements.VictimWasCommissionOfficerAgentOrEmployee victim c →
    Deontic.IsCommissionOfficerOrEmployee victim c
axiom corr_2000e13_killing {accused victim : Person} {c : ComplaintText} :
    Elements.KilledPersonInViolationOfSection1114 accused c →
    Elements.VictimEngagedInOrKilledOnAccountOfOfficialFunctions victim c →
    Deontic.KilledCommissionPersonnelInPerformanceOfDuties accused victim c



theorem s2000e13_elements_implies_deontic
    {accused victim : Person} {c : ComplaintText}
    (h : Elements.Section2000e13 accused victim c) :
    Deontic.ProhibitionViolated2000e13 accused victim c :=
  ⟨{ victimClass := corr_2000e13_victimClass h.victimIsCommissionPersonnel },
   corr_2000e13_killing h.killing h.officialFunctions⟩

axiom corr_2000e13_remedy {accused victim : Person} {c : ComplaintText} :
    Elements.Section2000e13 accused victim c →
    Remedy.AssaultOrKillingOfCommissionPersonnel accused c



theorem s2000e13_elements_implies_remedy
    {accused victim : Person} {c : ComplaintText}
    (h : Elements.Section2000e13 accused victim c) :
    Remedy.PersonnelProtectionOffense2000e13 accused c :=
  { offense := corr_2000e13_remedy h }



axiom corr_2000e14_report {c : ComplaintText} :
    Deontic.TransmittedAnnualReportToCongressAndPresident c →
    Procedure.AnnualCoordinationReportTransmitted c



theorem s2000e14_deontic_implies_procedure
    {c : ComplaintText} (h : Deontic.TransmittedAnnualReportToCongressAndPresident c) :
    Procedure.AnnualCoordinationReportTransmitted c :=
  corr_2000e14_report h

axiom corr_2000e15_conference {c : ComplaintText} :
    Deontic.ConvenedEqualEmploymentConferences c → Procedure.PresidentialConferenceConvened c



theorem s2000e15_deontic_implies_procedure
    {c : ComplaintText} (h : Deontic.ConvenedEqualEmploymentConferences c) :
    Procedure.PresidentialConferenceConvened c :=
  corr_2000e15_conference h



axiom corr_2000e16_entity {f : Elements.FederalUnit} {c : ComplaintText} (p : Person) :
    Elements.IsCoveredFederalUnit f c → Deontic.IsCoveredFederalEntity p c
axiom corr_2000e16_affects {f : Elements.FederalUnit} {p : Person}
    {b : Elements.ProtectedBasis} {c : ComplaintText}
    (q : Person) (pa : Deontic.PersonnelAction) :
    Elements.IsFederalEmployeeOrApplicant p f c →
    Deontic.PersonnelActionAffectsIndividual pa p q c
axiom corr_2000e16_notFree {f : Elements.FederalUnit} {p : Person}
    {b : Elements.ProtectedBasis} {c : ComplaintText} (pa : Deontic.PersonnelAction) :
    Elements.PersonnelActionNotFreeFromDiscrimination p f b c →
    ¬ Deontic.PersonnelActionFreeFromDiscrimination pa c







theorem s2000e16_elements_implies_deontic
    {f : Elements.FederalUnit} {p : Person} {b : Elements.ProtectedBasis}
    {c : ComplaintText} (q : Person) (pa : Deontic.PersonnelAction)
    (h : Elements.Section2000e16 f p b c) :
    Deontic.ObligationBreached2000e16a q p pa c :=
  ⟨{ addressee := corr_2000e16_entity q h.coveredUnit
     condition := corr_2000e16_affects (b := b) q pa h.coveredIndividual },
   corr_2000e16_notFree pa h.discrimination⟩

axiom corr_2000e16_onEntity {f : Elements.FederalUnit} {c : ComplaintText} (entity : Person) :
    Elements.IsCoveredFederalUnit f c →
    Ontology.IsFederalEntitySubjectToSection2000e16 entity c
axiom corr_2000e16_onAction {f : Elements.FederalUnit} {p : Person}
    {b : Elements.ProtectedBasis} {c : ComplaintText} :
    Elements.PersonnelActionNotFreeFromDiscrimination p f b c →
    Ontology.IsPersonnelAction (mapPersonnelActionOn f) c
axiom corr_2000e16_onDiscriminatory {f : Elements.FederalUnit} {p : Person}
    {b : Elements.ProtectedBasis} {c : ComplaintText} :
    Elements.PersonnelActionNotFreeFromDiscrimination p f b c →
    Ontology.IsDiscriminatoryPersonnelAction (mapPersonnelActionOn f) (mapBasisElOn b) c



theorem s2000e16_elements_implies_ontology
    {f : Elements.FederalUnit} {p : Person} {b : Elements.ProtectedBasis}
    {c : ComplaintText} (entity : Person)
    (h : Elements.Section2000e16 f p b c) :
    Ontology.CoveredFederalPersonnelAction (mapPersonnelActionOn f) entity
      (mapBasisElOn b) c :=
  { coveredEntity := corr_2000e16_onEntity entity h.coveredUnit
    isAction := corr_2000e16_onAction h.discrimination
    protectedBasis := corr_2000e2k_basisProtected
    discriminatory := corr_2000e16_onDiscriminatory h.discrimination }

axiom corr_2000e16_reCovered {f : Elements.FederalUnit} {p : Person} {c : ComplaintText} :
    Elements.IsFederalEmployeeOrApplicant p f c →
    Remedy.IsFederalSectorEmployeeOrApplicant p c
axiom corr_2000e16_reRipe {p : Person} {c : ComplaintText} :
    Elements.FederalSectorExhaustion p c →
    Remedy.FinalAgencyActionOrOneHundredEightyDayLapse p c
axiom corr_2000e16_reTimely {p : Person} {c : ComplaintText} :
    Elements.FederalSectorExhaustion p c → Remedy.FederalSuitWithinNinetyDaysOfNotice p c
axiom corr_2000e16_reDefendant {f : Elements.FederalUnit} {p : Person} {c : ComplaintText} :
    Elements.HeadOfDepartmentAgencyOrUnitNamedAsDefendant f c →
    Remedy.AgencyHeadNamedAsDefendant p c



theorem s2000e16_elements_implies_remedy
    {f : Elements.FederalUnit} {p : Person} {b : Elements.ProtectedBasis}
    {c : ComplaintText} (h : Elements.Section2000e16 f p b c) :
    Remedy.FederalSectorAction2000e16 p c :=
  { covered := corr_2000e16_reCovered h.coveredIndividual
    finalOrLapse := corr_2000e16_reRipe h.exhaustion
    timely := corr_2000e16_reTimely h.exhaustion
    properDefendant := corr_2000e16_reDefendant h.properDefendant }

axiom corr_2000e16_prCovered {f : Elements.FederalUnit} {c : ComplaintText} :
    Elements.IsCoveredFederalUnit f c → Procedure.CoveredFederalPersonnelAction c
axiom corr_2000e16_prAggrieved {f : Elements.FederalUnit} {p : Person}
    {b : Elements.ProtectedBasis} {c : ComplaintText} :
    Elements.PersonnelActionNotFreeFromDiscrimination p f b c →
    Procedure.AggrievedByFinalDisposition p c
axiom corr_2000e16_prDefendant {f : Elements.FederalUnit} {c : ComplaintText} :
    Elements.HeadOfDepartmentAgencyOrUnitNamedAsDefendant f c →
    Procedure.AgencyHeadNamedAsDefendant c
axiom corr_2000e16_prRipe {p : Person} {c : ComplaintText} :
    Elements.FederalSectorExhaustion p c →
    (Procedure.FederalAgencyFinalActionTaken c ∧
        Procedure.FederalSuitWithinNinetyDaysOfFinalAction c) ∨
      Procedure.FederalOneHundredEightyDaysElapsed c





theorem s2000e16_elements_implies_procedure_modulo_gaps
    {f : Elements.FederalUnit} {p : Person} {b : Elements.ProtectedBasis}
    {r : Procedure.Respondent} {d : Procedure.JudicialDistrict} {c : ComplaintText}
    (h : Elements.Section2000e16 f p b c)
    (gap_venue : Procedure.VenueProper p r d c) :
    Procedure.TimelyFederalSectorCivilAction p r d c :=
  { covered := corr_2000e16_prCovered h.coveredUnit
    aggrieved := corr_2000e16_prAggrieved h.discrimination
    agencyHeadDefendant := corr_2000e16_prDefendant h.properDefendant
    ripe := corr_2000e16_prRipe h.exhaustion
    venue := gap_venue }






axiom gcorr_16_covered {f : Elements.FederalUnit} {p : Person} {c : ComplaintText} :
    Elements.IsCoveredFederalUnit f c →
    Elements.IsFederalEmployeeOrApplicant p f c →
    ¬ Elements.IsAlienEmployedOutsideTheUnitedStates p c →
    Proving.TitleVII.FederalSector.IsCoveredFederalEmployee (gFederalEmployee p)
      (gComplaint c)
axiom gcorr_16_agencyHead {f : Elements.FederalUnit} {p : Person} {c : ComplaintText} :
    Elements.HeadOfDepartmentAgencyOrUnitNamedAsDefendant f c →
    Proving.TitleVII.FederalSector.IsAgencyHead (gAgencyHead f) (gFederalEmployee p)
      (gComplaint c)
axiom gcorr_16_discrimination {f : Elements.FederalUnit} {p : Person}
    {b : Elements.ProtectedBasis} {c : ComplaintText} :
    Elements.PersonnelActionNotFreeFromDiscrimination p f b c →
    Proving.TitleVII.FederalSector.PersonnelActionDiscriminatory (gPersonnelAction f)
      (gFederalEmployee p) (gGround b) (gComplaint c)
axiom gcorr_16_exhaustionFinal {p : Person} {c : ComplaintText} :
    Elements.ReceivedNoticeOfFinalAgencyAction p c →
    Proving.TitleVII.FederalSector.FederalAdministrativeExhaustion (gFederalEmployee p)
      (gComplaint c)
axiom gcorr_16_exhaustionInaction {p : Person} {c : ComplaintText} :
    Elements.DaysFromInitialChargeFilingWithAgency p c ≥ 180 →
    Proving.TitleVII.FederalSector.FederalAdministrativeExhaustion (gFederalEmployee p)
      (gComplaint c)
axiom gcorr_16_timelySuit {p : Person} {c : ComplaintText} :
    Elements.DaysFromFinalAgencyActionToCivilAction p c ≤ 90 →
    Proving.TitleVII.FederalSector.FederalSuitTimelyFiled (gFederalEmployee p)
      (gComplaint c)
axiom gcorr_16_finalActionIssued {p : Person} {c : ComplaintText} :
    Elements.ReceivedNoticeOfFinalAgencyAction p c →
    Proving.TitleVII.FederalSector.FinalAgencyActionIssued (gFederalEmployee p)
      (gComplaint c)
axiom gcorr_16_inaction {p : Person} {c : ComplaintText} :
    Elements.DaysFromInitialChargeFilingWithAgency p c ≥ 180 →
    Proving.TitleVII.FederalSector.AgencyInactionAfterCharge (gFederalEmployee p)
      (gComplaint c)




theorem s2000e16_elements_implies_golden_federal_sector
    {f : Elements.FederalUnit} {p : Person} {b : Elements.ProtectedBasis}
    {c : ComplaintText}
    (h : Elements.Section2000e16 f p b c)
    (hFinal : Elements.ReceivedNoticeOfFinalAgencyAction p c)
    (h90 : Elements.DaysFromFinalAgencyActionToCivilAction p c ≤ 90) :
    Proving.TitleVII.FederalSector.ValidFederalSectorClaim (gFederalEmployee p)
      (gComplaint c) :=
  .mk (gAgencyHead f) (gPersonnelAction f) (gGround b)
    { coveredEmployee := gcorr_16_covered h.coveredUnit h.coveredIndividual h.notAlienAbroad
      agencyHeadDef := gcorr_16_agencyHead (p := p) h.properDefendant
      discrimination := gcorr_16_discrimination h.discrimination
      exhaustion := gcorr_16_exhaustionFinal hFinal
      suitAuthorized := .finalAction (gcorr_16_finalActionIssued hFinal)
                                     (gcorr_16_timelySuit h90) }











theorem s2000e16_elements_implies_golden_federal_sector_via_inaction
    {f : Elements.FederalUnit} {p : Person} {b : Elements.ProtectedBasis}
    {c : ComplaintText}
    (h : Elements.Section2000e16 f p b c)
    (hInaction : Elements.DaysFromInitialChargeFilingWithAgency p c ≥ 180) :
    Proving.TitleVII.FederalSector.ValidFederalSectorClaim (gFederalEmployee p)
      (gComplaint c) :=
  .mk (gAgencyHead f) (gPersonnelAction f) (gGround b)
    { coveredEmployee := gcorr_16_covered h.coveredUnit h.coveredIndividual h.notAlienAbroad
      agencyHeadDef := gcorr_16_agencyHead (p := p) h.properDefendant
      discrimination := gcorr_16_discrimination h.discrimination
      exhaustion := gcorr_16_exhaustionInaction hInaction
      suitAuthorized := .agencyInaction (gcorr_16_inaction hInaction) }



axiom corr_2000e16b_covered {p : Person} {c : ComplaintText} :
    Elements.GeraCoveredIndividual p c → Deontic.IsCoveredGovernmentEmployee p c
axiom corr_2000e16b_affects {p : Person} {b : Elements.GeraBasis} {c : ComplaintText}
    (q : Person) (pa : Deontic.PersonnelAction) :
    Elements.PersonnelActionNotFreeFromGeraDiscrimination p b c →
    Deontic.PersonnelActionAffectsIndividual pa p q c
axiom corr_2000e16b_notFree {p : Person} {b : Elements.GeraBasis} {c : ComplaintText}
    (pa : Deontic.PersonnelAction) :
    Elements.PersonnelActionNotFreeFromGeraDiscrimination p b c →
    ¬ Deontic.PersonnelActionFreeFromDiscrimination pa c



theorem s2000e16b_elements_implies_deontic
    {p : Person} {b : Elements.GeraBasis} {c : ComplaintText}
    (q : Person) (pa : Deontic.PersonnelAction)
    (h : Elements.Section2000e16b p b c) :
    Deontic.ObligationBreached2000e16ba q p pa c :=
  ⟨{ beneficiary := corr_2000e16b_covered h.covered
     condition := corr_2000e16b_affects q pa h.discrimination },
   corr_2000e16b_notFree pa h.discrimination⟩

axiom corr_2000e16b_onCovered {p : Person} {c : ComplaintText} :
    Elements.GeraCoveredIndividual p c → Ontology.IsCoveredStateEmployee p c
axiom corr_2000e16b_onAction {p : Person} {b : Elements.GeraBasis} {c : ComplaintText}
    (act : Ontology.PersonnelAction) :
    Elements.PersonnelActionNotFreeFromGeraDiscrimination p b c →
    Ontology.IsPersonnelAction act c
axiom corr_2000e16b_onBasis {b : Elements.GeraBasis} {c : ComplaintText}
    (ob : Ontology.Basis) : Ontology.IsProtectedBasis ob c
axiom corr_2000e16b_onDiscriminatory {p : Person} {b : Elements.GeraBasis}
    {c : ComplaintText} (act : Ontology.PersonnelAction) (ob : Ontology.Basis) :
    Elements.PersonnelActionNotFreeFromGeraDiscrimination p b c →
    Ontology.IsDiscriminatoryPersonnelAction act ob c



theorem s2000e16b_elements_implies_ontology
    {p : Person} {b : Elements.GeraBasis} {c : ComplaintText}
    (act : Ontology.PersonnelAction) (ob : Ontology.Basis)
    (h : Elements.Section2000e16b p b c) :
    Ontology.GovernmentEmployeeRightsActViolation p act ob c :=
  { coveredEmployee := corr_2000e16b_onCovered h.covered
    isAction := corr_2000e16b_onAction act h.discrimination
    protectedBasis := corr_2000e16b_onBasis (b := b) ob
    discriminatory := corr_2000e16b_onDiscriminatory act ob h.discrimination }

axiom corr_2000e16c_deWindow {p : Person} {c : ComplaintText} :
    Elements.DaysFromViolationToGeraComplaint p c ≤ 180 →
    Deontic.ComplaintFiledWithinOneHundredEightyDays p c



theorem s2000e16c_elements_implies_deontic
    {p : Person} {b : Elements.GeraBasis} {c : ComplaintText}
    (h : Elements.Section2000e16c p b c) :
    Deontic.Permission2000e16cb1 p c :=
  { beneficiary := corr_2000e16b_covered h.violation.covered
    window := corr_2000e16c_deWindow h.timely }

axiom corr_2000e16c_prCovered {p : Person} {c : ComplaintText} :
    Elements.GeraCoveredIndividual p c → Procedure.GeraCoveredEmployee p c
axiom corr_2000e16c_prFiled {p : Person} {c : ComplaintText} :
    Elements.GeraComplaintFiledWithCommission p c →
    Procedure.GeraComplaintFiledWithCommission c
axiom corr_2000e16c_prWindow {p : Person} {c : ComplaintText} :
    Elements.DaysFromViolationToGeraComplaint p c ≤ 180 →
    Procedure.GeraComplaintWithinOneHundredEightyDays c



theorem s2000e16c_elements_implies_procedure
    {p : Person} {b : Elements.GeraBasis} {c : ComplaintText}
    (h : Elements.Section2000e16c p b c) :
    Procedure.TimelyGeraComplaint p c :=
  { covered := corr_2000e16c_prCovered h.violation.covered
    filed := corr_2000e16c_prFiled h.filedWithCommission
    withinWindow := corr_2000e16c_prWindow h.timely }

axiom corr_2000e16c_reCovered {p : Person} {c : ComplaintText} :
    Elements.GeraCoveredIndividual p c → Remedy.IsGeraCoveredEmployee p c
axiom corr_2000e16c_reWindow {p : Person} {c : ComplaintText} :
    Elements.DaysFromViolationToGeraComplaint p c ≤ 180 →
    Remedy.GeraComplaintWithinOneHundredEightyDays p c





theorem s2000e16c_elements_implies_remedy_modulo_gaps
    {p : Person} {b : Elements.GeraBasis} {c : ComplaintText}
    (h : Elements.Section2000e16c p b c)
    (gap_commissionFinalOrder : Remedy.CommissionFinalOrderEntered p c) :
    Remedy.GeraAdministrativeRemedy2000e16c p c :=
  { covered := corr_2000e16c_reCovered h.violation.covered
    timely := corr_2000e16c_reWindow h.timely
    finalOrder := gap_commissionFinalOrder }

axiom corr_2000e16c_prReCovered {p : Person} {c : ComplaintText} :
    Procedure.GeraCoveredEmployee p c → Remedy.IsGeraCoveredEmployee p c
axiom corr_2000e16c_prReWindow {p : Person} {c : ComplaintText} :
    Procedure.GeraComplaintWithinOneHundredEightyDays c →
    Remedy.GeraComplaintWithinOneHundredEightyDays p c
axiom corr_2000e16c_prReOrder {p : Person} {c : ComplaintText} :
    Procedure.GeraFinalOrderIssued c → Remedy.CommissionFinalOrderEntered p c




theorem s2000e16c_procedure_implies_remedy
    {p : Person} {c : ComplaintText} (h : Procedure.GeraJudicialReview p c) :
    Remedy.GeraAdministrativeRemedy2000e16c p c :=
  { covered := corr_2000e16c_prReCovered h.complaint.covered
    timely := corr_2000e16c_prReWindow h.complaint.withinWindow
    finalOrder := corr_2000e16c_prReOrder h.finalOrder }



axiom corr_2000e17_addressee {e : Elements.Employer} {c : ComplaintText} (p : Person) :
    Deontic.IsFederalAgencyOrOfficer p c
axiom corr_2000e17_accepted {e : Elements.Employer} {pl : Elements.AffirmativeActionPlan}
    {c : ComplaintText} :
    Elements.HasPreviouslyAcceptedAffirmativeActionPlanSameFacility e pl c →
    Elements.MonthsSincePlanAcceptance pl c ≤ 12 →
    Deontic.AffirmativeActionPlanPreviouslyAccepted (mapPlanElDe pl) c
axiom corr_2000e17_noHearing {e : Elements.Employer} {c : ComplaintText} (q : Person) :
    ¬ Elements.AccordedFullHearingAndAdjudication e c →
    ¬ Deontic.AccordedFullHearingAndAdjudication q c
axiom corr_2000e17_noDeviation {e : Elements.Employer} {pl : Elements.AffirmativeActionPlan}
    {c : ComplaintText} (q : Person) :
    ¬ Elements.DeviatedSubstantiallyFromAffirmativeActionPlan e c →
    ¬ Deontic.SubstantialDeviationFromPlan q (mapPlanElDe pl) c




theorem s2000e17_elements_implies_deontic
    {e : Elements.Employer} {pl : Elements.AffirmativeActionPlan} {c : ComplaintText}
    (p q : Person) (h : Elements.Section2000e17 e pl c) :
    Deontic.Prohibition2000e17 p q (mapPlanElDe pl) c :=
  { addressee := corr_2000e17_addressee (e := e) (c := c) p
    acceptedPlan := corr_2000e17_accepted h.accepted h.withinTwelveMonths
    noHearing := corr_2000e17_noHearing q h.noHearing
    noSubstantialDeviation := corr_2000e17_noDeviation (pl := pl) q h.noSubstantialDeviation }

axiom corr_2000e17_reNoHearing {e : Elements.Employer} {c : ComplaintText}
    (k : Remedy.GovernmentContract) :
    Elements.ContractDeniedWithheldTerminatedOrSuspended e c →
    ¬ Elements.AccordedFullHearingAndAdjudication e c →
    ¬ Remedy.AcceptedAffirmativeActionPlanInForce k c ∨
      Remedy.SubstantialDeviationFromPlan k c ∨
      Remedy.FullHearingAndAdjudicationAccorded k c





theorem s2000e17_elements_implies_remedy
    {e : Elements.Employer} {pl : Elements.AffirmativeActionPlan} {c : ComplaintText}
    (k : Remedy.GovernmentContract) (h : Elements.Section2000e17 e pl c) :
    Remedy.ContractSanctionPermitted2000e17 k c :=
  match corr_2000e17_reNoHearing k h.adverseContractAction h.noHearing with
  | Or.inl hn => .noAcceptedPlan hn
  | Or.inr (Or.inl hd) => .substantialDeviation hd
  | Or.inr (Or.inr hh) => .afterFullHearing hh

axiom corr_2000e17_onEmployer {e : Elements.Employer} {c : ComplaintText}
    (employer : Person) :
    Elements.ContractDeniedWithheldTerminatedOrSuspended e c →
    Ontology.IsEmployer employer c
axiom corr_2000e17_onPlan {e : Elements.Employer} {pl : Elements.AffirmativeActionPlan}
    {c : ComplaintText} :
    Elements.HasPreviouslyAcceptedAffirmativeActionPlanSameFacility e pl c →
    Ontology.IsAcceptedAffirmativeActionPlan (mapPlanElOn pl) c



theorem s2000e17_elements_implies_ontology
    {e : Elements.Employer} {pl : Elements.AffirmativeActionPlan} {c : ComplaintText}
    (employer : Person) (h : Elements.Section2000e17 e pl c) :
    Ontology.AffirmativeActionPlanProtection (mapPlanElOn pl) employer c :=
  { isEmployer := corr_2000e17_onEmployer employer h.adverseContractAction
    accepted := corr_2000e17_onPlan h.accepted }

axiom corr_2000e17_prNoHearing {e : Elements.Employer} {c : ComplaintText}
    (k : Procedure.GovernmentContract) :
    ¬ Elements.AccordedFullHearingAndAdjudication e c →
    ¬ Procedure.FullHearingAndAdjudicationAccorded k c








theorem s2000e17_elements_implies_procedure_noncompliance
    {e : Elements.Employer} {pl : Elements.AffirmativeActionPlan} {c : ComplaintText}
    (k : Procedure.GovernmentContract) (h : Elements.Section2000e17 e pl c) :
    ¬ Procedure.ContractActionProcedure (mapPlanElPr pl) k c :=
  fun hpr => corr_2000e17_prNoHearing k h.noHearing hpr.hearingAccorded

end Proving.USC.T42.Ch21TitleVII.Bridge
