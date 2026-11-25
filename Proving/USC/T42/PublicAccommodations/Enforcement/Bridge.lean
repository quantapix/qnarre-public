

































import Proving.USC.T42.PublicAccommodations.Enforcement.Elements.Statute
import Proving.USC.T42.PublicAccommodations.Enforcement.Deontic.Statute
import Proving.USC.T42.PublicAccommodations.Enforcement.Ontology.Statute
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Statute
import Proving.USC.T42.PublicAccommodations.Enforcement.Structure.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Bridge
open Proving.USC.Common


open Proving.USC.T42.PublicAccommodations.Enforcement










axiom corr_5a_cause {r : Elements.Respondent} {c : ComplaintText} :
    Elements.EngagedInPatternOrPracticeOfResistance r c →
    Elements.IntendedToDenyFullExercise r c →
    Deontic.PatternOrPracticeCause c



axiom corr_5a_action {cpl : Elements.Complaint} {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt cpl c →
    Deontic.AGBroughtCivilAction c




theorem s2000a5a_elements_implies_deontic
    {a : Elements.Actor} {r : Elements.Respondent} {cpl : Elements.Complaint}
    {c : ComplaintText}
    (h : Elements.Section2000a5a a r cpl c) :
    Deontic.Permission2000a5AGAction_exercised c :=
  ⟨⟨corr_5a_cause h.patternOrPractice h.intent⟩, corr_5a_action h.federalForum⟩




axiom corr_5a_o_person {r : Elements.Respondent} {p : Ontology.PersonOrGroup}
    {c : ComplaintText} :
    Elements.IsPersonOrGroup r c → Ontology.IsPersonOrGroup p c

axiom corr_5a_o_pattern {r : Elements.Respondent} {x : Ontology.PatternOrPractice}
    {c : ComplaintText} :
    Elements.EngagedInPatternOrPracticeOfResistance r c → Ontology.IsPatternOrPractice x c

axiom corr_5a_o_right {r : Elements.Respondent} {rt : Ontology.SubchapterRight}
    {c : ComplaintText} :
    Elements.IntendedToDenyFullExercise r c → Ontology.IsSubchapterRight rt c

axiom corr_5a_o_relief {cpl : Elements.Complaint} {rel : Ontology.PreventiveRelief}
    {c : ComplaintText} :
    Elements.ComplaintRequestsPreventiveRelief cpl c → Ontology.IsPreventiveRelief rel c


axiom corr_5a_o_action {a : Elements.Actor} {cpl : Elements.Complaint}
    {act : Ontology.AttorneyGeneralCivilAction} {c : ComplaintText} :
    Elements.ComplaintSignedByAttorneyGeneral a cpl c →
    Elements.ComplaintSetsForthPatternFacts cpl c →
    Elements.FiledInAppropriateDistrictCourt cpl c →
    Ontology.IsAttorneyGeneralCivilAction act c



theorem s2000a5a_elements_implies_ontology
    {a : Elements.Actor} {r : Elements.Respondent} {cpl : Elements.Complaint}
    {c : ComplaintText}
    {act : Ontology.AttorneyGeneralCivilAction} {p : Ontology.PersonOrGroup}
    {x : Ontology.PatternOrPractice} {rt : Ontology.SubchapterRight}
    {rel : Ontology.PreventiveRelief}
    (h : Elements.Section2000a5a a r cpl c) :
    Ontology.AGCivilActionMembership act p x rt rel c :=
  ⟨corr_5a_o_action h.signed h.pleadsFacts h.federalForum,
   corr_5a_o_person h.personOrGroup,
   corr_5a_o_pattern h.patternOrPractice,
   corr_5a_o_right h.intent,
   corr_5a_o_relief h.requestsRelief⟩




axiom corr_5a_p_cause {r : Elements.Respondent} {p : Proving.USC.Common.Person}
    {c : ComplaintText} :
    Elements.EngagedInPatternOrPracticeOfResistance r c →
    Elements.IntendedToDenyFullExercise r c →
    Procedure.AGReasonableCause p c

axiom corr_5a_p_venue {cpl : Elements.Complaint} {p : Proving.USC.Common.Person}
    {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt cpl c → Proving.USC.Common.VenueNexus p c

axiom corr_5a_p_jur {cpl : Elements.Complaint} {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt cpl c →
    Proving.USC.Common.FederalJurisdictionalNexus c

axiom corr_5a_p_filed {cpl : Elements.Complaint} {p : Proving.USC.Common.Person}
    {a : Procedure.AGComplaint} {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt cpl c → Procedure.AGActionFiled p a c


axiom corr_5a_p_wf {a' : Elements.Actor} {cpl : Elements.Complaint}
    {a : Procedure.AGComplaint} {c : ComplaintText} :
    Elements.ComplaintSignedByAttorneyGeneral a' cpl c →
    Elements.ComplaintSetsForthPatternFacts cpl c →
    Elements.ComplaintRequestsPreventiveRelief cpl c →
    Procedure.AGComplaintWellFormed a c


theorem s2000a5a_elements_implies_procedure
    {a' : Elements.Actor} {r : Elements.Respondent} {cpl : Elements.Complaint}
    {c : ComplaintText}
    {p : Proving.USC.Common.Person} {a : Procedure.AGComplaint}
    (h : Elements.Section2000a5a a' r cpl c) :
    Procedure.AGActionWellFiled p a c :=
  ⟨corr_5a_p_cause h.patternOrPractice h.intent,
   corr_5a_p_venue h.federalForum,
   corr_5a_p_jur h.federalForum,
   corr_5a_p_filed h.federalForum,
   corr_5a_p_wf h.signed h.pleadsFacts h.requestsRelief⟩





axiom corr_5a_s_exists {r : Elements.Respondent} {c : ComplaintText} :
    Elements.IntendedToDenyFullExercise r c →
    Structure.ReferencedSectionExists Structure.edge_2000a5_incorporates_subchapter c

axiom corr_5a_s_honored {r : Elements.Respondent} {c : ComplaintText} :
    Elements.EngagedInPatternOrPracticeOfResistance r c →
    Structure.IncorporationHonored Structure.edge_2000a5_incorporates_subchapter c


theorem s2000a5_elements_implies_structure
    {a : Elements.Actor} {r : Elements.Respondent} {cpl : Elements.Complaint}
    {c : ComplaintText}
    (h : Elements.Section2000a5a a r cpl c) :
    Structure.Coherent2000a5 c :=
  ⟨corr_5a_s_exists h.intent, corr_5a_s_honored h.patternOrPractice⟩








axiom corr_5b_request {a : Elements.Actor} {c : ComplaintText} :
    Elements.ThreeJudgeRequestFiledWithClerk a c → Deontic.ThreeJudgeRequestFiled c







theorem s2000a5b_elements_implies_deontic
    {a : Elements.Actor} {c : ComplaintText} {j : Deontic.JudicialOfficer}
    (h : Elements.Section2000a5b a c)
    (hAddr : Deontic.AddresseeIsChiefJudge j c) :
    Deontic.Obligation2000a5Designate j c :=
  ⟨hAddr, corr_5b_request h.requestFiled⟩


axiom corr_5b_o_court {a : Elements.Actor} {ct : Ontology.ThreeJudgeCourt}
    {c : ComplaintText} :
    Elements.ThreeJudgeRequestFiledWithClerk a c → Ontology.IsThreeJudgeCourt ct c

axiom corr_5b_o_cert {a : Elements.Actor} {cert : Ontology.GeneralPublicImportanceCertificate}
    {c : ComplaintText} :
    Elements.CertifiedGeneralPublicImportance a c →
    Ontology.IsGeneralPublicImportanceCertificate cert c


theorem s2000a5b_elements_implies_ontology
    {a : Elements.Actor} {c : ComplaintText}
    {ct : Ontology.ThreeJudgeCourt} {cert : Ontology.GeneralPublicImportanceCertificate}
    (h : Elements.Section2000a5b a c) :
    Ontology.ThreeJudgeCourtMembership ct cert c :=
  ⟨corr_5b_o_court h.requestFiled, corr_5b_o_cert h.publicImportance⟩



















axiom corr_4_addressee {a : Elements.Actor} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt a c → Deontic.AddresseeIsService c


axiom corr_4_condition {a : Elements.Actor} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt a c → Deontic.ComplaintReferredByCourt c




theorem s2000a4_elements_implies_deontic
    {a : Elements.Actor} {c : ComplaintText}
    (h : Elements.Section2000a4 a c) :
    Deontic.Power2000a4Investigate c :=
  ⟨corr_4_addressee h.referred, corr_4_condition h.referred⟩




axiom corr_4_o_service {a : Elements.Actor} {e : Ontology.CommunityRelationsService}
    {c : ComplaintText} :
    Elements.ComplaintReferredByCourt a c → Ontology.IsCommunityRelationsService e c

axiom corr_4_o_referred {a : Elements.Actor} {rc : Ontology.ReferredComplaint}
    {c : ComplaintText} :
    Elements.ComplaintReferredByCourt a c → Ontology.IsReferredComplaint rc c


axiom corr_4_o_settlement {a : Elements.Actor} {s : Ontology.VoluntarySettlement}
    {c : ComplaintText} :
    Elements.EndeavorsVoluntarySettlement a c → Ontology.IsVoluntarySettlement s c


theorem s2000a4_elements_implies_ontology
    {a : Elements.Actor} {c : ComplaintText}
    {e : Ontology.CommunityRelationsService} {rc : Ontology.ReferredComplaint}
    {s : Ontology.VoluntarySettlement}
    (h : Elements.Section2000a4 a c) :
    Ontology.ServiceConciliationMembership e rc s c :=
  ⟨corr_4_o_service h.referred, corr_4_o_referred h.referred,
   corr_4_o_settlement h.endeavorsSettle⟩




axiom corr_4_p_referred {a : Elements.Actor} {r : Procedure.ReferredComplaint}
    {c : ComplaintText} :
    Elements.ComplaintReferredByCourt a c → Procedure.ComplaintReferredToCRS r c


axiom corr_4_p_investigated {a : Elements.Actor} {r : Procedure.ReferredComplaint}
    {c : ComplaintText} :
    Elements.ComplaintReferredByCourt a c → Procedure.CRSInvestigated r c


axiom corr_4_p_confidential {a : Elements.Actor} {r : Procedure.ReferredComplaint}
    {c : ComplaintText} :
    Elements.HearingsInExecutiveSession a c →
    Elements.TestimonyWithheldAbsentAgreement a c →
    Procedure.CRSHearingConfidential r c

axiom corr_4_p_settlement {a : Elements.Actor} {r : Procedure.ReferredComplaint}
    {c : ComplaintText} :
    Elements.EndeavorsVoluntarySettlement a c → Procedure.CRSSoughtVoluntarySettlement r c


theorem s2000a4_elements_implies_procedure
    {a : Elements.Actor} {c : ComplaintText} {r : Procedure.ReferredComplaint}
    (h : Elements.Section2000a4 a c) :
    Procedure.CRSProcessProper r c :=
  ⟨corr_4_p_referred h.referred, corr_4_p_investigated h.referred,
   corr_4_p_confidential h.executiveSession h.testimonyWithheld,
   corr_4_p_settlement h.endeavorsSettle⟩





axiom corr_4_s_exists {a : Elements.Actor} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt a c →
    Structure.ReferencedSectionExists Structure.edge_2000a4_incorporates_2000a3d c

axiom corr_4_s_honored {a : Elements.Actor} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt a c →
    Structure.IncorporationHonored Structure.edge_2000a4_incorporates_2000a3d c


theorem s2000a4_elements_implies_structure
    {a : Elements.Actor} {c : ComplaintText}
    (h : Elements.Section2000a4 a c) :
    Structure.Coherent2000a4 c :=
  ⟨corr_4_s_exists h.referred, corr_4_s_honored h.referred⟩









theorem s2000a5a_tierA
    {a : Elements.Actor} {r : Elements.Respondent} {cpl : Elements.Complaint}
    {c : ComplaintText}
    {act : Ontology.AttorneyGeneralCivilAction} {p : Ontology.PersonOrGroup}
    {x : Ontology.PatternOrPractice} {rt : Ontology.SubchapterRight}
    {rel : Ontology.PreventiveRelief}
    {pp : Proving.USC.Common.Person} {pa : Procedure.AGComplaint}
    (h : Elements.Section2000a5a a r cpl c) :
    Deontic.Permission2000a5AGAction_exercised c
    ∧ Ontology.AGCivilActionMembership act p x rt rel c
    ∧ Procedure.AGActionWellFiled pp pa c
    ∧ Structure.Coherent2000a5 c :=
  ⟨s2000a5a_elements_implies_deontic h,
   s2000a5a_elements_implies_ontology h,
   s2000a5a_elements_implies_procedure h,
   s2000a5_elements_implies_structure h⟩



theorem s2000a4_tierA
    {a : Elements.Actor} {c : ComplaintText}
    {e : Ontology.CommunityRelationsService} {rc : Ontology.ReferredComplaint}
    {s : Ontology.VoluntarySettlement} {r : Procedure.ReferredComplaint}
    (h : Elements.Section2000a4 a c) :
    Deontic.Power2000a4Investigate c
    ∧ Ontology.ServiceConciliationMembership e rc s c
    ∧ Procedure.CRSProcessProper r c
    ∧ Structure.Coherent2000a4 c :=
  ⟨s2000a4_elements_implies_deontic h,
   s2000a4_elements_implies_ontology h,
   s2000a4_elements_implies_procedure h,
   s2000a4_elements_implies_structure h⟩






theorem s2000a5b_tierB_modulo_gaps
    {a : Elements.Actor} {c : ComplaintText} {j : Deontic.JudicialOfficer}
    {ct : Ontology.ThreeJudgeCourt} {cert : Ontology.GeneralPublicImportanceCertificate}
    (h : Elements.Section2000a5b a c)
    (gap_5b_addressee : Deontic.AddresseeIsChiefJudge j c) :
    Deontic.Obligation2000a5Designate j c
    ∧ Ontology.ThreeJudgeCourtMembership ct cert c :=
  ⟨s2000a5b_elements_implies_deontic h gap_5b_addressee,
   s2000a5b_elements_implies_ontology h⟩

end Proving.USC.T42.PublicAccommodations.Enforcement.Bridge
