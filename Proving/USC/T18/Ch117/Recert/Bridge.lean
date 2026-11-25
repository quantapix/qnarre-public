








































import Proving.USC.T18.Ch117.Recert.Deontic.Statute
import Proving.USC.T18.Ch117.Recert.Elements.Statute
import Proving.USC.T18.Ch117.Recert.Ontology.Statute
import Proving.USC.T18.Ch117.Recert.Procedure.Statute
import Proving.USC.T18.Ch117.Recert.Scienter.Statute
import Proving.USC.T18.Ch117.Recert.Structure.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.Rico.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Bridge

open Proving.USC.Common









axiom mapIcs_DE : Deontic.InteractiveComputerService → Elements.InteractiveComputerService

axiom mapIcs_EO : Elements.InteractiveComputerService → Ontology.InteractiveComputerService

axiom mapTravel_EO : Elements.Travel → Ontology.TravelOrTransportation




axiom travelObjectE : Person → ComplaintText → Elements.Travel

axiom travelObjectO : Person → ComplaintText → Ontology.TravelOrTransportation



axiom intentObject : Person → ComplaintText → Ontology.Intent

axiom intentMoment : Person → ComplaintText → Time


axiom iccObject : Person → ComplaintText → Ontology.IllicitSexualConduct


axiom icsObjectE : ComplaintText → Elements.InteractiveComputerService


axiom courtObject : ComplaintText → Deontic.Court











axiom corr2421A_service {p : Person} {s : Deontic.InteractiveComputerService}
    {c : ComplaintText} :
    Deontic.AddresseeOperatesInteractiveComputerService p s c →
    Elements.IsInteractiveComputerService (mapIcs_DE s) c



axiom corr2421A_commerce {p : Person} {c : ComplaintText} :
    Deontic.ConditionInterstateCommerceNexus p c → Elements.CommerceNexus2421A p c



axiom corr2421A_intent {p : Person} {c : ComplaintText} :
    Deontic.MensReaIntentToPromoteOrFacilitateProstitution p c →
    Elements.IntentToPromoteOrFacilitateProstitution p c



axiom corr2421A_operation {p : Person} {s : Deontic.InteractiveComputerService}
    {c : ComplaintText} :
    Deontic.ActOwnManageOperateOrAttemptService p s c →
    Elements.IcsOperationRoute p (mapIcs_DE s) c





axiom corr2421Ae_defence {p : Person} {j : Deontic.Jurisdiction} {c : ComplaintText} :
    Elements.DefenseProstitutionLegalInTargetedJurisdiction p c →
    Deontic.EscapeProstitutionLegalInTargetedJurisdiction p j c


theorem s2421Aa_deontic_implies_elements {p : Person}
    {s : Deontic.InteractiveComputerService} {j : Deontic.Jurisdiction}
    {c : ComplaintText} (h : Deontic.ProhibitionViolated2421Aa p s j c) :
    Elements.Section2421Aa p (mapIcs_DE s) c :=
  { commerce := corr2421A_commerce h.1.condition
  , service := corr2421A_service h.1.addressee
  , operation := corr2421A_operation h.2.1
  , intent := corr2421A_intent h.1.mensRea
  , noJurisdictionalLegalityDefense := fun hd => h.2.2 (corr2421Ae_defence hd) }



axiom corr2421Ab1_act {p : Person} {c : ComplaintText} :
    Deontic.ActFacilitateProstitutionOfFiveOrMorePersons p c →
    Elements.PromotesOrFacilitatesProstitutionOfAnother p c ∧
      Elements.PromotesOrFacilitatesFiveOrMore p c




axiom corr2421Ab2_reckless {p : Person} {c : ComplaintText} :
    Deontic.MensReaRecklessDisregardOfSexTraffickingContribution p c →
    Elements.ConductContributedToSexTrafficking p c ∧ Elements.ActsInRecklessDisregard p c




theorem s2421Ab_aggravator_deontic_implies_elements {p : Person}
    {j : Deontic.Jurisdiction} {c : ComplaintText}
    (h : Deontic.Aggravator2421Ab p j c) : Elements.Aggravator2421Ab p c :=
  match h with
  | .fiveOrMorePersons hAct hNo =>
      .fiveOrMore
        { promotes := (corr2421Ab1_act hAct).1
        , fiveOrMore := (corr2421Ab1_act hAct).2
        , noJurisdictionalLegalityDefense := fun hd => hNo (corr2421Ae_defence hd) }
  | .recklessDisregardOfSexTrafficking hR =>
      .recklessDisregard
        { contribution := (corr2421Ab2_reckless hR).1
        , recklessness := (corr2421Ab2_reckless hR).2 }


theorem s2421Ab_deontic_implies_elements {p : Person}
    {s : Deontic.InteractiveComputerService} {j : Deontic.Jurisdiction}
    {c : ComplaintText} (h : Deontic.ProhibitionViolated2421Ab p s j c) :
    Elements.Section2421Ab p (mapIcs_DE s) c :=
  { commerce := corr2421A_commerce h.1.condition
  , service := corr2421A_service h.1.addressee
  , operation := corr2421A_operation h.2.1
  , intent := corr2421A_intent h.1.mensRea
  , aggravator := s2421Ab_aggravator_deontic_implies_elements h.2.2 }





axiom corr2421A_rungE {p : Person} {c : ComplaintText} :
    Elements.IntentToPromoteOrFacilitateProstitution p c →
    Scienter.MentalStateProvenAsTo2421A p MentalState.Specific
      Scienter.ScienterElement2421A.PromoteFacilitateProstitution c



axiom corr2421Ab2_rungE {p : Person} {c : ComplaintText} :
    Elements.ActsInRecklessDisregard p c →
    Scienter.MentalStateProvenAsTo2421A p MentalState.Recklessness
      Scienter.ScienterElement2421A.ContributionToSexTrafficking c



axiom corr2421Ae_defenceES {p : Person} {c : ComplaintText} :
    Scienter.PromotionLegalInTargetedJurisdiction p c →
    Elements.DefenseProstitutionLegalInTargetedJurisdiction p c




theorem s2421Aa_elements_implies_scienter {p : Person}
    {s : Elements.InteractiveComputerService} {c : ComplaintText}
    (h : Elements.Section2421Aa p s c) : Scienter.Culpable2421AaUndefeated p c :=
  ⟨⟨MentalState.Specific, MentalState.atLeast_refl MentalState.Specific,
    corr2421A_rungE h.intent⟩,
   fun hl => h.noJurisdictionalLegalityDefense (corr2421Ae_defenceES hl)⟩






theorem s2421Ab_elements_implies_scienter {p : Person}
    {s : Elements.InteractiveComputerService} {c : ComplaintText}
    (h : Elements.Section2421Ab p s c) :
    Scienter.Culpable2421Ab1 p c ∨ Scienter.Culpable2421Ab2 p c :=
  match h.aggravator with
  | .fiveOrMore _ =>
      Or.inl ⟨MentalState.Specific, MentalState.atLeast_refl MentalState.Specific,
              corr2421A_rungE h.intent⟩
  | .recklessDisregard hR =>
      Or.inr ⟨⟨MentalState.Specific, MentalState.atLeast_refl MentalState.Specific,
               corr2421A_rungE h.intent⟩,
              ⟨MentalState.Recklessness, MentalState.atLeast_refl MentalState.Recklessness,
               corr2421Ab2_rungE hR.recklessness⟩⟩




axiom corr2421A_rungD {p : Person} {c : ComplaintText} :
    Deontic.MensReaIntentToPromoteOrFacilitateProstitution p c →
    Scienter.MentalStateProvenAsTo2421A p MentalState.Specific
      Scienter.ScienterElement2421A.PromoteFacilitateProstitution c


axiom corr2421Ae_defenceDS {p : Person} {j : Deontic.Jurisdiction} {c : ComplaintText} :
    Scienter.PromotionLegalInTargetedJurisdiction p c →
    Deontic.EscapeProstitutionLegalInTargetedJurisdiction p j c


theorem s2421Aa_deontic_implies_scienter {p : Person}
    {s : Deontic.InteractiveComputerService} {j : Deontic.Jurisdiction}
    {c : ComplaintText} (h : Deontic.ProhibitionViolated2421Aa p s j c) :
    Scienter.Culpable2421AaUndefeated p c :=
  ⟨⟨MentalState.Specific, MentalState.atLeast_refl MentalState.Specific,
    corr2421A_rungD h.1.mensRea⟩,
   fun hl => h.2.2 (corr2421Ae_defenceDS hl)⟩








axiom corrO2421A_service {s : Elements.InteractiveComputerService} {c : ComplaintText} :
    Elements.IsInteractiveComputerService s c →
    Ontology.IsInteractiveComputerService (mapIcs_EO s) c

axiom corrO2421A_operator {p : Person} {s : Elements.InteractiveComputerService}
    {c : ComplaintText} :
    Elements.OwnsManagesOrOperatesIcs p s c →
    Ontology.IsOwnerManagerOrOperator p (mapIcs_EO s) c








theorem s2421Aa_elements_implies_ontology_modulo_gaps {p : Person}
    {s : Elements.InteractiveComputerService} {f : Ontology.CommerceFacility}
    {c : ComplaintText}
    (h : Elements.Section2421Aa p s c)
    (gap_facilityCarrier : Ontology.IsFacilityOrMeansOfInterstateCommerce f c)
    (gap_operatorRoute : Elements.OwnsManagesOrOperatesIcs p s c) :
    Ontology.ServiceOperatorMembership p (mapIcs_EO s) f c :=
  { service := corrO2421A_service h.service
  , facility := gap_facilityCarrier
  , operator := corrO2421A_operator gap_operatorRoute }










axiom corr2421Ac_injury {v : Person} {c : ComplaintText} :
    Deontic.AddresseeInjuredByViolationOf2421Ab v c →
    Elements.PlaintiffInjuredByViolation v c

axiom corr2421Ac_causation {v p : Person} {c : ComplaintText} :
    Deontic.ConditionInjuryByReasonOfViolation v p c → ProximateCause v c

axiom corr2421Ac_forum {c : ComplaintText} :
    Deontic.ConditionAppropriateUnitedStatesDistrictCourtForum c →
    Elements.BroughtInUnitedStatesDistrictCourt c




theorem s2421Ac_deontic_implies_elements_modulo_gaps {v p : Person}
    {s : Deontic.InteractiveComputerService} {j : Deontic.Jurisdiction}
    {c : ComplaintText}
    (h : Deontic.Permission2421Ac v p s j c)
    (gap_withinLimitations : WithinLimitations v c) :
    Elements.ValidSection2421AcClaim v p (mapIcs_DE s) c :=
  { violation := s2421Ab_deontic_implies_elements h.predicateViolation
  , injury := corr2421Ac_injury h.addressee
  , causation := corr2421Ac_causation h.condition
  , timeliness := gap_withinLimitations
  , forum := corr2421Ac_forum h.forum }





axiom corrPE2421Ac_violation {p : Person} {c : ComplaintText} :
    Procedure.ViolationOfSubsectionB p c → Elements.Section2421Ab p (icsObjectE c) c



axiom corrPE2421Ac_injury {v p : Person} {c : ComplaintText} :
    Procedure.InjuredByReasonOfViolation v p c →
    Elements.PlaintiffInjuredByViolation v c ∧ ProximateCause v c

axiom corrPE2421Ac_forum {v : Person} {c : ComplaintText} :
    Procedure.FiledInUnitedStatesDistrictCourt v c →
    Elements.BroughtInUnitedStatesDistrictCourt c




axiom corrPE2421Ac_window {v : Person} {c : ComplaintText} {w : Nat} :
    Procedure.WithinLimitationsWindow v c w → WithinLimitations v c




theorem s2421Ac_procedure_implies_elements {v p : Person} {c : ComplaintText} {w : Nat}
    (h : Procedure.Section2421AcTimelyCivilFiling v p c w) :
    Elements.ValidSection2421AcClaim v p (icsObjectE c) c :=
  { violation := corrPE2421Ac_violation h.predicateViolation
  , injury := (corrPE2421Ac_injury h.injured).1
  , causation := (corrPE2421Ac_injury h.injured).2
  , timeliness := corrPE2421Ac_window h.inWindow
  , forum := corrPE2421Ac_forum h.forum }












axiom corr2421Ad_orderD {ct : Deontic.Court} {p : Person} {c : ComplaintText} :
    Deontic.ActOrderRestitutionConsistentWith2327b ct p c →
    Procedure.RestitutionOrdered p c ∧
      Procedure.RestitutionScopeConsistentWithSection2327b p c




axiom corr2421Ad_triggerP {p : Person} {c : ComplaintText} :
    Procedure.ConvictedUnderSubsectionB2 p c →
    Deontic.ConditionViolationOfSubsection2421Ab2 p c

axiom corr2421Ad_orderP {p : Person} {c : ComplaintText} :
    Procedure.RestitutionOrdered p c →
    Procedure.RestitutionScopeConsistentWithSection2327b p c →
    Deontic.ActOrderRestitutionConsistentWith2327b (courtObject c) p c






theorem s2421Ad_deontic_implies_procedure_modulo_gaps {ct : Deontic.Court} {p : Person}
    {c : ComplaintText}
    (h : Deontic.ObligationDischarged2421Ad ct p c)
    (gap_convictionPosture : Procedure.ConvictedUnderSubsectionB2 p c) :
    Procedure.Section2421AdMandatoryRestitution p c :=
  { convicted := gap_convictionPosture
  , ordered := (corr2421Ad_orderD h.2).1
  , scopeConsistent := (corr2421Ad_orderD h.2).2 }







theorem s2421Ad_procedure_implies_deontic_modulo_gaps {p : Person} {c : ComplaintText}
    (h : Procedure.Section2421AdMandatoryRestitution p c)
    (gap_courtAddressee : Deontic.AddresseeSentencingCourt (courtObject c) c) :
    Deontic.ObligationDischarged2421Ad (courtObject c) p c :=
  ⟨{ addressee := gap_courtAddressee
   , condition := corr2421Ad_triggerP h.convicted }
  , corr2421Ad_orderP h.ordered h.scopeConsistent⟩
















axiom corr2423g1 {p o : Person} {c : ComplaintText} :
    Deontic.DefIllicitSexualConductSexualActWithMinor p o c → Elements.SexualActRoute p o c

axiom corr2423g2 {p o : Person} {c : ComplaintText} :
    Deontic.DefIllicitSexualConductCommercialSexActWithMinor p o c →
    Elements.CommercialSexActUnderSection1591 p o c ∧ Elements.UnderEighteen o c

axiom corr2423g3 {p o : Person} {c : ComplaintText} :
    Deontic.DefIllicitSexualConductProductionOfChildPornography p o c →
    Elements.ProducesChildPornographyUnderSection2256 p o c



axiom corr2423i_defence {p o : Person} {c : ComplaintText} :
    Elements.DefenseReasonableBeliefVictimAttainedEighteen p o c →
    Deontic.EscapeReasonableBeliefPersonHadAttainedEighteen p o c


theorem s2423g_deontic_implies_elements {p o : Person} {c : ComplaintText}
    (h : Deontic.IllicitSexualConduct p o c) : Elements.IllicitSexualConduct p o c :=
  match h with
  | .sexualActWithMinor hA => .sexualAct (corr2423g1 hA)
  | .commercialSexActWithMinor hA hNo =>
      .commercialSexAct
        { commercialSexAct := (corr2423g2 hA).1
        , minor := (corr2423g2 hA).2
        , noReasonableBeliefDefense := fun hd => hNo (corr2423i_defence hd) }
  | .productionOfChildPornography hA => .childPornography (corr2423g3 hA)



axiom corr2423a_transport {p m : Person} {c : ComplaintText} :
    Deontic.ActTransportIndividual p m c →
    Elements.TransportsIndividual p m (travelObjectE p c) c




axiom corr2423a_mensRea {p m : Person} {c : ComplaintText} :
    Deontic.MensReaIntentThatIndividualEngageInProhibitedSexualActivity p m c →
    ActedWithScienter p c ∧ Elements.UnlawfulPurpose2423a p m c

axiom corr2423a_minor {m : Person} {c : ComplaintText} :
    Deontic.ConditionIndividualUnderAgeOfEighteen m c → Elements.UnderEighteen m c

axiom corr2423a_locus {p m : Person} {c : ComplaintText} :
    Deontic.ConditionTransportationInInterstateForeignOrTerritorialCommerce p m c →
    Elements.TransportJurisdiction2423a (travelObjectE p c) c


axiom corr2423h_temporal {p : Person} {c : ComplaintText} :
    Deontic.DefIntentAtTimeOfTransportationOrTravel p c →
    Elements.IntentExistedAtTimeOfTravel p c


theorem s2423a_deontic_implies_elements {p m : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2423a p m c) :
    Elements.Section2423a p m (travelObjectE p c) c :=
  { transportation := corr2423a_transport h.2
  , knowledge := (corr2423a_mensRea h.1.mensRea).1
  , minor := corr2423a_minor h.1.conditionMinority
  , jurisdiction := corr2423a_locus h.1.conditionChannel
  , purpose := (corr2423a_mensRea h.1.mensRea).2
  , contemporaneousIntent := corr2423h_temporal h.1.temporalIntent }

axiom corr2423a_transportRungE {p : Person} {c : ComplaintText} :
    ActedWithScienter p c →
    Scienter.MentalStateProvenAsTo2423 p MentalState.Knowledge
      Scienter.ScienterElement2423.TransportationOfIndividual c

axiom corr2423a_purposeRungE {p v : Person} {c : ComplaintText} :
    Elements.UnlawfulPurpose2423a p v c →
    Scienter.MentalStateProvenAsTo2423 p MentalState.Specific
      Scienter.ScienterElement2423.IntendedProstitutionOrChargeableSexualActivity c

axiom corr2423h_intentHeldE {p : Person} {c : ComplaintText} :
    Elements.IntentExistedAtTimeOfTravel p c → Scienter.IntentHeldAtTimeOfTravel p c





theorem s2423a_elements_implies_scienter {p v : Person} {t : Elements.Travel}
    {c : ComplaintText} (h : Elements.Section2423a p v t c) : Scienter.Culpable2423a p c :=
  ⟨⟨MentalState.Knowledge, MentalState.atLeast_refl MentalState.Knowledge,
    corr2423a_transportRungE h.knowledge⟩,
   ⟨MentalState.Specific, MentalState.atLeast_refl MentalState.Specific,
    corr2423a_purposeRungE h.purpose⟩,
   corr2423h_intentHeldE h.contemporaneousIntent⟩

axiom corr2423a_rungsD {p m : Person} {c : ComplaintText} :
    Deontic.MensReaIntentThatIndividualEngageInProhibitedSexualActivity p m c →
    Scienter.MentalStateProvenAsTo2423 p MentalState.Knowledge
        Scienter.ScienterElement2423.TransportationOfIndividual c ∧
      Scienter.MentalStateProvenAsTo2423 p MentalState.Specific
        Scienter.ScienterElement2423.IntendedProstitutionOrChargeableSexualActivity c

axiom corr2423h_intentHeldD {p : Person} {c : ComplaintText} :
    Deontic.DefIntentAtTimeOfTransportationOrTravel p c →
    Scienter.IntentHeldAtTimeOfTravel p c


theorem s2423a_deontic_implies_scienter {p m : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2423a p m c) : Scienter.Culpable2423a p c :=
  ⟨⟨MentalState.Knowledge, MentalState.atLeast_refl MentalState.Knowledge,
    (corr2423a_rungsD h.1.mensRea).1⟩,
   ⟨MentalState.Specific, MentalState.atLeast_refl MentalState.Specific,
    (corr2423a_rungsD h.1.mensRea).2⟩,
   corr2423h_intentHeldD h.1.temporalIntent⟩

axiom corrO2423a_minorE {v : Person} {c : ComplaintText} :
    Elements.UnderEighteen v c → Ontology.IsMinorUnder18 v c

axiom corrO2423a_knowingE {p v : Person} {t : Elements.Travel} {c : ComplaintText} :
    Elements.TransportsIndividual p v t c → ActedWithScienter p c →
    Ontology.IsKnowingTransportation p (mapTravel_EO t) v c

axiom corrO2423a_locusE {t : Elements.Travel} {c : ComplaintText} :
    Elements.TransportJurisdiction2423a t c → Ontology.Section2423aLocus (mapTravel_EO t) c



axiom corrO2423h_intentE {p v : Person} {c : ComplaintText} :
    Elements.UnlawfulPurpose2423a p v c →
    Ontology.IsIntentUnderSection2423 (intentObject p c) c


axiom corrO2423h_timingE {p : Person} {t : Elements.Travel} {c : ComplaintText} :
    Elements.IntentExistedAtTimeOfTravel p c →
    Ontology.IsAtTimeOfTransportationOrTravel (intentObject p c) (mapTravel_EO t)
      (intentMoment p c) c


theorem s2423a_elements_implies_ontology {p v : Person} {t : Elements.Travel}
    {c : ComplaintText} (h : Elements.Section2423a p v t c) :
    Ontology.TransportedMinorMembership p v (mapTravel_EO t) (intentObject p c)
      (intentMoment p c) c :=
  { minor := corrO2423a_minorE h.minor
  , knowing := corrO2423a_knowingE h.transportation h.knowledge
  , locus := corrO2423a_locusE h.jurisdiction
  , intent := corrO2423h_intentE h.purpose
  , timing := corrO2423h_timingE h.contemporaneousIntent }

axiom corrO2423a_minorD {m : Person} {c : ComplaintText} :
    Deontic.ConditionIndividualUnderAgeOfEighteen m c → Ontology.IsMinorUnder18 m c

axiom corrO2423a_knowingD {p m : Person} {c : ComplaintText} :
    Deontic.ActTransportIndividual p m c →
    Deontic.MensReaIntentThatIndividualEngageInProhibitedSexualActivity p m c →
    Ontology.IsKnowingTransportation p (travelObjectO p c) m c

axiom corrO2423a_locusD {p m : Person} {c : ComplaintText} :
    Deontic.ConditionTransportationInInterstateForeignOrTerritorialCommerce p m c →
    Ontology.Section2423aLocus (travelObjectO p c) c

axiom corrO2423h_intentD {p m : Person} {c : ComplaintText} :
    Deontic.MensReaIntentThatIndividualEngageInProhibitedSexualActivity p m c →
    Ontology.IsIntentUnderSection2423 (intentObject p c) c

axiom corrO2423h_timingD {p : Person} {c : ComplaintText} :
    Deontic.DefIntentAtTimeOfTransportationOrTravel p c →
    Ontology.IsAtTimeOfTransportationOrTravel (intentObject p c) (travelObjectO p c)
      (intentMoment p c) c


theorem s2423a_deontic_implies_ontology {p m : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2423a p m c) :
    Ontology.TransportedMinorMembership p m (travelObjectO p c) (intentObject p c)
      (intentMoment p c) c :=
  { minor := corrO2423a_minorD h.1.conditionMinority
  , knowing := corrO2423a_knowingD h.2 h.1.mensRea
  , locus := corrO2423a_locusD h.1.conditionChannel
  , intent := corrO2423h_intentD h.1.mensRea
  , timing := corrO2423h_timingD h.1.temporalIntent }

axiom corrOS2423a_knowingRung {p v : Person} {t : Ontology.TravelOrTransportation}
    {c : ComplaintText} :
    Ontology.IsKnowingTransportation p t v c →
    Scienter.MentalStateProvenAsTo2423 p MentalState.Knowledge
      Scienter.ScienterElement2423.TransportationOfIndividual c

axiom corrOS2423a_intentRung {p v : Person} {t : Ontology.TravelOrTransportation}
    {i : Ontology.Intent} {c : ComplaintText} :
    Ontology.IsKnowingTransportation p t v c → Ontology.IsIntentUnderSection2423 i c →
    Scienter.MentalStateProvenAsTo2423 p MentalState.Specific
      Scienter.ScienterElement2423.IntendedProstitutionOrChargeableSexualActivity c

axiom corrOS2423h_held {p v : Person} {t : Ontology.TravelOrTransportation}
    {i : Ontology.Intent} {moment : Time} {c : ComplaintText} :
    Ontology.IsKnowingTransportation p t v c →
    Ontology.IsAtTimeOfTransportationOrTravel i t moment c →
    Scienter.IntentHeldAtTimeOfTravel p c





theorem s2423a_ontology_implies_scienter {p v : Person} {t : Ontology.TravelOrTransportation}
    {i : Ontology.Intent} {moment : Time} {c : ComplaintText}
    (h : Ontology.TransportedMinorMembership p v t i moment c) : Scienter.Culpable2423a p c :=
  ⟨⟨MentalState.Knowledge, MentalState.atLeast_refl MentalState.Knowledge,
    corrOS2423a_knowingRung h.knowing⟩,
   ⟨MentalState.Specific, MentalState.atLeast_refl MentalState.Specific,
    corrOS2423a_intentRung h.knowing h.intent⟩,
   corrOS2423h_held h.knowing h.timing⟩



axiom corr2423c_status {p : Person} {c : ComplaintText} :
    Deontic.AddresseeCitizenOrLawfulPermanentResident p c →
    Elements.IsUnitedStatesCitizenOrLawfulPermanentResident p c



axiom corr2423c_nexus {p : Person} {c : ComplaintText} :
    Deontic.ConditionTravelInForeignCommerceOrResidesInForeignCountry p c →
    Elements.ForeignNexus2423c p (travelObjectE p c) c





theorem s2423c_deontic_implies_elements {p o : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2423c p o c) :
    Elements.Section2423c p o (travelObjectE p c) c :=
  { status := corr2423c_status h.1.addressee
  , nexus := corr2423c_nexus h.1.condition
  , conduct := s2423g_deontic_implies_elements h.2 }



axiom corr2423d_role {p : Person} {e : Entity} {c : ComplaintText} :
    Deontic.ConditionOfficerDirectorEmployeeOrAgentOfOrganization p e c →
    Elements.IsOfficerDirectorEmployeeOrAgent p e c

axiom corr2423d_orgCommerce {e : Entity} {c : ComplaintText} :
    Deontic.ConditionOrganizationAffectsInterstateOrForeignCommerce e c →
    EngagedInInterstateCommerce e c

axiom corr2423d_mails {p : Person} {e : Entity} {c : ComplaintText} :
    Deontic.ActUseMailsOrInstrumentalityThroughOrganizationalConnection p e c →
    Elements.UsesMailsOrInstrumentalityThroughOrganization p e c

axiom corr2423d_furtherance {p : Person} {e : Entity} {c : ComplaintText} :
    Deontic.ActInFurtheranceOfIllicitSexualConductThroughOrganizationalConnection p e c →
    Elements.CommitsActInFurtheranceOfIllicitSexualConduct p e c







theorem s2423d_deontic_implies_elements {p : Person} {e : Entity} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2423d p e c) : Elements.Section2423d p e c :=
  { status := corr2423c_status h.1.addressee
  , role := corr2423d_role h.1.conditionRole
  , organizationCommerce := corr2423d_orgCommerce h.1.conditionCommerce
  , useOfMailsOrInstrumentality := corr2423d_mails h.2.1
  , furtherance := corr2423d_furtherance h.2.2 }

axiom corrEO2423d_status {p : Person} {c : ComplaintText} :
    Elements.IsUnitedStatesCitizenOrLawfulPermanentResident p c →
    Ontology.CoveredTravelerStatus p c

axiom corrEO2423d_role {p : Person} {e : Entity} {c : ComplaintText} :
    Elements.IsOfficerDirectorEmployeeOrAgent p e c →
    Ontology.IsOfficerDirectorEmployeeOrAgent p e c

axiom corrEO2423d_org {e : Entity} {c : ComplaintText} :
    EngagedInInterstateCommerce e c → Ontology.IsOrganizationAffectingCommerce e c

axiom corrEO2423d_mails {p : Person} {e : Entity} {c : ComplaintText} :
    Elements.UsesMailsOrInstrumentalityThroughOrganization p e c →
    Ontology.IsUseOfMailsOrInstrumentality p e c

axiom corrEO2423d_furtherance {p : Person} {e : Entity} {c : ComplaintText} :
    Elements.CommitsActInFurtheranceOfIllicitSexualConduct p e c →
    Ontology.IsActInFurtheranceThroughAffiliation p e (iccObject p c) c




theorem s2423d_elements_implies_ontology {p : Person} {e : Entity} {c : ComplaintText}
    (h : Elements.Section2423d p e c) :
    Ontology.OrganizationalAffiliationMembership p e (iccObject p c) c :=
  { status := corrEO2423d_status h.status
  , role := corrEO2423d_role h.role
  , organization := corrEO2423d_org h.organizationCommerce
  , instrumentality := corrEO2423d_mails h.useOfMailsOrInstrumentality
  , furtherance := corrEO2423d_furtherance h.furtherance }




























opaque Act : Type
axiom mapAct : Act → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText


axiom corr_2423a_1961B {p v : Person} {t : Elements.Travel} {c : ComplaintText} (act : Act) :
    Elements.Section2423a p v t c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s2423a_elements_implies_rico_1961B {p v : Person} {t : Elements.Travel}
    {c : ComplaintText} (act : Act) (h : Elements.Section2423a p v t c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2423a_1961B act h


axiom corr_2423b_1961B {p : Person} {t : Elements.Travel} {c : ComplaintText} (act : Act) :
    Elements.Section2423b p t c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s2423b_elements_implies_rico_1961B {p : Person} {t : Elements.Travel}
    {c : ComplaintText} (act : Act) (h : Elements.Section2423b p t c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2423b_1961B act h


axiom corr_2423c_1961B {p v : Person} {t : Elements.Travel} {c : ComplaintText} (act : Act) :
    Elements.Section2423c p v t c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s2423c_elements_implies_rico_1961B {p v : Person} {t : Elements.Travel}
    {c : ComplaintText} (act : Act) (h : Elements.Section2423c p v t c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2423c_1961B act h


axiom corr_2423d_1961B {p : Person} {e : Entity} {c : ComplaintText} (act : Act) :
    Elements.Section2423d p e c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s2423d_elements_implies_rico_1961B {p : Person} {e : Entity}
    {c : ComplaintText} (act : Act) (h : Elements.Section2423d p e c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2423d_1961B act h


axiom corr_2423e_1961B {p v : Person} {t : Elements.Travel} {c : ComplaintText} (act : Act) :
    Elements.Section2423e p v t c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s2423e_elements_implies_rico_1961B {p v : Person} {t : Elements.Travel}
    {c : ComplaintText} (act : Act) (h : Elements.Section2423e p v t c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2423e_1961B act h

end Proving.USC.T18.Ch117.Recert.Bridge
