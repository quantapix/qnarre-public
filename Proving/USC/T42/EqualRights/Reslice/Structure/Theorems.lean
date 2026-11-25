






import Proving.USC.T42.EqualRights.Reslice.Structure.Types
import Proving.USC.T42.EqualRights.Reslice.Structure.Predicates
import Proving.USC.T42.EqualRights.Reslice.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Structure

open Proving.USC.Common




theorem coherent1981_intro {t : IncorporatedTerm} {c : ComplaintText}
    (hTerm : DefinedTermCarriesBorrowedMeaning t edge_1981a_incorporates_1981b c)
    (hDef  : IncorporationHonored edge_1981a_incorporates_1981b c)
    (hCov  : IncorporationHonored edge_1981a_incorporates_1981c c)
    : Coherent1981 t c :=
  { contractTermBorrowed := hTerm
  , contractTermHonored := hDef
  , coverageHonored := hCov }




theorem damagesGateway1981a_titleVII_intro {c : ComplaintText}
    (hProc   : ReferencedSectionExists edge_1981a_incorporates_2000e5 c)
    (hProhib : IncorporationHonored edge_1981a_incorporates_2000e2 c)
    (hBar    : SubordinationSatisfied edge_1981a_subjectTo_1981 c)
    : DamagesGateway1981a c :=
  .titleVII hProc hProhib hBar


theorem damagesGateway1981a_disabilityStatutes_intro {c : ComplaintText}
    (hProc      : ReferencedSectionExists edge_1981a_incorporates_12117a c)
    (hRehab     : ReferencedSectionExists edge_1981a_incorporates_29_794a c)
    (hProhib    : IncorporationHonored edge_1981a_incorporates_12112 c)
    (hGoodFaith : ExceptionHonored edge_1981a_a2_exceptAsProvided_a3 c)
    : DamagesGateway1981a c :=
  .disabilityStatutes hProc hRehab hProhib hGoodFaith


theorem coherent1981a_intro {t : IncorporatedTerm} {c : ComplaintText}
    (hGateway  : DamagesGateway1981a c)
    (hRehab    : ReferencedSectionExists edge_1981a_incorporates_29_791 c)
    (hAddl     : IncorporationHonored edge_1981a_incorporates_2000e5g c)
    (hAnchor   : IncorporationHonored edge_1981a_a3_incorporates_12112b5 c)
    (hCaps     : IncorporationHonored edge_1981a_a_incorporates_b c)
    (hBackpay  : IncorporationHonored edge_1981a_b2_incorporates_2000e5g c)
    (hSaved    : SavingsClauseRespected edge_1981a_b4_savings_1981 c)
    (hJury     : IncorporationHonored edge_1981a_c2_incorporates_b3 c)
    (hParty    : DefinedTermCarriesBorrowedMeaning t edge_1981a_a_incorporates_d1 c)
    (hTitleVII : CrossReferenceResolvable edge_1981a_d1_incorporates_2000e)
    (hAda      : CrossReferenceResolvable edge_1981a_d1_incorporates_12111)
    (hPractice : IncorporationHonored edge_1981a_d2_incorporates_a c)
    : Coherent1981a t c :=
  { gateway := hGateway
  , rehabProhibitionExists := hRehab
  , additionalReliefHonored := hAddl
  , goodFaithAnchorHonored := hAnchor
  , capsIncorporated := hCaps
  , backpayExclusionHonored := hBackpay
  , section1981Saved := hSaved
  , juryLimitationHonored := hJury
  , complainingPartyBorrowed := hParty
  , titleVIIClassResolves := hTitleVII
  , adaClassResolves := hAda
  , practiceDefinitionHonored := hPractice }




theorem coherent1983_intro {c : ComplaintText}
    (hRight : IncorporationHonored edge_1983_incorporates_securedRights c)
    (hExc   : ExceptionHonored edge_1983_exceptAsProvided_judicialOfficer c)
    (hDc    : IncorporationHonored edge_1983_incorporates_dcDeeming c)
    : Coherent1983 c :=
  { securedRightIncorporated := hRight
  , judicialOfficerExceptionHonored := hExc
  , dcDeemingHonored := hDc }




theorem remedyPath1985_viaClause1_intro {c : ComplaintText}
    (h : IncorporationHonored edge_1985_1_incorporates_remedy c)
    : RemedyPath1985 c := .viaClause1 h


theorem remedyPath1985_viaClause2_intro {c : ComplaintText}
    (h : IncorporationHonored edge_1985_2_incorporates_remedy c)
    : RemedyPath1985 c := .viaClause2 h


theorem remedyPath1985_viaClause3_intro {c : ComplaintText}
    (h : IncorporationHonored edge_1985_3_incorporates_remedy c)
    : RemedyPath1985 c := .viaClause3 h


theorem coherent1985_intro {c : ComplaintText}
    (hPath   : RemedyPath1985 c)
    (hExists : ReferencedSectionExists edge_1985_3_incorporates_remedy c)
    : Coherent1985 c :=
  { remedyReached := hPath, remedyClauseExists := hExists }




theorem coherent1986_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1986_incorporates_1985 c)
    (hWrong  : IncorporationHonored edge_1986_incorporates_1985 c)
    (hBar    : SubordinationSatisfied edge_1986_subjectTo_oneYearBar c)
    : Coherent1986 c :=
  { section1985Exists := hExists
  , predicateWrongIncorporated := hWrong
  , oneYearBarSatisfied := hBar }




theorem ruleOfDecision1988a_federalSuffices_intro {c : ComplaintText}
    (hConf : IncorporationHonored edge_1988a_incorporates_usLaws c)
    (hNo   : ¬ ExceptionApplies edge_1988a_exceptAsProvided_stateCommonLaw c)
    : RuleOfDecision1988a c := .federalSuffices hConf hNo


theorem ruleOfDecision1988a_stateCommonLawFills_intro {c : ComplaintText}
    (hDef  : ExceptionApplies edge_1988a_exceptAsProvided_stateCommonLaw c)
    (hHon  : ExceptionHonored edge_1988a_exceptAsProvided_stateCommonLaw c)
    (hCons : SubordinationSatisfied edge_1988a_stateLaw_subjectTo_federal c)
    : RuleOfDecision1988a c := .stateCommonLawFills hDef hHon hCons


theorem section1988IncorporationsResolve_intro
    {p : EnforcementProceeding} {c : ComplaintText}
    (hRs        : CrossReferenceResolvable edge_1988a_incorporates_revisedStatutes)
    (hRule      : RuleOfDecision1988a c)
    (hGate      : EnforcementProceedingUnder edge_1988b_enforcementGate p c)
    (h1981      : ReferencedSectionExists edge_1988b_incorporates_1981 c)
    (h1981a     : ReferencedSectionExists edge_1988b_incorporates_1981a c)
    (h1982      : ReferencedSectionExists edge_1988b_incorporates_1982 c)
    (h1983      : ReferencedSectionExists edge_1988b_incorporates_1983 c)
    (h1985      : ReferencedSectionExists edge_1988b_incorporates_1985 c)
    (h1986      : ReferencedSectionExists edge_1988b_incorporates_1986 c)
    (hTitleIX   : CrossReferenceResolvable edge_1988b_incorporates_20_1681)
    (hRfra      : CrossReferenceResolvable edge_1988b_incorporates_2000bb)
    (hRluipa    : CrossReferenceResolvable edge_1988b_incorporates_2000cc)
    (hTitleVI   : CrossReferenceResolvable edge_1988b_incorporates_2000d)
    (h12361     : CrossReferenceResolvable edge_1988b_incorporates_34_12361)
    (hJudOff    : ExceptionHonored edge_1988b_exceptAsProvided_judicialOfficer c)
    (hOverride  : OverrideTriggered edge_1988c_lexSpecialis_1988b c)
    (hScope     : IncorporationHonored edge_1988c_incorporates_1981_1981a c)
    : Section1988IncorporationsResolve p c :=
  { revisedStatutesResolve := hRs
  , ruleOfDecision := hRule
  , proceedingEnforcesEnumerated := hGate
  , fee1981 := h1981
  , fee1981a := h1981a
  , fee1982 := h1982
  , fee1983 := h1983
  , fee1985 := h1985
  , fee1986 := h1986
  , feeTitleIX := hTitleIX
  , feeRfra := hRfra
  , feeRluipa := hRluipa
  , feeTitleVI := hTitleVI
  , feeSection12361 := h12361
  , judicialOfficerCostExceptionHonored := hJudOff
  , expertFeeOverrideTriggered := hOverride
  , expertFeeScopeHonored := hScope }

end Proving.USC.T42.EqualRights.Reslice.Structure
