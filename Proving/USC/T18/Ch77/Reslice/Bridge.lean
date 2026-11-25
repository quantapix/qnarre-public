










































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Reslice.Elements.Statute
import Proving.USC.T18.Ch77.Reslice.Deontic.Statute
import Proving.USC.T18.Ch77.Reslice.Ontology.Statute
import Proving.USC.T18.Ch77.Reslice.Procedure.Statute
import Proving.USC.T18.Ch77.Reslice.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Bridge

open Proving.USC.Common (Person ComplaintText ActedWithScienter)















axiom mapLaborE2O : Elements.LaborOrServices → Ontology.LaborOrServices


axiom mapSexActE2O : Elements.SexAct → Ontology.SexAct



axiom mapDocE2D : Elements.IdentificationDocument → Deontic.Document
axiom mapDocE2O : Elements.IdentificationDocument → Ontology.IdentificationDocument
axiom mapDocE2P : Elements.IdentificationDocument → Procedure.IdentityDocument
axiom mapDocD2O : Deontic.Document → Ontology.IdentificationDocument
axiom mapDocD2P : Deontic.Document → Procedure.IdentityDocument
axiom mapDocP2O : Procedure.IdentityDocument → Ontology.IdentificationDocument







axiom laborOf1590 (v : Person) (c : ComplaintText) : Ontology.LaborOrServices




axiom prosecutionOf (d : Person) (c : ComplaintText) : Procedure.Prosecution






axiom inCourseSectionOf (d : Person) (c : ComplaintText) : Procedure.Ch77PredicateSection
axiom intentSectionOf (d : Person) (c : ComplaintText) : Procedure.Ch77PredicateSection




axiom intentSectionOf_eligible (d : Person) (c : ComplaintText) :
    Procedure.intentToViolateEligible (intentSectionOf d c) = true



theorem inCourseSectionOf_eligible (d : Person) (c : ComplaintText) :
    Procedure.inCourseOfEligible (inCourseSectionOf d c) = true := rfl










axiom corr1590_culpable_addressee {d : Person} {c : ComplaintText} :
    Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c

axiom corr1590_scienter_knowingly {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Deontic.ActedKnowingly1590a d c

axiom corr1590_actus_act {d v : Person} {c : ComplaintText} :
    Elements.TraffickingActus1590a d v c → Deontic.TraffickingActOccurred1590a d v c





axiom corr1590_chapter_condition {v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} :
    Elements.ForLaborOrServices v ls c →
    Elements.LaborOrServicesInViolationOfChapter77 ls c →
    Deontic.LaborOrServicesInViolationOfChapter1590a v c


theorem s1590_elements_implies_deontic {d v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} (h : Elements.Section1590a d v ls c) :
    Deontic.Prohibition1590aViolated d v c :=
  ⟨⟨corr1590_culpable_addressee h.culpable,
    corr1590_chapter_condition h.purpose h.chapterViolation⟩,
   corr1590_scienter_knowingly h.scienter,
   corr1590_actus_act h.actus⟩



axiom corr1590_actus_procConduct {d v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} :
    Elements.TraffickingActus1590a d v c →
    Elements.ForLaborOrServices v ls c →
    ActedWithScienter d c →
    Procedure.RecruitedOrObtainedForLaborOrServices d v c

axiom corr1590_chapter_procChapter {d v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} :
    Elements.ForLaborOrServices v ls c →
    Elements.LaborOrServicesInViolationOfChapter77 ls c →
    Procedure.LaborOrServicesInViolationOfThisChapter d v c


theorem s1590_elements_implies_procedure {d v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} (h : Elements.Section1590a d v ls c) :
    Procedure.Section1590ProsecutionMadeOut d v c :=
  ⟨corr1590_actus_procConduct h.actus h.purpose h.scienter,
   corr1590_chapter_procChapter h.purpose h.chapterViolation⟩



axiom corr1590_actus_ontPerson {d v : Person} {c : ComplaintText} :
    Elements.TraffickingActus1590a d v c →
    Ontology.IsPersonRecruitedHarboredTransportedProvidedOrObtained v c

axiom corr1590_labor_ontLabor {v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} :
    Elements.ForLaborOrServices v ls c → Ontology.IsLaborOrServices (mapLaborE2O ls) c

axiom corr1590_chapter_ontChapter {ls : Elements.LaborOrServices} {c : ComplaintText} :
    Elements.LaborOrServicesInViolationOfChapter77 ls c → Ontology.IsChapter77Violation c


theorem s1590_elements_implies_ontology {d v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} (h : Elements.Section1590a d v ls c) :
    Ontology.Section1590aTermInventory v (mapLaborE2O ls) c :=
  ⟨corr1590_actus_ontPerson h.actus,
   corr1590_labor_ontLabor h.purpose,
   corr1590_chapter_ontChapter h.chapterViolation⟩










axiom corr1590_scienter_conductRung {d : Person} {c : ComplaintText} :
    ActedWithScienter d c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.conduct1590a c


theorem s1590_elements_implies_scienter {d v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} (h : Elements.Section1590a d v ls c) :
    Scienter.Scienter1590a d c :=
  ⟨corr1590_scienter_conductRung h.scienter, trivial⟩



axiom corr1590_deonticAct_procConduct {d v : Person} {c : ComplaintText} :
    Deontic.TraffickingActOccurred1590a d v c →
    Deontic.ActedKnowingly1590a d c →
    Procedure.RecruitedOrObtainedForLaborOrServices d v c

axiom corr1590_deonticCond_procChapter {d v : Person} {c : ComplaintText} :
    Deontic.LaborOrServicesInViolationOfChapter1590a v c →
    Procedure.LaborOrServicesInViolationOfThisChapter d v c


theorem s1590_deontic_implies_procedure {d v : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1590aViolated d v c) :
    Procedure.Section1590ProsecutionMadeOut d v c :=
  ⟨corr1590_deonticAct_procConduct h.2.2 h.2.1,
   corr1590_deonticCond_procChapter h.1.condition⟩



axiom corr1590_deonticAct_ontPerson {d v : Person} {c : ComplaintText} :
    Deontic.TraffickingActOccurred1590a d v c →
    Ontology.IsPersonRecruitedHarboredTransportedProvidedOrObtained v c

axiom corr1590_deonticCond_ontLabor {v : Person} {c : ComplaintText} :
    Deontic.LaborOrServicesInViolationOfChapter1590a v c →
    Ontology.IsLaborOrServices (laborOf1590 v c) c

axiom corr1590_deonticCond_ontChapter {v : Person} {c : ComplaintText} :
    Deontic.LaborOrServicesInViolationOfChapter1590a v c → Ontology.IsChapter77Violation c


theorem s1590_deontic_implies_ontology {d v : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1590aViolated d v c) :
    Ontology.Section1590aTermInventory v (laborOf1590 v c) c :=
  ⟨corr1590_deonticAct_ontPerson h.2.2,
   corr1590_deonticCond_ontLabor h.1.condition,
   corr1590_deonticCond_ontChapter h.1.condition⟩



axiom corr1590_deonticKnowing_rung {d : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly1590a d c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.conduct1590a c


theorem s1590_deontic_implies_scienter {d v : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1590aViolated d v c) : Scienter.Scienter1590a d c :=
  ⟨corr1590_deonticKnowing_rung h.2.1, trivial⟩



axiom corr1590_procConduct_ontPerson {d v : Person} {c : ComplaintText} :
    Procedure.RecruitedOrObtainedForLaborOrServices d v c →
    Ontology.IsPersonRecruitedHarboredTransportedProvidedOrObtained v c

axiom corr1590_procConduct_ontLabor {d v : Person} {c : ComplaintText} :
    Procedure.RecruitedOrObtainedForLaborOrServices d v c →
    Ontology.IsLaborOrServices (laborOf1590 v c) c

axiom corr1590_procChapter_ontChapter {d v : Person} {c : ComplaintText} :
    Procedure.LaborOrServicesInViolationOfThisChapter d v c →
    Ontology.IsChapter77Violation c


theorem s1590_procedure_implies_ontology {d v : Person} {c : ComplaintText}
    (h : Procedure.Section1590ProsecutionMadeOut d v c) :
    Ontology.Section1590aTermInventory v (laborOf1590 v c) c :=
  ⟨corr1590_procConduct_ontPerson h.conduct,
   corr1590_procConduct_ontLabor h.conduct,
   corr1590_procChapter_ontChapter h.chapterLink⟩








axiom corr1590_procConduct_rung {d v : Person} {c : ComplaintText} :
    Procedure.RecruitedOrObtainedForLaborOrServices d v c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.conduct1590a c


theorem s1590_procedure_implies_scienter {d v : Person} {c : ComplaintText}
    (h : Procedure.Section1590ProsecutionMadeOut d v c) : Scienter.Scienter1590a d c :=
  ⟨corr1590_procConduct_rung h.conduct, trivial⟩


























axiom corr1591_culpable_addressee {d : Person} {c : ComplaintText} :
    Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c

axiom corr1591_jurisdiction {d v : Person} {c : ComplaintText} :
    Elements.JurisdictionalNexus1591a1 d v c → Deontic.JurisdictionalNexus1591a1 d c

axiom corr1591_actus_recruitAct {d v : Person} {c : ComplaintText} :
    Elements.TraffickingActus1591a1 d v c → Deontic.RecruitmentActOccurred1591a1 d v c

axiom corr1591_mensLevel_deonticObject {d v : Person} {c : ComplaintText} :
    Elements.MensLevel1591a d v c → Deontic.MensReaObject1591a d v c



theorem s1591a1_elements_implies_deontic_modulo_gaps
    {d v : Person} {a : Elements.SexAct} {ven : Deontic.Venture} {c : ComplaintText}
    (gap_1591_chapeau_knowingly_absent_from_elements : Deontic.ActedKnowingly1591a d c)
    (gap_1591c_observation_route_has_no_deontic_mens_rea :
      Elements.HadReasonableOpportunityToObserve d v c → Deontic.MensReaObject1591a d v c)
    (h : Elements.Section1591a1 d v a c) :
    Deontic.Prohibition1591aViolated d v ven c :=
  ⟨⟨corr1591_culpable_addressee h.culpable,
    gap_1591_chapeau_knowingly_absent_from_elements,
    (match h.mens with
     | .proved (.means level _) => corr1591_mensLevel_deonticObject level
     | .proved (.minority level _) => corr1591_mensLevel_deonticObject level
     | .minorityObserved hObs _ =>
         gap_1591c_observation_route_has_no_deontic_mens_rea hObs)⟩,
   .recruitment (corr1591_jurisdiction h.jurisdiction)
     (corr1591_actus_recruitAct h.actus)⟩








axiom mapVentE2D : Elements.Venture → Deontic.Venture

axiom corr1591_venture {ven : Elements.Venture} {c : ComplaintText} :
    Elements.IsVenture ven c → Deontic.IsVenture1591e6 (mapVentE2D ven) c

axiom corr1591_participation {d : Person} {ven : Elements.Venture} {c : ComplaintText} :
    Elements.ParticipatesInVenture d ven c →
    Deontic.IsParticipationInVenture1591e4 d (mapVentE2D ven) c

axiom corr1591_benefit {d : Person} {ven : Elements.Venture} {c : ComplaintText} :
    Elements.BenefitsFinanciallyOrReceivesAnythingOfValue d ven c →
    Deontic.BenefitedFromVenture1591a2 d (mapVentE2D ven) c

axiom corr1591_ventureAct {v : Person} {ven : Elements.Venture} {c : ComplaintText} :
    Elements.VentureEngagedInActDescribedInParagraph1 ven c →
    Deontic.VentureEngagedInProhibitedAct1591a2 (mapVentE2D ven) v c



theorem s1591a2_elements_implies_deontic_modulo_gaps
    {d v : Person} {a : Elements.SexAct} {ven : Elements.Venture} {c : ComplaintText}
    (gap_1591_chapeau_knowingly_absent_from_elements : Deontic.ActedKnowingly1591a d c)
    (h : Elements.Section1591a2 d v a ven c) :
    Deontic.Prohibition1591aViolated d v (mapVentE2D ven) c :=
  ⟨⟨corr1591_culpable_addressee h.culpable,
    gap_1591_chapeau_knowingly_absent_from_elements,
    (match h.mens with
     | .means level _ => corr1591_mensLevel_deonticObject level
     | .minority level _ => corr1591_mensLevel_deonticObject level)⟩,
   .benefit (corr1591_venture h.venture) (corr1591_participation h.participation)
     (corr1591_benefit h.benefit) (corr1591_ventureAct h.ventureAct)⟩








axiom corr1591_jurisdiction_proc {d v : Person} {c : ComplaintText} :
    Elements.JurisdictionalNexus1591a1 d v c → Procedure.FederalJurisdictionalNexus1591 d c

axiom corr1591_actus_procAct {d v : Person} {c : ComplaintText} :
    Elements.TraffickingActus1591a1 d v c → Procedure.PerformedListedActUponPerson d v c

axiom corr1591_mensLevel_procProved {d v : Person} {c : ComplaintText} :
    Elements.MensLevel1591a d v c →
    Procedure.MensReaProofObligationDischarged1591 (prosecutionOf d c) d v c

axiom corr1591_mensLevel_procAgeProof {d v : Person} {c : ComplaintText} :
    Elements.MensLevel1591a d v c →
    Procedure.AgeKnowledgeProofObligationDischarged1591 (prosecutionOf d c) d v c

axiom corr1591_observe_procAgeProof {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObserve d v c →
    Procedure.AgeKnowledgeProofObligationDischarged1591 (prosecutionOf d c) d v c



theorem s1591a1_elements_implies_procedure_modulo_gaps
    {d v : Person} {a : Elements.SexAct} {c : ComplaintText}
    (gap_1591c_observation_route_discharges_no_means_or_minority_proof :
      Elements.HadReasonableOpportunityToObserve d v c →
      Procedure.MensReaProofObligationDischarged1591 (prosecutionOf d c) d v c)
    (h : Elements.Section1591a1 d v a c) :
    Procedure.Section1591ProsecutionMadeOut (prosecutionOf d c) d v c :=
  ⟨.actUponPerson (corr1591_jurisdiction_proc h.jurisdiction)
      (corr1591_actus_procAct h.actus),
   (match h.mens with
    | .proved (.means level _) => corr1591_mensLevel_procProved level
    | .proved (.minority level _) => corr1591_mensLevel_procProved level
    | .minorityObserved hObs _ =>
        gap_1591c_observation_route_discharges_no_means_or_minority_proof hObs),
   (match h.mens with
    | .proved (.means level _) => corr1591_mensLevel_procAgeProof level
    | .proved (.minority level _) => corr1591_mensLevel_procAgeProof level
    | .minorityObserved hObs _ => corr1591_observe_procAgeProof hObs)⟩



axiom corr1591_actus_ontPerson {d v : Person} {c : ComplaintText} :
    Elements.TraffickingActus1591a1 d v c →
    Ontology.IsPersonRecruitedEnticedHarboredOrSolicited v c

axiom corr1591_csa_ontCsa {a : Elements.SexAct} {c : ComplaintText} :
    Elements.CommercialSexAct1591e3 a c →
    Ontology.CommercialSexActMembership (mapSexActE2O a) c

axiom corr1591_jurisdiction_ont {d v : Person} {c : ComplaintText} :
    Elements.JurisdictionalNexus1591a1 d v c →
    Ontology.AffectsInterstateOrForeignCommerceOrIsWithinSMTJ c




private theorem elementsCsaOf {d v : Person} {a : Elements.SexAct} {c : ComplaintText}
    (h : Elements.MensRea1591a1 d v a c) : Elements.CommercialSexAct1591e3 a c :=
  match h with
  | .proved (.means _ route) => route.commercialSexAct
  | .proved (.minority _ route) => route.commercialSexAct
  | .minorityObserved _ route => route.commercialSexAct


theorem s1591a1_elements_implies_ontology {d v : Person} {a : Elements.SexAct}
    {c : ComplaintText} (h : Elements.Section1591a1 d v a c) :
    Ontology.Section1591aTermInventory v (mapSexActE2O a) c :=
  ⟨corr1591_actus_ontPerson h.actus,
   corr1591_csa_ontCsa (elementsCsaOf h.mens),
   corr1591_jurisdiction_ont h.jurisdiction⟩








axiom corr1591_level_yields_modality {d v : Person} {c : ComplaintText} :
    Elements.MensLevel1591a d v c →
    ∃ m : Scienter.ActModality, Scienter.ActModalityOfConduct d m c ∧
      Scienter.ElementScienterMet d (Scienter.ScienterElement.meansCircumstance1591a m) c

axiom corr1591_actus_yields_modality {d v : Person} {c : ComplaintText} :
    Elements.TraffickingActus1591a1 d v c →
    ∃ m : Scienter.ActModality, Scienter.ActModalityOfConduct d m c

axiom corr1591_observe_scienter {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObserve d v c →
    Scienter.ReasonableOpportunityToObserve d v c



theorem s1591a1_elements_implies_scienter_modulo_gaps
    {d v : Person} {a : Elements.SexAct} {c : ComplaintText}
    (gap_1591_chapeau_knowingly_absent_from_elements :
      Scienter.ElementScienterMet d Scienter.ScienterElement.conduct1591a1 c)
    (h : Elements.Section1591a1 d v a c) :
    ∃ m : Scienter.ActModality, Scienter.Scienter1591a1 d v m c :=
  match h.mens with
  | .proved (.means level _) =>
      let ⟨m, hMod, hRung⟩ := corr1591_level_yields_modality level
      ⟨m, gap_1591_chapeau_knowingly_absent_from_elements, hMod,
        .provedRung (.coerciveMeans hRung)⟩
  | .proved (.minority level _) =>
      let ⟨m, hMod, hRung⟩ := corr1591_level_yields_modality level
      ⟨m, gap_1591_chapeau_knowingly_absent_from_elements, hMod,
        .provedRung (.coerciveMeans hRung)⟩
  | .minorityObserved hObs _ =>
      let ⟨m, hMod⟩ := corr1591_actus_yields_modality h.actus
      ⟨m, gap_1591_chapeau_knowingly_absent_from_elements, hMod,
        .observeCarve (corr1591_observe_scienter hObs)⟩







axiom corr1591_deonticKnowing_conductRung {d : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly1591a d c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.conduct1591a1 c

axiom corr1591_deonticObject_yields_modality {d v : Person} {c : ComplaintText} :
    Deontic.MensReaObject1591a d v c →
    ∃ m : Scienter.ActModality, Scienter.ActModalityOfConduct d m c ∧
      Scienter.ElementScienterMet d (Scienter.ScienterElement.meansCircumstance1591a m) c


theorem s1591_deontic_implies_scienter {d v : Person} {ven : Deontic.Venture}
    {c : ComplaintText} (h : Deontic.Prohibition1591aViolated d v ven c) :
    ∃ m : Scienter.ActModality, Scienter.Scienter1591a1 d v m c :=
  let ⟨m, hMod, hRung⟩ := corr1591_deonticObject_yields_modality h.1.condition
  ⟨m, corr1591_deonticKnowing_conductRung h.1.scienter, hMod,
    .provedRung (.coerciveMeans hRung)⟩








axiom corr1591_deonticNexus_proc {d : Person} {c : ComplaintText} :
    Deontic.JurisdictionalNexus1591a1 d c → Procedure.FederalJurisdictionalNexus1591 d c

axiom corr1591_deonticAct_procAct {d v : Person} {c : ComplaintText} :
    Deontic.RecruitmentActOccurred1591a1 d v c → Procedure.PerformedListedActUponPerson d v c

axiom corr1591_deonticObject_procProved {d v : Person} {c : ComplaintText} :
    Deontic.MensReaObject1591a d v c →
    Procedure.MensReaProofObligationDischarged1591 (prosecutionOf d c) d v c


theorem s1591a1_deontic_implies_procedure_modulo_gaps
    {d v : Person} {ven : Deontic.Venture} {c : ComplaintText}
    (gap_1591_age_knowledge_obligation_not_isolated_by_deontic :
      Deontic.MensReaObject1591a d v c →
      Procedure.AgeKnowledgeProofObligationDischarged1591 (prosecutionOf d c) d v c)
    (hAct : Deontic.JurisdictionalNexus1591a1 d c)
    (hRecruit : Deontic.RecruitmentActOccurred1591a1 d v c)
    (h : Deontic.Prohibition1591aViolated d v ven c) :
    Procedure.Section1591ProsecutionMadeOut (prosecutionOf d c) d v c :=
  ⟨.actUponPerson (corr1591_deonticNexus_proc hAct) (corr1591_deonticAct_procAct hRecruit),
   corr1591_deonticObject_procProved h.1.condition,
   gap_1591_age_knowledge_obligation_not_isolated_by_deontic h.1.condition⟩











axiom corr1592_culpable_addressee {d : Person} {c : ComplaintText} :
    Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c

axiom corr1592_scienter_knowingly {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Deontic.ActedKnowingly1592a d c

axiom corr1592_actus_act {d v : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.DocumentActus1592a d doc c → Deontic.DocumentActOccurred1592a d (mapDocE2D doc) v c

axiom corr1592_document_covered {v : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.CoveredDocument1592a doc c →
    Elements.DocumentOfAnotherPerson doc v c →
    Deontic.IsCoveredDocument1592a (mapDocE2D doc) v c

axiom corr1592_inCourse {d : Person} {c : ComplaintText} :
    Elements.InTheCourseOfChapterTraffickingViolation d c →
    Deontic.InCourseOfChapterViolation1592a1 d c

axiom corr1592_intent {d : Person} {c : ComplaintText} :
    Elements.WithIntentToViolateChapterTraffickingSection d c →
    Deontic.IntentToViolateChapter1592a2 d c





axiom corr1592_liberty_purpose {d v : Person} {c : ComplaintText} :
    Elements.ToPreventOrRestrictLibertyToMoveOrTravel d v c →
    ¬ Elements.ActedWithLawfulAuthority d c →
    Elements.InOrderToMaintainLaborOrServices d v c →
    Deontic.PurposeToPreventOrRestrictLiberty1592a3 d v c

axiom corr1592_victimStatus {v : Person} {c : ComplaintText} :
    Elements.IsVictimOfSevereFormOfTrafficking v c →
    Deontic.IsSevereFormTraffickingVictim v c




axiom corr1592_exempt {d : Person} {c : ComplaintText} :
    Deontic.Exempt1592b d c → Elements.Exemption1592b d c


theorem s1592_elements_implies_deontic {d v : Person}
    {doc : Elements.IdentificationDocument} {c : ComplaintText}
    (h : Elements.Section1592a d v doc c) :
    Deontic.Prohibition1592aViolated d v (mapDocE2D doc) c :=
  ⟨⟨corr1592_culpable_addressee h.culpable,
    corr1592_scienter_knowingly h.scienter,
    corr1592_document_covered h.document h.ofAnother,
    (match h.circumstance with
     | .inCourseOfViolation hc => .inCourseOf (corr1592_inCourse hc)
     | .withIntentToViolate hi => .withIntent (corr1592_intent hi)
     | .libertyRestriction r =>
         .toRestrictLiberty
           (corr1592_liberty_purpose r.purpose r.withoutLawfulAuthority r.toMaintainLabor)
           (corr1592_victimStatus r.victimStatus)),
    fun hx => h.notExempt (corr1592_exempt hx)⟩,
   corr1592_actus_act h.actus⟩



axiom corr1592_actus_procHandled {d : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.DocumentActus1592a d doc c →
    ActedWithScienter d c →
    Procedure.KnowinglyHandledIdentityDocument d (mapDocE2P doc) c

axiom corr1592_inCourse_proc {d : Person} {c : ComplaintText} :
    Elements.InTheCourseOfChapterTraffickingViolation d c →
    Procedure.InTheCourseOfPredicateViolation d (inCourseSectionOf d c) c

axiom corr1592_intent_proc {d : Person} {c : ComplaintText} :
    Elements.WithIntentToViolateChapterTraffickingSection d c →
    Procedure.WithIntentToViolatePredicateSection d (intentSectionOf d c) c

axiom corr1592_authority_proc {d : Person} {c : ComplaintText} :
    ¬ Elements.ActedWithLawfulAuthority d c → Procedure.WithoutLawfulAuthority d c

axiom corr1592_liberty_proc {d v : Person} {c : ComplaintText} :
    Elements.ToPreventOrRestrictLibertyToMoveOrTravel d v c →
    Procedure.ToPreventOrRestrictLibertyToMove d v c

axiom corr1592_victim_proc {v : Person} {c : ComplaintText} :
    Elements.IsVictimOfSevereFormOfTrafficking v c →
    Procedure.VictimOfSevereFormOfTrafficking v c

axiom corr1592_exempt_proc {d : Person} {c : ComplaintText} :
    Procedure.Section1592VictimExemption d c → Elements.Exemption1592b d c


theorem s1592_elements_implies_procedure {d v : Person}
    {doc : Elements.IdentificationDocument} {c : ComplaintText}
    (h : Elements.Section1592a d v doc c) :
    Procedure.Section1592Chargeable d v (mapDocE2P doc) c :=
  ⟨corr1592_actus_procHandled h.actus h.scienter,
   (match h.circumstance with
    | .inCourseOfViolation hc =>
        .inCourseOf (inCourseSectionOf d c) (inCourseSectionOf_eligible d c)
          (corr1592_inCourse_proc hc)
    | .withIntentToViolate hi =>
        .withIntent (intentSectionOf d c) (intentSectionOf_eligible d c)
          (corr1592_intent_proc hi)
    | .libertyRestriction r =>
        .toRestrictLiberty (corr1592_authority_proc r.withoutLawfulAuthority)
          (corr1592_liberty_proc r.purpose) (corr1592_victim_proc r.victimStatus)),
   fun hx => h.notExempt (corr1592_exempt_proc hx)⟩



axiom corr1592_document_ontKind {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.CoveredDocument1592a doc c → Ontology.DocumentKind (mapDocE2O doc) c




axiom corr1592_document_ontActual {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.CoveredDocument1592a doc c → Ontology.IsActualOrPurportedDocument (mapDocE2O doc) c

axiom corr1592_ofAnother_ont {v : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.DocumentOfAnotherPerson doc v c →
    Ontology.IsDocumentOfAnotherPerson (mapDocE2O doc) v c

axiom corr1592_inCourse_ont {d : Person} {c : ComplaintText} :
    Elements.InTheCourseOfChapterTraffickingViolation d c →
    Ontology.IsInCourseOfEnumeratedChapter77Violation c

axiom corr1592_intent_ont {d : Person} {c : ComplaintText} :
    Elements.WithIntentToViolateChapterTraffickingSection d c →
    Ontology.HasIntentToViolateEnumeratedChapter77Section c

axiom corr1592_liberty_ont {d v : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.ToPreventOrRestrictLibertyToMoveOrTravel d v c →
    Ontology.RestrictsLibertyToMoveOrTravel (mapDocE2O doc) v c

axiom corr1592_authority_ont {d : Person} {c : ComplaintText} :
    ¬ Elements.ActedWithLawfulAuthority d c → Ontology.WithoutLawfulAuthority c

axiom corr1592_maintain_ont {d v : Person} {c : ComplaintText} :
    Elements.InOrderToMaintainLaborOrServices d v c →
    Ontology.InOrderToMaintainLaborOrServices v c

axiom corr1592_victim_ont {v : Person} {c : ComplaintText} :
    Elements.IsVictimOfSevereFormOfTrafficking v c →
    Ontology.IsVictimOfSevereFormOfTraffickingInPersons v c


theorem s1592_elements_implies_ontology {d v : Person}
    {doc : Elements.IdentificationDocument} {c : ComplaintText}
    (h : Elements.Section1592a d v doc c) :
    Ontology.Section1592aTermInventory (mapDocE2O doc) v c :=
  ⟨⟨corr1592_document_ontKind h.document,
    corr1592_document_ontActual h.document,
    corr1592_ofAnother_ont h.ofAnother⟩,
   (match h.circumstance with
    | .inCourseOfViolation hc => .inCourseOfEnumeratedViolation (corr1592_inCourse_ont hc)
    | .withIntentToViolate hi => .withIntentToViolate (corr1592_intent_ont hi)
    | .libertyRestriction r =>
        .toRestrictLibertyOfTraffickingVictim (corr1592_liberty_ont r.purpose)
          (corr1592_authority_ont r.withoutLawfulAuthority)
          (corr1592_maintain_ont r.toMaintainLabor)
          (corr1592_victim_ont r.victimStatus))⟩



axiom corr1592_scienter_conductRung {d : Person} {c : ComplaintText} :
    ActedWithScienter d c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.documentConduct1592a c

axiom corr1592_intent_rung {d : Person} {c : ComplaintText} :
    Elements.WithIntentToViolateChapterTraffickingSection d c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.intentToViolate1592a2 c

axiom corr1592_maintain_rung {d v : Person} {c : ComplaintText} :
    Elements.InOrderToMaintainLaborOrServices d v c →
    Scienter.ElementScienterMet d
      Scienter.ScienterElement.libertyRestrictionPurpose1592a3 c

axiom corr1592_exempt_scienter {d : Person} {c : ComplaintText} :
    Scienter.VictimStatusConductException1592b d c → Elements.Exemption1592b d c





theorem s1592_elements_implies_scienter {d v : Person}
    {doc : Elements.IdentificationDocument} {c : ComplaintText}
    (h : Elements.Section1592a d v doc c) : Scienter.Scienter1592a d c :=
  ⟨corr1592_scienter_conductRung h.scienter,
   (match h.circumstance with
    | .inCourseOfViolation _ => .inCourseOfViolation trivial
    | .withIntentToViolate hi => .intentToViolate (corr1592_intent_rung hi)
    | .libertyRestriction r => .libertyRestrictionPurpose (corr1592_maintain_rung r.toMaintainLabor)),
   fun hx => h.notExempt (corr1592_exempt_scienter hx)⟩



axiom corr1592_deonticAct_procHandled {d v : Person} {doc : Deontic.Document}
    {c : ComplaintText} :
    Deontic.DocumentActOccurred1592a d doc v c →
    Deontic.ActedKnowingly1592a d c →
    Procedure.KnowinglyHandledIdentityDocument d (mapDocD2P doc) c

axiom corr1592_deonticInCourse_proc {d : Person} {c : ComplaintText} :
    Deontic.InCourseOfChapterViolation1592a1 d c →
    Procedure.InTheCourseOfPredicateViolation d (inCourseSectionOf d c) c

axiom corr1592_deonticIntent_proc {d : Person} {c : ComplaintText} :
    Deontic.IntentToViolateChapter1592a2 d c →
    Procedure.WithIntentToViolatePredicateSection d (intentSectionOf d c) c

axiom corr1592_deonticPurpose_proc {d v : Person} {c : ComplaintText} :
    Deontic.PurposeToPreventOrRestrictLiberty1592a3 d v c →
    Procedure.WithoutLawfulAuthority d c ∧ Procedure.ToPreventOrRestrictLibertyToMove d v c

axiom corr1592_deonticVictim_proc {v : Person} {c : ComplaintText} :
    Deontic.IsSevereFormTraffickingVictim v c → Procedure.VictimOfSevereFormOfTrafficking v c

axiom corr1592_procExempt_deontic {d : Person} {c : ComplaintText} :
    Procedure.Section1592VictimExemption d c → Deontic.Exempt1592b d c


theorem s1592_deontic_implies_procedure {d v : Person} {doc : Deontic.Document}
    {c : ComplaintText} (h : Deontic.Prohibition1592aViolated d v doc c) :
    Procedure.Section1592Chargeable d v (mapDocD2P doc) c :=
  ⟨corr1592_deonticAct_procHandled h.2 h.1.scienter,
   (match h.1.condition with
    | .inCourseOf hc =>
        .inCourseOf (inCourseSectionOf d c) (inCourseSectionOf_eligible d c)
          (corr1592_deonticInCourse_proc hc)
    | .withIntent hi =>
        .withIntent (intentSectionOf d c) (intentSectionOf_eligible d c)
          (corr1592_deonticIntent_proc hi)
    | .toRestrictLiberty hp hv =>
        .toRestrictLiberty (corr1592_deonticPurpose_proc hp).1
          (corr1592_deonticPurpose_proc hp).2 (corr1592_deonticVictim_proc hv)),
   fun hx => h.1.notExempt (corr1592_procExempt_deontic hx)⟩



axiom corr1592_deonticDoc_ont {v : Person} {doc : Deontic.Document} {c : ComplaintText} :
    Deontic.IsCoveredDocument1592a doc v c →
    Ontology.IdentificationDocumentMembership (mapDocD2O doc) v c

axiom corr1592_deonticInCourse_ont {d : Person} {c : ComplaintText} :
    Deontic.InCourseOfChapterViolation1592a1 d c →
    Ontology.IsInCourseOfEnumeratedChapter77Violation c

axiom corr1592_deonticIntent_ont {d : Person} {c : ComplaintText} :
    Deontic.IntentToViolateChapter1592a2 d c →
    Ontology.HasIntentToViolateEnumeratedChapter77Section c

axiom corr1592_deonticPurpose_ont {d v : Person} {doc : Deontic.Document}
    {c : ComplaintText} :
    Deontic.PurposeToPreventOrRestrictLiberty1592a3 d v c →
    Ontology.RestrictsLibertyToMoveOrTravel (mapDocD2O doc) v c ∧
      Ontology.WithoutLawfulAuthority c ∧
      Ontology.InOrderToMaintainLaborOrServices v c

axiom corr1592_deonticVictim_ont {v : Person} {c : ComplaintText} :
    Deontic.IsSevereFormTraffickingVictim v c →
    Ontology.IsVictimOfSevereFormOfTraffickingInPersons v c


theorem s1592_deontic_implies_ontology {d v : Person} {doc : Deontic.Document}
    {c : ComplaintText} (h : Deontic.Prohibition1592aViolated d v doc c) :
    Ontology.Section1592aTermInventory (mapDocD2O doc) v c :=
  ⟨corr1592_deonticDoc_ont h.1.documentClass,
   (match h.1.condition with
    | .inCourseOf hc => .inCourseOfEnumeratedViolation (corr1592_deonticInCourse_ont hc)
    | .withIntent hi => .withIntentToViolate (corr1592_deonticIntent_ont hi)
    | .toRestrictLiberty hp hv =>
        .toRestrictLibertyOfTraffickingVictim
          (corr1592_deonticPurpose_ont (doc := doc) hp).1
          (corr1592_deonticPurpose_ont (doc := doc) hp).2.1
          (corr1592_deonticPurpose_ont (doc := doc) hp).2.2
          (corr1592_deonticVictim_ont hv))⟩



axiom corr1592_deonticKnowing_rung {d : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly1592a d c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.documentConduct1592a c

axiom corr1592_deonticIntent_rung {d : Person} {c : ComplaintText} :
    Deontic.IntentToViolateChapter1592a2 d c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.intentToViolate1592a2 c

axiom corr1592_deonticPurpose_rung {d v : Person} {c : ComplaintText} :
    Deontic.PurposeToPreventOrRestrictLiberty1592a3 d v c →
    Scienter.ElementScienterMet d
      Scienter.ScienterElement.libertyRestrictionPurpose1592a3 c

axiom corr1592_scienterExempt_deontic {d : Person} {c : ComplaintText} :
    Scienter.VictimStatusConductException1592b d c → Deontic.Exempt1592b d c


theorem s1592_deontic_implies_scienter {d v : Person} {doc : Deontic.Document}
    {c : ComplaintText} (h : Deontic.Prohibition1592aViolated d v doc c) :
    Scienter.Scienter1592a d c :=
  ⟨corr1592_deonticKnowing_rung h.1.scienter,
   (match h.1.condition with
    | .inCourseOf _ => .inCourseOfViolation trivial
    | .withIntent hi => .intentToViolate (corr1592_deonticIntent_rung hi)
    | .toRestrictLiberty hp _ => .libertyRestrictionPurpose (corr1592_deonticPurpose_rung hp)),
   fun hx => h.1.notExempt (corr1592_scienterExempt_deontic hx)⟩



axiom corr1592_procHandled_ontDoc {d v : Person} {doc : Procedure.IdentityDocument}
    {c : ComplaintText} :
    Procedure.KnowinglyHandledIdentityDocument d doc c →
    Ontology.IdentificationDocumentMembership (mapDocP2O doc) v c

axiom corr1592_procInCourse_ont {d : Person} {sec : Procedure.Ch77PredicateSection}
    {c : ComplaintText} :
    Procedure.InTheCourseOfPredicateViolation d sec c →
    Ontology.IsInCourseOfEnumeratedChapter77Violation c

axiom corr1592_procIntent_ont {d : Person} {sec : Procedure.Ch77PredicateSection}
    {c : ComplaintText} :
    Procedure.WithIntentToViolatePredicateSection d sec c →
    Ontology.HasIntentToViolateEnumeratedChapter77Section c

axiom corr1592_procLiberty_ont {d v : Person} {doc : Procedure.IdentityDocument}
    {c : ComplaintText} :
    Procedure.ToPreventOrRestrictLibertyToMove d v c →
    Ontology.RestrictsLibertyToMoveOrTravel (mapDocP2O doc) v c

axiom corr1592_procAuthority_ont {d : Person} {c : ComplaintText} :
    Procedure.WithoutLawfulAuthority d c → Ontology.WithoutLawfulAuthority c

axiom corr1592_procVictim_ont {v : Person} {c : ComplaintText} :
    Procedure.VictimOfSevereFormOfTrafficking v c →
    Ontology.IsVictimOfSevereFormOfTraffickingInPersons v c ∧
      Ontology.InOrderToMaintainLaborOrServices v c


theorem s1592_procedure_implies_ontology {d v : Person} {doc : Procedure.IdentityDocument}
    {c : ComplaintText} (h : Procedure.Section1592Chargeable d v doc c) :
    Ontology.Section1592aTermInventory (mapDocP2O doc) v c :=
  ⟨corr1592_procHandled_ontDoc h.conduct,
   (match h.route with
    | .inCourseOf _ _ hc => .inCourseOfEnumeratedViolation (corr1592_procInCourse_ont hc)
    | .withIntent _ _ hi => .withIntentToViolate (corr1592_procIntent_ont hi)
    | .toRestrictLiberty hA hR hV =>
        .toRestrictLibertyOfTraffickingVictim (corr1592_procLiberty_ont (doc := doc) hR)
          (corr1592_procAuthority_ont hA)
          (corr1592_procVictim_ont hV).2 (corr1592_procVictim_ont hV).1)⟩



axiom corr1592_procHandled_rung {d : Person} {doc : Procedure.IdentityDocument}
    {c : ComplaintText} :
    Procedure.KnowinglyHandledIdentityDocument d doc c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.documentConduct1592a c

axiom corr1592_procIntent_rung {d : Person} {sec : Procedure.Ch77PredicateSection}
    {c : ComplaintText} :
    Procedure.WithIntentToViolatePredicateSection d sec c →
    Scienter.ElementScienterMet d Scienter.ScienterElement.intentToViolate1592a2 c

axiom corr1592_procLiberty_rung {d v : Person} {c : ComplaintText} :
    Procedure.ToPreventOrRestrictLibertyToMove d v c →
    Scienter.ElementScienterMet d
      Scienter.ScienterElement.libertyRestrictionPurpose1592a3 c

axiom corr1592_scienterExempt_proc {d : Person} {c : ComplaintText} :
    Scienter.VictimStatusConductException1592b d c → Procedure.Section1592VictimExemption d c


theorem s1592_procedure_implies_scienter {d v : Person} {doc : Procedure.IdentityDocument}
    {c : ComplaintText} (h : Procedure.Section1592Chargeable d v doc c) :
    Scienter.Scienter1592a d c :=
  ⟨corr1592_procHandled_rung h.conduct,
   (match h.route with
    | .inCourseOf _ _ _ => .inCourseOfViolation trivial
    | .withIntent _ _ hi => .intentToViolate (corr1592_procIntent_rung hi)
    | .toRestrictLiberty _ hR _ => .libertyRestrictionPurpose (corr1592_procLiberty_rung hR)),
   fun hx => h.notExempt (corr1592_scienterExempt_proc hx)⟩

















axiom obstructiveActOf (d : Person) (c : ComplaintText) : Ontology.ObstructiveAct



axiom corrObs1590b_deontic {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c → Elements.EnforcementOfSection1590 e c →
    Deontic.ObstructedEnforcement1590b d c

axiom corrObs1590b_proc {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c → Elements.EnforcementOfSection1590 e c →
    Procedure.ObstructedEnforcement Procedure.Ch77ObstructionSection.S1590 d c

axiom corrObs1590b_deonticProc {d : Person} {c : ComplaintText} :
    Deontic.ObstructedEnforcement1590b d c →
    Procedure.ObstructedEnforcement Procedure.Ch77ObstructionSection.S1590 d c

axiom corrObs_ont {d : Person} {e : Elements.EnforcementProceeding} {c : ComplaintText} :
    Elements.ObstructionActus d e c →
    Ontology.EnforcementObstructionMembership (obstructiveActOf d c) c


theorem s1590b_elements_implies_deontic {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1590b d e c) :
    Deontic.Prohibition1590bViolated d c :=
  ⟨⟨corr1590_culpable_addressee h.culpable⟩,
   corrObs1590b_deontic h.actus h.targetSection⟩


theorem s1590b_elements_implies_procedure {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1590b d e c) :
    Procedure.Ch77ObstructionMadeOut Procedure.Ch77ObstructionSection.S1590 d c :=
  ⟨corrObs1590b_proc h.actus h.targetSection⟩


theorem s1590b_elements_implies_ontology {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1590b d e c) :
    Ontology.EnforcementObstructionMembership (obstructiveActOf d c) c :=
  corrObs_ont h.actus


theorem s1590b_deontic_implies_procedure {d : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1590bViolated d c) :
    Procedure.Ch77ObstructionMadeOut Procedure.Ch77ObstructionSection.S1590 d c :=
  ⟨corrObs1590b_deonticProc h.2⟩



axiom corrObs1591d_deontic {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c → Elements.EnforcementOfSection1591 e c →
    Deontic.ObstructedEnforcement1591d d c

axiom corrObs1591d_proc {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c → Elements.EnforcementOfSection1591 e c →
    Procedure.ObstructedEnforcement Procedure.Ch77ObstructionSection.S1591 d c

axiom corrObs1591d_deonticProc {d : Person} {c : ComplaintText} :
    Deontic.ObstructedEnforcement1591d d c →
    Procedure.ObstructedEnforcement Procedure.Ch77ObstructionSection.S1591 d c


theorem s1591d_elements_implies_deontic {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1591d d e c) :
    Deontic.Prohibition1591dViolated d c :=
  ⟨⟨corr1591_culpable_addressee h.culpable⟩,
   corrObs1591d_deontic h.actus h.targetSection⟩


theorem s1591d_elements_implies_procedure {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1591d d e c) :
    Procedure.Ch77ObstructionMadeOut Procedure.Ch77ObstructionSection.S1591 d c :=
  ⟨corrObs1591d_proc h.actus h.targetSection⟩


theorem s1591d_elements_implies_ontology {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1591d d e c) :
    Ontology.EnforcementObstructionMembership (obstructiveActOf d c) c :=
  corrObs_ont h.actus


theorem s1591d_deontic_implies_procedure {d : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1591dViolated d c) :
    Procedure.Ch77ObstructionMadeOut Procedure.Ch77ObstructionSection.S1591 d c :=
  ⟨corrObs1591d_deonticProc h.2⟩



axiom corrObs1592c_deontic {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c → Elements.EnforcementOfSection1592 e c →
    Deontic.ObstructedEnforcement1592c d c

axiom corrObs1592c_proc {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c → Elements.EnforcementOfSection1592 e c →
    Procedure.ObstructedEnforcement Procedure.Ch77ObstructionSection.S1592 d c

axiom corrObs1592c_deonticProc {d : Person} {c : ComplaintText} :
    Deontic.ObstructedEnforcement1592c d c →
    Procedure.ObstructedEnforcement Procedure.Ch77ObstructionSection.S1592 d c


theorem s1592c_elements_implies_deontic {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1592c d e c) :
    Deontic.Prohibition1592cViolated d c :=
  ⟨⟨corr1592_culpable_addressee h.culpable⟩,
   corrObs1592c_deontic h.actus h.targetSection⟩


theorem s1592c_elements_implies_procedure {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1592c d e c) :
    Procedure.Ch77ObstructionMadeOut Procedure.Ch77ObstructionSection.S1592 d c :=
  ⟨corrObs1592c_proc h.actus h.targetSection⟩


theorem s1592c_elements_implies_ontology {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} (h : Elements.Section1592c d e c) :
    Ontology.EnforcementObstructionMembership (obstructiveActOf d c) c :=
  corrObs_ont h.actus


theorem s1592c_deontic_implies_procedure {d : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1592cViolated d c) :
    Procedure.Ch77ObstructionMadeOut Procedure.Ch77ObstructionSection.S1592 d c :=
  ⟨corrObs1592c_deonticProc h.2⟩

end Proving.USC.T18.Ch77.Reslice.Bridge
