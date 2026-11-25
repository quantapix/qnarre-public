










import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Procedure.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Procedure.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Procedure

open Proving.USC.Common




theorem jurisdiction2332a_intro {p : Person} {c : ComplaintText} {b : Base2332a}
    (h : Base2332aEstablished b p c) : Jurisdiction2332a p c :=
  Jurisdiction2332a.viaSubsectionA b h



theorem jurisdiction2332a_subsectionB_intro {p : Person} {c : ComplaintText}
    (hNational : IsNationalOfTheUnitedStates p c)
    (h : Base2332aEstablished Base2332a.nationalUsingAbroad p c)
    : Jurisdiction2332a p c :=
  Jurisdiction2332a.viaSubsectionB hNational h


theorem prosecutionGrounded2332a_intro {p : Person} {c : ComplaintText}
    (hConduct : Conduct2332aAlleged p c) (hJur : Jurisdiction2332a p c)
    : ProsecutionGrounded2332a p c :=
  ⟨hConduct, hJur⟩


theorem deathResultPenaltyTriggered2332a_intro {p : Person} {c : ComplaintText}
    (hGrounded : ProsecutionGrounded2332a p c) (hDeath : DeathResulted p c)
    : DeathResultPenaltyTriggered2332a p c :=
  ⟨hGrounded, hDeath⟩




theorem offense2332bAlleged_intro {p : Person} {c : ComplaintText}
    (h : Conduct2332bAlleged p c) : Offense2332bAlleged p c :=
  Offense2332bAlleged.substantive h


theorem offense2332bAlleged_inchoate_intro {p : Person} {c : ComplaintText}
    (h : Inchoate2332bAlleged p c) : Offense2332bAlleged p c :=
  Offense2332bAlleged.inchoate h


theorem circumstanceAsToSomeOffender_intro {d o : Person} {c : ComplaintText}
    {x : Circumstance2332b}
    (hCo : CoOffenderInSameOffense o d c)
    (hCirc : Circumstance2332bPresentAsTo x o c)
    : CircumstanceAsToSomeOffender d c :=
  ⟨o, x, hCo, hCirc⟩


theorem jurisdiction2332b_intro {d : Person} {c : ComplaintText} {r : OffenderRole}
    (hRole : HasRole r d c) (hCirc : CircumstanceAsToSomeOffender d c)
    : Jurisdiction2332b d c :=
  ⟨⟨r, hRole⟩, hCirc⟩


theorem extraterritorialJurisdiction2332b_intro {d : Person} {c : ComplaintText}
    (h : Offense2332bAlleged d c) : ExtraterritorialJurisdiction2332b d c :=
  ExtraterritorialJurisdiction2332b.overSubsectionAOffense h



theorem extraterritorialJurisdiction2332b_accessory_intro
    {d : Person} {c : ComplaintText}
    (h : HasRole OffenderRole.accessoryAfterTheFact d c)
    : ExtraterritorialJurisdiction2332b d c :=
  ExtraterritorialJurisdiction2332b.overAccessoryAfterTheFact h


theorem prosecutionGrounded2332b_intro {d : Person} {c : ComplaintText}
    (hOffense : Offense2332bAlleged d c)
    (hTranscends : ConductTranscendsNationalBoundaries d c)
    (hUnlawful : ViolatesStateOrFederalLaw d c)
    (hJur : Jurisdiction2332b d c)
    : ProsecutionGrounded2332b d c :=
  ⟨hOffense, hTranscends, hUnlawful, hJur⟩


theorem seriousBodilyInjuryGravamen2332b_intro {p : Person} {c : ComplaintText}
    (hOffense : Offense2332bAlleged p c) (hInjury : SeriousBodilyInjuryAsDefined p c)
    : SeriousBodilyInjuryGravamen2332b p c :=
  ⟨hOffense, hInjury⟩


theorem federalCrimeOfTerrorism_intro {p : Person} {c : ComplaintText}
    (hCalculated : CalculatedToInfluenceOrRetaliateAgainstGovernment p c)
    (hEnumerated : ViolatesEnumeratedTerrorismOffense p c)
    : FederalCrimeOfTerrorism p c :=
  ⟨hCalculated, hEnumerated⟩



theorem attorneyGeneralPrimaryInvestigativeResponsibility_intro
    {p : Person} {c : ComplaintText} (h : FederalCrimeOfTerrorism p c)
    : AttorneyGeneralPrimaryInvestigativeResponsibility p c :=
  AttorneyGeneralPrimaryInvestigativeResponsibility.viaFederalCrimeOfTerrorism h



theorem attorneyGeneralPrimaryInvestigativeResponsibility_enumerated_intro
    {p : Person} {c : ComplaintText} {x : EnumeratedInvestigativeOffense}
    (h : ChargedUnderEnumeratedInvestigativeOffense x p c)
    : AttorneyGeneralPrimaryInvestigativeResponsibility p c :=
  AttorneyGeneralPrimaryInvestigativeResponsibility.viaEnumeratedOffense x h



theorem treasuryAssistanceDue_intro {p : Person} {c : ComplaintText}
    (hAG : AttorneyGeneralPrimaryInvestigativeResponsibility p c)
    (hRequest : AttorneyGeneralRequestedTreasuryAssistance c)
    : TreasuryAssistanceDue p c :=
  ⟨hAG, hRequest⟩


theorem sentencingCompliant2332b_intro {s : SentencingRecord} {c : ComplaintText}
    (hNoProbation : ¬ ProbationImposed s c)
    (hConsecutive : ConcurrencyBarSatisfied s c)
    (hWithinMax : WithinStatutoryMaximum s c)
    : SentencingCompliant2332b s c :=
  ⟨hNoProbation, hConsecutive, hWithinMax⟩




theorem statutoryMaximumYears_maiming :
    statutoryMaximumYears ConductClass.maiming = some 35 := rfl



theorem statutoryMaximumYears_assault :
    statutoryMaximumYears
      ConductClass.assaultWithDangerousWeaponOrSeriousBodilyInjury = some 30 := rfl


theorem statutoryMaximumYears_destruction :
    statutoryMaximumYears ConductClass.destructionOfProperty = some 25 := rfl


theorem statutoryMaximumYears_threat :
    statutoryMaximumYears ConductClass.threat = some 10 := rfl



theorem statutoryMaximumYears_attempt_destruction :
    statutoryMaximumYears
      (ConductClass.attemptOrConspiracy ConductClass.destructionOfProperty)
      = some 25 := rfl



theorem statutoryMaximumYears_uncapped :
    statutoryMaximumYears ConductClass.killingOrDeathResulting = none ∧
      statutoryMaximumYears ConductClass.kidnapping = none :=
  ⟨rfl, rfl⟩



theorem withinStatutoryMaximum_of_le {s : SentencingRecord} {c : ComplaintText}
    {cap : Nat}
    (hCap : statutoryMaximumYears (chargedConductClass s c) = some cap)
    (hLe : imposedTermYears s c ≤ cap) : WithinStatutoryMaximum s c := by
  intro cap' hCap'
  rw [hCap] at hCap'
  have hEq : cap = cap' := Option.some.inj hCap'
  subst hEq
  exact hLe




theorem maiming_thirty_years_within_maximum {s : SentencingRecord} {c : ComplaintText}
    (hClass : chargedConductClass s c = ConductClass.maiming)
    (hYears : imposedTermYears s c = 30) : WithinStatutoryMaximum s c := by
  refine withinStatutoryMaximum_of_le (cap := 35) ?_ ?_
  · rw [hClass]; exact statutoryMaximumYears_maiming
  · omega




theorem threat_sentence_capped_at_ten {s : SentencingRecord} {c : ComplaintText}
    (hClass : chargedConductClass s c = ConductClass.threat)
    (hWithin : WithinStatutoryMaximum s c) : imposedTermYears s c ≤ 10 := by
  apply hWithin
  rw [hClass]; exact statutoryMaximumYears_threat



theorem concurrencyBarSatisfied_of_le {s : SentencingRecord} {c : ComplaintText}
    (hLe : otherTermsEndDay s c ≤ sectionTermStartDay s c)
    : ConcurrencyBarSatisfied s c :=
  fun _ => hLe



theorem concurrency_bar_forces_consecutive {s : SentencingRecord} {c : ComplaintText}
    (hCompliant : SentencingCompliant2332b s c)
    (hOther : AnotherTermOfImprisonmentExists s c)
    : otherTermsEndDay s c ≤ sectionTermStartDay s c :=
  hCompliant.consecutive hOther



theorem compliant_sentence_excludes_probation {s : SentencingRecord} {c : ComplaintText}
    (hCompliant : SentencingCompliant2332b s c) : ¬ ProbationImposed s c :=
  hCompliant.noProbation







theorem prosecutionGrounded2332b_independent_of_base_scienter
    {d : Person} {c : ComplaintText}
    (h : ProsecutionGrounded2332b d c)
    (_hNoKnowledge : ¬ KnewJurisdictionalBase d c)
    : ProsecutionGrounded2332b d c := h





theorem adoptedStateLawPredicateMet_excludes_state_procedure
    {d : Person} {c : ComplaintText}
    (hElements : StateLawElementsSatisfied d c)
    (_hNoStateProcedure : ¬ StateProcedureOrEvidenceRuleSatisfied d c)
    : AdoptedStateLawPredicateMet d c := hElements






theorem section3056_authority_unimpaired {p : Person} {c : ComplaintText}
    (hAG : AttorneyGeneralPrimaryInvestigativeResponsibility p c)
    (hSS : SecretServiceActingUnderSection3056 c)
    : AttorneyGeneralPrimaryInvestigativeResponsibility p c ∧
      SecretServiceActingUnderSection3056 c :=
  ⟨hAG, hSS⟩





theorem prosecutionCommenced_reachable_2332a {p : Person} {c : ComplaintText}
    (hJur : Jurisdiction2332a p c) (hGrounded : ProsecutionGrounded2332a p c)
    : Reachable c State.prosecutionCommenced :=
  Reachable.step (prosecutionStep2332a p c) rfl rfl hGrounded
    (Reachable.step (jurisdictionStep2332a p c) rfl rfl hJur Reachable.initial)




theorem sentenced_reachable_2332b {d : Person} {c : ComplaintText}
    {s : SentencingRecord}
    (hJur : Jurisdiction2332b d c)
    (hInvestigation : AttorneyGeneralPrimaryInvestigativeResponsibility d c)
    (hGrounded : ProsecutionGrounded2332b d c)
    (hSentence : SentencingCompliant2332b s c)
    : Reachable c State.sentenced :=
  Reachable.step (sentencingStep2332b s c) rfl rfl hSentence
    (Reachable.step (adjudicationStep2332b d c) rfl rfl hGrounded
      (Reachable.step (prosecutionStep2332b d c) rfl rfl hGrounded
        (Reachable.step (investigationStep2332b d c) rfl rfl hInvestigation
          (Reachable.step (jurisdictionStep2332b d c) rfl rfl hJur
            Reachable.initial))))

end Proving.USC.T18.Ch113B.Wmd.Part3.Procedure
