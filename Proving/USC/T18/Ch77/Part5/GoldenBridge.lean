



























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.Trafficking.Statute
import Proving.USC.T18.Ch77.Part5.Elements.Theorems

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.GoldenBridge

open Proving.USC.Common








axiom mapPerson : Person → Proving.Trafficking.Person
axiom mapComplaint : ComplaintText → Proving.Trafficking.ComplaintText
axiom mapAction : Elements.TraffickingAct → Proving.Trafficking.Action
axiom mapObstructiveAct : Elements.ObstructiveAct → Proving.Trafficking.Action













axiom corr_eg_knowingly {d : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    ActedWithScienter d c →
    Proving.Trafficking.ActedKnowingly (mapPerson d) (mapAction act) (mapComplaint c)




axiom corr_eg_nexus {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.CommerceOrMaritimeNexus act c →
    Proving.Trafficking.InterstateCommerceOrSpecialJurisdiction
      (mapAction act) (mapComplaint c)



axiom corr_eg_conduct {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.TraffickingConduct1591a1 d act v c →
    Proving.Trafficking.RecruitsEnticesHarborsAdvertisesOrSolicits
      (mapPerson d) (mapPerson v) (mapAction act) (mapComplaint c)






axiom corr_eg_means {d v : Person} {act : Elements.TraffickingAct}
    {sx : Elements.SexAct} {c : ComplaintText} :
    Elements.MeansRoute1591a d v sx c →
    Proving.Trafficking.CoerciveMeansWillBeUsed
      (mapPerson v) (mapAction act) (mapComplaint c)






axiom corr_eg_age {v : Person} {c : ComplaintText} :
    Elements.UnderAge18 v c →
    Proving.Trafficking.PersonHasNotAttainedAgeEighteen (mapPerson v) (mapComplaint c)




axiom corr_eg_observe {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObservePerson d v c →
    Proving.Trafficking.ReasonableOpportunityToObservePerson
      (mapPerson d) (mapPerson v) (mapComplaint c)






axiom corr_eg_commercialSex {v : Person} {act : Elements.TraffickingAct}
    {sx : Elements.SexAct} {c : ComplaintText} :
    Elements.IsCommercialSexAct sx c →
    Elements.WillBeCausedToEngageInSexAct v sx c →
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (mapPerson v) (mapAction act) (mapComplaint c)



axiom corr_eg_obstruction {d : Person} {oa : Elements.ObstructiveAct}
    {c : ComplaintText} :
    Elements.ObstructiveConduct1591d d oa c →
    Proving.Trafficking.ObstructsEnforcementOfSection1591
      (mapPerson d) (mapObstructiveAct oa) (mapComplaint c)







private theorem mensReaAndResult
    {d v : Person} {act : Elements.TraffickingAct} {sx : Elements.SexAct}
    {c : ComplaintText}
    (gap_eg_means_object :
        (Elements.KnowsOfProhibitedCircumstance d v c ∨
         Elements.RecklesslyDisregardsProhibitedCircumstance d v c) →
        Elements.MeansRoute1591a d v sx c →
        Proving.Trafficking.KnewOrRecklesslyDisregardedCoerciveMeans
          (mapPerson d) (mapPerson v) (mapAction act) (mapComplaint c))
    (gap_eg_minority_object :
        (Elements.KnowsOfProhibitedCircumstance d v c ∨
         Elements.RecklesslyDisregardsProhibitedCircumstance d v c) →
        Elements.MinorityRoute1591a v sx c →
        Proving.Trafficking.KnewOrRecklesslyDisregardedThatPersonWasMinor
          (mapPerson d) (mapPerson v) (mapComplaint c))
    (h : Elements.CircumstanceEstablished1591a1 d act v sx c) :
    Proving.Trafficking.Section1591MensRea
      (mapPerson d) (mapPerson v) (mapAction act) (mapComplaint c) ∧
    Proving.Trafficking.WillBeCausedToEngageInCommercialSexAct
      (mapPerson v) (mapAction act) (mapComplaint c) :=
  match h with
  | .observedMinority hObs hR =>
      ⟨.viaObservedMinority (corr_eg_observe hObs) (corr_eg_age hR.minor),
       corr_eg_commercialSex hR.commercial hR.caused⟩
  | .general (.knowingMeans hk hR) =>
      ⟨.viaCoercion (gap_eg_means_object (Or.inl hk) hR) (corr_eg_means hR),
       corr_eg_commercialSex hR.commercial hR.caused⟩
  | .general (.recklessMeans hr _ hR) =>
      ⟨.viaCoercion (gap_eg_means_object (Or.inr hr) hR) (corr_eg_means hR),
       corr_eg_commercialSex hR.commercial hR.caused⟩
  | .general (.knowingMinority hk hR) =>
      ⟨.viaKnownMinority (gap_eg_minority_object (Or.inl hk) hR) (corr_eg_age hR.minor),
       corr_eg_commercialSex hR.commercial hR.caused⟩
  | .general (.recklessMinority hr _ hR) =>
      ⟨.viaKnownMinority (gap_eg_minority_object (Or.inr hr) hR) (corr_eg_age hR.minor),
       corr_eg_commercialSex hR.commercial hR.caused⟩


























theorem s1591a1_elements_implies_golden_modulo_gaps
    {d v : Person} {act : Elements.TraffickingAct} {sx : Elements.SexAct}
    {c : ComplaintText}
    (gap_eg_means_object :
        (Elements.KnowsOfProhibitedCircumstance d v c ∨
         Elements.RecklesslyDisregardsProhibitedCircumstance d v c) →
        Elements.MeansRoute1591a d v sx c →
        Proving.Trafficking.KnewOrRecklesslyDisregardedCoerciveMeans
          (mapPerson d) (mapPerson v) (mapAction act) (mapComplaint c))
    (gap_eg_minority_object :
        (Elements.KnowsOfProhibitedCircumstance d v c ∨
         Elements.RecklesslyDisregardsProhibitedCircumstance d v c) →
        Elements.MinorityRoute1591a v sx c →
        Proving.Trafficking.KnewOrRecklesslyDisregardedThatPersonWasMinor
          (mapPerson d) (mapPerson v) (mapComplaint c))
    (h : Elements.Section1591a1 d act v sx c) :
    Proving.Trafficking.Section1591SubsecA
      (mapPerson d) (mapPerson v) (mapAction act) (mapComplaint c) :=
  ⟨corr_eg_knowingly h.knowingly,
   .viaRecruitment (corr_eg_nexus h.nexus) (corr_eg_conduct h.conduct),
   (mensReaAndResult gap_eg_means_object gap_eg_minority_object h.circumstance).1,
   (mensReaAndResult gap_eg_means_object gap_eg_minority_object h.circumstance).2⟩










theorem s1591d_elements_implies_golden_modulo_gaps
    {d : Person} {oa : Elements.ObstructiveAct} {c : ComplaintText}
    (gap_obstruction_chapeau_knowingly_absent_from_enacted_text :
        Proving.Trafficking.ActedKnowingly
          (mapPerson d) (mapObstructiveAct oa) (mapComplaint c))
    (h : Elements.Section1591d d oa c) :
    Proving.Trafficking.Section1591SubsecD
      (mapPerson d) (mapObstructiveAct oa) (mapComplaint c) :=
  ⟨gap_obstruction_chapeau_knowingly_absent_from_enacted_text,
   corr_eg_obstruction h.conduct⟩

end Proving.USC.T18.Ch77.Part5.GoldenBridge
