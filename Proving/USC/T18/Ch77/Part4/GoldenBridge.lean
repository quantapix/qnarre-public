
























import Proving.USC.T18.Ch77.Part4.Elements.Theorems
import Proving.Trafficking.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch77.Part4








axiom gPerson : Person → Proving.Trafficking.Person

axiom gComplaint : ComplaintText → Proving.Trafficking.ComplaintText

axiom gAction : Elements.TraffickingAct → Proving.Trafficking.Action






axiom gcorr_knowingly {d : Person} {act : Elements.TraffickingAct} {c : ComplaintText} :
    ActedWithScienter d c →
    Proving.Trafficking.ActedKnowingly (gPerson d) (gAction act) (gComplaint c)



axiom gcorr_jurisdiction {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.JurisdictionalNexus1591a1 act c →
    Proving.Trafficking.InterstateCommerceOrSpecialJurisdiction (gAction act) (gComplaint c)


axiom gcorr_recruits {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.PerformsProhibitedTraffickingAct d act v c →
    Proving.Trafficking.RecruitsEnticesHarborsAdvertisesOrSolicits
      (gPerson d) (gPerson v) (gAction act) (gComplaint c)




axiom gcorr_benefit {d : Person} {ven : Elements.Venture}
    {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.BenefitsFinanciallyOrReceivesValue d ven c →
    Elements.ParticipatesInVenture d ven c →
    Proving.Trafficking.BenefitsFromParticipationInVenture
      (gPerson d) (gAction act) (gComplaint c)


axiom gcorr_venturePredicate {ven : Elements.Venture}
    {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.VentureEngagedInParagraphOneAct ven act c →
    Proving.Trafficking.VentureEngagedInSection1591a1Act (gAction act) (gComplaint c)



axiom gcorr_knowsMeans {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.KnowsMeansWillBeUsed d v c →
    Proving.Trafficking.KnewOrRecklesslyDisregardedCoerciveMeans
      (gPerson d) (gPerson v) (gAction act) (gComplaint c)


axiom gcorr_recklessMeans {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.RecklesslyDisregardsMeansWillBeUsed d v c →
    Proving.Trafficking.KnewOrRecklesslyDisregardedCoerciveMeans
      (gPerson d) (gPerson v) (gAction act) (gComplaint c)



axiom gcorr_knowsAge {d v : Person} {c : ComplaintText} :
    Elements.KnowsVictimUnderageAndWillBeCaused d v c →
    Proving.Trafficking.KnewOrRecklesslyDisregardedThatPersonWasMinor
      (gPerson d) (gPerson v) (gComplaint c)



axiom gcorr_recklessAge {d v : Person} {c : ComplaintText} :
    Elements.RecklesslyDisregardsVictimUnderageAndWillBeCaused d v c →
    Proving.Trafficking.KnewOrRecklesslyDisregardedThatPersonWasMinor
      (gPerson d) (gPerson v) (gComplaint c)





axiom gcorr_underEighteen {v : Person} {c : ComplaintText} :
    Elements.VictimUnderEighteen v c →
    Proving.Trafficking.PersonHasNotAttainedAgeEighteen (gPerson v) (gComplaint c)


axiom gcorr_observe {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObserve d v c →
    Proving.Trafficking.ReasonableOpportunityToObservePerson
      (gPerson d) (gPerson v) (gComplaint c)




axiom gcorr_willBeCaused {v : Person} {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.WillBeCausedToEngageInCommercialSexAct v c →
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (gPerson v) (gAction act) (gComplaint c)





theorem s1591a_conduct_elements_implies_golden
    {d v : Person} {ven : Elements.Venture} {act : Elements.TraffickingAct}
    {c : ComplaintText}
    (h : Elements.Conduct1591a d ven act v c) :
    Proving.Trafficking.Section1591Conduct
      (gPerson d) (gPerson v) (gAction act) (gComplaint c) := by
  cases h with
  | paragraphOne hp =>
      exact Proving.Trafficking.Section1591Conduct.viaRecruitment
        (gcorr_jurisdiction hp.jurisdiction) (gcorr_recruits hp.traffickingAct)
  | paragraphTwo hp =>
      exact Proving.Trafficking.Section1591Conduct.viaVentureBenefit
        (gcorr_benefit hp.benefit hp.participation)
        (gcorr_venturePredicate hp.venturePredicateAct)







theorem s1591c_route_elements_implies_golden
    {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText}
    (hUnder18 : Elements.VictimUnderEighteen v c)
    (hObs : Elements.HadReasonableOpportunityToObserve d v c) :
    Proving.Trafficking.Section1591MensRea
      (gPerson d) (gPerson v) (gAction act) (gComplaint c) :=
  Proving.Trafficking.Section1591MensRea.viaObservedMinority
    (gcorr_observe hObs) (gcorr_underEighteen hUnder18)





theorem s1591a_mensRea_elements_implies_golden_modulo_gaps
    {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.MensRea1591a d act v c)
    (gap_means_route_supplies_no_objective_coercive_means :
        Elements.MensReaAsToMeans d act v c →
        Proving.Trafficking.CoerciveMeansWillBeUsed
          (gPerson v) (gAction act) (gComplaint c)) :
    Proving.Trafficking.Section1591MensRea
      (gPerson d) (gPerson v) (gAction act) (gComplaint c) := by
  cases h with
  | means hm =>
      refine Proving.Trafficking.Section1591MensRea.viaCoercion ?_
        (gap_means_route_supplies_no_objective_coercive_means hm)
      cases hm with
      | knowing hk => exact gcorr_knowsMeans hk
      | reckless hr _ => exact gcorr_recklessMeans hr
  | age ha =>
      cases ha with
      | knowing hU _ hk =>
          exact Proving.Trafficking.Section1591MensRea.viaKnownMinority
            (gcorr_knowsAge hk) (gcorr_underEighteen hU)
      | reckless hU _ hr _ =>
          exact Proving.Trafficking.Section1591MensRea.viaKnownMinority
            (gcorr_recklessAge hr) (gcorr_underEighteen hU)
      | reasonableOpportunityToObserve hU _ _ hObs =>
          exact Proving.Trafficking.Section1591MensRea.viaObservedMinority
            (gcorr_observe hObs) (gcorr_underEighteen hU)















theorem s1591a_elements_implies_golden_modulo_gaps
    {d v : Person} {ven : Elements.Venture} {act : Elements.TraffickingAct}
    {c : ComplaintText}
    (h : Elements.Section1591a d ven act v c)
    (gap_means_route_supplies_no_objective_coercive_means :
        Elements.MensReaAsToMeans d act v c →
        Proving.Trafficking.CoerciveMeansWillBeUsed
          (gPerson v) (gAction act) (gComplaint c))
    (gap_means_route_supplies_no_objective_commercial_sex_result :
        Elements.MensReaAsToMeans d act v c →
        Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
          (gPerson v) (gAction act) (gComplaint c)) :
    Proving.Trafficking.Section1591SubsecA
      (gPerson d) (gPerson v) (gAction act) (gComplaint c) := by
  refine ⟨gcorr_knowingly h.knowingly,
          s1591a_conduct_elements_implies_golden h.conduct,
          s1591a_mensRea_elements_implies_golden_modulo_gaps h.mensRea
            gap_means_route_supplies_no_objective_coercive_means, ?_⟩
  cases h.mensRea with
  | means hm => exact gap_means_route_supplies_no_objective_commercial_sex_result hm
  | age ha =>
      cases ha with
      | knowing _ hC _ => exact gcorr_willBeCaused hC
      | reckless _ hC _ _ => exact gcorr_willBeCaused hC
      | reasonableOpportunityToObserve _ hC _ _ => exact gcorr_willBeCaused hC

end Proving.USC.T18.Ch77.Part4.GoldenBridge
