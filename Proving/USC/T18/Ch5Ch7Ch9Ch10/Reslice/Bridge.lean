



































import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements.Statute
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic.Statute
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology.Statute
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure.Statute
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Bridge

open Proving.USC.Common









axiom asOfficial : Person → Deontic.Official

axiom asPublicOfficer : Person → Deontic.PublicOfficer

axiom asCase11 : Elements.BankruptcyCase → Deontic.Case11

axiom asEstateD : Elements.EstateProperty → Deontic.EstateProperty

axiom asBioD : Elements.BioMaterial → Deontic.BioMaterial

axiom asProceeding : ComplaintText → Procedure.Proceeding

axiom asSeizure : Elements.BioMaterial → Procedure.Seizure

axiom asAgentO : Elements.BioMaterial → Ontology.Agent

axiom asToxinO : Elements.BioMaterial → Ontology.Toxin

axiom asDeliveryO : Elements.BioMaterial → Ontology.DeliverySystem

axiom asPurposeO : Elements.BioMaterial → Ontology.Purpose

axiom asConductO : Person → Ontology.Conduct

axiom asProcedureO : Person → Ontology.Procedure

axiom asInfoO : Elements.RestrictedPersonalInfo → Ontology.Information

axiom asDocumentO : Elements.BankruptcyCase → Ontology.Document

axiom asEstateO : Person → Ontology.Estate










axiom corr_whoever (d : Person) (c : ComplaintText) : Deontic.AddresseeIsAnyPerson d c







axiom corr_scienter_knowing (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Deontic.ActedKnowingly d c
axiom corr_scienter_willful (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Deontic.ActedWillfully d c
axiom corr_ch9_knowing (d : Person) (c : ComplaintText) :
    Elements.ActsKnowinglyAndFraudulently d c → Deontic.ActedKnowingly d c
axiom corr_ch9_fraudulent (d : Person) (c : ComplaintText) :
    Elements.ActsKnowinglyAndFraudulently d c → Deontic.ActedFraudulently d c





namespace S111

axiom corr_cond_a1 (v : Person) (c : ComplaintText) :
    Elements.IsSection1114ProtectedOfficer v c →
    Elements.EngagedInOrOnAccountOfOfficialDuties v c →
    Deontic.ConditionMetS111_a1 (asOfficial v) c
axiom corr_act_a1 (d v : Person) (c : ComplaintText) :
    Elements.ForciblyAssaultsOrImpedes d v c →
    Deontic.RegulatedActOccurredS111_a1 d (asOfficial v) c
axiom corr_cond_a2 (v : Person) (c : ComplaintText) :
    Elements.IsFormerSection1114ProtectedOfficer v c →
    Elements.OnAccountOfDutiesDuringTermOfService v c →
    Deontic.ConditionMetS111_a2 (asOfficial v) c
axiom corr_act_a2 (d v : Person) (c : ComplaintText) :
    Elements.ForciblyAssaultsOrIntimidates d v c →
    Deontic.RegulatedActOccurredS111_a2 d (asOfficial v) c



theorem s111_elements_implies_deontic (d v : Person) (c : ComplaintText) :
    Elements.Section111a d v c → Deontic.ViolatedS111 d (asOfficial v) c := by
  intro h
  cases h with
  | serving hs =>
      exact Or.inl ⟨⟨corr_whoever d c,
                     corr_cond_a1 v c hs.protectedOfficer hs.dutiesNexus⟩,
                    corr_act_a1 d v c hs.forcibleAct⟩
  | former hf =>
      exact Or.inr (Or.inl ⟨⟨corr_whoever d c,
                             corr_cond_a2 v c hf.formerOfficer hf.dutiesNexus⟩,
                            corr_act_a2 d v c hf.forcibleAct⟩)

axiom corr_officer_o (v : Person) (c : ComplaintText) :
    Elements.IsSection1114ProtectedOfficer v c →
    Ontology.IsPersonDesignatedInSection1114 v c






theorem s111_elements_implies_ontology (d v : Person) (c : ComplaintText) :
    Elements.Section111a1 d v c → Ontology.ProtectedFederalOfficialClass v c :=
  fun h => .section1114 (corr_officer_o v c h.protectedOfficer)

axiom corr_reach_p (c : ComplaintText) :
    Elements.ExtraterritorialJurisdictionOverConduct c →
    Procedure.ConductOccurredOutsideUnitedStates c



theorem s111c_elements_implies_procedure (c : ComplaintText) :
    Elements.ExtraterritorialReachCh7 c → Procedure.Section111ReachUnlimitedByLocus c :=
  fun h => Or.inl (corr_reach_p c h)

end S111



namespace S112

axiom corr_cond_a (v : Person) (c : ComplaintText) :
    Elements.IsProtectedForeignPerson v c → Deontic.ConditionMetS112_a (asOfficial v) c
axiom corr_act_a_person (d v : Person) (c : ComplaintText) :
    Elements.ViolentAttackOnPerson d v c →
    Deontic.RegulatedActOccurredS112_a d (asOfficial v) c
axiom corr_act_a_premises (d v : Person) (c : ComplaintText) :
    Elements.ViolentAttackOnProtectedPremises d v c →
    Elements.LikelyToEndangerPersonOrLiberty v c →
    Deontic.RegulatedActOccurredS112_a d (asOfficial v) c
axiom corr_act_a_attempt (d v : Person) (c : ComplaintText) :
    Elements.AttemptsProhibitedAttack d v c →
    Deontic.RegulatedActOccurredS112_a d (asOfficial v) c





theorem s112a_elements_implies_deontic (d v : Person) (c : ComplaintText) :
    Elements.Section112a d v c → Deontic.ViolatedS112_a d (asOfficial v) c := by
  intro h
  refine ⟨⟨corr_whoever d c, ?_⟩, ?_⟩
  · cases h.route with
    | person hp => exact corr_cond_a v c hp.protectedPerson
    | premises hp => exact corr_cond_a v c hp.protectedPerson
    | attempt hp => exact corr_cond_a v c hp.protectedPerson
  · cases h.route with
    | person hp => exact corr_act_a_person d v c hp.attack
    | premises hp => exact corr_act_a_premises d v c hp.attack hp.endangerment
    | attempt hp => exact corr_act_a_attempt d v c hp.attempt

axiom corr_scienter_s (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Scienter.WillfulnessProven d c



theorem s112b_elements_implies_scienter (d v : Person) (c : ComplaintText) :
    Elements.Section112b1 d v c → Scienter.Scienter112b d c :=
  fun h => corr_scienter_s d c h.willful

axiom corr_no_abridgment (d : Person) (c : ComplaintText) :
    Procedure.ApplicationWouldAbridgeFirstAmendmentRights c →
    Elements.ExercisesProtectedFirstAmendmentRight d c



theorem s112d_elements_implies_procedure (d v : Person) (c : ComplaintText) :
    Elements.Section112a d v c → Procedure.Section112ApplicationPermitted c :=
  fun h => ⟨fun hab => h.notProtectedSpeech (corr_no_abridgment d c hab)⟩

end S112



namespace S113

axiom corr_juris (c : ComplaintText) :
    Elements.WithinSpecialMaritimeAndTerritorialJurisdiction c →
    Deontic.WithinSpecialMaritimeTerritorialJurisdiction c
axiom corr_act (d v : Person) (c : ComplaintText) :
    Elements.CommitsAssault d v c → Deontic.RegulatedActOccurredS113_a d c





theorem s113_elements_implies_deontic (d v : Person) (w : Elements.DangerousWeapon)
    (c : ComplaintText) :
    Elements.Section113a d v w c → Deontic.ViolatedS113_a d c := by
  intro h
  have core : Elements.Section113Core d v c := by
    cases h with
    | intentMurderOrSexualAbuse hx => exact hx.core
    | intentFelony hx => exact hx.core
    | dangerousWeapon hx => exact hx.core
    | strikingBeatingWounding hx => exact hx.core
    | simpleAssault hx => exact hx.core
    | seriousBodilyInjury hx => exact hx.core
    | substantialBodilyInjury hx => exact hx.core
    | stranglingOrSuffocating hx => exact hx.core
  exact ⟨⟨corr_whoever d c, corr_juris c core.jurisdiction⟩,
         corr_act d v c core.assault⟩

axiom corr_intent_murder (d : Person) (c : ComplaintText) :
    Elements.IntentToCommitMurderOrSexualAbuse d c →
    Scienter.SpecificPurposeProven d .ToCommitMurder c



theorem s113a1_elements_implies_scienter (d v : Person) (c : ComplaintText) :
    Elements.Section113a1 d v c → Scienter.Scienter113a1 d c :=
  fun h => corr_intent_murder d c h.intent

end S113



namespace S114

axiom corr_cond (d : Person) (c : ComplaintText) :
    Elements.IntentToTortureMaimOrDisfigure d c → Deontic.ConditionMetS114 d c
axiom corr_act_mutilation (d v : Person) (c : ComplaintText) :
    Elements.MutilatesOrDisablesBodyPart d v c → Deontic.RegulatedActOccurredS114 d c
axiom corr_act_corrosive (d v : Person) (c : ComplaintText) :
    Elements.ThrowsCorrosiveOrScaldingSubstance d v c → Deontic.RegulatedActOccurredS114 d c




theorem s114_elements_implies_deontic (d v : Person) (c : ComplaintText) :
    Elements.Section114 d v c → Deontic.ViolatedS114 d c := by
  intro h
  refine ⟨⟨corr_whoever d c, S113.corr_juris c h.jurisdiction, corr_cond d c h.intent⟩, ?_⟩
  cases h.actus with
  | mutilation hm => exact corr_act_mutilation d v c hm
  | corrosive hc => exact corr_act_corrosive d v c hc

axiom corr_intent_s (d : Person) (c : ComplaintText) :
    Elements.IntentToTortureMaimOrDisfigure d c →
    Scienter.SpecificPurposeProven d .ToTortureMaimOrDisfigure c


theorem s114_elements_implies_scienter (d v : Person) (c : ComplaintText) :
    Elements.Section114 d v c → Scienter.Scienter114 d c :=
  fun h => corr_intent_s d c h.intent

end S114



namespace S115

axiom corr_cond_a1 (d v : Person) (c : ComplaintText) :
    Elements.IsCoveredFederalOfficial v c →
    Deontic.ConditionMetS115_a1 d (asOfficial v) c
axiom corr_act_a1A (d fm v : Person) (c : ComplaintText) :
    Elements.IsImmediateFamilyMember fm v c →
    Elements.Section115Conduct d fm c →
    Deontic.RegulatedActOccurredS115_a1A d (asOfficial v) c
axiom corr_act_a1B (d v : Person) (c : ComplaintText) :
    Elements.ThreatensToAssaultKidnapOrMurder d v c →
    Deontic.RegulatedActOccurredS115_a1B d (asOfficial v) c
axiom corr_cond_a2 (d v : Person) (c : ComplaintText) :
    Elements.IsFormerCoveredFederalOfficial v c →
    Deontic.ConditionMetS115_a2 d (asOfficial v) c
axiom corr_act_a2 (d fm v : Person) (c : ComplaintText) :
    Elements.Section115a2Target d fm v c →
    Deontic.RegulatedActOccurredS115_a2 d (asOfficial v) c



theorem s115_elements_implies_deontic (d fm v : Person) (c : ComplaintText) :
    Elements.Section115a d fm v c → Deontic.ViolatedS115 d (asOfficial v) c := by
  intro h
  cases h with
  | familyTarget hx =>
      exact Or.inl ⟨⟨corr_whoever d c, corr_cond_a1 d v c hx.official⟩,
                    corr_act_a1A d fm v c hx.family hx.conduct⟩
  | officialThreat hx =>
      exact Or.inr (Or.inl ⟨⟨corr_whoever d c, corr_cond_a1 d v c hx.official⟩,
                            corr_act_a1B d v c hx.threat⟩)
  | formerService hx =>
      exact Or.inr (Or.inr ⟨⟨corr_whoever d c, corr_cond_a2 d v c hx.formerOfficial⟩,
                            corr_act_a2 d fm v c hx.target⟩)

axiom corr_official_o (v : Person) (c : ComplaintText) :
    Elements.IsCoveredFederalOfficial v c → Ontology.IsUnitedStatesOfficial v c
axiom corr_family_o (fm v : Person) (c : ComplaintText) :
    Elements.IsImmediateFamilyMember fm v c →
    Ontology.IsSpouseParentSiblingChildOrInLocoParentis fm v c



theorem s115_elements_implies_ontology (d fm v : Person) (c : ComplaintText) :
    Elements.Section115a1A d fm v c → Ontology.ImmediateFamilyMembership fm v c :=
  fun h => .closeRelative (corr_family_o fm v c h.family)

axiom corr_intent_impede (d : Person) (c : ComplaintText) :
    Elements.IntentToImpedeOrInterfereWithOfficialDuties d c →
    Scienter.SpecificPurposeProven d .ToImpedeOrIntimidateOfficial c
axiom corr_intent_retaliate (d : Person) (c : ComplaintText) :
    Elements.IntentToRetaliateForOfficialDuties d c →
    Scienter.SpecificPurposeProven d .ToRetaliateForOfficialDuties c



theorem s115_elements_implies_scienter (d fm v : Person) (c : ComplaintText) :
    Elements.Section115a1A d fm v c → Scienter.Scienter115a1 d c := by
  intro h
  cases h.intent with
  | impede hi => exact Or.inl (corr_intent_impede d c hi)
  | retaliate hi => exact Or.inr (corr_intent_retaliate d c hi)



theorem s115e_elements_implies_procedure (c : ComplaintText) :
    Elements.ExtraterritorialReachCh7 c → Procedure.Section115ReachUnlimitedByLocus c :=
  fun h => Or.inl (S111.corr_reach_p c h)

end S115



namespace S116

axiom corr_knowing (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Deontic.ActedKnowingly d c
axiom corr_circumstance (d : Person) (c : ComplaintText) :
    Elements.Section116dCircumstance d c → Deontic.ConditionMetS116_d c
axiom corr_act_performs (d v : Person) (c : ComplaintText) :
    Elements.PerformsFemaleGenitalMutilation d v c →
    Elements.VictimUnderEighteen v c →
    Deontic.RegulatedActOccurredS116_a1 d c
axiom corr_act_facilitates (d v : Person) (c : ComplaintText) :
    Elements.ParentOrGuardianFacilitatesOrConsents d v c →
    Elements.VictimUnderEighteen v c →
    Deontic.RegulatedActOccurredS116_a2 d c
axiom corr_act_transports (d v : Person) (c : ComplaintText) :
    Elements.TransportsForPurposeOfMutilation d v c →
    Elements.VictimUnderEighteen v c →
    Deontic.RegulatedActOccurredS116_a3 d c
axiom corr_addressee_parent (d : Person) (c : ComplaintText) :
    Deontic.AddresseeIsParentGuardianOrCaretaker d c









theorem s116_elements_implies_deontic_modulo_gaps (d v : Person) (c : ComplaintText)
    (gap_permission_is_exception :
      Deontic.PermittedS116_b d c → Elements.Section116bException d v c) :
    Elements.Section116a d v c → Deontic.ViolatedS116_a d c := by
  intro h
  refine ⟨?_, fun hperm => h.noMedicalException (gap_permission_is_exception hperm)⟩
  cases h.conduct with
  | performs hc =>
      exact Or.inl ⟨⟨corr_whoever d c, corr_knowing d c h.scienter,
                     corr_circumstance d c h.circumstance⟩,
                    corr_act_performs d v c hc h.minorVictim⟩
  | facilitates hc =>
      exact Or.inr (Or.inl ⟨⟨corr_addressee_parent d c, corr_knowing d c h.scienter,
                             corr_circumstance d c h.circumstance⟩,
                            corr_act_facilitates d v c hc h.minorVictim⟩)
  | transports hc =>
      exact Or.inr (Or.inr ⟨⟨corr_whoever d c, corr_knowing d c h.scienter,
                             corr_circumstance d c h.circumstance⟩,
                            corr_act_transports d v c hc h.minorVictim⟩)

axiom corr_fgm_nonmedical (d v : Person) (c : ComplaintText) :
    Elements.PerformsFemaleGenitalMutilation d v c →
    ¬ Elements.Section116bException d v c →
    Ontology.IsPerformedForNonMedicalReasons (asProcedureO v) c
axiom corr_fgm_anatomical (d v : Person) (c : ComplaintText) :
    Elements.PerformsFemaleGenitalMutilation d v c →
    Ontology.IsRemovalOfOrInjuryToExternalFemaleGenitalia (asProcedureO v) c





theorem s116_elements_implies_ontology (d v : Person) (c : ComplaintText)
    (hperf : Elements.PerformsFemaleGenitalMutilation d v c) :
    Elements.Section116a d v c → Ontology.FemaleGenitalMutilationMembership (asProcedureO v) c :=
  fun h => ⟨corr_fgm_nonmedical d v c hperf h.noMedicalException,
            corr_fgm_anatomical d v c hperf⟩

axiom corr_knowledge_rung (d : Person) (c : ComplaintText) :
    ActedWithScienter d c → Scienter.MeetsRequirement .Knowledge d c



theorem s116_elements_implies_scienter (d v : Person) (c : ComplaintText) :
    Elements.Section116a d v c → Scienter.Scienter116a d c :=
  fun h => corr_knowledge_rung d c h.scienter

axiom corr_circumstance_p (d : Person) (c : ComplaintText) :
    Elements.Section116dCircumstance d c → Procedure.Section116Circumstance c




theorem s116_elements_implies_procedure_modulo_gaps (d v : Person) (c : ComplaintText)
    (gap_medical_is_exception :
      Procedure.MedicalNecessityExceptionApplies c → Elements.Section116bException d v c) :
    Elements.Section116a d v c → Procedure.Section116ProsecutionUnbarred c :=
  fun h => ⟨corr_circumstance_p d c h.circumstance,
            fun hm => h.noMedicalException (gap_medical_is_exception hm)⟩

end S116



namespace S117

axiom corr_juris (c : ComplaintText) :
    Elements.WithinFederalOrIndianCountryJurisdiction c → Deontic.ConditionMetS117_juris c
axiom corr_priors (d : Person) (c : ComplaintText) :
    Elements.HasTwoOrMorePriorQualifyingConvictions d c → Deontic.ConditionMetS117_a d c
axiom corr_act (d v : Person) (c : ComplaintText) :
    Elements.DomesticAssault d v c → Deontic.RegulatedActOccurredS117_a d c




theorem s117_elements_implies_deontic (d v : Person) (pc₁ pc₂ : Elements.PriorConviction)
    (c : ComplaintText) :
    Elements.Section117 d v pc₁ pc₂ c → Deontic.ViolatedS117_a d c :=
  fun h => ⟨⟨corr_whoever d c, corr_juris c h.jurisdiction, corr_priors d c h.priorCount⟩,
            corr_act d v c h.domesticAssault⟩

axiom corr_assault_o (d v : Person) (c : ComplaintText) :
    Elements.CommitsAssault d v c → Ontology.IsAssault (asConductO d) c
axiom corr_relation_o (d v : Person) (c : ComplaintText) :
    Elements.IsDomesticRelationship d v c → Ontology.IsDomesticRelationToVictim d v c




theorem s117_elements_implies_ontology (d v : Person) (c : ComplaintText) :
    Elements.DomesticAssault d v c → Ontology.DomesticAssaultMembership (asConductO d) d v c :=
  fun h => ⟨corr_assault_o d v c h.assault, corr_relation_o d v c h.relationship⟩

axiom corr_locus_p (c : ComplaintText) :
    Elements.WithinFederalOrIndianCountryJurisdiction c →
    Procedure.WithinSpecialMaritimeAndTerritorialJurisdiction c
axiom corr_final_p (d : Person) (pc₁ pc₂ : Elements.PriorConviction) (c : ComplaintText) :
    Elements.PriorConvictionIsFinal pc₁ c → Elements.PriorConvictionIsFinal pc₂ c →
    Procedure.PriorConvictionsAreFinal d c
axiom corr_prior_p (d : Person) (pc₁ pc₂ : Elements.PriorConviction) (c : ComplaintText) :
    Elements.PriorConvictionIsFinal pc₁ c → Elements.PriorConvictionIsFinal pc₂ c →
    Procedure.PriorConvictionsPrecedeInstantOffense d c




axiom corr_count_p (d : Person) (c : ComplaintText) :
    Elements.PriorQualifyingConvictionCount d c ≤
      Procedure.PriorQualifyingConvictionOccasions d c





theorem s117_elements_implies_procedure (d v : Person) (pc₁ pc₂ : Elements.PriorConviction)
    (c : ComplaintText) :
    Elements.Section117 d v pc₁ pc₂ c → Procedure.Section117HabitualPredicate d c :=
  fun h => ⟨.maritime (corr_locus_p c h.jurisdiction),
            Nat.le_trans h.priorCount (corr_count_p d c),
            corr_final_p d pc₁ pc₂ c h.firstPrior.final h.secondPrior.final,
            corr_prior_p d pc₁ pc₂ c h.firstPrior.final h.secondPrior.final⟩

end S117



namespace S118

axiom corr_cond (v : Person) (c : ComplaintText) :
    Elements.IsFederalLawEnforcementAgent v c →
    Elements.EngagedInStatutoryProtectiveFunctions v c →
    Deontic.ConditionMetS118 (asOfficial v) c
axiom corr_act (d v : Person) (c : ComplaintText) :
    Elements.ObstructsResistsOrInterferes d v c →
    Deontic.RegulatedActOccurredS118 d (asOfficial v) c




theorem s118_elements_implies_deontic (d v : Person) (c : ComplaintText) :
    Elements.Section118 d v c → Deontic.ViolatedS118 d (asOfficial v) c :=
  fun h => ⟨⟨corr_whoever d c, corr_scienter_knowing d c h.scienter,
             corr_scienter_willful d c h.scienter, corr_cond v c h.agent h.protectiveFunction⟩,
            corr_act d v c h.conduct⟩



theorem s118_elements_implies_scienter (d v : Person) (c : ComplaintText) :
    Elements.Section118 d v c → Scienter.Scienter118 d c :=
  fun h => ⟨S116.corr_knowledge_rung d c h.scienter, S112.corr_scienter_s d c h.scienter⟩

axiom corr_locus_p (c : ComplaintText) :
    Elements.WithinUnitedStatesOrSpecialJurisdiction c → Procedure.WithinUnitedStates c
axiom corr_authorized_p (v : Person) (c : ComplaintText) :
    Elements.EngagedInStatutoryProtectiveFunctions v c →
    Procedure.ProtectiveFunctionAuthorized c



theorem s118_elements_implies_procedure (d v : Person) (c : ComplaintText) :
    Elements.Section118 d v c → Procedure.Section118ProtectiveSetting c :=
  fun h => ⟨.inUnitedStates (corr_locus_p c h.jurisdiction),
            corr_authorized_p v c h.protectiveFunction⟩

end S118



namespace S119

axiom corr_cond_a1 (d v : Person) (c : ComplaintText) :
    Elements.CoveredPerson119 v c → Deontic.ConditionMetS119_a1 d (asOfficial v) c
axiom corr_cond_a2 (d v fm : Person) (c : ComplaintText) :
    Elements.CoveredPerson119 v c → Elements.IsImmediateFamilyMember fm v c →
    Deontic.ConditionMetS119_a2 d (asOfficial v) c
axiom corr_act (d v : Person) (i : Elements.RestrictedPersonalInfo) (c : ComplaintText) :
    Elements.MakesRestrictedInformationPubliclyAvailable d i c →
    Elements.IsRestrictedPersonalInformation i v c →
    Deontic.RegulatedActOccurredS119_a d (asOfficial v) c




theorem s119_elements_implies_deontic (d v fm : Person)
    (i : Elements.RestrictedPersonalInfo) (c : ComplaintText) :
    Elements.Section119 d v fm i c → Deontic.ViolatedS119 d (asOfficial v) c := by
  intro h
  cases h.subject with
  | coveredPerson hcp =>
      exact Or.inl ⟨⟨corr_whoever d c, corr_scienter_knowing d c h.scienter,
                     corr_cond_a1 d v c hcp⟩,
                    corr_act d v i c h.publication h.restrictedInfo⟩
  | familyMember hcp hf =>
      exact Or.inr ⟨⟨corr_whoever d c, corr_scienter_knowing d c h.scienter,
                     corr_cond_a2 d v fm c hcp hf⟩,
                    corr_act d v i c h.publication h.restrictedInfo⟩

axiom corr_cp_1114 (v : Person) (c : ComplaintText) :
    Elements.IsSection1114ProtectedOfficer v c → Ontology.IsPersonDesignatedInSection1114 v c
axiom corr_cp_court (v : Person) (c : ComplaintText) :
    Elements.IsCourtOfficerJurorOrWitness v c → Ontology.IsCourtOfficerJurorOrWitness v c
axiom corr_cp_informant (v : Person) (c : ComplaintText) :
    Elements.IsFederalInformantOrWitness v c →
    Ontology.IsFederalInvestigationInformantOrWitness v c
axiom corr_cp_stateLocal (v : Person) (c : ComplaintText) :
    Elements.IsStateOrLocalOfficerAssistingFederalInvestigation v c →
    Ontology.IsStateOrLocalOfficerAssistingFederalInvestigation v c




theorem s119_elements_implies_ontology (v : Person) (c : ComplaintText) :
    Elements.CoveredPerson119 v c → Ontology.CoveredPersonMembership v c := by
  intro h
  cases h with
  | section1114Designee hx => exact .designated1114 (corr_cp_1114 v c hx)
  | courtOfficer hx => exact .courtOfficer (corr_cp_court v c hx)
  | informant hx => exact .informant (corr_cp_informant v c hx)
  | stateOrLocalAssistant hx => exact .stateOrLocal (corr_cp_stateLocal v c hx)

axiom corr_intent_s (d : Person) (c : ComplaintText) :
    Elements.Section119Intent d c →
    Scienter.SpecificPurposeProven d .ToThreatenIntimidateOrIncite c



theorem s119_elements_implies_scienter (d v fm : Person)
    (i : Elements.RestrictedPersonalInfo) (c : ComplaintText) :
    Elements.Section119 d v fm i c → Scienter.Scienter119a d c :=
  fun h => ⟨S116.corr_knowledge_rung d c h.scienter, corr_intent_s d c h.intent⟩

axiom corr_role_p (v : Person) (c : ComplaintText) :
    Elements.CoveredPerson119 v c → Procedure.CoveredPersonAdjudicativeRole v c



theorem s119_elements_implies_procedure (v : Person) (c : ComplaintText) :
    Elements.CoveredPerson119 v c → Procedure.Section119CoveredRole v c :=
  fun h => ⟨corr_role_p v c h⟩

end S119











namespace S151

axiom corr_petition_o (dbtr : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.PetitionFiledUnderTitle11 dbtr bc c →
    Ontology.IsPetitionFiledUnderTitle11 (asDocumentO bc) c
axiom corr_concerns_o (dbtr : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.PetitionFiledUnderTitle11 dbtr bc c →
    Ontology.PetitionConcernsPerson (asDocumentO bc) dbtr c





theorem s151_elements_implies_ontology (dbtr : Person) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.Section151Debtor dbtr bc c →
      Ontology.DebtorMembership dbtr (asDocumentO bc) c :=
  fun h => ⟨corr_petition_o dbtr bc c h.petition, corr_concerns_o dbtr bc c h.petition⟩

axiom corr_filed_p (dbtr : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.PetitionFiledUnderTitle11 dbtr bc c →
    Procedure.PetitionFiledUnderTitle11 (asProceeding c)
axiom corr_concerns_p (dbtr : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.PetitionFiledUnderTitle11 dbtr bc c →
    Procedure.PetitionConcernsPerson dbtr (asProceeding c)



theorem s151_elements_implies_procedure (dbtr : Person) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.Section151Debtor dbtr bc c → Procedure.IsDebtor dbtr (asProceeding c) :=
  fun h => ⟨corr_filed_p dbtr bc c h.petition, corr_concerns_p dbtr bc c h.petition⟩

end S151



namespace S152

axiom corr_cond (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.InOrInRelationToTitle11Case bc c → Deontic.ConditionMetS152 (asCase11 bc) c
axiom corr_cond_of_property (pr : Elements.EstateProperty) (c : ComplaintText)
    (bc : Elements.BankruptcyCase) :
    Elements.PropertyBelongsToDebtorEstate pr c → Deontic.ConditionMetS152 (asCase11 bc) c
axiom corr_act_p1 (d : Person) (pr : Elements.EstateProperty) (c : ComplaintText) :
    Elements.ConcealsPropertyFromEstateOfficer d pr c →
    Deontic.RegulatedActOccurredS152_p1 d (asEstateD pr) c
axiom corr_act_p2 (d : Person) (c : ComplaintText) :
    Elements.MakesFalseOathOrAccount d c → Deontic.RegulatedActOccurredS152_p2 d c
axiom corr_act_p3 (d : Person) (c : ComplaintText) :
    Elements.MakesFalseDeclarationUnderPenaltyOfPerjury d c →
    Deontic.RegulatedActOccurredS152_p3 d c






theorem s152p1_elements_implies_deontic (d : Person) (pr : Elements.EstateProperty)
    (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.Section152P1 d pr c → Deontic.ViolatedS152 d (asCase11 bc) c :=
  fun h => .concealsEstateProperty (asEstateD pr)
    ⟨corr_whoever d c, corr_ch9_knowing d c h.scienter, corr_ch9_fraudulent d c h.scienter,
     corr_cond_of_property pr c bc h.estateProperty⟩
    (corr_act_p1 d pr c h.concealment)


theorem s152p2_elements_implies_deontic (d : Person) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.Section152P2 d bc c → Deontic.ViolatedS152 d (asCase11 bc) c :=
  fun h => .falseOath
    ⟨corr_whoever d c, corr_ch9_knowing d c h.scienter, corr_ch9_fraudulent d c h.scienter,
     corr_cond bc c h.caseNexus⟩
    (corr_act_p2 d c h.falseOath)


theorem s152p3_elements_implies_deontic (d : Person) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.Section152P3 d bc c → Deontic.ViolatedS152 d (asCase11 bc) c :=
  fun h => .falseDeclaration
    ⟨corr_whoever d c, corr_ch9_knowing d c h.scienter, corr_ch9_fraudulent d c h.scienter,
     corr_cond bc c h.caseNexus⟩
    (corr_act_p3 d c h.falseDeclaration)

axiom corr_ch9_rung (d : Person) (c : ComplaintText) :
    Elements.ActsKnowinglyAndFraudulently d c → Scienter.MeetsRequirement .Knowledge d c
axiom corr_ch9_fraud_s (d : Person) (c : ComplaintText) :
    Elements.ActsKnowinglyAndFraudulently d c → Scienter.FraudulentIntentProven d c




theorem s152_elements_implies_scienter (d : Person) (pr : Elements.EstateProperty)
    (c : ComplaintText) :
    Elements.Section152P1 d pr c → Scienter.Scienter152 d c :=
  fun h => ⟨corr_ch9_rung d c h.scienter, corr_ch9_fraud_s d c h.scienter⟩

axiom corr_after_filing_p (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.AfterFilingOfTitle11Case bc c →
    Procedure.PetitionFilingDay (asProceeding c) < Procedure.ConductDay c
axiom corr_debtor_p (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.AfterFilingOfTitle11Case bc c → Procedure.IsDebtor d (asProceeding c)




theorem s152p5_elements_implies_procedure (d : Person) (pr : Elements.EstateProperty)
    (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.Section152P5 d pr bc c → Procedure.PostFilingPosture d (asProceeding c) c :=
  fun h => ⟨corr_debtor_p d bc c h.afterFiling, corr_after_filing_p bc c h.afterFiling⟩

end S152



namespace S153

axiom corr_addressee (d : Person) (c : ComplaintText) :
    Elements.Section153Fiduciary d c → Deontic.AddresseeIsEstateAdministrationOfficer d c
axiom corr_act_property (d : Person) (pr : Elements.EstateProperty) (c : ComplaintText) :
    Elements.AppropriatesEmbezzlesOrTransfersEstateProperty d pr c →
    Deontic.RegulatedActOccurredS153_a d (asEstateD pr) c
axiom corr_cond_of_act (d : Person) (pr : Elements.EstateProperty) (c : ComplaintText) :
    Elements.AppropriatesEmbezzlesOrTransfersEstateProperty d pr c →
    Deontic.ConditionMetS153 (asEstateD pr) c




theorem s153_elements_implies_deontic (d : Person) (pr : Elements.EstateProperty)
    (doc : Elements.RecordedInformation) (c : ComplaintText)
    (hprop : Elements.AppropriatesEmbezzlesOrTransfersEstateProperty d pr c) :
    Elements.Section153 d pr doc c → Deontic.ViolatedS153_a d (asEstateD pr) c :=
  fun h => ⟨⟨corr_addressee d c h.fiduciary, corr_ch9_knowing d c h.scienter,
             corr_ch9_fraudulent d c h.scienter, corr_cond_of_act d pr c hprop⟩,
            corr_act_property d pr c hprop⟩

axiom corr_access_o (d : Person) (c : ComplaintText) :
    Elements.HasAccessToEstatePropertyOrDocuments d c →
    Ontology.HasAccessToEstatePropertyOrDocuments d (asEstateO d) c
axiom corr_participation_o (d : Person) (c : ComplaintText) :
    Elements.ParticipatesInEstateAdministration d c →
    Ontology.ParticipatesInEstateAdministration d (asEstateO d) c




theorem s153_elements_implies_ontology (d : Person) (c : ComplaintText) :
    Elements.Section153Fiduciary d c →
      Ontology.EstateAdministrationInsiderMembership d (asEstateO d) c :=
  fun h => ⟨corr_access_o d c h.access, corr_participation_o d c h.participation⟩



theorem s153_elements_implies_scienter (d : Person) (pr : Elements.EstateProperty)
    (doc : Elements.RecordedInformation) (c : ComplaintText) :
    Elements.Section153 d pr doc c → Scienter.Scienter153 d c :=
  fun h => ⟨S152.corr_ch9_rung d c h.scienter, S152.corr_ch9_fraud_s d c h.scienter⟩

end S153



namespace S154

axiom corr_addressee (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.IsCourtOfficerInTitle11Case d c →
    Deontic.AddresseeIsCourtOfficerInCase d (asCase11 bc) c
axiom corr_act_p1 (d : Person) (pr : Elements.EstateProperty) (c : ComplaintText) :
    Elements.PurchasesPropertyOfEstate d pr c →
    Deontic.RegulatedActOccurredS154_p1 d (asEstateD pr) c
axiom corr_cond_p2 (d : Person) (c : ComplaintText) :
    Elements.CourtDirectedInspection d c → Deontic.ConditionMetS154_p2 c
axiom corr_act_p2 (d : Person) (c : ComplaintText) :
    Elements.RefusesInspectionByPartiesInInterest d c →
    Deontic.RegulatedActOccurredS154_p2 d c
axiom corr_act_p3 (d : Person) (c : ComplaintText) :
    Elements.RefusesInspectionByUnitedStatesTrustee d c →
    Deontic.RegulatedActOccurredS154_p3 d c





theorem s154_elements_implies_deontic (d : Person) (pr : Elements.EstateProperty)
    (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.Section154 d pr c → Deontic.ViolatedS154 d (asCase11 bc) c := by
  intro h
  cases h with
  | selfDealingPurchase hx =>
      exact .purchasesEstateProperty (asEstateD pr)
        ⟨corr_addressee d bc c hx.officer, corr_scienter_knowing d c hx.scienter⟩
        (corr_act_p1 d pr c hx.purchase)
  | refusalToPartiesInInterest hx =>
      exact .refusesPartyInspection
        ⟨corr_addressee d bc c hx.officer, corr_scienter_knowing d c hx.scienter⟩
        (corr_cond_p2 d c hx.courtDirection)
        (corr_act_p2 d c hx.refusal)
  | refusalToUnitedStatesTrustee hx =>
      exact .refusesTrusteeInspection
        ⟨corr_addressee d bc c hx.officer, corr_scienter_knowing d c hx.scienter⟩
        (corr_act_p3 d c hx.refusal)



theorem s154_elements_implies_scienter (d : Person) (pr : Elements.EstateProperty)
    (c : ComplaintText) :
    Elements.Section154P1 d pr c → Scienter.Scienter154 d c :=
  fun h => S116.corr_knowledge_rung d c h.scienter

axiom corr_filed_p (d : Person) (c : ComplaintText) :
    Elements.IsCourtOfficerInTitle11Case d c → Procedure.PetitionFiledUnderTitle11 (asProceeding c)
axiom corr_custody_p (d : Person) (c : ComplaintText) :
    Elements.IsCourtOfficerInTitle11Case d c →
    Procedure.CourtOfficerChargedWithCustody d (asProceeding c)
axiom corr_directed_p (d : Person) (c : ComplaintText) :
    Elements.CourtDirectedInspection d c → Procedure.CourtDirectedInspection (asProceeding c)



theorem s154_elements_implies_procedure (d : Person) (c : ComplaintText) :
    Elements.Section154P2 d c → Procedure.Section154PartyInspectionDuty d (asProceeding c) :=
  fun h => ⟨⟨corr_filed_p d c h.officer, corr_custody_p d c h.officer⟩,
            corr_directed_p d c h.courtDirection⟩

end S154



namespace S155

axiom corr_addressee (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.IsPartyInInterestOrAttorney d c →
    Deontic.AddresseeIsPartyInInterest d (asCase11 bc) c
axiom corr_cond (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.InReceivershipOrTitle11CaseInUnitedStatesCourt c →
    Deontic.ConditionMetS155 (asCase11 bc) c
axiom corr_act (d : Person) (ag : Agreement) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.AgreementWithAnotherPartyInInterest ag c →
    Elements.AgreementFixesFeesFromEstateAssets ag c →
    Deontic.RegulatedActOccurredS155 d (asCase11 bc) c




theorem s155_elements_implies_deontic (d : Person) (ag : Agreement)
    (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.Section155 d ag c → Deontic.ViolatedS155 d (asCase11 bc) c :=
  fun h => ⟨⟨corr_addressee d bc c h.partyInInterest, corr_ch9_knowing d c h.scienter,
             corr_ch9_fraudulent d c h.scienter, corr_cond bc c h.forum⟩,
            corr_act d ag bc c h.counterparty h.feeFixingPurpose⟩

axiom corr_purpose_s (ag : Agreement) (d : Person) (c : ComplaintText) :
    Elements.AgreementFixesFeesFromEstateAssets ag c →
    Scienter.SpecificPurposeProven d .ToFixFeesFromEstate c



theorem s155_elements_implies_scienter (d : Person) (ag : Agreement) (c : ComplaintText) :
    Elements.Section155 d ag c → Scienter.Scienter155 d c :=
  fun h => ⟨S152.corr_ch9_rung d c h.scienter, S152.corr_ch9_fraud_s d c h.scienter,
            corr_purpose_s ag d c h.feeFixingPurpose⟩

axiom corr_pending_p (c : ComplaintText) :
    Elements.InReceivershipOrTitle11CaseInUnitedStatesCourt c →
    Procedure.CaseOrReceivershipPending (asProceeding c)
axiom corr_party_p (d : Person) (c : ComplaintText) :
    Elements.IsPartyInInterestOrAttorney d c → Procedure.PartyInInterest d (asProceeding c)



theorem s155_elements_implies_procedure (d : Person) (ag : Agreement) (c : ComplaintText) :
    Elements.Section155 d ag c → Procedure.Section155Posture d (asProceeding c) :=
  fun h => ⟨corr_pending_p c h.forum, corr_party_p d c h.partyInInterest⟩

end S155



namespace S156

axiom corr_addressee (d : Person) (c : ComplaintText) :
    Elements.IsBankruptcyPetitionPreparer d c →
    Deontic.AddresseeIsBankruptcyPetitionPreparer d c
axiom corr_cond (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.CaseOrProceedingDismissed bc c → Deontic.ConditionMetS156_b (asCase11 bc) c
axiom corr_act (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.KnowingAttemptToDisregardBankruptcyRequirements d c →
    Elements.DismissalCausedByPreparerDisregard d bc c →
    Deontic.RegulatedActOccurredS156_b d (asCase11 bc) c




theorem s156_elements_implies_deontic (d : Person) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.Section156 d bc c → Deontic.ViolatedS156_b d (asCase11 bc) c :=
  fun h => ⟨⟨corr_addressee d c h.preparer, corr_cond bc c h.dismissal⟩,
            corr_act d bc c h.disregard h.causation⟩

axiom corr_knowing_s (d : Person) (c : ComplaintText) :
    Elements.KnowingAttemptToDisregardBankruptcyRequirements d c →
    Scienter.MeetsRequirement .Knowledge d c



theorem s156_elements_implies_scienter (d : Person) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.Section156 d bc c → Scienter.Scienter156b d c :=
  fun h => corr_knowing_s d c h.disregard

axiom corr_preparer_p (d : Person) (c : ComplaintText) :
    Elements.IsBankruptcyPetitionPreparer d c → Procedure.BankruptcyPetitionPreparer d c
axiom corr_document_p (d : Person) (c : ComplaintText) :
    Elements.IsBankruptcyPetitionPreparer d c → Procedure.DocumentForFilingPrepared d c
axiom corr_dismissed_p (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.CaseOrProceedingDismissed bc c →
    Procedure.CaseOrRelatedProceedingDismissed (asProceeding c)
axiom corr_causation_p (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.DismissalCausedByPreparerDisregard d bc c →
    Procedure.DismissalCausedByPreparerDisregard d (asProceeding c)



theorem s156_elements_implies_procedure (d : Person) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.Section156 d bc c → Procedure.Section156DismissalTrigger d (asProceeding c) c :=
  fun h => ⟨corr_preparer_p d c h.preparer, corr_document_p d c h.preparer,
            corr_dismissed_p d bc c h.dismissal, corr_causation_p d bc c h.causation⟩

end S156



namespace S157

axiom corr_cond (d : Person) (c : ComplaintText) :
    Elements.DevisedOrIntendedSchemeToDefraud d c →
    Elements.ForPurposeOfExecutingOrConcealingScheme d c →
    Deontic.ConditionMetS157 d c
axiom corr_act_p1 (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.FilesPetitionUnderTitle11 d bc c → Deontic.RegulatedActOccurredS157_p1 d c
axiom corr_act_p2 (d : Person) (doc : Elements.RecordedInformation) (c : ComplaintText) :
    Elements.FilesDocumentInTitle11Proceeding d doc c →
    Deontic.RegulatedActOccurredS157_p2 d c
axiom corr_act_p3 (d : Person) (c : ComplaintText) :
    Elements.MakesFalseRepresentationConcerningTitle11Proceeding d c →
    Deontic.RegulatedActOccurredS157_p3 d c




theorem s157_elements_implies_deontic (d : Person) (bc : Elements.BankruptcyCase)
    (doc : Elements.RecordedInformation) (c : ComplaintText) :
    Elements.Section157 d bc doc c → Deontic.ViolatedS157 d c := by
  intro h
  refine ⟨⟨corr_whoever d c, corr_cond d c h.scheme h.purpose⟩, ?_⟩
  cases h.actus with
  | petition hx => exact Or.inl (corr_act_p1 d bc c hx)
  | document hx => exact Or.inr (Or.inl (corr_act_p2 d doc c hx))
  | representation hx => exact Or.inr (Or.inr (corr_act_p3 d c hx))

axiom corr_defraud_s (d : Person) (c : ComplaintText) :
    Elements.DevisedOrIntendedSchemeToDefraud d c →
    Scienter.SpecificPurposeProven d .ToDefraud c
axiom corr_execute_s (d : Person) (c : ComplaintText) :
    Elements.ForPurposeOfExecutingOrConcealingScheme d c →
    Scienter.SpecificPurposeProven d .ToExecuteOrConcealScheme c




theorem s157_elements_implies_scienter (d : Person) (bc : Elements.BankruptcyCase)
    (doc : Elements.RecordedInformation) (c : ComplaintText) :
    Elements.Section157 d bc doc c → Scienter.Scienter157 d c :=
  fun h => ⟨corr_defraud_s d c h.scheme, corr_execute_s d c h.purpose⟩

axiom corr_act_petition_p (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.FilesPetitionUnderTitle11 d bc c →
    Procedure.PetitionFiledByRespondent d (asProceeding c)
axiom corr_act_document_p (d : Person) (doc : Elements.RecordedInformation)
    (c : ComplaintText) :
    Elements.FilesDocumentInTitle11Proceeding d doc c →
    Procedure.DocumentFiledInProceeding d (asProceeding c)
axiom corr_act_repr_p (d : Person) (c : ComplaintText) :
    Elements.MakesFalseRepresentationConcerningTitle11Proceeding d c →
    Procedure.RepresentationMadeConcerningProceeding d (asProceeding c)
axiom corr_setting_real_p (d : Person) (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.FilesPetitionUnderTitle11 d bc c →
    Procedure.PetitionFiledUnderTitle11 (asProceeding c)
axiom corr_setting_doc_p (d : Person) (doc : Elements.RecordedInformation)
    (c : ComplaintText) :
    Elements.FilesDocumentInTitle11Proceeding d doc c →
    Procedure.PetitionFiledUnderTitle11 (asProceeding c)
axiom corr_setting_false_p (d : Person) (c : ComplaintText) :
    Elements.MakesFalseRepresentationConcerningTitle11Proceeding d c →
    Procedure.ProceedingFalselyAssertedPending (asProceeding c)





theorem s157_elements_implies_procedure (d : Person) (bc : Elements.BankruptcyCase)
    (doc : Elements.RecordedInformation) (c : ComplaintText) :
    Elements.Section157 d bc doc c → Procedure.Section157Posture d (asProceeding c) := by
  intro h
  cases h.actus with
  | petition hx =>
      exact ⟨.filesPetition (corr_act_petition_p d bc c hx),
             .real (corr_setting_real_p d bc c hx)⟩
  | document hx =>
      exact ⟨.filesDocument (corr_act_document_p d doc c hx),
             .real (corr_setting_doc_p d doc c hx)⟩
  | representation hx =>
      exact ⟨.representation (corr_act_repr_p d c hx),
             .falselyAsserted (corr_setting_false_p d c hx)⟩

end S157








namespace S158

axiom corr_addressee (v : Person) (c : ComplaintText) :
    Elements.AttorneyGeneralDesignatesEnforcementIndividuals c →
    Deontic.AddresseeIsAttorneyGeneral (asPublicOfficer v) c
axiom corr_act (v : Person) (c : ComplaintText) :
    Elements.AttorneyGeneralDesignatesEnforcementIndividuals c →
    Elements.DesigneeIsUnitedStatesAttorneyOrFbiAgent v c →
    Deontic.RegulatedActOccurredS158_a (asPublicOfficer v) c




theorem s158_elements_implies_deontic (v : Person) (c : ComplaintText) :
    Elements.Section158 v c → Deontic.FulfilledS158_a (asPublicOfficer v) c :=
  fun h => ⟨⟨corr_addressee v c h.designation⟩, corr_act v c h.designation h.designee⟩

axiom corr_designated_p (c : ComplaintText) :
    Elements.AttorneyGeneralDesignatesEnforcementIndividuals c →
    Procedure.AttorneyGeneralDesignationMade c
axiom corr_usAttorney_p (v : Person) (c : ComplaintText) :
    Elements.DesigneeIsUnitedStatesAttorneyOrFbiAgent v c →
    Procedure.UnitedStatesAttorneyDesignated c
axiom corr_fbi_p (v : Person) (c : ComplaintText) :
    Elements.DesigneeIsUnitedStatesAttorneyOrFbiAgent v c → Procedure.FbiAgentDesignated c
axiom corr_3057_p (c : ComplaintText) :
    Elements.DesignationCoversAbusiveReaffirmationEnforcement c →
    Procedure.Section3057ResponsibilityAssigned c



theorem s158_elements_implies_procedure (v : Person) (c : ComplaintText) :
    Elements.Section158 v c → Procedure.Section158DesignationProgram c :=
  fun h => ⟨corr_designated_p c h.designation, corr_usAttorney_p v c h.designee,
            corr_fbi_p v c h.designee, corr_3057_p c h.reaffirmationScope⟩

end S158





namespace S175

axiom corr_cond (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsBiologicalAgentToxinOrDeliverySystem m c →
    Deontic.ConditionMetS175_a (asBioD m) c
axiom corr_act_weaponisation (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.DevelopsProducesOrPossessesBioMaterial d m c →
    Elements.ForUseAsWeapon m c →
    Deontic.RegulatedActOccurredS175_a d (asBioD m) c
axiom corr_act_assistance (d : Person) (org : Entity) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.AssistsForeignStateOrOrganization d org c →
    Deontic.RegulatedActOccurredS175_a d (asBioD m) c
axiom corr_act_inchoate (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.AttemptsThreatensOrConspiresToViolate d c →
    Deontic.RegulatedActOccurredS175_a d (asBioD m) c




theorem s175a_elements_implies_deontic (d : Person) (m : Elements.BioMaterial)
    (org : Entity) (c : ComplaintText) :
    Elements.Section175ProhibitedUse d m org c → Deontic.ViolatedS175 d (asBioD m) c := by
  intro h
  refine Or.inl ⟨⟨corr_whoever d c, corr_scienter_knowing d c h.scienter,
                  corr_cond m c h.material⟩, ?_⟩
  cases h.conduct with
  | weaponisation hx hw => exact corr_act_weaponisation d m c hx hw
  | assistance hx => exact corr_act_assistance d org m c hx
  | inchoate hx => exact corr_act_inchoate d m c hx

axiom corr_cond_b (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsBiologicalAgentToxinOrDeliverySystem m c →
    Deontic.ConditionMetS175_b (asBioD m) c
axiom corr_act_b (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.PossessesBioMaterial d m c →
    Elements.QuantityOrTypeNotReasonablyJustified m c →
    ¬ Elements.NaturallyOccurringAndUnextracted m c →
    Deontic.RegulatedActOccurredS175_b d (asBioD m) c





theorem s175b_elements_implies_deontic (d : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175UnjustifiedPossession d m c → Deontic.ViolatedS175 d (asBioD m) c :=
  fun h => Or.inr ⟨⟨corr_whoever d c, corr_scienter_knowing d c h.scienter,
                    corr_cond_b m c h.material⟩,
                   corr_act_b d m c h.possession h.unjustified h.notNaturallyOccurring⟩

axiom corr_weapon_purpose_s (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.ForUseAsWeapon m c → Scienter.SpecificPurposeProven d .ForUseAsWeapon c





theorem s175a_elements_implies_scienter (d : Person) (m : Elements.BioMaterial)
    (org : Entity) (c : ComplaintText) (hw : Elements.ForUseAsWeapon m c) :
    Elements.Section175ProhibitedUse d m org c → Scienter.Scienter175SubsecA d c :=
  fun h => ⟨S116.corr_knowledge_rung d c h.scienter, corr_weapon_purpose_s d m c hw⟩

end S175



namespace S175a

axiom corr_addressee (v : Person) (c : ComplaintText) :
    Elements.AttorneyGeneralRequestsMilitaryAssistance c →
    Deontic.AddresseeIsAttorneyGeneral (asPublicOfficer v) c
axiom corr_cond (c : ComplaintText) :
    Elements.EmergencyInvolvingBiologicalWeaponOfMassDestruction c →
    Elements.RequestSupportsSection175Enforcement c →
    Deontic.ConditionMetS175a c
axiom corr_act (v : Person) (c : ComplaintText) :
    Elements.AttorneyGeneralRequestsMilitaryAssistance c →
    Deontic.RegulatedActOccurredS175a (asPublicOfficer v) c




theorem s175a_elements_implies_deontic (v : Person) (c : ComplaintText) :
    Elements.Section175aMilitaryAssistanceRequest c →
      Deontic.ExercisedS175a (asPublicOfficer v) c :=
  fun h => ⟨⟨corr_addressee v c h.request, corr_cond c h.emergency h.enforcementPurpose⟩,
            corr_act v c h.request⟩

axiom corr_requester_p (c : ComplaintText) :
    Elements.AttorneyGeneralRequestsMilitaryAssistance c →
    Procedure.AttorneyGeneralRequestedMilitaryAssistance c
axiom corr_supports_p (c : ComplaintText) :
    Elements.RequestSupportsSection175Enforcement c →
    Procedure.RequestSupportsSection175Enforcement c
axiom corr_emergency_p (c : ComplaintText) :
    Elements.EmergencyInvolvingBiologicalWeaponOfMassDestruction c →
    Procedure.EmergencyInvolvingBiologicalWeapon c



theorem s175a_elements_implies_procedure (c : ComplaintText) :
    Elements.Section175aMilitaryAssistanceRequest c →
      Procedure.Section175aAssistanceRequest c :=
  fun h => ⟨.attorneyGeneral (corr_requester_p c h.request),
            corr_supports_p c h.enforcementPurpose,
            corr_emergency_p c h.emergency⟩

end S175a



namespace S175b

axiom corr_addressee (d : Person) (c : ComplaintText) :
    Elements.IsRestrictedPerson d c → Deontic.AddresseeIsRestrictedPerson d c
axiom corr_cond (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsListedSelectAgent m c → Deontic.ConditionMetS175b_a2 (asBioD m) c
axiom corr_act_a1A (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.ShipsTransportsOrPossessesInCommerce d m c →
    Deontic.RegulatedActOccurredS175b_a1A d (asBioD m) c
axiom corr_act_a1B (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.ReceivesAgentShippedInCommerce d m c →
    Deontic.RegulatedActOccurredS175b_a1B d (asBioD m) c









theorem s175b_elements_implies_deontic_modulo_gaps (d : Person) (m : Elements.BioMaterial)
    (c : ComplaintText)
    (gap_exempt_is_authorized :
      Deontic.ConditionMetS175b_exempt c →
        Elements.DulyAuthorizedUnitedStatesGovernmentalActivity d c) :
    Elements.Section175bA d m c → Deontic.ViolatedS175b_a d (asBioD m) c := by
  intro h
  have hn : Deontic.NormS175b_a d (asBioD m) c :=
    ⟨corr_addressee d c h.restricted, corr_scienter_knowing d c h.scienter,
     fun hex => h.notAuthorizedActivity (gap_exempt_is_authorized hex),
     corr_cond m c h.selectAgent⟩
  cases h.conduct with
  | shipTransportPossess hx => exact .shipTransportOrPossess hn (corr_act_a1A d m c hx)
  | receive hx => exact .receive hn (corr_act_a1B d m c hx)

axiom corr_rp_indictment (d : Person) (c : ComplaintText) :
    Elements.UnderIndictmentForFelony d c → Ontology.IsUnderIndictmentForFelony d c
axiom corr_rp_convicted (d : Person) (c : ComplaintText) :
    Elements.ConvictedOfFelony d c → Ontology.IsConvictedOfFelony d c
axiom corr_rp_fugitive (d : Person) (c : ComplaintText) :
    Elements.IsFugitiveFromJustice d c → Ontology.IsFugitiveFromJustice d c
axiom corr_rp_drug (d : Person) (c : ComplaintText) :
    Elements.IsUnlawfulUserOfControlledSubstance d c →
    Ontology.IsUnlawfulUserOfControlledSubstance d c
axiom corr_rp_alien (d : Person) (c : ComplaintText) :
    Elements.IsAlienUnlawfullyInTheUnitedStates d c →
    Ontology.IsAlienUnlawfullyInTheUnitedStates d c
axiom corr_rp_mental (d : Person) (c : ComplaintText) :
    Elements.AdjudicatedMentalDefectiveOrCommitted d c →
    Ontology.IsAdjudicatedMentalDefectiveOrCommitted d c
axiom corr_rp_stateSponsor (d : Person) (c : ComplaintText) :
    Elements.IsNationalOrAgentOfStateSponsorOfTerrorism d c →
    Ontology.IsNationalOfTerrorismSupportingCountry d c
axiom corr_rp_stateSponsor_alien (d : Person) (c : ComplaintText) :
    Elements.IsNationalOrAgentOfStateSponsorOfTerrorism d c → Ontology.IsAlien d c
axiom corr_rp_stateSponsor_notLpr (d : Person) (c : ComplaintText) :
    Elements.IsNationalOrAgentOfStateSponsorOfTerrorism d c →
    ¬ Ontology.IsLawfullyAdmittedForPermanentResidence d c
axiom corr_rp_discharge (d : Person) (c : ComplaintText) :
    Elements.DischargedUnderDishonorableConditions d c → Ontology.IsDishonorablyDischarged d c
axiom corr_rp_terror (d : Person) (c : ComplaintText) :
    Elements.IsMemberOrAgentOfTerroristOrganization d c →
    Ontology.IsAffiliatedWithTerroristOrganization d c







theorem s175b_elements_implies_ontology (d : Person) (c : ComplaintText) :
    Elements.RestrictedPersonStatus d c → Ontology.RestrictedPersonMembership d c := by
  intro h
  cases h with
  | underIndictment hx => exact .underIndictment (corr_rp_indictment d c hx)
  | convicted hx => exact .convicted (corr_rp_convicted d c hx)
  | fugitive hx => exact .fugitive (corr_rp_fugitive d c hx)
  | unlawfulDrugUser hx => exact .drugUser (corr_rp_drug d c hx)
  | unlawfulAlien hx => exact .unlawfulAlien (corr_rp_alien d c hx)
  | mentalAdjudication hx => exact .mentalAdjudication (corr_rp_mental d c hx)
  | stateSponsorNational hx =>
      exact .designatedCountryNational (corr_rp_stateSponsor_alien d c hx)
        (corr_rp_stateSponsor_notLpr d c hx) (corr_rp_stateSponsor d c hx)
  | dishonorableDischarge hx => exact .dishonorableDischarge (corr_rp_discharge d c hx)
  | terroristOrganization hx => exact .terroristAffiliation (corr_rp_terror d c hx)

axiom corr_knows_status_s (d : Person) (c : ComplaintText) :
    Elements.IsRestrictedPerson d c →
    ActedWithScienter d c →
    Scienter.KnowsOwnRestrictedPersonStatus d c





theorem s175b_elements_implies_scienter (d : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175bA d m c → Scienter.Scienter175bSubsecA d c :=
  fun h => ⟨S116.corr_knowledge_rung d c h.scienter,
            corr_knows_status_s d c h.restricted h.scienter⟩

axiom corr_status_p (d : Person) (c : ComplaintText) :
    Elements.IsFugitiveFromJustice d c → Procedure.FugitiveFromJustice d c
axiom corr_commerce_p (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.ShipsTransportsOrPossessesInCommerce d m c →
    Procedure.ConductAffectedInterstateOrForeignCommerce c
axiom corr_notAuthorized_p (d : Person) (c : ComplaintText) :
    Procedure.DulyAuthorizedGovernmentActivity c →
    Elements.DulyAuthorizedUnitedStatesGovernmentalActivity d c






theorem s175b_elements_implies_procedure (d : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) (hfug : Elements.IsFugitiveFromJustice d c)
    (hship : Elements.ShipsTransportsOrPossessesInCommerce d m c) :
    Elements.Section175bA d m c → Procedure.Section175bProhibitionApplicable d c :=
  fun h => ⟨.fugitive (corr_status_p d c hfug),
            corr_commerce_p d m c hship,
            fun ha => h.notAuthorizedActivity (corr_notAuthorized_p d c ha)⟩

end S175b



namespace S175c

axiom corr_juris (d v : Person) (c : ComplaintText) :
    Elements.Section175cJurisdiction d v c → Deontic.ConditionMetS175c_b c
axiom corr_exempt (d : Person) (c : ComplaintText) :
    Deontic.ConditionMetS175c_a2 d c →
    Elements.ActsUnderAuthorityOfSecretaryOfHealthAndHumanServices d c
axiom corr_act (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.HandlesOrUsesVariolaVirus d m c →
    Elements.IsVariolaVirus m c →
    Deontic.RegulatedActOccurredS175c_a1 d c




theorem s175c_elements_implies_deontic (d v : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175c d v m c → Deontic.ViolatedS175c_a1 d c :=
  fun h => ⟨⟨corr_whoever d c, corr_scienter_knowing d c h.scienter,
             fun hex => h.notSecretarialAuthority (corr_exempt d c hex),
             corr_juris d v c h.jurisdiction⟩,
            corr_act d m c h.conduct h.variola⟩



theorem s175c_elements_implies_scienter (d v : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175c d v m c → Scienter.Scienter175c d c :=
  fun h => S116.corr_knowledge_rung d c h.scienter

axiom corr_juris_commerce_p (c : ComplaintText) :
    Elements.OffenseOccursInOrAffectsCommerce c →
    Procedure.ConductAffectedInterstateOrForeignCommerce c
axiom corr_hhs_p (d : Person) (c : ComplaintText) :
    Procedure.ConductUnderHealthSecretaryAuthority c →
    Elements.ActsUnderAuthorityOfSecretaryOfHealthAndHumanServices d c



theorem s175c_elements_implies_procedure (d v : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) (hcom : Elements.OffenseOccursInOrAffectsCommerce c) :
    Elements.Section175c d v m c → Procedure.Section175cProhibitionApplicable c :=
  fun h => ⟨.commerce (corr_juris_commerce_p c hcom),
            fun hh => h.notSecretarialAuthority (corr_hhs_p d c hh)⟩

end S175c



namespace S176

axiom corr_addressee (v : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.Section176SeizureAuthority m c →
    Deontic.AddresseeIsAttorneyGeneral (asPublicOfficer v) c
axiom corr_cond (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.PertainsToConductProhibitedBySection175 m c →
    Deontic.ConditionMetS176_a1 (asBioD m) c
axiom corr_act (v : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.Section176SeizureAuthority m c →
    Deontic.RegulatedActOccurredS176_a1 (asPublicOfficer v) (asBioD m) c




theorem s176_elements_implies_deontic (v : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section176SeizureProhibitedConduct m c →
      Deontic.ExercisedS176_a1 (asPublicOfficer v) (asBioD m) c :=
  fun h => ⟨⟨corr_addressee v m c h.authority, corr_cond m c h.ground⟩,
            corr_act v m c h.authority⟩

axiom corr_peaceful_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.MaterialForProphylacticProtectiveOrPeacefulPurpose m c →
    Ontology.IsPeacefulPurpose (asPurposeO m) c
axiom corr_proportion_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.TypeAndQuantityReasonableForPurpose m c →
    Ontology.IsReasonableTypeAndQuantityForPurpose (asAgentO m) (asPurposeO m) c




theorem s176_elements_implies_ontology (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.Section176Defense m c →
      Ontology.PeacefulPurposeDefence (asAgentO m) (asPurposeO m) c :=
  fun h => ⟨corr_peaceful_o m c h.peacefulPurpose, corr_proportion_o m c h.reasonableQuantity⟩

axiom corr_item_p (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.PertainsToConductProhibitedBySection175 m c →
    Procedure.ItemPertainsToProhibitedConduct (asSeizure m)
axiom corr_warrant_p (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.SeizureWarrantIssued m c → Procedure.SeizureWarrantIssued (asSeizure m)
axiom corr_exigent_p (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.ExigentCircumstancesWithProbableCause m c →
    Procedure.ExigentCircumstancesExisted (asSeizure m)
axiom corr_probable_p (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.ExigentCircumstancesWithProbableCause m c →
    Procedure.ProbableCauseExisted (asSeizure m)





theorem s176_elements_implies_procedure (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.Section176SeizureProhibitedConduct m c → Procedure.LawfulSeizure (asSeizure m) := by
  intro h
  refine ⟨.pertainsToProhibitedConduct (corr_item_p m c h.ground), ?_⟩
  cases h.authority with
  | warrant hx => exact .warrant (corr_warrant_p m c hx)
  | exigent hx => exact .exigent (corr_exigent_p m c hx) (corr_probable_p m c hx)

end S176



namespace S177

axiom corr_addressee (v : Person) (c : ComplaintText) :
    Elements.UnitedStatesBringsCivilAction c →
    Deontic.AddresseeIsUnitedStates (asPublicOfficer v) c
axiom corr_ground_a1 (d : Person) (c : ComplaintText) :
    Elements.ConductProhibitedBySection175 d c → Deontic.ConditionMetS177_a1 c
axiom corr_ground_a2 (d : Person) (c : ComplaintText) :
    Elements.PreparationSolicitationAttemptThreatOrConspiracy d c →
    Deontic.ConditionMetS177_a2 c
axiom corr_ground_a3 (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.UnjustifiedDevelopmentOrPossession d m c →
    Deontic.ConditionMetS177_a3 (asBioD m) c
axiom corr_act (v : Person) (c : ComplaintText) :
    Elements.UnitedStatesBringsCivilAction c →
    Deontic.RegulatedActOccurredS177_a (asPublicOfficer v) c



theorem s177_elements_implies_deontic (d v : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section177 d m c → Deontic.ExercisedS177_a (asPublicOfficer v) (asBioD m) c := by
  intro h
  cases h with
  | prohibitedConduct hx =>
      exact ⟨⟨corr_addressee v c hx.civilAction, Or.inl (corr_ground_a1 d c hx.ground)⟩,
             corr_act v c hx.civilAction⟩
  | inchoate hx =>
      exact ⟨⟨corr_addressee v c hx.civilAction,
              Or.inr (Or.inl (corr_ground_a2 d c hx.ground))⟩,
             corr_act v c hx.civilAction⟩
  | unjustified hx =>
      exact ⟨⟨corr_addressee v c hx.civilAction,
              Or.inr (Or.inr (corr_ground_a3 d m c hx.ground))⟩,
             corr_act v c hx.civilAction⟩



theorem s177_elements_implies_ontology (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.Section177Defense m c →
      Ontology.PeacefulPurposeDefence (asAgentO m) (asPurposeO m) c :=
  fun h => ⟨S176.corr_peaceful_o m c h.peacefulPurpose,
            S176.corr_proportion_o m c h.reasonableQuantity⟩

axiom corr_action_p (c : ComplaintText) :
    Elements.UnitedStatesBringsCivilAction c → Procedure.UnitedStatesCommencedCivilAction c
axiom corr_ground_a1_p (d : Person) (c : ComplaintText) :
    Elements.ConductProhibitedBySection175 d c →
    Procedure.ConductProhibitedUnderSection175Shown c
axiom corr_ground_a2_p (d : Person) (c : ComplaintText) :
    Elements.PreparationSolicitationAttemptThreatOrConspiracy d c →
    Procedure.InchoateSection175ConductShown c
axiom corr_ground_a3_p (d : Person) (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.UnjustifiedDevelopmentOrPossession d m c →
    Procedure.UnjustifiedTypeOrQuantityShown c



theorem s177_elements_implies_procedure (d : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section177 d m c → Procedure.Section177InjunctionAction c := by
  intro h
  cases h with
  | prohibitedConduct hx =>
      exact ⟨corr_action_p c hx.civilAction, .prohibitedConduct (corr_ground_a1_p d c hx.ground)⟩
  | inchoate hx =>
      exact ⟨corr_action_p c hx.civilAction, .inchoateConduct (corr_ground_a2_p d c hx.ground)⟩
  | unjustified hx =>
      exact ⟨corr_action_p c hx.civilAction,
             .unjustifiedQuantity (corr_ground_a3_p d m c hx.ground)⟩

end S177








namespace S178

axiom corr_genus_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsMicroorganismOrInfectiousSubstance m c →
    Ontology.IsMicroorganismOrInfectiousSubstance (asAgentO m) c
axiom corr_capability_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.BiologicalAgentCapability m c →
    Ontology.IsCapableOfCausingBiologicalHarm (asAgentO m) c





theorem s178_agent_elements_implies_ontology (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsBiologicalAgent m c → Ontology.BiologicalAgentMembership (asAgentO m) c :=
  fun h => ⟨corr_genus_o m c h.substance, corr_capability_o m c h.capability⟩

axiom corr_toxic_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsToxicMaterialOrProduct m c → Ontology.IsToxicMaterialOrProduct (asToxinO m) c
axiom corr_toxic_engineered_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsPoisonousSubstanceOrBiologicalProduct m c →
    Ontology.IsToxicMaterialOrProduct (asToxinO m) c
axiom corr_toxic_derivative_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsPoisonousIsomerHomologOrDerivative m c →
    Ontology.IsToxicMaterialOrProduct (asToxinO m) c
axiom corr_origin_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsToxicMaterialOrProduct m c →
    Ontology.IsBiologicalOrSynthesizedOrigin (asToxinO m) c
axiom corr_origin_engineered_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsPoisonousSubstanceOrBiologicalProduct m c →
    Ontology.IsBiologicalOrSynthesizedOrigin (asToxinO m) c
axiom corr_origin_derivative_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsPoisonousIsomerHomologOrDerivative m c →
    Ontology.IsBiologicalOrSynthesizedOrigin (asToxinO m) c





theorem s178_toxin_elements_implies_ontology (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.IsToxin m c → Ontology.ToxinMembership (asToxinO m) c := by
  intro h
  cases h with
  | toxicMaterial hx => exact ⟨corr_toxic_o m c hx, corr_origin_o m c hx⟩
  | engineeredProduct hx =>
      exact ⟨corr_toxic_engineered_o m c hx, corr_origin_engineered_o m c hx⟩
  | derivative hx =>
      exact ⟨corr_toxic_derivative_o m c hx, corr_origin_derivative_o m c hx⟩

axiom corr_designed_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.SpecificallyDesignedToDeliverAgentOrToxin m c →
    Ontology.IsApparatusDesignedToDisseminate (asDeliveryO m) c
axiom corr_vector_o (m : Elements.BioMaterial) (c : ComplaintText) :
    Elements.IsVector m c → Ontology.IsVectorDeliverySystem (asDeliveryO m) c





theorem s178_delivery_elements_implies_ontology (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.IsDeliverySystem m c → Ontology.DeliverySystemMembership (asDeliveryO m) c := by
  intro h
  cases h with
  | designedDelivery hx => exact .designedApparatus (corr_designed_o m c hx)
  | vector hx => exact .vectorForm (corr_vector_o m c hx)

end S178

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Bridge
