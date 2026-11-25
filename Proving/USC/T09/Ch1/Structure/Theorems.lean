







import Proving.USC.T09.Ch1.Structure.Types
import Proving.USC.T09.Ch1.Structure.Predicates
import Proving.USC.T09.Ch1.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Structure

open Proving.USC.Common



theorem coherent1_intro {c : ComplaintText}
    (hMaritime : DefinitionSuppliedForTerm "maritime transactions" edge_2_incorporates_1 c)
    (hCommerce : DefinitionSuppliedForTerm "commerce" edge_2_incorporates_1 c)
    (hExcl : ReferencedSectionExists edge_chapter_exceptAsProvided_1 c) :
    Coherent1 c :=
  ⟨hMaritime, hCommerce, hExcl⟩

theorem coherent2_intro {c : ComplaintText}
    (hDefExists : ReferencedSectionExists edge_2_incorporates_1 c)
    (hDefHonored : IncorporationHonored edge_2_incorporates_1 c)
    (hSavings : SavingsClausePreserves edge_2_savings_contractLaw c)
    (hCh4 : ReferencedSectionExists edge_2_exceptAsProvided_ch4 c) :
    Coherent2 c :=
  ⟨hDefExists, hDefHonored, hSavings, hCh4⟩

theorem coherent3_intro {c : ComplaintText}
    (hAgrExists : ReferencedSectionExists edge_3_incorporates_2 c)
    (hAgrHonored : IncorporationHonored edge_3_incorporates_2 c)
    (hMotion : ReferencedSectionExists edge_3_subjectTo_6 c) :
    Coherent3 c :=
  ⟨hAgrExists, hAgrHonored, hMotion⟩

theorem coherent4_intro {c : ComplaintText}
    (hAgr : IncorporationHonored edge_4_incorporates_2 c)
    (hT28 : CrossTitleReferenceResolves edge_4_incorporates_t28 c)
    (hFrcp : IncorporationHonored edge_4_incorporates_frcp c)
    (hMotion : ReferencedSectionExists edge_4_subjectTo_6 c) :
    Coherent4 c :=
  ⟨hAgr, hT28, hFrcp, hMotion⟩

theorem coherent5_intro {c : ComplaintText}
    (hMethod : LexSpecialisControls edge_5_lexSpecialis_agreementMethod c)
    (hMotion : ReferencedSectionExists edge_5_subjectTo_6 c) :
    Coherent5 c :=
  ⟨hMethod, hMotion⟩

theorem section6IncorporationsResolve_intro {c : ComplaintText}
    (hMotionPractice : IncorporationHonored edge_6_incorporates_motionPractice c)
    (hDepartures : ReferencedSectionExists edge_6_exceptAsProvided_chapter c) :
    Section6IncorporationsResolve c :=
  ⟨hMotionPractice, hDepartures⟩

theorem coherent7_intro {c : ComplaintText}
    (hSel : IncorporationHonored edge_7_incorporates_5 c)
    (hFees : IncorporationHonored edge_7_incorporates_witnessFees c)
    (hService : IncorporationHonored edge_7_incorporates_subpoenaService c)
    (hContempt : IncorporationHonored edge_7_incorporates_contemptLaw c) :
    Coherent7 c :=
  ⟨hSel, hFees, hService, hContempt⟩

theorem coherent8_intro {c : ComplaintText}
    (hOverride : OverrideTriggered edge_8_notwithstanding_chapter c)
    (hAdmiralty : IncorporationHonored edge_8_incorporates_admiraltyProcedure c) :
    Coherent8 c :=
  ⟨hOverride, hAdmiralty⟩

theorem coherent9_intro {c : ComplaintText}
    (hVac : ReferencedSectionExists edge_9_exceptAsProvided_10 c)
    (hMod : ReferencedSectionExists edge_9_exceptAsProvided_11 c)
    (hMotion : ReferencedSectionExists edge_9_subjectTo_6 c) :
    Coherent9 c :=
  ⟨hVac, hMod, hMotion⟩

theorem coherent10_intro {c : ComplaintText}
    (hAward : CrossTitleReferenceResolves edge_10c_incorporates_5usc580 c)
    (hFactors : CrossTitleReferenceResolves edge_10c_incorporates_5usc572 c)
    (hNotice : ReferencedSectionExists edge_10_subjectTo_12 c)
    (hMotion : ReferencedSectionExists edge_10_subjectTo_6 c) :
    Coherent10 c :=
  ⟨hAward, hFactors, hNotice, hMotion⟩

theorem coherent11_intro {c : ComplaintText}
    (hNotice : ReferencedSectionExists edge_11_subjectTo_12 c)
    (hMotion : ReferencedSectionExists edge_11_subjectTo_6 c) :
    Coherent11 c :=
  ⟨hNotice, hMotion⟩

theorem coherent12_intro {c : ComplaintText}
    (hVac : IncorporationHonored edge_12_incorporates_10 c)
    (hMod : IncorporationHonored edge_12_incorporates_11 c)
    (hService : IncorporationHonored edge_12_incorporates_serviceOfNotice c)
    (hMotion : ReferencedSectionExists edge_12_subjectTo_6 c) :
    Coherent12 c :=
  ⟨hVac, hMod, hService, hMotion⟩

theorem coherent13_intro {c : ComplaintText}
    (hConf : IncorporationHonored edge_13_incorporates_9 c)
    (hMod : IncorporationHonored edge_13_incorporates_11 c)
    (hJudgment : IncorporationHonored edge_13_incorporates_judgmentLaw c) :
    Coherent13 c :=
  ⟨hConf, hMod, hJudgment⟩

theorem coherent14_intro {c : ComplaintText}
    (hCarve : ReferencedSectionExists edge_title_exceptAsProvided_14 c) :
    Coherent14 c :=
  ⟨hCarve⟩

theorem coherent15_intro {c : ComplaintText}
    (hActOfState : OverrideTriggered edge_15_notwithstanding_actOfState c)
    (hEnforce : IncorporationHonored edge_15_incorporates_2 c)
    (hConfirm : IncorporationHonored edge_15_incorporates_9 c)
    (hExecute : IncorporationHonored edge_15_incorporates_13 c) :
    Coherent15 c :=
  ⟨hActOfState, hEnforce, hConfirm, hExecute⟩

theorem coherent16_intro {c : ComplaintText}
    (hStay : IncorporationHonored edge_16a1A_incorporates_3 c)
    (hCompel : IncorporationHonored edge_16a1B_incorporates_4 c)
    (hConvention : ReferencedSectionExists edge_16a1C_incorporates_206 c)
    (hConfirm : IncorporationHonored edge_16a1D_incorporates_9 c)
    (hVacate : IncorporationHonored edge_16a1E_incorporates_10 c)
    (hModify : IncorporationHonored edge_16a1E_incorporates_11 c)
    (hCarve : CrossTitleReferenceResolves edge_16b_exceptAsProvided_28usc1292b c)
    (hBarStay : IncorporationHonored edge_16b1_incorporates_3 c)
    (hBarCompel : IncorporationHonored edge_16b2_incorporates_4 c)
    (hBarConvention : ReferencedSectionExists edge_16b3_incorporates_206 c) :
    Coherent16 c :=
  ⟨hStay, hCompel, hConvention, hConfirm, hVacate, hModify, hCarve,
   hBarStay, hBarCompel, hBarConvention⟩



theorem chapterOperationDefeated_workerExclusion_intro {c : ComplaintText}
    (h : TransportationWorkerExclusionApplies c) : ChapterOperationDefeated c :=
  .workerExclusion h

theorem chapterOperationDefeated_preEnactment_intro {c : ComplaintText}
    (h : PreEnactmentContractExclusionApplies c) : ChapterOperationDefeated c :=
  .preEnactmentContract h

theorem chapterOperationDefeated_chapterFour_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2_exceptAsProvided_ch4 c) : ChapterOperationDefeated c :=
  .chapterFourOverride h

theorem section10VacaturRegime_general_intro {c : ComplaintText}
    (h : ReferencedSectionExists edge_10_subjectTo_12 c) : Section10VacaturRegime c :=
  .general h

theorem section10VacaturRegime_adrAct_intro {c : ComplaintText}
    (hAward : CrossTitleReferenceResolves edge_10c_incorporates_5usc580 c)
    (hFactors : CrossTitleReferenceResolves edge_10c_incorporates_5usc572 c)
    (hSpecialis : LexSpecialisControls edge_10c_lexSpecialis_10a c) :
    Section10VacaturRegime c :=
  .adrAct hAward hFactors hSpecialis

theorem section16AppealReferent_refusedStay3_intro {c : ComplaintText}
    (h : IncorporationHonored edge_16a1A_incorporates_3 c) : Section16AppealReferent c :=
  .refusedStay3 h

theorem section16AppealReferent_deniedPetition4_intro {c : ComplaintText}
    (h : IncorporationHonored edge_16a1B_incorporates_4 c) : Section16AppealReferent c :=
  .deniedPetition4 h

theorem section16AppealReferent_deniedApplication206_intro {c : ComplaintText}
    (h : ReferencedSectionExists edge_16a1C_incorporates_206 c) : Section16AppealReferent c :=
  .deniedApplication206 h

theorem section16AppealReferent_confirmation9_intro {c : ComplaintText}
    (h : IncorporationHonored edge_16a1D_incorporates_9 c) : Section16AppealReferent c :=
  .confirmation9 h

theorem section16AppealReferent_vacatur10_intro {c : ComplaintText}
    (h : IncorporationHonored edge_16a1E_incorporates_10 c) : Section16AppealReferent c :=
  .vacatur10 h

theorem section16AppealReferent_modification11_intro {c : ComplaintText}
    (h : IncorporationHonored edge_16a1E_incorporates_11 c) : Section16AppealReferent c :=
  .modification11 h

theorem section16AppealReferent_subjectToThisTitle_intro {c : ComplaintText}
    (h : ReferencedSectionExists edge_chapter_exceptAsProvided_1 c) :
    Section16AppealReferent c :=
  .subjectToThisTitle h



theorem section9ConfirmationMandateIntact_intro {c : ComplaintText}
    (hNoVacatur : ¬ ExceptionApplies edge_9_exceptAsProvided_10 c)
    (hNoModification : ¬ ExceptionApplies edge_9_exceptAsProvided_11 c) :
    Section9ConfirmationMandateIntact c :=
  ⟨hNoVacatur, hNoModification⟩

theorem chapterOperatesOnContract_intro {c : ComplaintText}
    (h : ¬ ChapterOperationDefeated c) : ChapterOperatesOnContract c :=
  h



theorem title9Chapter1Coherent_intro {c : ComplaintText}
    (h1 : Coherent1 c) (h2 : Coherent2 c) (h3 : Coherent3 c) (h4 : Coherent4 c)
    (h5 : Coherent5 c) (h6 : Section6IncorporationsResolve c) (h7 : Coherent7 c)
    (h8 : Coherent8 c) (h9 : Coherent9 c) (h10 : Coherent10 c) (h11 : Coherent11 c)
    (h12 : Coherent12 c) (h13 : Coherent13 c) (h14 : Coherent14 c)
    (h15 : Coherent15 c) (h16 : Coherent16 c) :
    Title9Chapter1Coherent c :=
  ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16⟩

end Proving.USC.T09.Ch1.Structure
