








import Proving.USC.Common.Types
import Proving.USC.T18.Ch73.Reslice.Procedure.Types
import Proving.USC.T18.Ch73.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch73.Reslice.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Procedure

open Proving.USC.Common



theorem isOfficialProceeding_intro
    {op : OfficialProceeding} {c : ComplaintText}
    (h : ProceedingBeforeFederalCourtOrGrandJury op c) :
    IsOfficialProceeding op c :=
  Or.inl h

theorem isOfficialProceeding_intro_congress
    {op : OfficialProceeding} {c : ComplaintText}
    (h : ProceedingBeforeCongress op c) : IsOfficialProceeding op c :=
  Or.inr (Or.inl h)

theorem isOfficialProceeding_intro_agency
    {op : OfficialProceeding} {c : ComplaintText}
    (h : ProceedingBeforeFederalAgencyAuthorizedByLaw op c) :
    IsOfficialProceeding op c :=
  Or.inr (Or.inr (Or.inl h))

theorem isOfficialProceeding_intro_insurance
    {op : OfficialProceeding} {c : ComplaintText}
    (h : ProceedingBeforeInsuranceRegulator op c) : IsOfficialProceeding op c :=
  Or.inr (Or.inr (Or.inr h))



theorem proceedingPendingAtConduct_intro
    {op : OfficialProceeding} {cd : Conduct} {c : ComplaintText}
    (hInst : ProceedingInstituted op c)
    (hOrder : proceedingInstitutionDay op c ≤ conductDay cd c) :
    ProceedingPendingAtConduct op cd c :=
  ⟨hInst, hOrder⟩

theorem proceedingNexus_intro
    {cd : Conduct} {op : OfficialProceeding} {c : ComplaintText}
    (hOP : IsOfficialProceeding op c)
    (hIntent : IntendedToAffectProceeding cd op c) :
    ProceedingNexus cd op c :=
  ⟨hOP, hIntent⟩




theorem proceedingNexus_holds_though_not_pending
    {cd : Conduct} {op : OfficialProceeding} {c : ComplaintText}
    (hOP : IsOfficialProceeding op c)
    (hIntent : IntendedToAffectProceeding cd op c)
    (_hNotPending : ¬ ProceedingPendingAtConduct op cd c)
    (_hNotImminent : ¬ ProceedingAboutToBeInstituted op c) :
    ProceedingNexus cd op c :=
  ⟨hOP, hIntent⟩



theorem proceedingNexus_holds_though_never_instituted
    {cd : Conduct} {op : OfficialProceeding} {c : ComplaintText}
    (hOP : IsOfficialProceeding op c)
    (hIntent : IntendedToAffectProceeding cd op c)
    (_hNever : ¬ ProceedingInstituted op c) :
    ProceedingNexus cd op c :=
  ⟨hOP, hIntent⟩



theorem federalCircumstance_intro
    {op : OfficialProceeding} {c : ComplaintText}
    (h : ProceedingIsFederalForum op c) : FederalCircumstance op c :=
  ⟨h⟩



theorem federalCircumstance_holds_without_mens_rea
    {op : OfficialProceeding} {d : Person} {cd : Conduct} {c : ComplaintText}
    (h : ProceedingIsFederalForum op c)
    (_hNoMens : ¬ MentalStateProvedAsToFederalCircumstance d cd c) :
    FederalCircumstance op c :=
  ⟨h⟩



theorem venueBasis_intro
    {cd : Conduct} {op : OfficialProceeding} {dist : District} {c : ComplaintText}
    (h : ProceedingIntendedToBeAffectedInDistrict op dist c) :
    VenueBasis cd op dist c :=
  Or.inl h

theorem venueBasis_intro_conductLocus
    {cd : Conduct} {op : OfficialProceeding} {dist : District} {c : ComplaintText}
    (h : ConductOccurredInDistrict cd dist c) : VenueBasis cd op dist c :=
  Or.inr h

theorem properVenue_intro
    {pr : Prosecution} {cd : Conduct} {op : OfficialProceeding}
    {dist : District} {c : ComplaintText}
    (hPros : ProsecutionUnderSection1512 pr c)
    (hBasis : VenueBasis cd op dist c) :
    ProperVenue pr cd op dist c :=
  ⟨hPros, hBasis⟩

theorem federalJurisdictionOverOffense_intro
    {cd : Conduct} {c : ComplaintText}
    (h : ConductIsOffenseUnderSection1512 cd c) :
    FederalJurisdictionOverOffense cd c :=
  h




theorem federalJurisdiction_reaches_extraterritorial_conduct
    {cd : Conduct} {c : ComplaintText}
    (hOffense : ConductIsOffenseUnderSection1512 cd c)
    (_hOutside : ¬ ConductOccurredInUnitedStates cd c) :
    FederalJurisdictionOverOffense cd c :=
  hOffense



theorem compulsionDefiance_intro
    {w : Person} {lp : LegalProcess} {op : OfficialProceeding} {c : ComplaintText}
    (h : WitnessEvadedLegalProcess w lp c) : CompulsionDefiance w lp op c :=
  Or.inl h

theorem compulsionDefiance_intro_absence
    {w : Person} {lp : LegalProcess} {op : OfficialProceeding} {c : ComplaintText}
    (h : ¬ WitnessAppearedAtProceeding w op c) : CompulsionDefiance w lp op c :=
  Or.inr h

theorem compulsionDefied_intro
    {w : Person} {lp : LegalProcess} {op : OfficialProceeding} {c : ComplaintText}
    (hServed : LegalProcessServed lp w c)
    (hCommands : ProcessCommandsAppearanceAsWitness lp op c)
    (hDefiance : CompulsionDefiance w lp op c) :
    CompulsionDefied w lp op c :=
  ⟨hServed, hCommands, hDefiance⟩

theorem productionDefeated_intro
    {lp : LegalProcess} {w : Person} {it : EvidentiaryItem}
    {op : OfficialProceeding} {c : ComplaintText}
    (hServed : LegalProcessServed lp w c)
    (hCommands : ProcessCommandsProductionOfItem lp it op c)
    (hNotProduced : ¬ ItemProducedAtProceeding it op c)
    (hImpaired : ItemIntegrityImpairedForProceeding it op c) :
    ProductionDefeated lp w it op c :=
  ⟨hServed, hCommands, hNotProduced, hImpaired⟩



theorem productionDefeated_holds_though_item_inadmissible
    {lp : LegalProcess} {w : Person} {it : EvidentiaryItem}
    {op : OfficialProceeding} {c : ComplaintText}
    (hServed : LegalProcessServed lp w c)
    (hCommands : ProcessCommandsProductionOfItem lp it op c)
    (hNotProduced : ¬ ItemProducedAtProceeding it op c)
    (hImpaired : ItemIntegrityImpairedForProceeding it op c)
    (_hInadmissible : ¬ EvidentiaryItemAdmissible it c)
    (_hPrivileged : ¬ EvidentiaryItemFreeOfPrivilegeClaim it c) :
    ProductionDefeated lp w it op c :=
  ⟨hServed, hCommands, hNotProduced, hImpaired⟩




theorem pipeline_report_reaches_attendance :
    PipelineReachable JusticeProcessStage.reportToLawEnforcement
      JusticeProcessStage.attendanceOrTestimony :=
  PipelineReachable.step PipelineStep.reportToArrest
    (PipelineReachable.step PipelineStep.arrestToInstitution
      (PipelineReachable.step PipelineStep.institutionToAttendance
        (PipelineReachable.refl _)))

theorem stageDelayed_intro
    {s : JusticeProcessStage} {v : Person} {c : ComplaintText}
    (h : scheduledStageDay s v c < actualStageDay s v c) : StageDelayed s v c :=
  h

theorem stagePrevented_intro
    {s : JusticeProcessStage} {v : Person} {c : ComplaintText}
    (h : ¬ StageOccurred s v c) : StagePrevented s v c :=
  h

theorem stageObstructed_intro
    {s : JusticeProcessStage} {v : Person} {c : ComplaintText}
    (h : StageHindered s v c) : StageObstructed s v c :=
  Or.inl h

theorem stageObstructed_intro_delay
    {s : JusticeProcessStage} {v : Person} {c : ComplaintText}
    (h : StageDelayed s v c) : StageObstructed s v c :=
  Or.inr (Or.inl h)

theorem stageObstructed_intro_prevention
    {s : JusticeProcessStage} {v : Person} {c : ComplaintText}
    (h : StagePrevented s v c) : StageObstructed s v c :=
  Or.inr (Or.inr (Or.inl h))

theorem stageObstructed_intro_dissuasion
    {s : JusticeProcessStage} {v : Person} {c : ComplaintText}
    (h : StageDissuaded s v c) : StageObstructed s v c :=
  Or.inr (Or.inr (Or.inr h))



theorem stageObstructed_of_late
    {s : JusticeProcessStage} {v : Person} {c : ComplaintText}
    (h : scheduledStageDay s v c < actualStageDay s v c) :
    StageObstructed s v c :=
  Or.inr (Or.inl h)

theorem harassmentObstruction_intro
    {d : Person} {v : Person} {s : JusticeProcessStage} {c : ComplaintText}
    (hHarass : IntentionalHarassment d v c)
    (hObstructed : StageObstructed s v c) :
    HarassmentObstruction d v s c :=
  ⟨hHarass, hObstructed⟩



theorem affirmativeDefenseEstablished_intro
    {pr : Prosecution} {d : Person} {cd : Conduct} {c : ComplaintText}
    (hRaised : AffirmativeDefenseRaised pr d c)
    (hLawful : ConductSolelyLawful cd c)
    (hIntent : SoleIntentionToEncourageTruthfulTestimony d cd c)
    (hBurden : BurdenCarriedByPreponderance d c) :
    AffirmativeDefenseEstablished pr d cd c :=
  ⟨hRaised, hLawful, hIntent, hBurden⟩



theorem affirmativeDefense_fails_without_burden
    {pr : Prosecution} {d : Person} {cd : Conduct} {c : ComplaintText}
    (hNoBurden : ¬ BurdenCarriedByPreponderance d c) :
    ¬ AffirmativeDefenseEstablished pr d cd c :=
  fun h => hNoBurden h.burdenCarried



theorem prosecutionSustainable_intro
    {pr : Prosecution} {d : Person} {cd : Conduct}
    {op : OfficialProceeding} {dist : District} {c : ComplaintText}
    (hPros : ProsecutionUnderSection1512 pr c)
    (hNexus : ProceedingNexus cd op c)
    (hFed : FederalCircumstance op c)
    (hVenue : ProperVenue pr cd op dist c)
    (hJuris : FederalJurisdictionOverOffense cd c)
    (hNotRep : ¬ LawfulBonaFideLegalRepresentationServices d op c)
    (hNoDefense : ¬ AffirmativeDefenseEstablished pr d cd c) :
    ProsecutionSustainable pr d cd op dist c :=
  ⟨hPros, hNexus, hFed, hVenue, hJuris, hNotRep, hNoDefense⟩




theorem prosecutionNotSustainable_of_legalRepresentation
    {pr : Prosecution} {d : Person} {cd : Conduct}
    {op : OfficialProceeding} {dist : District} {c : ComplaintText}
    (hRep : LawfulBonaFideLegalRepresentationServices d op c) :
    ¬ ProsecutionSustainable pr d cd op dist c :=
  fun h => h.notLegalRepresentation hRep


theorem prosecutionNotSustainable_of_establishedDefense
    {pr : Prosecution} {d : Person} {cd : Conduct}
    {op : OfficialProceeding} {dist : District} {c : ComplaintText}
    (hDef : AffirmativeDefenseEstablished pr d cd c) :
    ¬ ProsecutionSustainable pr d cd op dist c :=
  fun h => h.defenseNotEstablished hDef

theorem conspiracyProsecutionSustainable_intro
    {pr : Prosecution} {d : Person} {cd : Conduct}
    {op : OfficialProceeding} {dist : District} {c : ComplaintText}
    (hConspired : ConspiracyToCommitSection1512Offense d cd c)
    (hPosture : ProsecutionSustainable pr d cd op dist c) :
    ConspiracyProsecutionSustainable pr d cd op dist c :=
  ⟨hConspired, hPosture⟩

theorem section1512ProceduralPosture_intro
    {pr : Prosecution} {d : Person} {cd : Conduct}
    {op : OfficialProceeding} {dist : District} {c : ComplaintText}
    (h : ProsecutionSustainable pr d cd op dist c) :
    Section1512ProceduralPosture pr d cd op dist c :=
  Section1512ProceduralPosture.substantive h

theorem section1512ProceduralPosture_intro_conspiracy
    {pr : Prosecution} {d : Person} {cd : Conduct}
    {op : OfficialProceeding} {dist : District} {c : ComplaintText}
    (h : ConspiracyProsecutionSustainable pr d cd op dist c) :
    Section1512ProceduralPosture pr d cd op dist c :=
  Section1512ProceduralPosture.conspiracy h



theorem penaltyEnhancementTriggered_intro
    {cd : Conduct} {pr : Prosecution} {c : ComplaintText}
    (hPros : ProsecutionUnderSection1512 pr c)
    (hTrial : OffenseOccurredInConnectionWithCriminalTrial cd pr c) :
    PenaltyEnhancementTriggered cd pr c :=
  ⟨hPros, hTrial⟩


theorem enhancedMaxMonths_ge_base (baseMonths chargedMaxMonths : Nat) :
    baseMonths ≤ enhancedMaxMonths baseMonths chargedMaxMonths := by
  unfold enhancedMaxMonths
  omega



theorem enhancedMaxMonths_ge_charged (baseMonths chargedMaxMonths : Nat) :
    chargedMaxMonths ≤ enhancedMaxMonths baseMonths chargedMaxMonths := by
  unfold enhancedMaxMonths
  omega



theorem enhancedMaxMonths_eq_base_of_charged_le
    (baseMonths chargedMaxMonths : Nat) (h : chargedMaxMonths ≤ baseMonths) :
    enhancedMaxMonths baseMonths chargedMaxMonths = baseMonths := by
  unfold enhancedMaxMonths
  omega


theorem conspiracyMaxMonths_eq_declared (t : OffenseTier) :
    conspiracyMaxMonths t = declaredMaxMonths t := rfl



theorem declaredMaxMonths_killing_deferred :
    declaredMaxMonths OffenseTier.killing = none := rfl


theorem declaredMaxMonths_harassment :
    declaredMaxMonths OffenseTier.harassment = some 36 := rfl



theorem declaredMaxMonths_attemptedMurder_eq_usedPhysicalForce :
    declaredMaxMonths OffenseTier.attemptedMurder
      = declaredMaxMonths OffenseTier.usedPhysicalForce := rfl



theorem declaredMaxMonths_twentyYearTiers :
    declaredMaxMonths OffenseTier.threatenedPhysicalForce = some 240
    ∧ declaredMaxMonths OffenseTier.corruptPersuasion = some 240
    ∧ declaredMaxMonths OffenseTier.evidenceObstruction = some 240 :=
  ⟨rfl, rfl, rfl⟩

end Proving.USC.T18.Ch73.Reslice.Procedure
