import Proving.USC.T18.Ch2Ch3.Procedure.Statute

set_option autoImplicit false










namespace Proving.USC.T18.Ch2Ch3.Procedure

open Proving.USC.Common



theorem section32Jurisdiction_nationality {p : Person} {c : ComplaintText}
    (h : USNationalityNexus p c) : Section32Jurisdiction p c := Or.inl h

theorem section32Jurisdiction_found {p : Person} {c : ComplaintText}
    (h : OffenderFoundInUS p c) : Section32Jurisdiction p c := Or.inr h

theorem section37Jurisdiction_territorial {p : Person} {c : ComplaintText}
    (h : ConductWithinUS p c) : Section37Jurisdiction p c := Or.inl h

theorem section37Jurisdiction_found {p : Person} {c : ComplaintText}
    (h : OffenderFoundInUS p c) : Section37Jurisdiction p c := Or.inr (Or.inl h)

theorem section37Jurisdiction_nationality {p : Person} {c : ComplaintText}
    (h : USNationalityNexus p c) : Section37Jurisdiction p c := Or.inr (Or.inr h)

theorem section38ExtraterritorialReach_nationality {p : Person} {c : ComplaintText}
    (h : USNationalityNexus p c) : Section38ExtraterritorialReach p c := Or.inl h

theorem section38ExtraterritorialReach_actInUS {p : Person} {c : ComplaintText}
    (h : ConductWithinUS p c) : Section38ExtraterritorialReach p c := Or.inr h



theorem laborDisputeBar_intro {p : Person} {c : ComplaintText}
    (hLabor : RelatedToLaborDispute p c) (hFelony : ProhibitedAsStateFelony p c) :
    LaborDisputeBar p c := ⟨hLabor, hFelony⟩



theorem section37Prosecutable_intro {p : Person} {c : ComplaintText}
    (hConduct : OffenseConductAlleged p c) (hJur : Section37Jurisdiction p c)
    (hNotBarred : ¬ LaborDisputeBar p c) : Section37Prosecutable p c :=
  ⟨hConduct, hJur, hNotBarred⟩

theorem interimReliefAvailable_intro {p : Person} {c : ComplaintText}
    (hProceeding : EquitableEnforcementProceedingBrought p c)
    (hPending : FinalDeterminationPending p c) : InterimReliefAvailable p c :=
  ⟨hProceeding, hPending⟩

theorem criminalToCivilEstoppel_intro {p : Person} {c : ComplaintText}
    (hCriminal : CriminalJudgmentForUSFinal p c)
    (hCivil : SubsequentCivilProceedingByUS p c) : CriminalToCivilEstoppel p c :=
  ⟨hCriminal, hCivil⟩

theorem forfeitureAtSentencing_intro {p : Person} {c : ComplaintText}
    (hConvicted : ConvictionEnteredUnderSection p c) : ForfeitureAtSentencing p c :=
  ⟨hConvicted⟩

theorem restitutionAtSentencing_intro {p : Person} {c : ComplaintText}
    (hViolation : RestitutionPredicateViolation p c) : RestitutionAtSentencing p c :=
  ⟨hViolation⟩



theorem timelyRulemaking_intro {c : ComplaintText} {enactmentDay ruleDay : Nat}
    (hPleaded : RulemakingDatesPleaded c enactmentDay ruleDay)
    (hWindow : WithinRulemakingWindow enactmentDay ruleDay) :
    TimelyRulemaking c enactmentDay ruleDay := ⟨hPleaded, hWindow⟩




theorem rulemakingWindow_example : WithinRulemakingWindow 0 120 := by decide

theorem suspensionPrimaFacie_intro {p : Person} {c : ComplaintText}
    (hProceeding : PermitSuspensionProceeding p c)
    (hRatio : InhumaneConditionRatioShown p c) : SuspensionPrimaFacie p c :=
  ⟨hProceeding, hRatio⟩

theorem mandatoryDisposition_intro {p : Person} {c : ComplaintText}
    (hImported : ProhibitedSpeciesImported p c) : MandatoryDisposition p c :=
  ⟨hImported⟩

theorem discretionaryPermitIssuance_intro {p : Person} {c : ComplaintText}
    (hShowing : ProperShowingOfResponsibility p c) : DiscretionaryPermitIssuance p c :=
  ⟨hShowing⟩

end Proving.USC.T18.Ch2Ch3.Procedure
