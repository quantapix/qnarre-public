





























import Proving.Trafficking.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Reslice.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.GoldenBridge

open Proving.USC.Common (Person ComplaintText ActedWithScienter)















axiom mapPersonG : Person → Proving.Trafficking.Person
axiom mapComplaintG : ComplaintText → Proving.Trafficking.ComplaintText
axiom mapDocG : Elements.IdentificationDocument → Proving.Trafficking.Document

axiom actOf1590 (d v : Person) (c : ComplaintText) : Proving.Trafficking.Action
axiom actOf1591 (d v : Person) (c : ComplaintText) : Proving.Trafficking.Action
axiom actOf1592 (d : Person) (doc : Elements.IdentificationDocument)
    (c : ComplaintText) : Proving.Trafficking.Action
axiom actOfObstruction (d : Person) (e : Elements.EnforcementProceeding)
    (c : ComplaintText) : Proving.Trafficking.Action



axiom g1590_knowingly {d v : Person} {c : ComplaintText} :
    ActedWithScienter d c →
    Proving.Trafficking.ActedKnowingly (mapPersonG d) (actOf1590 d v c) (mapComplaintG c)




axiom g1590_conduct {d v : Person} {c : ComplaintText} :
    Elements.TraffickingActus1590a d v c →
    Proving.Trafficking.RecruitsHarborsTransportsProvidesOrObtains
      (mapPersonG d) (mapPersonG v) (actOf1590 d v c) (mapComplaintG c)

axiom g1590_forLabor {d v : Person} {ls : Elements.LaborOrServices} {c : ComplaintText} :
    Elements.ForLaborOrServices v ls c →
    Proving.Trafficking.ForLaborOrServices
      (mapPersonG v) (actOf1590 d v c) (mapComplaintG c)




axiom g1590_chapterPredicate {d v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} :
    Elements.ForLaborOrServices v ls c →
    Elements.LaborOrServicesInViolationOfChapter77 ls c →
    Proving.Trafficking.InViolationOfChapterSeventySeven
      (actOf1590 d v c) (mapComplaintG c)




theorem s1590_elements_implies_golden {d v : Person} {ls : Elements.LaborOrServices}
    {c : ComplaintText} (h : Elements.Section1590a d v ls c) :
    Proving.Trafficking.Section1590SubsecA
      (mapPersonG d) (mapPersonG v) (actOf1590 d v c) (mapComplaintG c) :=
  ⟨g1590_knowingly h.scienter,
   g1590_conduct h.actus,
   g1590_forLabor h.purpose,
   g1590_chapterPredicate h.purpose h.chapterViolation⟩











axiom g1591_jurisdiction {d v : Person} {c : ComplaintText} :
    Elements.JurisdictionalNexus1591a1 d v c →
    Proving.Trafficking.InterstateCommerceOrSpecialJurisdiction
      (actOf1591 d v c) (mapComplaintG c)

axiom g1591_conduct {d v : Person} {c : ComplaintText} :
    Elements.TraffickingActus1591a1 d v c →
    Proving.Trafficking.RecruitsEnticesHarborsAdvertisesOrSolicits
      (mapPersonG d) (mapPersonG v) (actOf1591 d v c) (mapComplaintG c)





axiom g1591_mensCoercion {d v : Person} {c : ComplaintText} :
    Elements.MensLevel1591a d v c →
    Proving.Trafficking.KnewOrRecklesslyDisregardedCoerciveMeans
      (mapPersonG d) (mapPersonG v) (actOf1591 d v c) (mapComplaintG c)

axiom g1591_mensMinority {d v : Person} {c : ComplaintText} :
    Elements.MensLevel1591a d v c →
    Proving.Trafficking.KnewOrRecklesslyDisregardedThatPersonWasMinor
      (mapPersonG d) (mapPersonG v) (mapComplaintG c)

axiom g1591_coerciveMeansWillBeUsed {d v : Person} {a : Elements.SexAct}
    {c : ComplaintText} :
    Elements.MeansRoute1591 d v a c →
    Proving.Trafficking.CoerciveMeansWillBeUsed
      (mapPersonG v) (actOf1591 d v c) (mapComplaintG c)




axiom g1591_age {v : Person} {c : ComplaintText} :
    Elements.ageOfPersonAtTimeOfOffense v c < 18 →
    Proving.Trafficking.PersonHasNotAttainedAgeEighteen (mapPersonG v) (mapComplaintG c)

axiom g1591_observe {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObserve d v c →
    Proving.Trafficking.ReasonableOpportunityToObservePerson
      (mapPersonG d) (mapPersonG v) (mapComplaintG c)

axiom g1591_csaFromMeans {d v : Person} {a : Elements.SexAct} {c : ComplaintText} :
    Elements.MeansRoute1591 d v a c →
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (mapPersonG v) (actOf1591 d v c) (mapComplaintG c)

axiom g1591_csaFromMinority {d v : Person} {a : Elements.SexAct} {c : ComplaintText} :
    Elements.MinorityRoute1591 v a c →
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (mapPersonG v) (actOf1591 d v c) (mapComplaintG c)





private theorem g1591_mensRea {d v : Person} {a : Elements.SexAct} {c : ComplaintText}
    (h : Elements.MensRea1591a1 d v a c) :
    Proving.Trafficking.Section1591MensRea
      (mapPersonG d) (mapPersonG v) (actOf1591 d v c) (mapComplaintG c) :=
  match h with
  | .proved (.means level route) =>
      .viaCoercion (g1591_mensCoercion level) (g1591_coerciveMeansWillBeUsed route)
  | .proved (.minority level route) =>
      .viaKnownMinority (g1591_mensMinority level) (g1591_age route.underEighteen)
  | .minorityObserved hObs route =>
      .viaObservedMinority (g1591_observe hObs) (g1591_age route.underEighteen)

private theorem g1591_commercialSex {d v : Person} {a : Elements.SexAct}
    {c : ComplaintText} (h : Elements.MensRea1591a1 d v a c) :
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (mapPersonG v) (actOf1591 d v c) (mapComplaintG c) :=
  match h with
  | .proved (.means _ route) => g1591_csaFromMeans route
  | .proved (.minority _ route) => g1591_csaFromMinority route
  | .minorityObserved _ route => g1591_csaFromMinority route




theorem s1591a1_elements_implies_golden_modulo_gaps {d v : Person}
    {a : Elements.SexAct} {c : ComplaintText}
    (gap_1591_chapeau_knowingly_absent_from_elements :
      Proving.Trafficking.ActedKnowingly (mapPersonG d) (actOf1591 d v c) (mapComplaintG c))
    (h : Elements.Section1591a1 d v a c) :
    Proving.Trafficking.Section1591SubsecA
      (mapPersonG d) (mapPersonG v) (actOf1591 d v c) (mapComplaintG c) :=
  ⟨gap_1591_chapeau_knowingly_absent_from_elements,
   .viaRecruitment (g1591_jurisdiction h.jurisdiction) (g1591_conduct h.actus),
   g1591_mensRea h.mens,
   g1591_commercialSex h.mens⟩








axiom g1591_benefit {d v : Person} {ven : Elements.Venture} {c : ComplaintText} :
    Elements.BenefitsFinanciallyOrReceivesAnythingOfValue d ven c →
    Elements.ParticipatesInVenture d ven c →
    Proving.Trafficking.BenefitsFromParticipationInVenture
      (mapPersonG d) (actOf1591 d v c) (mapComplaintG c)

axiom g1591_ventureAct {d v : Person} {ven : Elements.Venture} {c : ComplaintText} :
    Elements.VentureEngagedInActDescribedInParagraph1 ven c →
    Elements.IsVenture ven c →
    Proving.Trafficking.VentureEngagedInSection1591a1Act
      (actOf1591 d v c) (mapComplaintG c)

private theorem g1591_mensReaUnrelieved {d v : Person} {a : Elements.SexAct}
    {c : ComplaintText} (h : Elements.MensRea1591a d v a c) :
    Proving.Trafficking.Section1591MensRea
      (mapPersonG d) (mapPersonG v) (actOf1591 d v c) (mapComplaintG c) :=
  match h with
  | .means level route =>
      .viaCoercion (g1591_mensCoercion level) (g1591_coerciveMeansWillBeUsed route)
  | .minority level route =>
      .viaKnownMinority (g1591_mensMinority level) (g1591_age route.underEighteen)

private theorem g1591_commercialSexUnrelieved {d v : Person} {a : Elements.SexAct}
    {c : ComplaintText} (h : Elements.MensRea1591a d v a c) :
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (mapPersonG v) (actOf1591 d v c) (mapComplaintG c) :=
  match h with
  | .means _ route => g1591_csaFromMeans route
  | .minority _ route => g1591_csaFromMinority route



theorem s1591a2_elements_implies_golden_modulo_gaps {d v : Person}
    {a : Elements.SexAct} {ven : Elements.Venture} {c : ComplaintText}
    (gap_1591_chapeau_knowingly_absent_from_elements :
      Proving.Trafficking.ActedKnowingly (mapPersonG d) (actOf1591 d v c) (mapComplaintG c))
    (h : Elements.Section1591a2 d v a ven c) :
    Proving.Trafficking.Section1591SubsecA
      (mapPersonG d) (mapPersonG v) (actOf1591 d v c) (mapComplaintG c) :=
  ⟨gap_1591_chapeau_knowingly_absent_from_elements,
   .viaVentureBenefit (g1591_benefit h.benefit h.participation)
     (g1591_ventureAct h.ventureAct h.venture),
   g1591_mensReaUnrelieved h.mens,
   g1591_commercialSexUnrelieved h.mens⟩



axiom g1592_knowingly {d : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    ActedWithScienter d c →
    Proving.Trafficking.ActedKnowingly (mapPersonG d) (actOf1592 d doc c) (mapComplaintG c)

axiom g1592_conduct {d : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.DocumentActus1592a d doc c →
    Proving.Trafficking.DestroysConcealsRemovesConfiscatesOrPossesses
      (mapPersonG d) (mapDocG doc) (actOf1592 d doc c) (mapComplaintG c)

axiom g1592_isDocument {doc : Elements.IdentificationDocument} {c : ComplaintText} :
    Elements.CoveredDocument1592a doc c →
    Proving.Trafficking.IsPassportOrGovernmentIdentificationDocument
      (mapDocG doc) (mapComplaintG c)

axiom g1592_ofAnother {v : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.DocumentOfAnotherPerson doc v c →
    Proving.Trafficking.DocumentOfAnotherPerson
      (mapDocG doc) (mapPersonG v) (mapComplaintG c)

axiom g1592_inCourse {d : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.InTheCourseOfChapterTraffickingViolation d c →
    Proving.Trafficking.InCourseOfEnumeratedTraffickingViolation
      (actOf1592 d doc c) (mapComplaintG c)

axiom g1592_intent {d : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.WithIntentToViolateChapterTraffickingSection d c →
    Proving.Trafficking.WithIntentToViolateEnumeratedTraffickingSection
      (mapPersonG d) (actOf1592 d doc c) (mapComplaintG c)

axiom g1592_restrict {d v : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.ToPreventOrRestrictLibertyToMoveOrTravel d v c →
    Proving.Trafficking.ToPreventOrRestrictLibertyToMoveOrTravel
      (mapPersonG d) (mapPersonG v) (actOf1592 d doc c) (mapComplaintG c)





axiom g1592_withoutAuthority {d : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    ¬ Elements.ActedWithLawfulAuthority d c →
    Proving.Trafficking.WithoutLawfulAuthority
      (mapPersonG d) (actOf1592 d doc c) (mapComplaintG c)

axiom g1592_maintain {d v : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    Elements.InOrderToMaintainLaborOrServices d v c →
    Proving.Trafficking.InOrderToMaintainLaborOrServices
      (mapPersonG v) (actOf1592 d doc c) (mapComplaintG c)

axiom g1592_victim {v : Person} {c : ComplaintText} :
    Elements.IsVictimOfSevereFormOfTrafficking v c →
    Proving.Trafficking.IsVictimOfSevereFormOfTrafficking
      (mapPersonG v) (mapComplaintG c)





axiom g1592_notExcluded {d : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} :
    ¬ Elements.Exemption1592b d c →
    Proving.Trafficking.Section1592bVictimExclusionInapplicable
      (mapPersonG d) (actOf1592 d doc c) (mapComplaintG c)

private theorem g1592_purpose {d v : Person} {doc : Elements.IdentificationDocument}
    {c : ComplaintText} (h : Elements.Circumstance1592a d v c) :
    Proving.Trafficking.Section1592Purpose
      (mapPersonG d) (mapPersonG v) (actOf1592 d doc c) (mapComplaintG c) :=
  match h with
  | .inCourseOfViolation hc => .viaInCourseOfViolation (g1592_inCourse hc)
  | .withIntentToViolate hi => .viaIntentToViolate (g1592_intent hi)
  | .libertyRestriction r =>
      .viaRestrictingLiberty (g1592_restrict r.purpose)
        (g1592_withoutAuthority r.withoutLawfulAuthority)
        (g1592_maintain r.toMaintainLabor)
        (g1592_victim r.victimStatus)





theorem s1592_elements_implies_golden {d v : Person}
    {doc : Elements.IdentificationDocument} {c : ComplaintText}
    (h : Elements.Section1592a d v doc c) :
    Proving.Trafficking.Section1592SubsecA
      (mapPersonG d) (mapPersonG v) (mapDocG doc) (actOf1592 d doc c) (mapComplaintG c) :=
  ⟨g1592_knowingly h.scienter,
   g1592_conduct h.actus,
   g1592_isDocument h.document,
   g1592_ofAnother h.ofAnother,
   g1592_purpose h.circumstance,
   g1592_notExcluded h.notExempt⟩












axiom g1590b_obstructs {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c →
    Elements.EnforcementOfSection1590 e c →
    Proving.Trafficking.ObstructsEnforcementOfSection1590
      (mapPersonG d) (actOfObstruction d e c) (mapComplaintG c)

axiom g1591d_obstructs {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c →
    Elements.EnforcementOfSection1591 e c →
    Proving.Trafficking.ObstructsEnforcementOfSection1591
      (mapPersonG d) (actOfObstruction d e c) (mapComplaintG c)

axiom g1592c_obstructs {d : Person} {e : Elements.EnforcementProceeding}
    {c : ComplaintText} :
    Elements.ObstructionActus d e c →
    Elements.EnforcementOfSection1592 e c →
    Proving.Trafficking.ObstructsEnforcementOfSection1592
      (mapPersonG d) (actOfObstruction d e c) (mapComplaintG c)


theorem s1590b_elements_implies_golden_modulo_gaps {d : Person}
    {e : Elements.EnforcementProceeding} {c : ComplaintText}
    (gap_obstruction_chapeau_knowingly_absent_from_enacted_text :
      Proving.Trafficking.ActedKnowingly (mapPersonG d) (actOfObstruction d e c)
        (mapComplaintG c))
    (h : Elements.Section1590b d e c) :
    Proving.Trafficking.Section1590SubsecB
      (mapPersonG d) (actOfObstruction d e c) (mapComplaintG c) :=
  ⟨gap_obstruction_chapeau_knowingly_absent_from_enacted_text,
   g1590b_obstructs h.actus h.targetSection⟩


theorem s1591d_elements_implies_golden_modulo_gaps {d : Person}
    {e : Elements.EnforcementProceeding} {c : ComplaintText}
    (gap_obstruction_chapeau_knowingly_absent_from_enacted_text :
      Proving.Trafficking.ActedKnowingly (mapPersonG d) (actOfObstruction d e c)
        (mapComplaintG c))
    (h : Elements.Section1591d d e c) :
    Proving.Trafficking.Section1591SubsecD
      (mapPersonG d) (actOfObstruction d e c) (mapComplaintG c) :=
  ⟨gap_obstruction_chapeau_knowingly_absent_from_enacted_text,
   g1591d_obstructs h.actus h.targetSection⟩


theorem s1592c_elements_implies_golden_modulo_gaps {d : Person}
    {e : Elements.EnforcementProceeding} {c : ComplaintText}
    (gap_obstruction_chapeau_knowingly_absent_from_enacted_text :
      Proving.Trafficking.ActedKnowingly (mapPersonG d) (actOfObstruction d e c)
        (mapComplaintG c))
    (h : Elements.Section1592c d e c) :
    Proving.Trafficking.Section1592SubsecC
      (mapPersonG d) (actOfObstruction d e c) (mapComplaintG c) :=
  ⟨gap_obstruction_chapeau_knowingly_absent_from_enacted_text,
   g1592c_obstructs h.actus h.targetSection⟩

end Proving.USC.T18.Ch77.Reslice.GoldenBridge
