





























import Proving.Trafficking.Statute
import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part2.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch77.Part2.Elements











axiom mapPerson : Person → Proving.Trafficking.Person
axiom mapComplaint : ComplaintText → Proving.Trafficking.ComplaintText
axiom mapAction : TraffickingAct → Proving.Trafficking.Action













axiom corr_knowingly {p : Person} {a : TraffickingAct} {c : ComplaintText} :
    ActedWithScienter p c →
    Proving.Trafficking.ActedKnowingly (mapPerson p) (mapAction a) (mapComplaint c)




axiom corr_jurisdiction {a : TraffickingAct} {c : ComplaintText} :
    JurisdictionalNexus1591a1 a c →
    Proving.Trafficking.InterstateCommerceOrSpecialJurisdiction
      (mapAction a) (mapComplaint c)


axiom corr_conductVerb {p v : Person} {a : TraffickingAct} {c : ComplaintText} :
    PerformsEnumeratedTraffickingAct p v a c →
    Proving.Trafficking.RecruitsEnticesHarborsAdvertisesOrSolicits
      (mapPerson p) (mapPerson v) (mapAction a) (mapComplaint c)






axiom corr_ventureBenefit {p : Person} {ven : Venture} {a : TraffickingAct}
    {c : ComplaintText} :
    ReceivesBenefitOfValue p ven c →
    ParticipationInVenture1591e4 p ven c →
    Venture1591e6 ven c →
    Proving.Trafficking.BenefitsFromParticipationInVenture
      (mapPerson p) (mapAction a) (mapComplaint c)



axiom corr_venturePredicateAct {ven : Venture} {a : TraffickingAct}
    {c : ComplaintText} :
    VentureEngagedInParagraphOneAct ven c →
    Proving.Trafficking.VentureEngagedInSection1591a1Act
      (mapAction a) (mapComplaint c)





axiom corr_meansMensRea {p v : Person} {a : TraffickingAct} {c : ComplaintText} :
    CulpableMentalState1591a p a c →
    Proving.Trafficking.KnewOrRecklesslyDisregardedCoerciveMeans
      (mapPerson p) (mapPerson v) (mapAction a) (mapComplaint c)



axiom corr_coerciveMeansUsed {v : Person} {m : CoerciveMeans} {hm : Harm}
    {s : SexAct} {a : TraffickingAct} {c : ComplaintText} :
    ProhibitedMeans1591 m hm v c →
    MeansWillBeUsedToCauseCommercialSexAct v m s c →
    Proving.Trafficking.CoerciveMeansWillBeUsed
      (mapPerson v) (mapAction a) (mapComplaint c)




axiom corr_underEighteen {v : Person} {c : ComplaintText} :
    victimAgeYearsAtOffense v c < 18 →
    Proving.Trafficking.PersonHasNotAttainedAgeEighteen
      (mapPerson v) (mapComplaint c)


axiom corr_minorityMensRea {p v : Person} {a : TraffickingAct}
    {c : ComplaintText} :
    CulpableMentalState1591a p a c →
    Proving.Trafficking.KnewOrRecklesslyDisregardedThatPersonWasMinor
      (mapPerson p) (mapPerson v) (mapComplaint c)









axiom corr_observationRoute {p v : Person} {c : ComplaintText} :
    ProsecutedUnderParagraphOne p c →
    ReasonableOpportunityToObserve p v c →
    Proving.Trafficking.ReasonableOpportunityToObservePerson
      (mapPerson p) (mapPerson v) (mapComplaint c)




axiom corr_resultViaMeans {v : Person} {m : CoerciveMeans} {s : SexAct}
    {a : TraffickingAct} {c : ComplaintText} :
    MeansWillBeUsedToCauseCommercialSexAct v m s c →
    CommercialSexAct1591e3 s c →
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (mapPerson v) (mapAction a) (mapComplaint c)


axiom corr_resultViaMinority {v : Person} {s : SexAct} {a : TraffickingAct}
    {c : ComplaintText} :
    WillBeCausedToEngageInCommercialSexAct v s c →
    CommercialSexAct1591e3 s c →
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (mapPerson v) (mapAction a) (mapComplaint c)

















theorem s1591a_elements_implies_golden
    {p v : Person} {a : TraffickingAct} {ven : Venture} {m : CoerciveMeans}
    {hm : Harm} {s : SexAct} {c : ComplaintText}
    (h : Section1591a p v a ven m hm s c) :
    Proving.Trafficking.Section1591SubsecA
      (mapPerson p) (mapPerson v) (mapAction a) (mapComplaint c) := by
  refine { knowingly := ?_, conduct := ?_, mensRea := ?_, commercialSex := ?_ }
  ·
    cases h.conduct with
    | direct hd => exact corr_knowingly (a := a) hd.knowingly
    | beneficiary hb => exact corr_knowingly (a := a) hb.knowingly
  ·
    cases h.conduct with
    | direct hd =>
        exact Proving.Trafficking.Section1591Conduct.viaRecruitment
          (corr_jurisdiction hd.jurisdiction) (corr_conductVerb hd.act)
    | beneficiary hb =>
        exact Proving.Trafficking.Section1591Conduct.viaVentureBenefit
          (corr_ventureBenefit (a := a) hb.benefit hb.participation hb.venture)
          (corr_venturePredicateAct (a := a) hb.venturePredicateAct)
  ·
    cases h.aggravatingFact with
    | byMeans hMeans =>
        exact Proving.Trafficking.Section1591MensRea.viaCoercion
          (corr_meansMensRea (v := v) hMeans.mentalState)
          (corr_coerciveMeansUsed (a := a) hMeans.means hMeans.causation)
    | byMinority hMin =>
        cases hMin.mentalState with
        | proven hProven =>
            exact Proving.Trafficking.Section1591MensRea.viaKnownMinority
              (corr_minorityMensRea (v := v) hProven)
              (corr_underEighteen hMin.underEighteen)
        | relievedByObservation hProsecution hOpportunity =>
            exact Proving.Trafficking.Section1591MensRea.viaObservedMinority
              (corr_observationRoute hProsecution hOpportunity)
              (corr_underEighteen hMin.underEighteen)
  ·
    cases h.aggravatingFact with
    | byMeans hMeans =>
        exact corr_resultViaMeans (a := a) hMeans.causation hMeans.commerciality
    | byMinority hMin =>
        exact corr_resultViaMinority (a := a) hMin.causation hMin.commerciality
















axiom corr_obstructs {p : Person} {o : ObstructiveAct} {a : TraffickingAct}
    {c : ComplaintText} :
    ObstructionConduct1591d p o c →
    EnforcementOfThisSection o c →
    Proving.Trafficking.ObstructsEnforcementOfSection1591
      (mapPerson p) (mapAction a) (mapComplaint c)






theorem s1591d_elements_implies_golden_modulo_gaps
    {p : Person} {o : ObstructiveAct} {a : TraffickingAct} {c : ComplaintText}
    (gap_obstruction_chapeau_knowingly_absent_from_enacted_text :
      Proving.Trafficking.ActedKnowingly (mapPerson p) (mapAction a) (mapComplaint c))
    (h : Section1591d p o c) :
    Proving.Trafficking.Section1591SubsecD
      (mapPerson p) (mapAction a) (mapComplaint c) :=
  { knowingly := gap_obstruction_chapeau_knowingly_absent_from_enacted_text
    obstructs := corr_obstructs (a := a) h.conduct h.targetIsThisSection }

end Proving.USC.T18.Ch77.Part2.GoldenBridge
