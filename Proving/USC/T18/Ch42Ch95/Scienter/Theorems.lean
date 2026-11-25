





import Proving.USC.Common.Types
import Proving.USC.T18.Ch42Ch95.Scienter.Types
import Proving.USC.T18.Ch42Ch95.Scienter.Predicates
import Proving.USC.T18.Ch42Ch95.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Scienter

open Proving.USC.Common



theorem mentalState_atLeast_refl (a : MentalState) : a.atLeast a :=
  Nat.le_refl _

theorem mentalState_atLeast_trans {a b d : MentalState}
    (hab : a.atLeast b) (hbd : b.atLeast d) : a.atLeast d :=
  Nat.le_trans hbd hab




theorem demand_metBy_of_atLeast {r proven higher : MentalState}
    (hmet : (Demand.rung r).metBy proven) (hhigh : higher.atLeast proven) :
    (Demand.rung r).metBy higher :=
  Nat.le_trans hmet hhigh


theorem specific_meets_all (r : MentalState) : (Demand.rung r).metBy .Specific := by
  cases r <;> decide



theorem scienterMet_intro {p : Person} {el : ScienterElement} {c : ComplaintText}
    (rung : MentalState) (hReach : (demandOf el).metBy rung)
    (hProv : MentalStateProven p el rung c) :
    ScienterMet p el c :=
  Or.inl ⟨rung, hReach, hProv⟩

theorem scienterMet_ofStatutoryRoute_intro
    {p : Person} {el : ScienterElement} {c : ComplaintText}
    (rung : MentalState) (hReach : (demandOf el).metBy rung)
    (hRoute : RungShownByStatutoryProofRoute p el rung c) :
    ScienterMet p el c :=
  Or.inr ⟨rung, hReach, hRoute⟩



theorem scienterMet_of_higher_rung
    {p : Person} {el : ScienterElement} {c : ComplaintText}
    {r proven higher : MentalState}
    (hDemand : demandOf el = Demand.rung r)
    (hReach : (Demand.rung r).metBy proven)
    (hHigher : higher.atLeast proven)
    (hProv : MentalStateProven p el higher c) :
    ScienterMet p el c :=
  Or.inl ⟨higher, by rw [hDemand]; exact demand_metBy_of_atLeast hReach hHigher, hProv⟩



theorem scienter892aMaking_intro {creditor debtor : Person} {c : ComplaintText}
    (hCreditor : ScienterMet creditor .E892aUnderstandingCreditor c)
    (hDebtor : ScienterMet debtor .E892aUnderstandingDebtor c)
    (hMutual : SharedUnderstandingOfViolentConsequence creditor debtor c) :
    Scienter892aMaking creditor debtor c :=
  ⟨hCreditor, hDebtor, hMutual⟩

theorem scienter892aConspiracy_intro {p : Person} {c : ComplaintText}
    (hPurpose : ScienterMet p .E892aConspiracyPurpose c)
    (hPleaded : ConspiratorialPurposeToCommitOffense p .E892aConspiracyPurpose c) :
    Scienter892aConspiracy p c :=
  ⟨hPurpose, hPleaded⟩

theorem scienter892a_intro {creditor debtor : Person} {c : ComplaintText}
    (h : Scienter892aMaking creditor debtor c) : Scienter892a creditor debtor c :=
  .making h

theorem scienter892a_ofConspiracy_intro {creditor debtor : Person} {c : ComplaintText}
    (h : Scienter892aConspiracy creditor c) : Scienter892a creditor debtor c :=
  .conspiracy h

theorem scienter892b3_intro {debtor : Person} {c : ComplaintText}
    (hBelief : ScienterMet debtor .E892b3DebtorBelief c)
    (hReasonable : BeliefObjectivelyReasonable debtor .E892b3DebtorBelief c) :
    Scienter892b3 debtor c :=
  ⟨hBelief, hReasonable⟩



theorem scienter894aParticipation_intro {p : Person} {c : ComplaintText}
    (hKnowing : ScienterMet p .E894aKnowingParticipation c)
    (obj : Section894Object) (hPurpose : Scienter894Object p obj c) :
    Scienter894aParticipation p c :=
  ⟨hKnowing, ⟨obj, hPurpose⟩⟩

theorem scienter894aConspiracy_intro {p : Person} {c : ComplaintText}
    (hPurpose : ScienterMet p .E894aConspiracyPurpose c)
    (hPleaded : ConspiratorialPurposeToCommitOffense p .E894aConspiracyPurpose c) :
    Scienter894aConspiracy p c :=
  ⟨hPurpose, hPleaded⟩

theorem scienter894a_intro {p : Person} {c : ComplaintText}
    (h : Scienter894aParticipation p c) : Scienter894a p c :=
  .participation h

theorem scienter894a_ofConspiracy_intro {p : Person} {c : ComplaintText}
    (h : Scienter894aConspiracy p c) : Scienter894a p c :=
  .conspiracy h

theorem scienter894b_intro {target : Person} {c : ComplaintText}
    (h : ScienterMet target .E894bTargetKnowledge c) : Scienter894b target c :=
  h



theorem scienter1952a_intro {p : Person} {c : ComplaintText}
    (obj : Section1952Object) (hIntent : Scienter1952Object p obj c) :
    Scienter1952a p c :=
  ⟨⟨obj, hIntent⟩⟩



theorem scienter1956a1_intro {p : Person} {c : ComplaintText}
    (hKnowledge : ScienterMet p .E1956a1KnowledgeProceedsSomeForm c)
    (hGeneric : KnowsUnlawfulActivityGenerically p c)
    (obj : Section1956a1Object) (hObject : Scienter1956a1Object p obj c) :
    Scienter1956a1 p c :=
  ⟨hKnowledge, hGeneric, ⟨obj, hObject⟩⟩

theorem scienter1956a2A_intro {p : Person} {c : ComplaintText}
    (h : ScienterMet p .E1956a2AIntentPromote c) : Scienter1956a2A p c :=
  h

theorem scienter1956a2B_intro {p : Person} {c : ComplaintText}
    (hKnowledge : ScienterMet p .E1956a2BKnowledgeProceedsSomeForm c)
    (hGeneric : KnowsUnlawfulActivityGenerically p c)
    (d : Section1956a2Design) (hDesign : Scienter1956a2Design p d c) :
    Scienter1956a2B p c :=
  ⟨hKnowledge, hGeneric, ⟨d, hDesign⟩⟩

theorem scienter1956a2_intro {p : Person} {c : ComplaintText}
    (h : Scienter1956a2A p c) : Scienter1956a2 p c :=
  .promotion h

theorem scienter1956a2_ofConcealment_intro {p : Person} {c : ComplaintText}
    (h : Scienter1956a2B p c) : Scienter1956a2 p c :=
  .concealment h

theorem scienter1956a3_intro {p : Person} {c : ComplaintText}
    (obj : Section1956a3Object) (hIntent : Scienter1956a3Object p obj c) :
    Scienter1956a3 p c :=
  ⟨⟨obj, hIntent⟩⟩

theorem scienter1956a_intro {p : Person} {c : ComplaintText}
    (h : Scienter1956a1 p c) : Scienter1956a p c :=
  .paragraph1 h

theorem scienter1956a_ofParagraph2_intro {p : Person} {c : ComplaintText}
    (h : Scienter1956a2 p c) : Scienter1956a p c :=
  .paragraph2 h

theorem scienter1956a_ofParagraph3_intro {p : Person} {c : ComplaintText}
    (h : Scienter1956a3 p c) : Scienter1956a p c :=
  .paragraph3 h



theorem scienter1956b1_intro {p : Person} {c : ComplaintText}
    (h : Scienter1956a p c) : Scienter1956b1 p c :=
  h

theorem scienter1956h_intro {p : Person} {c : ComplaintText}
    (hPurpose : ScienterMet p .E1956hConspiracyPurpose c)
    (hPleaded : ConspiratorialPurposeToCommitOffense p .E1956hConspiracyPurpose c) :
    Scienter1956h p c :=
  ⟨hPurpose, hPleaded⟩



theorem culpableUnderSlice_of892a {p q : Person} {c : ComplaintText}
    (h : Scienter892a p q c) : CulpableUnderSlice p q c := .s892a h

theorem culpableUnderSlice_of894a {p q : Person} {c : ComplaintText}
    (h : Scienter894a p c) : CulpableUnderSlice p q c := .s894a h

theorem culpableUnderSlice_of1952a {p q : Person} {c : ComplaintText}
    (h : Scienter1952a p c) : CulpableUnderSlice p q c := .s1952a h

theorem culpableUnderSlice_of1956a {p q : Person} {c : ComplaintText}
    (h : Scienter1956a p c) : CulpableUnderSlice p q c := .s1956a h

theorem culpableUnderSlice_of1956h {p q : Person} {c : ComplaintText}
    (h : Scienter1956h p c) : CulpableUnderSlice p q c := .s1956h h








theorem s892a_makingAct_noQualifier :
    sourceOf .E892aMakingAct = DemandSource.noQualifier := rfl


theorem s892a_understandingDebtor_actor :
    actorOf .E892aUnderstandingDebtor = ActorRole.Debtor := rfl


theorem s894a_participation_knowledge :
    demandOf .E894aKnowingParticipation = Demand.rung .Knowledge := rfl


theorem s894b_actor_isThreatTarget :
    actorOf .E894bTargetKnowledge = ActorRole.ThreatTarget := rfl


theorem s1952a_travel_strictLiability :
    demandOf .E1952aTravelOrFacilityUse = Demand.rung .StrictLiability := rfl



theorem s1956a1_inFact_expressNegation :
    sourceOf .E1956a1InFactSpecifiedUnlawfulActivity = DemandSource.expressNegation := rfl



theorem s1956a1_A_outranks_B :
    demandOf .E1956a1AiIntentPromote = Demand.rung .Specific ∧
    demandOf .E1956a1BiKnowledgeDesignToConceal = Demand.rung .Knowledge :=
  ⟨rfl, rfl⟩



theorem s1956a2A_specific_only :
    demandOf .E1956a2AIntentPromote = Demand.rung .Specific := rfl






theorem demandStated_exhaustive (el : ScienterElement) :
    demandStated el = true ∨
      (el = .E892bObjectiveFactors ∨ el = .E892cEvidentiaryRoute ∨
       el = .E894cEvidentiaryRoute ∨ el = .E1952NonOperative ∨
       el = .E1956NonOperative) := by
  cases el <;> decide


theorem unstated_demands :
    demandStated .E892bObjectiveFactors = false ∧
    demandStated .E892cEvidentiaryRoute = false ∧
    demandStated .E894cEvidentiaryRoute = false ∧
    demandStated .E1952NonOperative = false ∧
    demandStated .E1956NonOperative = false :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

end Proving.USC.T18.Ch42Ch95.Scienter
