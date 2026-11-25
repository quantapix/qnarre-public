





































import Proving.USC.T18.Ch77.Part3.Elements.Statute
import Proving.USC.T18.Ch77.Part3.Deontic.Statute
import Proving.USC.T18.Ch77.Part3.Ontology.Statute
import Proving.USC.T18.Ch77.Part3.Procedure.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Bridge

open Proving.USC.Common






axiom mapOffenceED : Elements.Offense → Deontic.ChapterOffense

axiom mapOffenceEO : Elements.Offense → Ontology.Offense

axiom mapOrderED : Elements.RestitutionOrder → Deontic.RestitutionOrder

axiom mapOrderEO : Elements.RestitutionOrder → Ontology.RestitutionOrder

axiom mapOrderEP : Elements.RestitutionOrder → Procedure.RestitutionOrder

axiom mapOrderPD : Procedure.RestitutionOrder → Deontic.RestitutionOrder

axiom mapOrderPO : Procedure.RestitutionOrder → Ontology.RestitutionOrder

axiom mapOrderOD : Ontology.RestitutionOrder → Deontic.RestitutionOrder










axiom corr_p_offence {d : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsChapter77Offense o c → Elements.DefendantConvictedOfOffense d o c →
    Procedure.OffenseUnderChapter77Established d c



axiom corr_p_ordered {ord : Elements.RestitutionOrder} {d v : Person} {c : ComplaintText} :
    Elements.OrderDirectsDefendantToPayVictim ord d v c →
    Procedure.CourtOrderedRestitution (mapOrderEP ord) d c



axiom corr_p_harmed {v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsIndividualHarmed v o c → ProximateCause v c →
    Procedure.IsIndividualHarmedByChapter77Crime v c



axiom corr_p_minor {v : Person} {c : ComplaintText} :
    Elements.VictimUnderEighteen v c → Procedure.victimAgeInYears v c < 18

axiom corr_p_incompetent {v : Person} {c : ComplaintText} :
    Elements.VictimIncompetent v c → Procedure.VictimIsIncompetent v c

axiom corr_p_incapacitated {v : Person} {c : ComplaintText} :
    Elements.VictimIncapacitated v c → Procedure.VictimIsIncapacitated v c

axiom corr_p_deceased {v : Person} {c : ComplaintText} :
    Elements.VictimDeceased v c → Procedure.VictimIsDeceased v c


axiom corr_p_guardian {r v : Person} {c : ComplaintText} :
    Elements.IsLegalGuardianOfVictim r v c → Procedure.IsLegalGuardianOfVictim r v c

axiom corr_p_estate {r v : Person} {c : ComplaintText} :
    Elements.IsRepresentativeOfVictimEstate r v c → Procedure.IsRepresentativeOfVictimsEstate r v c

axiom corr_p_family {r v : Person} {c : ComplaintText} :
    Elements.IsFamilyMemberOfVictim r v c → Procedure.IsFamilyMemberOfVictim r v c

axiom corr_p_appointed {r v : Person} {c : ComplaintText} :
    Elements.IsCourtAppointedSuitablePerson r v c →
    Procedure.IsCourtAppointedSuitableRepresentative r v c





axiom corr_p_defendantBar {r : Person} {o : Elements.Offense} {c : ComplaintText} :
    Procedure.IsDefendantInChapter77Proceeding r c → Elements.IsDefendantInOffense r o c


axiom corr_p_directsPay {ord : Elements.RestitutionOrder} {d v : Person} {c : ComplaintText} :
    Elements.OrderDirectsDefendantToPayVictim ord d v c →
    Procedure.OrderDirectsDefendantToPayVictim (mapOrderEP ord) d v c

axiom corr_p_mechanism {ord : Elements.RestitutionOrder} {c : ComplaintText} :
    Elements.PaymentThroughCourtMechanism ord c →
    Procedure.PaymentRoutedThroughCourtMechanism (mapOrderEP ord) c


axiom corr_p_issued {ord : Elements.RestitutionOrder} {c : ComplaintText} :
    Elements.OrderIssuedAndEnforcedUnderSection3664 ord c →
    Procedure.OrderIssuedInAccordanceWithSection3664 (mapOrderEP ord) c

axiom corr_p_enforced {ord : Elements.RestitutionOrder} {c : ComplaintText} :
    Elements.OrderIssuedAndEnforcedUnderSection3664 ord c →
    Procedure.OrderEnforcedInAccordanceWithSection3664 (mapOrderEP ord) c





axiom corr_p_amt2259 {v : Person} {c : ComplaintText} :
    Procedure.section2259LossAmount v c = Elements.section2259LossAmount v c

axiom corr_p_amtGross {v d : Person} {c : ComplaintText} :
    Procedure.grossIncomeOrValueToDefendantOfVictimServices v d c
      = Elements.grossIncomeOrValueToDefendantOfVictimServices v d c

axiom corr_p_amtFlsa {v : Person} {c : ComplaintText} :
    Procedure.flsaGuaranteedValueOfVictimLabor v c
      = Elements.flsaGuaranteedValueOfVictimLabor v c

axiom corr_p_amtOrdered {ord : Elements.RestitutionOrder} {c : ComplaintText} :
    Procedure.orderedRestitutionAmount (mapOrderEP ord) c
      = Elements.orderedRestitutionAmount ord c






theorem fullAmount_PE (v d : Person) (c : ComplaintText) :
    Procedure.fullAmountOfVictimsLosses v d c = Elements.fullAmountOfVictimsLosses v d c := by
  unfold Procedure.fullAmountOfVictimsLosses Elements.fullAmountOfVictimsLosses
  rw [corr_p_amt2259, corr_p_amtGross, corr_p_amtFlsa]



theorem victim_elements_implies_procedure
    {payee harmed : Person} {o : Elements.Offense} {c : ComplaintText}
    (hHarmed : Elements.DirectVictim harmed o c)
    (h : Elements.Victim1593c payee harmed o c) :
    Procedure.VictimForRestitution payee harmed c :=
  match h with
  | .direct hEq =>
      .direct (corr_p_harmed hHarmed.individualHarmed hHarmed.causation) hEq
  | .representative hRep =>
      .throughRepresentative
        (corr_p_harmed hHarmed.individualHarmed hHarmed.causation)
        (match hRep.trigger with
          | .underEighteen ht => Or.inl (corr_p_minor ht)
          | .incompetent ht => Or.inr (Or.inl (corr_p_incompetent ht))
          | .incapacitated ht => Or.inr (Or.inr (Or.inl (corr_p_incapacitated ht)))
          | .deceased ht => Or.inr (Or.inr (Or.inr (corr_p_deceased ht))))
        (match hRep.capacity with
          | .legalGuardian hc => .legalGuardian (corr_p_guardian hc)
          | .estateRepresentative hc => .estateRepresentative (corr_p_estate hc)
          | .familyMember hc => .familyMember (corr_p_family hc)
          | .courtAppointed hc => .courtAppointed (corr_p_appointed hc))
        (fun hd => hRep.notDefendant (corr_p_defendantBar hd))










theorem s1593_elements_implies_procedure_modulo_gaps
    {d payee harmed : Person} {o : Elements.Offense}
    {ord : Elements.RestitutionOrder} {c : ComplaintText}
    (gap_restitutionNotWithheld1593 :
      Procedure.RestitutionNotWithheldUnderGeneralRestitutionProvisions (mapOrderEP ord) c)
    (gap_restitutionAdditionalToOtherPenalties1593 :
      Procedure.RestitutionAdditionalToOtherPenalties (mapOrderEP ord) c)
    (h : Elements.Section1593 d o payee harmed ord c) :
    Procedure.Section1593Compliant d payee harmed (mapOrderEP ord) c :=
  { mandate :=
      { offenseEstablished := corr_p_offence h.trigger.chapter77Offense h.trigger.convicted
      , notWithheld := gap_restitutionNotWithheld1593
      , ordered := corr_p_ordered h.order.directsPayment
      , additionalToOtherPenalties := gap_restitutionAdditionalToOtherPenalties1593 }
  , standing := victim_elements_implies_procedure h.harmedIsVictim h.payeeQualifies
  , content :=
      { directsPayment := corr_p_directsPay h.order.directsPayment
      , throughCourtMechanism := corr_p_mechanism h.order.courtMechanism
      , fullAmount :=
          (corr_p_amtOrdered.trans h.order.fullAmount).trans
            (fullAmount_PE harmed d c).symm }
  , route :=
      { issuedUnder3664 := corr_p_issued h.order.section3664
      , enforcedUnder3664 := corr_p_enforced h.order.section3664 } }















axiom corr_d_orderUnder1593 {ord : Elements.RestitutionOrder} {d v : Person}
    {c : ComplaintText} :
    Elements.OrderDirectsDefendantToPayVictim ord d v c →
    Elements.OrderIssuedAndEnforcedUnderSection3664 ord c →
    Deontic.IsOrderUnderSection1593 (mapOrderED ord) c



axiom corr_d_defendant {d : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.DefendantConvictedOfOffense d o c →
    Deontic.IsDefendantForOffense d (mapOffenceED o) c





axiom corr_d_victim {payee harmed : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.Victim1593c payee harmed o c →
    Deontic.IsVictimUnderSection1593 payee (mapOffenceED o) c


axiom corr_d_victimDirect {harmed : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.DirectVictim harmed o c →
    Deontic.IsVictimUnderSection1593 harmed (mapOffenceED o) c




axiom corr_d_paysFullAmount {ord : Elements.RestitutionOrder} {d payee harmed : Person}
    {c : ComplaintText} :
    Elements.OrderDirectsDefendantToPayVictim ord d payee c →
    Elements.OrderAwardsFullAmountOfVictimsLosses ord harmed d c →
    Deontic.OrderDirectsDefendantToPayFullAmount (mapOrderED ord) d payee c


axiom corr_d_mechanism {ord : Elements.RestitutionOrder} {c : ComplaintText} :
    Elements.PaymentThroughCourtMechanism ord c →
    Deontic.PaymentRoutedThroughCourtMechanism (mapOrderED ord) c



axiom corr_d_3664 {ord : Elements.RestitutionOrder} {c : ComplaintText} :
    Elements.OrderIssuedAndEnforcedUnderSection3664 ord c →
    Deontic.OrderIssuedAndEnforcedUnderSection3664 (mapOrderED ord) c




axiom corr_d_laborFloor {ord : Elements.RestitutionOrder} {d harmed : Person}
    {c : ComplaintText} :
    Elements.OrderAwardsFullAmountOfVictimsLosses ord harmed d c →
    Deontic.AmountIncludesGreaterOfGrossIncomeOrLaborValue (mapOrderED ord) d harmed c


axiom corr_d_offenceCondition {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsChapter77Offense o c → Deontic.OffenseUnderChapter77 (mapOffenceED o) c




axiom corr_d_courtOrdered {ct : Deontic.Court} {ord : Elements.RestitutionOrder}
    {d v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Deontic.IsSentencingCourt ct c →
    Elements.IsChapter77Offense o c →
    Elements.OrderDirectsDefendantToPayVictim ord d v c →
    Deontic.CourtOrderedRestitution ct (mapOffenceED o) c









theorem s1593_elements_implies_deontic_orderContent
    {d payee harmed : Person} {o : Elements.Offense}
    {ord : Elements.RestitutionOrder} {c : ComplaintText}
    (h : Elements.Section1593 d o payee harmed ord c) :
    Deontic.ObligationSatisfied1593b1 (mapOrderED ord) (mapOffenceED o) d payee c
      ∧ Deontic.ObligationSatisfied1593b2 (mapOrderED ord) c
      ∧ Deontic.ObligationSatisfied1593b3 (mapOrderED ord) (mapOffenceED o) d harmed c :=
  ⟨⟨⟨corr_d_orderUnder1593 h.order.directsPayment h.order.section3664
    , corr_d_defendant h.trigger.convicted
    , corr_d_victim h.payeeQualifies⟩
   , corr_d_paysFullAmount h.order.directsPayment h.order.fullAmount
   , corr_d_mechanism h.order.courtMechanism⟩
  , ⟨⟨corr_d_orderUnder1593 h.order.directsPayment h.order.section3664⟩
    , corr_d_3664 h.order.section3664⟩
  , ⟨⟨corr_d_orderUnder1593 h.order.directsPayment h.order.section3664
     , corr_d_defendant h.trigger.convicted
     , corr_d_victimDirect h.harmedIsVictim⟩
    , corr_d_laborFloor h.order.fullAmount⟩⟩





















theorem s1593_elements_implies_deontic_complied_modulo_gaps
    {d payee harmed : Person} {o : Elements.Offense}
    {ord : Elements.RestitutionOrder} {ct : Deontic.Court}
    {f : Deontic.ForfeitableProperty} {c : ComplaintText}
    (gap_payeeIsLossBearer1593 : payee = harmed)
    (gap_sentencingCourt1593 : Deontic.IsSentencingCourt ct c)
    (gap_forfeitureRouting1593 : Deontic.ObligationSatisfied1593b4 f (mapOrderED ord) c)
    (gap_noBarredAppointment1593 :
      ¬ Deontic.ProhibitionViolated1593c ct (mapOffenceED o) d payee c)
    (h : Elements.Section1593 d o payee harmed ord c) :
    Deontic.Section1593Complied ct (mapOrderED ord) (mapOffenceED o) d payee f c :=
  { mandatoryOrder :=
      ⟨⟨gap_sentencingCourt1593, corr_d_offenceCondition h.trigger.chapter77Offense⟩
      , corr_d_courtOrdered gap_sentencingCourt1593 h.trigger.chapter77Offense
          h.order.directsPayment⟩
  , orderContent := (s1593_elements_implies_deontic_orderContent h).1
  , issuanceAndEnforcement := (s1593_elements_implies_deontic_orderContent h).2.1
  , laborValueFloor :=
      ⟨⟨corr_d_orderUnder1593 h.order.directsPayment h.order.section3664
       , corr_d_defendant h.trigger.convicted
       , corr_d_victim h.payeeQualifies⟩
      , gap_payeeIsLossBearer1593 ▸ corr_d_laborFloor h.order.fullAmount⟩
  , forfeitureRouting := gap_forfeitureRouting1593
  , noBarredAppointment := gap_noBarredAppointment1593 }




axiom corr_o_offence {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsChapter77Offense o c → Ontology.IsOffenseUnderThisChapter (mapOffenceEO o) c


axiom corr_o_harm {v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsIndividualHarmed v o c → ProximateCause v c →
    Ontology.HarmResultedFromOffense v (mapOffenceEO o) c

axiom corr_o_orderUnder {ord : Elements.RestitutionOrder} {d v : Person} {c : ComplaintText} :
    Elements.OrderDirectsDefendantToPayVictim ord d v c →
    Ontology.IsOrderOfRestitutionUnderSection1593 (mapOrderEO ord) c


axiom corr_o_directsPay {ord : Elements.RestitutionOrder} {d v : Person} {c : ComplaintText} :
    Elements.OrderDirectsDefendantToPayVictim ord d v c →
    Elements.PaymentThroughCourtMechanism ord c →
    Ontology.DirectsPaymentToVictim (mapOrderEO ord) v c

axiom corr_o_3664 {ord : Elements.RestitutionOrder} {c : ComplaintText} :
    Elements.OrderIssuedAndEnforcedUnderSection3664 ord c →
    Ontology.IssuedAndEnforcedUnderSection3664 (mapOrderEO ord) c


axiom corr_o_amt2259 {v : Person} {c : ComplaintText} :
    Ontology.section2259c2LossAmount v c = Elements.section2259LossAmount v c

axiom corr_o_amtFlsa {v : Person} {c : ComplaintText} :
    Ontology.flsaGuaranteedLaborValue v c = Elements.flsaGuaranteedValueOfVictimLabor v c












theorem s1593_elements_implies_ontology_modulo_gaps
    {d payee harmed : Person} {o : Elements.Offense}
    {ord : Elements.RestitutionOrder} {c : ComplaintText}
    (gap_payeeIsLossBearer1593 : payee = harmed)
    (gap_ontologyDefendantFreeGrossValue1593 :
      Ontology.grossIncomeOrValueToDefendant harmed c
        = Elements.grossIncomeOrValueToDefendantOfVictimServices harmed d c)
    (h : Elements.Section1593 d o payee harmed ord c) :
    Ontology.Section1593bOrder (mapOrderEO ord) harmed
      (Elements.orderedRestitutionAmount ord c) c :=
  { order := corr_o_orderUnder h.order.directsPayment
  , directsPay := gap_payeeIsLossBearer1593 ▸
      corr_o_directsPay h.order.directsPayment h.order.courtMechanism
  , fullAmount :=
      { victim :=
          Ontology.Section1593cVictim.direct
            { chapterOffense := corr_o_offence h.trigger.chapter77Offense
            , harmed := corr_o_harm h.harmedIsVictim.individualHarmed
                h.harmedIsVictim.causation }
      , amount := by
          have hE := h.order.fullAmount
          unfold Elements.OrderAwardsFullAmountOfVictimsLosses at hE
          unfold Elements.fullAmountOfVictimsLosses at hE
          unfold Ontology.fullAmountOfVictimsLosses
          rw [corr_o_amt2259, corr_o_amtFlsa, gap_ontologyDefendantFreeGrossValue1593]
          exact hE }
  , enforcement := corr_o_3664 h.order.section3664 }






axiom corr_pd_orderUnder {ord : Procedure.RestitutionOrder} {c : ComplaintText} :
    Procedure.OrderIssuedInAccordanceWithSection3664 ord c →
    Deontic.IsOrderUnderSection1593 (mapOrderPD ord) c


axiom corr_pd_defendant {d : Person} {o : Deontic.ChapterOffense} {c : ComplaintText} :
    Procedure.OffenseUnderChapter77Established d c → Deontic.IsDefendantForOffense d o c

axiom corr_pd_condition {d : Person} {o : Deontic.ChapterOffense} {c : ComplaintText} :
    Procedure.OffenseUnderChapter77Established d c → Deontic.OffenseUnderChapter77 o c

axiom corr_pd_victim {payee victim : Person} {o : Deontic.ChapterOffense} {c : ComplaintText} :
    Procedure.VictimForRestitution payee victim c →
    Deontic.IsVictimUnderSection1593 payee o c

axiom corr_pd_courtOrdered {ct : Deontic.Court} {ord : Procedure.RestitutionOrder}
    {d : Person} {o : Deontic.ChapterOffense} {c : ComplaintText} :
    Deontic.IsSentencingCourt ct c → Procedure.CourtOrderedRestitution ord d c →
    Deontic.CourtOrderedRestitution ct o c

axiom corr_pd_paysFullAmount {ord : Procedure.RestitutionOrder} {d payee victim : Person}
    {c : ComplaintText} :
    Procedure.OrderDirectsDefendantToPayVictim ord d payee c →
    Procedure.OrderedAmountIsFullAmount ord victim d c →
    Deontic.OrderDirectsDefendantToPayFullAmount (mapOrderPD ord) d payee c

axiom corr_pd_mechanism {ord : Procedure.RestitutionOrder} {c : ComplaintText} :
    Procedure.PaymentRoutedThroughCourtMechanism ord c →
    Deontic.PaymentRoutedThroughCourtMechanism (mapOrderPD ord) c


axiom corr_pd_3664 {ord : Procedure.RestitutionOrder} {c : ComplaintText} :
    Procedure.OrderIssuedInAccordanceWithSection3664 ord c →
    Procedure.OrderEnforcedInAccordanceWithSection3664 ord c →
    Deontic.OrderIssuedAndEnforcedUnderSection3664 (mapOrderPD ord) c


axiom corr_pd_laborFloor {ord : Procedure.RestitutionOrder} {d victim : Person}
    {c : ComplaintText} :
    Procedure.OrderedAmountIsFullAmount ord victim d c →
    Deontic.AmountIncludesGreaterOfGrossIncomeOrLaborValue (mapOrderPD ord) d victim c







theorem s1593_procedure_implies_deontic_modulo_gaps
    {d payee victim : Person} {ord : Procedure.RestitutionOrder}
    {ct : Deontic.Court} {o : Deontic.ChapterOffense}
    {f : Deontic.ForfeitableProperty} {c : ComplaintText}
    (gap_payeeIsLossBearer1593 : payee = victim)
    (gap_sentencingCourt1593 : Deontic.IsSentencingCourt ct c)
    (gap_forfeitureRouting1593 : Deontic.ObligationSatisfied1593b4 f (mapOrderPD ord) c)
    (gap_noBarredAppointment1593 : ¬ Deontic.ProhibitionViolated1593c ct o d payee c)
    (h : Procedure.Section1593Compliant d payee victim ord c) :
    Deontic.Section1593Complied ct (mapOrderPD ord) o d payee f c :=
  { mandatoryOrder :=
      ⟨⟨gap_sentencingCourt1593, corr_pd_condition h.mandate.offenseEstablished⟩
      , corr_pd_courtOrdered gap_sentencingCourt1593 h.mandate.ordered⟩
  , orderContent :=
      ⟨⟨corr_pd_orderUnder h.route.issuedUnder3664
       , corr_pd_defendant h.mandate.offenseEstablished
       , corr_pd_victim h.standing⟩
      , corr_pd_paysFullAmount h.content.directsPayment h.content.fullAmount
      , corr_pd_mechanism h.content.throughCourtMechanism⟩
  , issuanceAndEnforcement :=
      ⟨⟨corr_pd_orderUnder h.route.issuedUnder3664⟩
      , corr_pd_3664 h.route.issuedUnder3664 h.route.enforcedUnder3664⟩
  , laborValueFloor :=
      ⟨⟨corr_pd_orderUnder h.route.issuedUnder3664
       , corr_pd_defendant h.mandate.offenseEstablished
       , corr_pd_victim h.standing⟩
      , gap_payeeIsLossBearer1593 ▸ corr_pd_laborFloor h.content.fullAmount⟩
  , forfeitureRouting := gap_forfeitureRouting1593
  , noBarredAppointment := gap_noBarredAppointment1593 }




axiom corr_po_harm {v : Person} {o : Ontology.Offense} {c : ComplaintText} :
    Procedure.IsIndividualHarmedByChapter77Crime v c →
    Ontology.HarmResultedFromOffense v o c

axiom corr_po_offence {v : Person} {o : Ontology.Offense} {c : ComplaintText} :
    Procedure.IsIndividualHarmedByChapter77Crime v c →
    Ontology.IsOffenseUnderThisChapter o c

axiom corr_po_orderUnder {ord : Procedure.RestitutionOrder} {c : ComplaintText} :
    Procedure.OrderIssuedInAccordanceWithSection3664 ord c →
    Ontology.IsOrderOfRestitutionUnderSection1593 (mapOrderPO ord) c

axiom corr_po_directsPay {ord : Procedure.RestitutionOrder} {d v : Person} {c : ComplaintText} :
    Procedure.OrderDirectsDefendantToPayVictim ord d v c →
    Procedure.PaymentRoutedThroughCourtMechanism ord c →
    Ontology.DirectsPaymentToVictim (mapOrderPO ord) v c

axiom corr_po_3664 {ord : Procedure.RestitutionOrder} {c : ComplaintText} :
    Procedure.OrderIssuedInAccordanceWithSection3664 ord c →
    Procedure.OrderEnforcedInAccordanceWithSection3664 ord c →
    Ontology.IssuedAndEnforcedUnderSection3664 (mapOrderPO ord) c

axiom corr_po_amt2259 {v : Person} {c : ComplaintText} :
    Ontology.section2259c2LossAmount v c = Procedure.section2259LossAmount v c

axiom corr_po_amtFlsa {v : Person} {c : ComplaintText} :
    Ontology.flsaGuaranteedLaborValue v c = Procedure.flsaGuaranteedValueOfVictimLabor v c




theorem s1593_procedure_implies_ontology_modulo_gaps
    {d payee victim : Person} {ord : Procedure.RestitutionOrder} {c : ComplaintText}
    (oO : Ontology.Offense)
    (gap_payeeIsLossBearer1593 : payee = victim)
    (gap_ontologyDefendantFreeGrossValue1593 :
      Ontology.grossIncomeOrValueToDefendant victim c
        = Procedure.grossIncomeOrValueToDefendantOfVictimServices victim d c)
    (hHarmed : Procedure.IsIndividualHarmedByChapter77Crime victim c)
    (h : Procedure.Section1593Compliant d payee victim ord c) :
    Ontology.Section1593bOrder (mapOrderPO ord) victim
      (Procedure.orderedRestitutionAmount ord c) c :=
  { order := corr_po_orderUnder h.route.issuedUnder3664
  , directsPay := gap_payeeIsLossBearer1593 ▸
      corr_po_directsPay h.content.directsPayment h.content.throughCourtMechanism
  , fullAmount :=
      { victim :=
          Ontology.Section1593cVictim.direct (o := oO)
            { chapterOffense := corr_po_offence (o := oO) hHarmed
            , harmed := corr_po_harm (o := oO) hHarmed }
      , amount := by
          have hP := h.content.fullAmount
          unfold Procedure.OrderedAmountIsFullAmount at hP
          unfold Procedure.fullAmountOfVictimsLosses at hP
          unfold Ontology.fullAmountOfVictimsLosses
          rw [corr_po_amt2259, corr_po_amtFlsa, gap_ontologyDefendantFreeGrossValue1593]
          exact hP }
  , enforcement := corr_po_3664 h.route.issuedUnder3664 h.route.enforcedUnder3664 }






axiom corr_od_orderUnder {ord : Ontology.RestitutionOrder} {c : ComplaintText} :
    Ontology.IsOrderOfRestitutionUnderSection1593 ord c →
    Deontic.IsOrderUnderSection1593 (mapOrderOD ord) c

axiom corr_od_victim {v : Person} {o : Deontic.ChapterOffense} {c : ComplaintText} :
    Ontology.Section1593cVictim c v → Deontic.IsVictimUnderSection1593 v o c


axiom corr_od_paysFullAmount {ord : Ontology.RestitutionOrder} {d v : Person} {n : Nat}
    {c : ComplaintText} :
    Ontology.DirectsPaymentToVictim ord v c → Ontology.FullAmountOfVictimsLosses v n c →
    Deontic.OrderDirectsDefendantToPayFullAmount (mapOrderOD ord) d v c

axiom corr_od_mechanism {ord : Ontology.RestitutionOrder} {v : Person} {c : ComplaintText} :
    Ontology.DirectsPaymentToVictim ord v c →
    Deontic.PaymentRoutedThroughCourtMechanism (mapOrderOD ord) c

axiom corr_od_3664 {ord : Ontology.RestitutionOrder} {c : ComplaintText} :
    Ontology.IssuedAndEnforcedUnderSection3664 ord c →
    Deontic.OrderIssuedAndEnforcedUnderSection3664 (mapOrderOD ord) c


axiom corr_od_laborFloor {ord : Ontology.RestitutionOrder} {d v : Person} {n : Nat}
    {c : ComplaintText} :
    Ontology.FullAmountOfVictimsLosses v n c →
    Deontic.AmountIncludesGreaterOfGrossIncomeOrLaborValue (mapOrderOD ord) d v c









theorem s1593_ontology_implies_deontic_modulo_gaps
    {d v : Person} {n : Nat} {ord : Ontology.RestitutionOrder}
    {ct : Deontic.Court} {o : Deontic.ChapterOffense}
    {f : Deontic.ForfeitableProperty} {c : ComplaintText}
    (gap_sentencingCourt1593 : Deontic.IsSentencingCourt ct c)
    (gap_offenceTrigger1593 : Deontic.OffenseUnderChapter77 o c)
    (gap_defendantForOffence1593 : Deontic.IsDefendantForOffense d o c)
    (gap_courtOrderedRestitution1593 : Deontic.CourtOrderedRestitution ct o c)
    (gap_forfeitureRouting1593 : Deontic.ObligationSatisfied1593b4 f (mapOrderOD ord) c)
    (gap_noBarredAppointment1593 : ¬ Deontic.ProhibitionViolated1593c ct o d v c)
    (h : Ontology.Section1593bOrder ord v n c) :
    Deontic.Section1593Complied ct (mapOrderOD ord) o d v f c :=
  { mandatoryOrder :=
      ⟨⟨gap_sentencingCourt1593, gap_offenceTrigger1593⟩, gap_courtOrderedRestitution1593⟩
  , orderContent :=
      ⟨⟨corr_od_orderUnder h.order
       , gap_defendantForOffence1593
       , corr_od_victim h.fullAmount.victim⟩
      , corr_od_paysFullAmount h.directsPay h.fullAmount
      , corr_od_mechanism h.directsPay⟩
  , issuanceAndEnforcement := ⟨⟨corr_od_orderUnder h.order⟩, corr_od_3664 h.enforcement⟩
  , laborValueFloor :=
      ⟨⟨corr_od_orderUnder h.order
       , gap_defendantForOffence1593
       , corr_od_victim h.fullAmount.victim⟩
      , corr_od_laborFloor h.fullAmount⟩
  , forfeitureRouting := gap_forfeitureRouting1593
  , noBarredAppointment := gap_noBarredAppointment1593 }

end Proving.USC.T18.Ch77.Part3.Bridge
