




import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Structure.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Structure.Predicates
import Proving.USC.T42.Ch6ASchI.Reslice.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Structure

open Proving.USC.Common

theorem coherent218_intro {c : ComplaintText}
    (hGrant : IncorporationHonored edge_218a_incorporates_254b c)
    (hMembers : IncorporationHonored edge_218b_incorporates_254b c)
    (hActExists : ReferencedSectionExists edge_218d_notwithstanding_5usc1013a c)
    (hOptOut : OverrideTriggered edge_218d_notwithstanding_5usc1013a c)
    : Coherent218 c :=
  ⟨hGrant, hMembers, hActExists, hOptOut⟩

theorem coherent233_intro {c : ComplaintText}
    (hFtcaExists : ReferencedSectionExists edge_233a_incorporates_28usc1346b c)
    (hFtca : IncorporationHonored edge_233a_incorporates_28usc1346b c)
    (hSettle : IncorporationHonored edge_233a_incorporates_28usc2672 c)
    (hExclusive : LexSpecialisControls edge_233a_lexSpecialis_otherCivilActions c)
    (hRemoval : IncorporationHonored edge_233c_incorporates_28usc_ch171 c)
    (hCompromise : IncorporationHonored edge_233d_incorporates_28usc2677 c)
    (hAssaultBattery : OverrideTriggered edge_233e_notwithstanding_28usc2680h c)
    (hHoldHarmless : IncorporationHonored edge_233f_incorporates_28usc2679b c)
    (hTransfer : ReferencedSectionExists edge_233g1A_subjectTo_233k3 c)
    (hDeemExclusive : IncorporationHonored edge_233g1A_incorporates_233a c)
    (hApplication : IncorporationHonored edge_233g1D_incorporates_233h c)
    (hFinality : ExceptionApplies edge_233g1F_exceptAsProvided_233i c →
      IncorporationHonored edge_233g1F_exceptAsProvided_233i c)
    (hEntity : IncorporationHonored edge_233g4_incorporates_254b c)
    (hDeDeem : OverrideTriggered edge_233i1_notwithstanding_233g1 c)
    (hDeDeemGround : IncorporationHonored edge_233i1_incorporates_233h1 c)
    (hCorps : MutatisMutandisApplicationResolves edge_233j_incorporates_254he c)
    (hFund : IncorporationHonored edge_233k1A_incorporates_28usc1346_ch171 c)
    (hAdvice : IncorporationHonored edge_233l1_incorporates_233c c)
    (hManagedCare : IncorporationHonored edge_233m2_incorporates_ssa c)
    (hPartC : ReferencedSectionExists edge_233p3A_subjectTo_partC c)
    (hSaved : SavingsClauseHonored edge_233p3Aiii_savings_28usc_ch171 c)
    (hPoxExclusive : IncorporationHonored edge_233p3B_incorporates_233a c)
    (hPoxRemoval : IncorporationHonored edge_233p4_incorporates_233c c)
    (hPoxException : ExceptionApplies edge_233p2B_exceptAsProvided_233p5Bii c →
      IncorporationHonored edge_233p2B_exceptAsProvided_233p5Bii c)
    : Coherent233 c :=
  ⟨hFtcaExists, hFtca, hSettle, hExclusive, hRemoval, hCompromise, hAssaultBattery,
   hHoldHarmless, hTransfer, hDeemExclusive, hApplication, hFinality, hEntity,
   hDeDeem, hDeDeemGround, hCorps, hFund, hAdvice, hManagedCare, hPartC, hSaved,
   hPoxExclusive, hPoxRemoval, hPoxException⟩

theorem section233DeemingRoute_intro_fundedEntity {c : ComplaintText}
    (hEntity : IncorporationHonored edge_233g4_incorporates_254b c)
    (hExclusive : IncorporationHonored edge_233g1A_incorporates_233a c)
    : Section233DeemingRoute c :=
  .fundedEntity hEntity hExclusive

theorem section233DeemingRoute_intro_freeClinic {c : ComplaintText}
    (hApply : MutatisMutandisApplicationResolves edge_233o5_incorporates_233ghil c)
    (hFund : ReferencedSectionExists edge_233o5_subjectTo_233o6 c)
    : Section233DeemingRoute c :=
  .freeClinicHealthProfessional hApply hFund

theorem section233DeemingRoute_intro_volunteer {c : ComplaintText}
    (hApply : MutatisMutandisApplicationResolves edge_233q3_incorporates_233ghil c)
    (hService : IncorporationHonored edge_233q1_incorporates_254b c)
    : Section233DeemingRoute c :=
  .healthProfessionalVolunteer hApply hService

theorem section233DeemingRoute_intro_smallpox {c : ComplaintText}
    (hExclusive : IncorporationHonored edge_233p3B_incorporates_233a c)
    (hRemoval : IncorporationHonored edge_233p4_incorporates_233c c)
    : Section233DeemingRoute c :=
  .smallpoxCoveredPerson hExclusive hRemoval

theorem coherent234_intro {c : ComplaintText}
    (hOverride : OverrideTriggered edge_234a_notwithstanding_anyOtherLaw c)
    (hCorps : IncorporationHonored edge_234a_incorporates_300hh15 c)
    (hRegistry : IncorporationHonored edge_234a_incorporates_247d7b c)
    (hSitus : LexSpecialisControls edge_234a_lexSpecialis_situsStateLaw c)
    (hLicensure : ExceptionApplies edge_234a_exceptAsProvided_licensure c →
      IncorporationHonored edge_234a_exceptAsProvided_licensure c)
    (hVpa : SavingsClauseHonored edge_234b_savings_volunteerProtectionAct c)
    (hScope : PreemptionScopeRespected edge_234c_notwithstanding_otherStateLaw c)
    : Coherent234 c :=
  ⟨hOverride, hCorps, hRegistry, hSitus, hLicensure, hVpa, hScope⟩

theorem section234TriggeringEvent_intro_publicHealthEmergency {c : ComplaintText}
    (h : IncorporationHonored edge_234a1A_incorporates_247da c)
    : Section234TriggeringEvent c :=
  .publicHealthEmergency h

theorem section234TriggeringEvent_intro_majorDisaster {c : ComplaintText}
    (h : IncorporationHonored edge_234a1B_incorporates_5170 c)
    : Section234TriggeringEvent c :=
  .presidentialMajorDisaster h

theorem section234TriggeringEvent_intro_nationalEmergency {c : ComplaintText}
    (h : IncorporationHonored edge_234a1B_incorporates_50usc1621 c)
    : Section234TriggeringEvent c :=
  .nationalEmergency h

theorem coherent235_intro {c : ComplaintText}
    (hV : IncorporationHonored edge_235_incorporates_subchV c)
    (hVi : IncorporationHonored edge_235_incorporates_subchVI c)
    (hResearch : IncorporationHonored edge_235_incorporates_242b c)
    (hFormula : IncorporationHonored edge_235_incorporates_246 c)
    (hSaved : SavingsClauseHonored edge_235_savings_statutoryRequirements c)
    : Coherent235 c :=
  ⟨hV, hVi, hResearch, hFormula, hSaved⟩

theorem coherent236_intro {c : ComplaintText}
    (hSubchB : IncorporationHonored edge_236c1A_incorporates_ffdcaSubchB c)
    (hInd : IncorporationHonored edge_236c5_incorporates_21usc355i c)
    (hNda : IncorporationHonored edge_236c5_incorporates_21usc355c c)
    (hBiologics : IncorporationHonored edge_236c5_incorporates_42usc262 c)
    (hDesignation : IncorporationHonored edge_236e1_incorporates_21usc360bb c)
    (hGrants : IncorporationHonored edge_236e_incorporates_21usc360ee c)
    : Coherent236 c :=
  ⟨hSubchB, hInd, hNda, hBiologics, hDesignation, hGrants⟩

theorem coherent237_intro {c : ComplaintText}
    (hAppoint : OverrideTriggered edge_237b_notwithstanding_title5Appointment c)
    (hSystems : OverrideTriggered edge_237b_notwithstanding_title5Systems c)
    (hGrade : IncorporationHonored edge_237b_incorporates_generalSchedule c)
    (hPayCap : IncorporationHonored edge_237d2_incorporates_3usc102 c)
    (hReappoint : OverrideTriggered edge_237e_notwithstanding_title5Appointment c)
    : Coherent237 c :=
  ⟨hAppoint, hSystems, hGrade, hPayCap, hReappoint⟩

theorem coherent237a_intro {c : ComplaintText}
    (hOffice : IncorporationHonored edge_237ab_incorporates_237aa c)
    (hGrants : IncorporationHonored edge_237ab7_incorporates_237ac c)
    (hEvaluation : IncorporationHonored edge_237ac2_incorporates_237ac1 c)
    : Coherent237a c :=
  ⟨hOffice, hGrants, hEvaluation⟩

theorem coherent238a_intro {c : ComplaintText}
    (hTarget : IncorporationHonored edge_238a_exceptAsProvided_249a c)
    (hCarveOut : ExceptionApplies edge_238a_exceptAsProvided_249a c →
      IncorporationHonored edge_238a_exceptAsProvided_249a c)
    : Coherent238a c :=
  ⟨hTarget, hCarveOut⟩

theorem coherent238l_intro {c : ComplaintText}
    (hAct : PriorLawIncorporationPreserved sref_238la_cmhca c)
    (hTransferee : PriorLawIncorporationPreserved sref_238la1A_cmhca222 c)
    (hAmount : IncorporationHonored edge_238la_incorporates_238lc c)
    (hNotice : IncorporationHonored edge_238lb_incorporates_238la c)
    (hWaiver : ExceptionApplies edge_238ld_exceptAsProvided_238la c →
      IncorporationHonored edge_238ld_exceptAsProvided_238la c)
    (hLien : SavingsClauseHonored edge_238le_savings_lienLaw c)
    : Coherent238l c :=
  ⟨hAct, hTransferee, hAmount, hNotice, hWaiver, hLien⟩

theorem section238lInterestPeriodRoute_intro_noticeGiven {c : ComplaintText}
    (h : IncorporationHonored edge_238lc2Bi_incorporates_238lb c)
    : Section238lInterestPeriodRoute c :=
  .noticeGiven h

theorem section238lInterestPeriodRoute_intro_noticeOmitted {c : ComplaintText}
    (h : IncorporationHonored edge_238lc2Bii_incorporates_238lb c)
    : Section238lInterestPeriodRoute c :=
  .noticeOmitted h

theorem coherent238m_intro {c : ComplaintText}
    (hEmergency : IncorporationHonored edge_238ma1B_incorporates_247d c)
    (hQuarantine : IncorporationHonored edge_238ma1B_incorporates_249 c)
    (hCompetition : OverrideTriggered edge_238mb1_notwithstanding_41usc6101 c)
    (hCarrierTerms : MutatisMutandisApplicationResolves edge_238md_incorporates_1395u_de c)
    (hAgentDef : IncorporationHonored edge_238me_incorporates_1395uf1 c)
    (hTribal : IncorporationHonored edge_238me_incorporates_isda c)
    : Coherent238m c :=
  ⟨hEmergency, hQuarantine, hCompetition, hCarrierTerms, hAgentDef, hTribal⟩

theorem ch6ASchIReferenceDefects_intro {c : ComplaintText}
    (h218a : TargetEditoriallyDefective sref_218a_254b c)
    (h218b : TargetEditoriallyDefective sref_218b_254b c)
    (h233g : TargetEditoriallyDefective sref_233g1Gii_254b_256a c)
    (h233k : TargetEditoriallyDefective sref_233k2_254b_256a c)
    (h233n : TargetEditoriallyDefective sref_233n1C_254b_256a c)
    (h233p : TargetEditoriallyDefective sref_233p7Bv_subclause c)
    (h235vii : TargetEditoriallyDefective sref_235_subchVII c)
    (h235246 : TargetEditoriallyDefective sref_235_246 c)
    (h236 : TargetEditoriallyDefective sref_236e_44H c)
    (h238a : TargetEditoriallyDefective sref_238a_249a c)
    (h238md : TargetEditoriallyDefective sref_238md_1395u_de c)
    (h238me : TargetEditoriallyDefective sref_238me_1395uf1 c)
    (h238lAct : PriorLawIncorporationPreserved sref_238la_cmhca c)
    (h238lSec : PriorLawIncorporationPreserved sref_238la1A_cmhca222 c)
    : Ch6ASchIReferenceDefects c :=
  ⟨h218a, h218b, h233g, h233k, h233n, h233p, h235vii, h235246, h236, h238a,
   h238md, h238me, h238lAct, h238lSec⟩

end Proving.USC.T42.Ch6ASchI.Reslice.Structure
