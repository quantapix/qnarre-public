


































import Proving.USC.T18.Ch42Ch95.Elements.Statute
import Proving.USC.T18.Ch42Ch95.Deontic.Statute
import Proving.USC.T18.Ch42Ch95.Ontology.Statute
import Proving.USC.T18.Ch42Ch95.Scienter.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch42Ch95









axiom mapCreditE2D : Elements.ExtensionOfCredit → Deontic.CreditExtension
axiom mapCreditE2O : Elements.ExtensionOfCredit → Ontology.ExtensionOfCredit
axiom mapCreditD2O : Deontic.CreditExtension → Ontology.ExtensionOfCredit
axiom mapCreditD2E : Deontic.CreditExtension → Elements.ExtensionOfCredit
axiom mapMeansE2O : Elements.CollectionConduct → Ontology.ExtortionateMeans
axiom mapUaE2D : Elements.UnlawfulActivity → Deontic.UnlawfulActivity
axiom mapUaE2O : Elements.UnlawfulActivity → Ontology.UnlawfulActivity
axiom mapUaD2O : Deontic.UnlawfulActivity → Ontology.UnlawfulActivity
axiom mapFtE2D : Elements.FinancialTransaction → Deontic.FinancialTransaction
axiom mapMtE2D : Elements.MonetaryTransfer → Deontic.MonetaryProperty
axiom mapFtE2O : Elements.FinancialTransaction → Ontology.Transaction
axiom mapSuaE2O : Elements.SpecifiedUnlawfulActivity → Ontology.SpecifiedUnlawfulActivity



namespace S892



axiom corr_culpable_addressee {p c} :
  Elements.CulpablePersonCapableOfIntent p c → Deontic.AddresseeAnyPerson892a p c

axiom corr_extortionate_condition {x c} :
  Elements.IsExtortionateExtensionOfCredit x c →
  Deontic.ConditionExtensionIsExtortionate892a (mapCreditE2D x) c

axiom corr_making_regulatedAct {p x c} :
  Elements.MakesExtensionOfCredit p x c →
  Elements.IsExtortionateExtensionOfCredit x c →
  Deontic.RegulatedActMakesExtortionateExtension892a p (mapCreditE2D x) c










axiom gap_892a_conspiracy_objectExtension
  (p : Person) (ag : Agreement) (x : Elements.ExtensionOfCredit) (c : ComplaintText) : Prop

axiom gap_892a_conspiracy_resolves {p ag x c} :
  Elements.Section892aConspiracy p ag c →
  gap_892a_conspiracy_objectExtension p ag x c →
  Deontic.ProhibitionViolated892a p (mapCreditE2D x) c


theorem s892_elements_implies_deontic_modulo_gaps
    {p : Person} {x : Elements.ExtensionOfCredit} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section892a p x ag c)
    (gap : gap_892a_conspiracy_objectExtension p ag x c) :
    Deontic.ProhibitionViolated892a p (mapCreditE2D x) c := by
  cases h with
  | making hm =>
      exact ⟨⟨corr_culpable_addressee hm.culpable,
              corr_extortionate_condition hm.extortionate⟩,
             corr_making_regulatedAct hm.makesExtension hm.extortionate⟩
  | conspiracy hc => exact gap_892a_conspiracy_resolves hc gap



axiom corr_makes_isExtension {p x c} :
  Elements.MakesExtensionOfCredit p x c →
  Ontology.IsExtensionOfCredit (mapCreditE2O x) c

axiom corr_extortionate_ontology {x c} :
  Elements.IsExtortionateExtensionOfCredit x c →
  Ontology.IsExtortionateExtensionOfCredit (mapCreditE2O x) c

axiom gap_892a_conspiracy_membership {p ag x c} :
  Elements.Section892aConspiracy p ag c →
  gap_892a_conspiracy_objectExtension p ag x c →
  Ontology.ExtortionateExtensionMembership (mapCreditE2O x) c


theorem s892_elements_implies_ontology_modulo_gaps
    {p : Person} {x : Elements.ExtensionOfCredit} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section892a p x ag c)
    (gap : gap_892a_conspiracy_objectExtension p ag x c) :
    Ontology.ExtortionateExtensionMembership (mapCreditE2O x) c := by
  cases h with
  | making hm =>
      exact ⟨corr_makes_isExtension hm.makesExtension,
             corr_extortionate_ontology hm.extortionate⟩
  | conspiracy hc => exact gap_892a_conspiracy_membership hc gap








axiom corr_creditorUnderstanding {p x c} :
  Elements.MakesExtensionOfCredit p x c →
  Elements.CreditorUnderstoodNonrepaymentRiskedViolence x c →
  Elements.UnderstandingHeldWhenCreditExtended x c →
  Scienter.ScienterMet p Scienter.ScienterElement.E892aUnderstandingCreditor c






axiom gap_892a_debtorParty
  (dbtr : Person) (x : Elements.ExtensionOfCredit) (c : ComplaintText) : Prop

axiom gap_892a_debtor_resolves {p dbtr x c} :
  Elements.IsExtortionateExtensionOfCredit x c →
  gap_892a_debtorParty dbtr x c →
  Scienter.ScienterMet dbtr Scienter.ScienterElement.E892aUnderstandingDebtor c
    ∧ Scienter.SharedUnderstandingOfViolentConsequence p dbtr c

axiom corr_892_conspiracy_scienter {p ag c} :
  Elements.Section892aConspiracy p ag c →
  Scienter.ScienterMet p Scienter.ScienterElement.E892aConspiracyPurpose c
    ∧ Scienter.ConspiratorialPurposeToCommitOffense p
        Scienter.ScienterElement.E892aConspiracyPurpose c


theorem s892_elements_implies_scienter_modulo_gaps
    {p dbtr : Person} {x : Elements.ExtensionOfCredit} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section892a p x ag c)
    (gap : gap_892a_debtorParty dbtr x c) :
    Scienter.Scienter892a p dbtr c := by
  cases h with
  | making hm =>
      have hd := gap_892a_debtor_resolves (p := p) hm.extortionate gap
      exact Scienter.Scienter892a.making
        ⟨corr_creditorUnderstanding hm.makesExtension
            hm.extortionate.creditorUnderstanding hm.extortionate.atTimeCreditMade,
         hd.1, hd.2⟩
  | conspiracy hc =>
      have hs := corr_892_conspiracy_scienter hc
      exact Scienter.Scienter892a.conspiracy ⟨hs.1, hs.2⟩









axiom corr_deontic_culpable {p c} :
  Deontic.AddresseeAnyPerson892a p c → Elements.CulpablePersonCapableOfIntent p c

axiom corr_deontic_makes {p x c} :
  Deontic.RegulatedActMakesExtortionateExtension892a p x c →
  Elements.MakesExtensionOfCredit p (mapCreditD2E x) c

axiom corr_deontic_extortionate {x c} :
  Deontic.ConditionExtensionIsExtortionate892a x c →
  Elements.IsExtortionateExtensionOfCredit (mapCreditD2E x) c


theorem s892_deontic_implies_elements
    {p : Person} {x : Deontic.CreditExtension} {ag : Agreement} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated892a p x c) :
    Elements.Section892a p (mapCreditD2E x) ag c :=
  Elements.Section892a.making
    ⟨corr_deontic_culpable h.1.addressee,
     corr_deontic_makes h.2,
     corr_deontic_extortionate h.1.condition⟩



axiom corr_deontic_condition_ontology {x c} :
  Deontic.ConditionExtensionIsExtortionate892a x c →
  Ontology.IsExtortionateExtensionOfCredit (mapCreditD2O x) c

axiom corr_deontic_act_isExtension {p x c} :
  Deontic.RegulatedActMakesExtortionateExtension892a p x c →
  Ontology.IsExtensionOfCredit (mapCreditD2O x) c


theorem s892_deontic_implies_ontology
    {p : Person} {x : Deontic.CreditExtension} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated892a p x c) :
    Ontology.ExtortionateExtensionMembership (mapCreditD2O x) c :=
  ⟨corr_deontic_act_isExtension h.2, corr_deontic_condition_ontology h.1.condition⟩



axiom corr_deontic_creditorUnderstanding {p x c} :
  Deontic.AddresseeAnyPerson892a p c →
  Deontic.RegulatedActMakesExtortionateExtension892a p x c →
  Deontic.ConditionExtensionIsExtortionate892a x c →
  Scienter.ScienterMet p Scienter.ScienterElement.E892aUnderstandingCreditor c

axiom gap_892a_debtorParty_deontic
  (dbtr : Person) (x : Deontic.CreditExtension) (c : ComplaintText) : Prop

axiom gap_892a_debtor_resolves_deontic {p dbtr x c} :
  Deontic.ConditionExtensionIsExtortionate892a x c →
  gap_892a_debtorParty_deontic dbtr x c →
  Scienter.ScienterMet dbtr Scienter.ScienterElement.E892aUnderstandingDebtor c
    ∧ Scienter.SharedUnderstandingOfViolentConsequence p dbtr c


theorem s892_deontic_implies_scienter_modulo_gaps
    {p dbtr : Person} {x : Deontic.CreditExtension} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated892a p x c)
    (gap : gap_892a_debtorParty_deontic dbtr x c) :
    Scienter.Scienter892a p dbtr c :=
  have hd := gap_892a_debtor_resolves_deontic (p := p) h.1.condition gap
  Scienter.Scienter892a.making
    ⟨corr_deontic_creditorUnderstanding h.1.addressee h.2 h.1.condition, hd.1, hd.2⟩



axiom gap_892a_ontology_parties
  (cred dbtr : Person) (x : Ontology.ExtensionOfCredit) (c : ComplaintText) : Prop

axiom gap_892a_ontology_resolves {cred dbtr x c} :
  Ontology.ExtortionateExtensionMembership x c →
  gap_892a_ontology_parties cred dbtr x c →
  Scienter.Scienter892a cred dbtr c





theorem s892_ontology_implies_scienter_modulo_gaps
    {cred dbtr : Person} {x : Ontology.ExtensionOfCredit} {c : ComplaintText}
    (h : Ontology.ExtortionateExtensionMembership x c)
    (gap : gap_892a_ontology_parties cred dbtr x c) :
    Scienter.Scienter892a cred dbtr c :=
  gap_892a_ontology_resolves h gap

end S892



namespace S894



axiom corr_knowingParticipant {p k c} :
  Elements.CulpablePersonCapableOfIntent p c →
  ActedWithScienter p c →
  Elements.ParticipatesInUseOfExtortionateMeans p k c →
  Deontic.AddresseeKnowingParticipant894a p c

axiom corr_meansUsed {p k x c} :
  Elements.ParticipatesInUseOfExtortionateMeans p k c →
  Elements.IsExtortionateMeans k c →
  Elements.ExtensionOfCreditExists x c →
  Deontic.ConditionExtortionateMeansUsed894a p (mapCreditE2D x) c

axiom corr_collect {p k x c} :
  Elements.ParticipatesInUseOfExtortionateMeans p k c →
  Elements.PurposeToCollectExtensionOfCredit k x c →
  Deontic.RegulatedActCollectsExtension894a1 p (mapCreditE2D x) c





axiom gap_894a_victimParty
  (v : Person) (x : Elements.ExtensionOfCredit) (c : ComplaintText) : Prop

axiom gap_894a_punish_resolves {p v k x c} :
  Elements.PurposeToPunishNonrepayment k x c →
  gap_894a_victimParty v x c →
  Deontic.RegulatedActPunishesNonrepayment894a2 p v (mapCreditE2D x) c




axiom gap_894a_conspiracy_objects
  (p : Person) (ag : Agreement) (v : Person)
  (x : Elements.ExtensionOfCredit) (c : ComplaintText) : Prop

axiom gap_894a_conspiracy_resolves {p ag v x c} :
  Elements.Section894aConspiracy p ag c →
  gap_894a_conspiracy_objects p ag v x c →
  Deontic.ProhibitionViolated894a p v (mapCreditE2D x) c



theorem s894_elements_implies_deontic_modulo_gaps
    {p v : Person} {k : Elements.CollectionConduct}
    {x : Elements.ExtensionOfCredit} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section894a p k x ag c)
    (gapV : gap_894a_victimParty v x c)
    (gapC : gap_894a_conspiracy_objects p ag v x c) :
    Deontic.ProhibitionViolated894a p v (mapCreditE2D x) c := by
  cases h with
  | participation hp =>
      refine ⟨⟨corr_knowingParticipant hp.culpable hp.knowingly hp.participates,
               corr_meansUsed hp.participates hp.extortionateMeans hp.creditExists⟩, ?_⟩
      cases hp.purpose with
      | collect hc =>
          exact Deontic.ProhibitedPurpose894a.collect (corr_collect hp.participates hc)
      | punishNonrepayment hn =>
          exact Deontic.ProhibitedPurpose894a.punish
            (gap_894a_punish_resolves hn gapV)
  | conspiracy hc => exact gap_894a_conspiracy_resolves hc gapC



axiom corr_means_ontology {k c} :
  Elements.IsExtortionateMeans k c →
  Ontology.IsExtortionateMeans (mapMeansE2O k) c

axiom corr_creditExists_ontology {x c} :
  Elements.ExtensionOfCreditExists x c →
  Ontology.IsExtensionOfCredit (mapCreditE2O x) c

axiom corr_participates_ontology {p k c} :
  ActedWithScienter p c →
  Elements.ParticipatesInUseOfExtortionateMeans p k c →
  Ontology.KnowinglyParticipatesInUseOfExtortionateMeans p (mapMeansE2O k) c

axiom corr_collect_ontology {k x c} :
  Elements.PurposeToCollectExtensionOfCredit k x c →
  Ontology.UsedToCollectExtensionOfCredit (mapMeansE2O k) (mapCreditE2O x) c

axiom gap_894a_punish_ontology {v k x c} :
  Elements.PurposeToPunishNonrepayment k x c →
  gap_894a_victimParty v x c →
  Ontology.UsedToPunishNonrepayment (mapMeansE2O k) v (mapCreditE2O x) c

axiom gap_894a_conspiracy_ontology {p ag v k x c} :
  Elements.Section894aConspiracy p ag c →
  gap_894a_conspiracy_objects p ag v x c →
  Ontology.ExtortionateCollectionMembership p (mapMeansE2O k) (mapCreditE2O x) v c



theorem s894_elements_implies_ontology_modulo_gaps
    {p v : Person} {k : Elements.CollectionConduct}
    {x : Elements.ExtensionOfCredit} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section894a p k x ag c)
    (gapV : gap_894a_victimParty v x c)
    (gapC : gap_894a_conspiracy_objects p ag v x c) :
    Ontology.ExtortionateCollectionMembership p (mapMeansE2O k) (mapCreditE2O x) v c := by
  cases h with
  | participation hp =>
      refine ⟨corr_means_ontology hp.extortionateMeans,
              corr_creditExists_ontology hp.creditExists,
              corr_participates_ontology hp.knowingly hp.participates, ?_⟩
      cases hp.purpose with
      | collect hc => exact Ontology.ExtortionateUsePurpose.collect (corr_collect_ontology hc)
      | punishNonrepayment hn =>
          exact Ontology.ExtortionateUsePurpose.punish (gap_894a_punish_ontology hn gapV)
  | conspiracy hc => exact gap_894a_conspiracy_ontology hc gapC



axiom corr_knowing_scienter {p k c} :
  ActedWithScienter p c →
  Elements.ParticipatesInUseOfExtortionateMeans p k c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aKnowingParticipation c

axiom corr_collectPurpose_scienter {p k x c} :
  Elements.ParticipatesInUseOfExtortionateMeans p k c →
  Elements.PurposeToCollectExtensionOfCredit k x c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aCollectionPurpose c

axiom corr_punishPurpose_scienter {p k x c} :
  Elements.ParticipatesInUseOfExtortionateMeans p k c →
  Elements.PurposeToPunishNonrepayment k x c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aPunishmentPurpose c

axiom corr_894_conspiracy_scienter {p ag c} :
  Elements.Section894aConspiracy p ag c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aConspiracyPurpose c
    ∧ Scienter.ConspiratorialPurposeToCommitOffense p
        Scienter.ScienterElement.E894aConspiracyPurpose c




theorem s894_elements_implies_scienter
    {p : Person} {k : Elements.CollectionConduct}
    {x : Elements.ExtensionOfCredit} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section894a p k x ag c) :
    Scienter.Scienter894a p c := by
  cases h with
  | participation hp =>
      refine Scienter.Scienter894a.participation
        ⟨corr_knowing_scienter hp.knowingly hp.participates, ?_⟩
      cases hp.purpose with
      | collect hc =>
          exact ⟨Scienter.Section894Object.collect,
                 corr_collectPurpose_scienter hp.participates hc⟩
      | punishNonrepayment hn =>
          exact ⟨Scienter.Section894Object.punish,
                 corr_punishPurpose_scienter hp.participates hn⟩
  | conspiracy hc =>
      have hs := corr_894_conspiracy_scienter hc
      exact Scienter.Scienter894a.conspiracy ⟨hs.1, hs.2⟩










axiom gap_894a_deontic_meansObject
  (p : Person) (m : Ontology.ExtortionateMeans) (x : Deontic.CreditExtension)
  (c : ComplaintText) : Prop

axiom gap_894a_deontic_meansUsed_ontology {p m x c} :
  Deontic.AddresseeKnowingParticipant894a p c →
  Deontic.ConditionExtortionateMeansUsed894a p x c →
  gap_894a_deontic_meansObject p m x c →
  Ontology.IsExtortionateMeans m c
    ∧ Ontology.IsExtensionOfCredit (mapCreditD2O x) c
    ∧ Ontology.KnowinglyParticipatesInUseOfExtortionateMeans p m c

axiom gap_894a_deontic_collect_ontology {p m x c} :
  Deontic.RegulatedActCollectsExtension894a1 p x c →
  gap_894a_deontic_meansObject p m x c →
  Ontology.UsedToCollectExtensionOfCredit m (mapCreditD2O x) c

axiom gap_894a_deontic_punish_ontology {p v m x c} :
  Deontic.RegulatedActPunishesNonrepayment894a2 p v x c →
  gap_894a_deontic_meansObject p m x c →
  Ontology.UsedToPunishNonrepayment m v (mapCreditD2O x) c


theorem s894_deontic_implies_ontology_modulo_gaps
    {p v : Person} {m : Ontology.ExtortionateMeans}
    {x : Deontic.CreditExtension} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated894a p v x c)
    (gap : gap_894a_deontic_meansObject p m x c) :
    Ontology.ExtortionateCollectionMembership p m (mapCreditD2O x) v c := by
  have hc := gap_894a_deontic_meansUsed_ontology h.1.addressee h.1.condition gap
  refine ⟨hc.1, hc.2.1, hc.2.2, ?_⟩
  cases h.2 with
  | collect hcol =>
      exact Ontology.ExtortionateUsePurpose.collect
        (gap_894a_deontic_collect_ontology hcol gap)
  | punish hpun =>
      exact Ontology.ExtortionateUsePurpose.punish
        (gap_894a_deontic_punish_ontology hpun gap)



axiom corr_deontic_knowing_scienter {p c} :
  Deontic.AddresseeKnowingParticipant894a p c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aKnowingParticipation c

axiom corr_deontic_collect_scienter {p x c} :
  Deontic.RegulatedActCollectsExtension894a1 p x c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aCollectionPurpose c

axiom corr_deontic_punish_scienter {p v x c} :
  Deontic.RegulatedActPunishesNonrepayment894a2 p v x c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aPunishmentPurpose c


theorem s894_deontic_implies_scienter
    {p v : Person} {x : Deontic.CreditExtension} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated894a p v x c) :
    Scienter.Scienter894a p c := by
  refine Scienter.Scienter894a.participation
    ⟨corr_deontic_knowing_scienter h.1.addressee, ?_⟩
  cases h.2 with
  | collect hc =>
      exact ⟨Scienter.Section894Object.collect, corr_deontic_collect_scienter hc⟩
  | punish hn =>
      exact ⟨Scienter.Section894Object.punish, corr_deontic_punish_scienter hn⟩



axiom corr_ontology_knowing_scienter {p m c} :
  Ontology.KnowinglyParticipatesInUseOfExtortionateMeans p m c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aKnowingParticipation c

axiom corr_ontology_collect_scienter {p m x c} :
  Ontology.KnowinglyParticipatesInUseOfExtortionateMeans p m c →
  Ontology.UsedToCollectExtensionOfCredit m x c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aCollectionPurpose c

axiom corr_ontology_punish_scienter {p v m x c} :
  Ontology.KnowinglyParticipatesInUseOfExtortionateMeans p m c →
  Ontology.UsedToPunishNonrepayment m v x c →
  Scienter.ScienterMet p Scienter.ScienterElement.E894aPunishmentPurpose c




theorem s894_ontology_implies_scienter
    {p v : Person} {m : Ontology.ExtortionateMeans}
    {x : Ontology.ExtensionOfCredit} {c : ComplaintText}
    (h : Ontology.ExtortionateCollectionMembership p m x v c) :
    Scienter.Scienter894a p c := by
  refine Scienter.Scienter894a.participation
    ⟨corr_ontology_knowing_scienter h.participates, ?_⟩
  cases h.purpose with
  | collect hc =>
      exact ⟨Scienter.Section894Object.collect,
             corr_ontology_collect_scienter h.participates hc⟩
  | punish hn =>
      exact ⟨Scienter.Section894Object.punish,
             corr_ontology_punish_scienter h.participates hn⟩

end S894



namespace S1952



axiom corr_culpable_addressee {p c} :
  Elements.CulpablePersonCapableOfIntent p c → Deontic.AddresseeAnyPerson1952a p c

axiom corr_unlawfulActivity {u c} :
  Elements.IsUnlawfulActivity u c →
  Deontic.ConditionActivityIsUnlawfulActivity1952b (mapUaE2D u) c

axiom corr_travel {p a c} :
  Elements.TravelsInInterstateOrForeignCommerce p a c →
  Deontic.RegulatedActTravelsOrUsesInterstateFacility1952a p c
axiom corr_mail {p a c} :
  Elements.UsesTheMail p a c →
  Deontic.RegulatedActTravelsOrUsesInterstateFacility1952a p c
axiom corr_facility {p a c} :
  Elements.UsesFacilityInInterstateOrForeignCommerce p a c →
  Deontic.RegulatedActTravelsOrUsesInterstateFacility1952a p c

axiom corr_intentDistribute {p u c} :
  Elements.IntendsToDistributeProceedsOfUnlawfulActivity p u c →
  Deontic.ConditionIntentToDistributeProceeds1952a1 p (mapUaE2D u) c
axiom corr_intentViolence {p u c} :
  Elements.IntendsToCommitCrimeOfViolenceToFurtherUnlawfulActivity p u c →
  Deontic.ConditionIntentToCommitCrimeOfViolence1952a2 p (mapUaE2D u) c
axiom corr_intentPromote {p u c} :
  Elements.IntendsToPromoteManageOrCarryOnUnlawfulActivity p u c →
  Deontic.ConditionIntentToPromoteOrFacilitate1952a3 p (mapUaE2D u) c

axiom corr_thereafter {p u c} :
  Elements.PerformsOrAttemptsActDescribedInSubsectionA p u c →
  Deontic.RegulatedActThereafterPerformsOrAttempts1952a p (mapUaE2D u) c





axiom corr_savingsRaffle {p u c} :
  Deontic.EscapeSavingsPromotionRaffle1952e p (mapUaE2D u) c →
  Elements.SavingsPromotionRaffleByInsuredInstitution u c


theorem s1952_elements_implies_deontic
    {p : Person} {a : Elements.InterstateAct} {u : Elements.UnlawfulActivity}
    {c : ComplaintText}
    (h : Elements.Section1952a p a u c) :
    Deontic.ProhibitionViolated1952a p (mapUaE2D u) c := by
  refine ⟨⟨corr_culpable_addressee h.culpable, corr_unlawfulActivity h.unlawfulActivity⟩,
          ?_, ?_, corr_thereafter h.thereafterActs,
          fun hEsc => h.notSavingsPromotionRaffle (corr_savingsRaffle hEsc)⟩
  · cases h.interstateNexus with
    | travel ht => exact corr_travel ht
    | mail hm => exact corr_mail hm
    | facility hf => exact corr_facility hf
  · cases h.purpose with
    | distributeProceeds hd =>
        exact Deontic.ProscribedIntent1952a.distributeProceeds (corr_intentDistribute hd)
    | crimeOfViolence hv =>
        exact Deontic.ProscribedIntent1952a.crimeOfViolence (corr_intentViolence hv)
    | promoteOrCarryOn hp =>
        exact Deontic.ProscribedIntent1952a.promoteOrFacilitate (corr_intentPromote hp)



axiom corr_scienter_distribute {p u c} :
  Elements.IntendsToDistributeProceedsOfUnlawfulActivity p u c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1952aIntentDistributeProceeds c
axiom corr_scienter_violence {p u c} :
  Elements.IntendsToCommitCrimeOfViolenceToFurtherUnlawfulActivity p u c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1952aIntentCommitCrimeOfViolence c
axiom corr_scienter_promote {p u c} :
  Elements.IntendsToPromoteManageOrCarryOnUnlawfulActivity p u c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1952aIntentPromoteUnlawfulActivity c




theorem s1952_elements_implies_scienter
    {p : Person} {a : Elements.InterstateAct} {u : Elements.UnlawfulActivity}
    {c : ComplaintText}
    (h : Elements.Section1952a p a u c) :
    Scienter.Scienter1952a p c := by
  refine ⟨?_⟩
  cases h.purpose with
  | distributeProceeds hd =>
      exact ⟨Scienter.Section1952Object.distributeProceeds, corr_scienter_distribute hd⟩
  | crimeOfViolence hv =>
      exact ⟨Scienter.Section1952Object.crimeOfViolence, corr_scienter_violence hv⟩
  | promoteOrCarryOn hp =>
      exact ⟨Scienter.Section1952Object.promoteUnlawfulActivity, corr_scienter_promote hp⟩



axiom corr_d_scienter_distribute {p u c} :
  Deontic.ConditionIntentToDistributeProceeds1952a1 p u c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1952aIntentDistributeProceeds c
axiom corr_d_scienter_violence {p u c} :
  Deontic.ConditionIntentToCommitCrimeOfViolence1952a2 p u c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1952aIntentCommitCrimeOfViolence c
axiom corr_d_scienter_promote {p u c} :
  Deontic.ConditionIntentToPromoteOrFacilitate1952a3 p u c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1952aIntentPromoteUnlawfulActivity c


theorem s1952_deontic_implies_scienter
    {p : Person} {u : Deontic.UnlawfulActivity} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1952a p u c) :
    Scienter.Scienter1952a p c := by
  refine ⟨?_⟩
  cases h.2.2.1 with
  | distributeProceeds hd =>
      exact ⟨Scienter.Section1952Object.distributeProceeds, corr_d_scienter_distribute hd⟩
  | crimeOfViolence hv =>
      exact ⟨Scienter.Section1952Object.crimeOfViolence, corr_d_scienter_violence hv⟩
  | promoteOrFacilitate hp =>
      exact ⟨Scienter.Section1952Object.promoteUnlawfulActivity, corr_d_scienter_promote hp⟩



axiom corr_ua_business {u c} :
  Elements.IsBusinessEnterpriseInvolvingGamblingLiquorNarcoticsOrProstitution u c →
  Ontology.IsBusinessEnterpriseInvolvingProhibitedActivity (mapUaE2O u) c
axiom corr_ua_extortion {u c} :
  Elements.IsExtortionBriberyOrArsonOffense u c →
  Ontology.IsExtortionBriberyOrArsonViolation (mapUaE2O u) c
axiom corr_ua_indictable {u c} :
  Elements.IsActIndictableUnderMoneyLaunderingOrCurrencyReporting u c →
  Ontology.IsIndictableFinancialOffense (mapUaE2O u) c
axiom corr_ua_term {u c} :
  Elements.IsUnlawfulActivity u c → Ontology.IsUnlawfulActivity (mapUaE2O u) c



theorem s1952b_elements_implies_ontology
    {u : Elements.UnlawfulActivity} {c : ComplaintText}
    (h : Elements.IsUnlawfulActivity u c) :
    Ontology.UnlawfulActivityMembership (mapUaE2O u) c := by
  refine ⟨?_, corr_ua_term h⟩
  cases h with
  | businessEnterprise hb =>
      exact Ontology.UnlawfulActivityKind.businessEnterprise (corr_ua_business hb)
  | extortionBriberyArson he =>
      exact Ontology.UnlawfulActivityKind.extortionBriberyArson (corr_ua_extortion he)
  | launderingOrCurrencyReporting hl =>
      exact Ontology.UnlawfulActivityKind.indictableFinancialOffense (corr_ua_indictable hl)





axiom gap_1952b_deontic_activityKind
  (u : Deontic.UnlawfulActivity) (c : ComplaintText) : Prop

axiom gap_1952b_deontic_resolves {u c} :
  Deontic.ConditionActivityIsUnlawfulActivity1952b u c →
  gap_1952b_deontic_activityKind u c →
  Ontology.UnlawfulActivityMembership (mapUaD2O u) c


theorem s1952b_deontic_implies_ontology_modulo_gaps
    {p : Person} {u : Deontic.UnlawfulActivity} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1952a p u c)
    (gap : gap_1952b_deontic_activityKind u c) :
    Ontology.UnlawfulActivityMembership (mapUaD2O u) c :=
  gap_1952b_deontic_resolves h.1.unlawfulActivity gap

end S1952



namespace S1956



axiom corr_addressee {p c} :
  Elements.CulpablePersonCapableOfIntent p c → Deontic.AddresseeAnyPerson1956 p c


axiom corr_a1_knowledge {p pr t c} :
  Elements.KnowsPropertyRepresentsProceedsOfSomeUnlawfulActivity p pr c →
  Elements.ConductsOrAttemptsFinancialTransaction p t c →
  Deontic.ConditionKnowsPropertyIsProceeds1956a1 p (mapFtE2D t) c
axiom corr_a1_inFact {t s c} :
  Elements.InvolvesProceedsOfSua1956 t s c →
  Elements.IsSpecifiedUnlawfulActivity s c →
  Deontic.ConditionInvolvesProceedsOfSpecifiedUnlawfulActivity1956a1 (mapFtE2D t) c
axiom corr_a1_conducts {p t c} :
  Elements.ConductsOrAttemptsFinancialTransaction p t c →
  Elements.IsFinancialTransaction t c →
  Deontic.RegulatedActConductsFinancialTransaction1956a1 p (mapFtE2D t) c
axiom corr_a1_promote {p t s c} :
  Elements.ConductsOrAttemptsFinancialTransaction p t c →
  Elements.IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c →
  Deontic.ConditionIntentToPromoteSua1956a1Ai p (mapFtE2D t) c
axiom corr_a1_tax {p t c} :
  Elements.ConductsOrAttemptsFinancialTransaction p t c →
  Elements.IntendsToViolateInternalRevenueCodeSection7201Or7206 p c →
  Deontic.ConditionIntentToViolateInternalRevenueCode1956a1Aii p (mapFtE2D t) c
axiom corr_a1_conceal {p t c} :
  Elements.KnowsTransactionDesignedToConcealProceeds p t c →
  Deontic.ConditionKnowsTransactionDesignedToConceal1956a1Bi p (mapFtE2D t) c
axiom corr_a1_avoid {p t c} :
  Elements.KnowsTransactionDesignedToAvoidReportingRequirement p t c →
  Deontic.ConditionKnowsTransactionDesignedToAvoidReporting1956a1Bii p (mapFtE2D t) c


axiom corr_a2_border {p m c} :
  Elements.CrossBorderTransfer1956 p m c →
  Deontic.ConditionCrossesUnitedStatesBorder1956a2 (mapMtE2D m) c
axiom corr_a2_act {p m c} :
  Elements.CrossBorderTransfer1956 p m c →
  Deontic.RegulatedActTransportsTransmitsOrTransfers1956a2 p (mapMtE2D m) c
axiom corr_a2_promote {p m s c} :
  Elements.CrossBorderTransfer1956 p m c →
  Elements.IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c →
  Deontic.ConditionIntentToPromoteSua1956a2A p (mapMtE2D m) c
axiom corr_a2_conceal {p m c} :
  Elements.TransferKnowledge1956a2 p m c →
  Elements.KnowsTransferDesignedToConcealProceeds p m c →
  Deontic.ConditionKnowsProceedsAndDesignedToConceal1956a2Bi p (mapMtE2D m) c
axiom corr_a2_avoid {p m c} :
  Elements.TransferKnowledge1956a2 p m c →
  Elements.KnowsTransferDesignedToAvoidReportingRequirement p m c →
  Deontic.ConditionKnowsProceedsAndDesignedToAvoidReporting1956a2Bii p (mapMtE2D m) c


axiom corr_a3_act {p pr t c} :
  Elements.ConductsOrAttemptsTransactionInvolvingRepresentedProperty p t pr c →
  Elements.RepresentationMadeByOrAtDirectionOfFederalAuthority pr c →
  Deontic.RegulatedActConductsTransactionInRepresentedProperty1956a3 p (mapFtE2D t) c
axiom corr_a3_promote {p pr t s c} :
  Elements.ConductsOrAttemptsTransactionInvolvingRepresentedProperty p t pr c →
  Elements.IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c →
  Deontic.ConditionIntentToPromoteSua1956a3A p (mapFtE2D t) c
axiom corr_a3_conceal {p pr t c} :
  Elements.ConductsOrAttemptsTransactionInvolvingRepresentedProperty p t pr c →
  Elements.IntendsToConcealNatureOrSourceOfBelievedProceeds p pr c →
  Deontic.ConditionIntentToConcealRepresentedProceeds1956a3B p (mapFtE2D t) c
axiom corr_a3_avoid {p pr t c} :
  Elements.ConductsOrAttemptsTransactionInvolvingRepresentedProperty p t pr c →
  Elements.IntendsToAvoidTransactionReportingRequirement p c →
  Deontic.ConditionIntentToAvoidReportingRequirement1956a3C p (mapFtE2D t) c


axiom corr_h_conspires {p ag c} :
  Elements.Section1956hConspiracy p ag c →
  Deontic.RegulatedActConspiresToCommitOffense1956h p c




theorem s1956_elements_implies_deontic
    {p : Person} {pr : Elements.LaunderedProperty} {t : Elements.FinancialTransaction}
    {m : Elements.MonetaryTransfer} {s : Elements.SpecifiedUnlawfulActivity}
    {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section1956Offense p pr t m s ag c) :
    Deontic.Section1956Violated p (mapFtE2D t) (mapMtE2D m) c := by
  cases h with
  | transactionLaundering h1 =>
      refine Deontic.Section1956Violated.domesticTransaction
        ⟨⟨corr_addressee h1.culpable,
          corr_a1_knowledge h1.knowsProceeds h1.conducts,
          corr_a1_inFact h1.involvesProceeds h1.specifiedUnlawfulActivity⟩,
         corr_a1_conducts h1.conducts h1.financialTransaction, ?_⟩
      cases h1.purpose with
      | promoteSua hx =>
          exact Deontic.ProscribedPurpose1956a1.promote (corr_a1_promote h1.conducts hx)
      | taxViolation hx =>
          exact Deontic.ProscribedPurpose1956a1.taxViolation (corr_a1_tax h1.conducts hx)
      | conceal hx => exact Deontic.ProscribedPurpose1956a1.conceal (corr_a1_conceal hx)
      | avoidReporting hx =>
          exact Deontic.ProscribedPurpose1956a1.avoidReporting (corr_a1_avoid hx)
  | crossBorderTransfer h2 =>
      refine Deontic.Section1956Violated.crossBorderTransfer
        ⟨⟨corr_addressee h2.culpable, corr_a2_border h2.crossBorder⟩,
         corr_a2_act h2.crossBorder, ?_⟩
      cases h2.purpose with
      | promoteSua hx =>
          exact Deontic.ProscribedPurpose1956a2.promote
            (corr_a2_promote h2.crossBorder hx)
      | knowingConcealment hk =>
          cases hk.design with
          | conceal hd =>
              exact Deontic.ProscribedPurpose1956a2.conceal (corr_a2_conceal hk.knowledge hd)
          | avoidReporting hd =>
              exact Deontic.ProscribedPurpose1956a2.avoidReporting
                (corr_a2_avoid hk.knowledge hd)
  | stingTransaction h3 =>
      refine Deontic.Section1956Violated.representedProceeds
        ⟨⟨corr_addressee h3.culpable⟩,
         corr_a3_act h3.conducts h3.federallyBackedRepresentation, ?_⟩
      cases h3.purpose with
      | promoteSua hx =>
          exact Deontic.ProscribedPurpose1956a3.promote (corr_a3_promote h3.conducts hx)
      | conceal hx =>
          exact Deontic.ProscribedPurpose1956a3.conceal (corr_a3_conceal h3.conducts hx)
      | avoidReporting hx =>
          exact Deontic.ProscribedPurpose1956a3.avoidReporting
            (corr_a3_avoid h3.conducts hx)
  | conspiracy hh =>
      exact Deontic.Section1956Violated.conspiracy
        ⟨⟨corr_addressee hh.culpable⟩, corr_h_conspires hh⟩



axiom corr_s_a1_knows {p pr c} :
  Elements.KnowsPropertyRepresentsProceedsOfSomeUnlawfulActivity p pr c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1KnowledgeProceedsSomeForm c
    ∧ Scienter.KnowsUnlawfulActivityGenerically p c
axiom corr_s_a1_promote {p s c} :
  Elements.IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1AiIntentPromote c
axiom corr_s_a1_tax {p c} :
  Elements.IntendsToViolateInternalRevenueCodeSection7201Or7206 p c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1AiiIntentViolateIRC c
axiom corr_s_a1_conceal {p t c} :
  Elements.KnowsTransactionDesignedToConcealProceeds p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1BiKnowledgeDesignToConceal c
axiom corr_s_a1_avoid {p t c} :
  Elements.KnowsTransactionDesignedToAvoidReportingRequirement p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1BiiKnowledgeDesignToAvoidReporting c

axiom corr_s_a2_promote {p s c} :
  Elements.IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a2AIntentPromote c
axiom corr_s_a2_knows {p m c} :
  Elements.TransferKnowledge1956a2 p m c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a2BKnowledgeProceedsSomeForm c
    ∧ Scienter.KnowsUnlawfulActivityGenerically p c
axiom corr_s_a2_conceal {p m c} :
  Elements.KnowsTransferDesignedToConcealProceeds p m c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a2BiKnowledgeDesignToConceal c
axiom corr_s_a2_avoid {p m c} :
  Elements.KnowsTransferDesignedToAvoidReportingRequirement p m c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a2BiiKnowledgeDesignToAvoidReporting c

axiom corr_s_a3_promote {p s c} :
  Elements.IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a3IntentPromote c
axiom corr_s_a3_conceal {p pr c} :
  Elements.IntendsToConcealNatureOrSourceOfBelievedProceeds p pr c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a3IntentConcealBelievedProceeds c
    ∧ Scienter.ScienterMet p Scienter.ScienterElement.E1956a3BeliefPropertyIsProceeds c
axiom corr_s_a3_avoid {p c} :
  Elements.IntendsToAvoidTransactionReportingRequirement p c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a3IntentAvoidReporting c

axiom corr_s_h {p ag c} :
  Elements.Section1956hConspiracy p ag c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956hConspiracyPurpose c
    ∧ Scienter.ConspiratorialPurposeToCommitOffense p
        Scienter.ScienterElement.E1956hConspiracyPurpose c






axiom gap_1956h_scienter_not_in_1956a
  (p : Person) (ag : Agreement) (c : ComplaintText) : Prop

axiom gap_1956h_scienter_resolves {p ag c} :
  Elements.Section1956hConspiracy p ag c →
  gap_1956h_scienter_not_in_1956a p ag c →
  Scienter.Scienter1956a p c

theorem s1956_elements_implies_scienter_modulo_gaps
    {p : Person} {pr : Elements.LaunderedProperty} {t : Elements.FinancialTransaction}
    {m : Elements.MonetaryTransfer} {s : Elements.SpecifiedUnlawfulActivity}
    {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section1956Offense p pr t m s ag c)
    (gap : gap_1956h_scienter_not_in_1956a p ag c) :
    Scienter.Scienter1956a p c := by
  cases h with
  | transactionLaundering h1 =>
      have hk := corr_s_a1_knows h1.knowsProceeds
      refine Scienter.Scienter1956a.paragraph1 ⟨hk.1, hk.2, ?_⟩
      cases h1.purpose with
      | promoteSua hx => exact ⟨Scienter.Section1956a1Object.promoteSua, corr_s_a1_promote hx⟩
      | taxViolation hx => exact ⟨Scienter.Section1956a1Object.violateIrc, corr_s_a1_tax hx⟩
      | conceal hx =>
          exact ⟨Scienter.Section1956a1Object.knowingDesignToConceal, corr_s_a1_conceal hx⟩
      | avoidReporting hx =>
          exact ⟨Scienter.Section1956a1Object.knowingDesignToAvoidReporting,
                 corr_s_a1_avoid hx⟩
  | crossBorderTransfer h2 =>
      cases h2.purpose with
      | promoteSua hx =>
          exact Scienter.Scienter1956a.paragraph2
            (Scienter.Scienter1956a2.promotion (corr_s_a2_promote hx))
      | knowingConcealment hk =>
          have hkn := corr_s_a2_knows hk.knowledge
          refine Scienter.Scienter1956a.paragraph2
            (Scienter.Scienter1956a2.concealment ⟨hkn.1, hkn.2, ?_⟩)
          cases hk.design with
          | conceal hd =>
              exact ⟨Scienter.Section1956a2Design.conceal, corr_s_a2_conceal hd⟩
          | avoidReporting hd =>
              exact ⟨Scienter.Section1956a2Design.avoidReporting, corr_s_a2_avoid hd⟩
  | stingTransaction h3 =>
      refine Scienter.Scienter1956a.paragraph3 ⟨?_⟩
      cases h3.purpose with
      | promoteSua hx => exact ⟨Scienter.Section1956a3Object.promote, corr_s_a3_promote hx⟩
      | conceal hx =>
          exact ⟨Scienter.Section1956a3Object.concealBelievedProceeds, corr_s_a3_conceal hx⟩
      | avoidReporting hx =>
          exact ⟨Scienter.Section1956a3Object.avoidReporting, corr_s_a3_avoid hx⟩
  | conspiracy hh => exact gap_1956h_scienter_resolves hh gap



axiom corr_d_a1_knows {p t c} :
  Deontic.ConditionKnowsPropertyIsProceeds1956a1 p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1KnowledgeProceedsSomeForm c
    ∧ Scienter.KnowsUnlawfulActivityGenerically p c
axiom corr_d_a1_promote {p t c} :
  Deontic.ConditionIntentToPromoteSua1956a1Ai p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1AiIntentPromote c
axiom corr_d_a1_tax {p t c} :
  Deontic.ConditionIntentToViolateInternalRevenueCode1956a1Aii p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1AiiIntentViolateIRC c
axiom corr_d_a1_conceal {p t c} :
  Deontic.ConditionKnowsTransactionDesignedToConceal1956a1Bi p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1BiKnowledgeDesignToConceal c
axiom corr_d_a1_avoid {p t c} :
  Deontic.ConditionKnowsTransactionDesignedToAvoidReporting1956a1Bii p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a1BiiKnowledgeDesignToAvoidReporting c

axiom corr_d_a2_promote {p m c} :
  Deontic.ConditionIntentToPromoteSua1956a2A p m c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a2AIntentPromote c
axiom corr_d_a2_conceal {p m c} :
  Deontic.ConditionKnowsProceedsAndDesignedToConceal1956a2Bi p m c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a2BKnowledgeProceedsSomeForm c
    ∧ Scienter.KnowsUnlawfulActivityGenerically p c
    ∧ Scienter.ScienterMet p Scienter.ScienterElement.E1956a2BiKnowledgeDesignToConceal c
axiom corr_d_a2_avoid {p m c} :
  Deontic.ConditionKnowsProceedsAndDesignedToAvoidReporting1956a2Bii p m c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a2BKnowledgeProceedsSomeForm c
    ∧ Scienter.KnowsUnlawfulActivityGenerically p c
    ∧ Scienter.ScienterMet p Scienter.ScienterElement.E1956a2BiiKnowledgeDesignToAvoidReporting c

axiom corr_d_a3_promote {p t c} :
  Deontic.ConditionIntentToPromoteSua1956a3A p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a3IntentPromote c
axiom corr_d_a3_conceal {p t c} :
  Deontic.ConditionIntentToConcealRepresentedProceeds1956a3B p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a3IntentConcealBelievedProceeds c
    ∧ Scienter.ScienterMet p Scienter.ScienterElement.E1956a3BeliefPropertyIsProceeds c
axiom corr_d_a3_avoid {p t c} :
  Deontic.ConditionIntentToAvoidReportingRequirement1956a3C p t c →
  Scienter.ScienterMet p Scienter.ScienterElement.E1956a3IntentAvoidReporting c




axiom gap_1956h_deontic_not_in_1956a (p : Person) (c : ComplaintText) : Prop

axiom gap_1956h_deontic_resolves {p c} :
  Deontic.ProhibitionViolated1956h p c →
  gap_1956h_deontic_not_in_1956a p c →
  Scienter.Scienter1956a p c


theorem s1956_deontic_implies_scienter_modulo_gaps
    {p : Person} {t : Deontic.FinancialTransaction} {m : Deontic.MonetaryProperty}
    {c : ComplaintText}
    (h : Deontic.Section1956Violated p t m c)
    (gap : gap_1956h_deontic_not_in_1956a p c) :
    Scienter.Scienter1956a p c := by
  cases h with
  | domesticTransaction h1 =>
      have hk := corr_d_a1_knows h1.1.knowledge
      refine Scienter.Scienter1956a.paragraph1 ⟨hk.1, hk.2, ?_⟩
      cases h1.2.2 with
      | promote hx => exact ⟨Scienter.Section1956a1Object.promoteSua, corr_d_a1_promote hx⟩
      | taxViolation hx => exact ⟨Scienter.Section1956a1Object.violateIrc, corr_d_a1_tax hx⟩
      | conceal hx =>
          exact ⟨Scienter.Section1956a1Object.knowingDesignToConceal, corr_d_a1_conceal hx⟩
      | avoidReporting hx =>
          exact ⟨Scienter.Section1956a1Object.knowingDesignToAvoidReporting,
                 corr_d_a1_avoid hx⟩
  | crossBorderTransfer h2 =>
      cases h2.2.2 with
      | promote hx =>
          exact Scienter.Scienter1956a.paragraph2
            (Scienter.Scienter1956a2.promotion (corr_d_a2_promote hx))
      | conceal hx =>
          have hk := corr_d_a2_conceal hx
          exact Scienter.Scienter1956a.paragraph2
            (Scienter.Scienter1956a2.concealment
              ⟨hk.1, hk.2.1, ⟨Scienter.Section1956a2Design.conceal, hk.2.2⟩⟩)
      | avoidReporting hx =>
          have hk := corr_d_a2_avoid hx
          exact Scienter.Scienter1956a.paragraph2
            (Scienter.Scienter1956a2.concealment
              ⟨hk.1, hk.2.1, ⟨Scienter.Section1956a2Design.avoidReporting, hk.2.2⟩⟩)
  | representedProceeds h3 =>
      refine Scienter.Scienter1956a.paragraph3 ⟨?_⟩
      cases h3.2.2 with
      | promote hx => exact ⟨Scienter.Section1956a3Object.promote, corr_d_a3_promote hx⟩
      | conceal hx =>
          exact ⟨Scienter.Section1956a3Object.concealBelievedProceeds, corr_d_a3_conceal hx⟩
      | avoidReporting hx =>
          exact ⟨Scienter.Section1956a3Object.avoidReporting, corr_d_a3_avoid hx⟩
  | conspiracy hh => exact gap_1956h_deontic_resolves hh gap



axiom corr_sua_1961 {s c} :
  Elements.IsOffenseListedInSection1961 s c →
  Ontology.IsSection1961ListedOffense (mapSuaE2O s) c
axiom corr_sua_foreign {s c} :
  Elements.IsQualifyingForeignOffense s c →
  Ontology.IsForeignNationOffenseOfEnumeratedKind (mapSuaE2O s) c
axiom corr_sua_cce {s c} :
  Elements.IsContinuingCriminalEnterprise s c →
  Ontology.IsContinuingCriminalEnterprise (mapSuaE2O s) c
axiom corr_sua_federal {s c} :
  Elements.IsEnumeratedFederalOffense s c →
  Ontology.IsEnumeratedFederalOffense (mapSuaE2O s) c
axiom corr_sua_env {s c} :
  Elements.IsFelonyEnvironmentalViolation s c →
  Ontology.IsEnvironmentalFelony (mapSuaE2O s) c
axiom corr_sua_health {s c} :
  Elements.IsFederalHealthCareOffense s c →
  Ontology.IsFederalHealthCareOffense (mapSuaE2O s) c
axiom corr_sua_wildlife {s c} :
  Elements.QualifyingWildlifeViolation s c →
  Ontology.IsWildlifeTraffickingViolationOverThreshold (mapSuaE2O s) c
axiom corr_sua_term {s c} :
  Elements.IsSpecifiedUnlawfulActivity s c →
  Ontology.IsSpecifiedUnlawfulActivity (mapSuaE2O s) c





theorem s1956c7_elements_implies_ontology
    {s : Elements.SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : Elements.IsSpecifiedUnlawfulActivity s c) :
    Ontology.SpecifiedUnlawfulActivityMembership (mapSuaE2O s) c := by
  refine ⟨?_, corr_sua_term h⟩
  cases h with
  | listedInSection1961 hx =>
      exact Ontology.SpecifiedUnlawfulActivityKind.section1961Offense (corr_sua_1961 hx)
  | qualifyingForeignOffense hx =>
      exact Ontology.SpecifiedUnlawfulActivityKind.foreignNationOffense (corr_sua_foreign hx)
  | continuingCriminalEnterprise hx =>
      exact Ontology.SpecifiedUnlawfulActivityKind.continuingCriminalEnterprise
        (corr_sua_cce hx)
  | enumeratedFederalOffense hx =>
      exact Ontology.SpecifiedUnlawfulActivityKind.enumeratedFederalOffense
        (corr_sua_federal hx)
  | environmentalFelony hx =>
      exact Ontology.SpecifiedUnlawfulActivityKind.environmentalFelony (corr_sua_env hx)
  | federalHealthCareOffense hx =>
      exact Ontology.SpecifiedUnlawfulActivityKind.federalHealthCareOffense
        (corr_sua_health hx)
  | wildlifeTrafficking hx =>
      exact Ontology.SpecifiedUnlawfulActivityKind.wildlifeTrafficking (corr_sua_wildlife hx)

end S1956

end Proving.USC.T18.Ch42Ch95.Bridge
