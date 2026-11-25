



import Proving.USC.T20.Ch38.Reearn.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Structure

open Proving.USC.Common

theorem coherent1681_intro {c : ComplaintText}
    (programActivityIncorporated : IncorporationHonored edge_1681a_incorporates_1687 c)
    (programActivityScope : DefinitionalScopeSatisfied edge_1687_incorporates_ch38 c)
    (educationalInstitutionIncorporated : IncorporationHonored edge_1681a_incorporates_1681c c)
    (educationalInstitutionScope : DefinitionalScopeSatisfied edge_1681c_incorporates_ch38 c)
    (admissionsScopeException : ExceptionHonored edge_1681a_exceptAsProvided_1681a1 c)
    (transitionPlanException : ExceptionHonored edge_1681a_exceptAsProvided_1681a2 c)
    (religiousTenetsException : ExceptionHonored edge_1681a_exceptAsProvided_1681a3 c)
    (militaryTrainingException : ExceptionHonored edge_1681a_exceptAsProvided_1681a4 c)
    (traditionallySingleSexException : ExceptionHonored edge_1681a_exceptAsProvided_1681a5 c)
    (membershipPracticesException : ExceptionHonored edge_1681a_exceptAsProvided_1681a6 c)
    (youthConferenceException : ExceptionHonored edge_1681a_exceptAsProvided_1681a7 c)
    (parentChildActivityException : ExceptionHonored edge_1681a_exceptAsProvided_1681a8 c)
    (pageantScholarshipException : ExceptionHonored edge_1681a_exceptAsProvided_1681a9 c)
    (taxExemptionIncorporated : IncorporationHonored edge_1681a6A_incorporates_26usc501a c)
    (taxExemptionSectionExists : ReferencedSectionExists edge_1681a6A_incorporates_26usc501a c)
    (taxExemptionCrossTitle : CrossTitleReferenceResolves edge_1681a6A_incorporates_26usc501a c)
    (otherFederalNondiscriminationLaw :
      OpenReferenceClassIdentified edge_1681a9_subjectTo_federalNondiscriminationLaw c)
    (statisticalImbalanceSavings : SavingsClauseRespected edge_1681b_savings_1681a c)
    (chapterProceedingsIncorporated : IncorporationHonored edge_1681b_incorporates_ch38 c)
    : Coherent1681 c :=
  { programActivityIncorporated, programActivityScope, educationalInstitutionIncorporated,
    educationalInstitutionScope, admissionsScopeException, transitionPlanException,
    religiousTenetsException, militaryTrainingException, traditionallySingleSexException,
    membershipPracticesException, youthConferenceException, parentChildActivityException,
    pageantScholarshipException, taxExemptionIncorporated, taxExemptionSectionExists,
    taxExemptionCrossTitle, otherFederalNondiscriminationLaw, statisticalImbalanceSavings,
    chapterProceedingsIncorporated }

theorem coherent1682_intro {c : ComplaintText}
    (effectuatesSection1681 : IncorporationHonored edge_1682_incorporates_1681 c)
    (section1681Exists : ReferencedSectionExists edge_1682_incorporates_1681 c)
    (judicialReviewRegimeExists : ReferencedSectionExists edge_1682_subjectTo_1683 c)
    (voluntaryComplianceProviso : ExceptionHonored edge_1682_exceptAsProvided_1682Proviso c)
    (insuranceGuarantySavings : SavingsClauseRespected edge_1685_savings_1682 c)
    : Coherent1682 c :=
  { effectuatesSection1681, section1681Exists, judicialReviewRegimeExists,
    voluntaryComplianceProviso, insuranceGuarantySavings }

theorem coherent1683_intro {c : ComplaintText}
    (reviewsSection1682Action : IncorporationHonored edge_1683_incorporates_1682 c)
    (section1682Exists : ReferencedSectionExists edge_1683_incorporates_1682 c)
    (apaProcedureIncorporated : IncorporationHonored edge_1683_incorporates_5uscCh7 c)
    (apaProcedureCrossTitle : CrossTitleReferenceResolves edge_1683_incorporates_5uscCh7 c)
    (unreviewableDiscretionOverride : OverrideTriggered edge_1683_notwithstanding_5usc701 c)
    (section701Exists : ReferencedSectionExists edge_1683_notwithstanding_5usc701 c)
    (section701CrossTitle : CrossTitleReferenceResolves edge_1683_notwithstanding_5usc701 c)
    (otherwiseProvidedReview :
      OpenReferenceClassIdentified edge_1683_subjectTo_otherJudicialReviewLaw c)
    : Coherent1683 c :=
  { reviewsSection1682Action, section1682Exists, apaProcedureIncorporated,
    apaProcedureCrossTitle, unreviewableDiscretionOverride, section701Exists,
    section701CrossTitle, otherwiseProvidedReview }

theorem coherent1684_intro {c : ComplaintText}
    (programActivityIncorporated : IncorporationHonored edge_1684_incorporates_1687 c)
    (programActivityScope : DefinitionalScopeSatisfied edge_1687_incorporates_ch38 c)
    (specialServicesSavings : SavingsClauseRespected edge_1684_savings_1684 c)
    : Coherent1684 c :=
  { programActivityIncorporated, programActivityScope, specialServicesSavings }

theorem coherent1685_intro {c : ComplaintText}
    (chapterAuthoritySavings : SavingsClauseRespected edge_1685_savings_ch38 c)
    (chapterExists : ReferencedSectionExists edge_1685_savings_ch38 c)
    : Coherent1685 c :=
  { chapterAuthoritySavings, chapterExists }

theorem coherent1686_intro {c : ComplaintText}
    (chapterOverrideFires : OverrideTriggered edge_1686_notwithstanding_ch38 c)
    (narrowerRuleControls : LexSpecialisControls edge_1686_lexSpecialis_1681 c)
    (section1681Exists : ReferencedSectionExists edge_1686_lexSpecialis_1681 c)
    (enactingActIdentified : OpenReferenceClassIdentified edge_1686_incorporates_pl92318 c)
    : Coherent1686 c :=
  { chapterOverrideFires, narrowerRuleControls, section1681Exists, enactingActIdentified }

theorem section1687IncorporationsResolve_intro {c : ComplaintText}
    (chapterScope : DefinitionalScopeSatisfied edge_1687_incorporates_ch38 c)
    (leaDefinitionIncorporated : IncorporationHonored edge_1687_incorporates_20usc7801 c)
    (leaSectionExists : ReferencedSectionExists edge_1687_incorporates_20usc7801 c)
    (religiousControlCarve : ExceptionHonored edge_1687_exceptAsProvided_1681 c)
    (section1681Exists : ReferencedSectionExists edge_1687_exceptAsProvided_1681 c)
    : Section1687IncorporationsResolve c :=
  { chapterScope, leaDefinitionIncorporated, leaSectionExists, religiousControlCarve,
    section1681Exists }

theorem coherent1688_intro {c : ComplaintText}
    (abortionNeutralitySavings : SavingsClauseRespected edge_1688_savings_ch38 c)
    (chapterExists : ReferencedSectionExists edge_1688_savings_ch38 c)
    : Coherent1688 c :=
  { abortionNeutralitySavings, chapterExists }

theorem coherent1689_intro {c : ComplaintText}
    (titleIXIncorporated : IncorporationHonored edge_1689a1_incorporates_1681 c)
    (campusSecurityIncorporated : IncorporationHonored edge_1689a1_incorporates_1092f c)
    (campusSecuritySectionExists : ReferencedSectionExists edge_1689a1_incorporates_1092f c)
    (enforcementAuthorityIncorporated : IncorporationHonored edge_1689a8_incorporates_1682 c)
    (detailAuthorityOverride : OverrideTriggered edge_1689b1_notwithstanding_otherLaw c)
    (detailAuthorityClassIdentified :
      OpenReferenceClassIdentified edge_1689b1_notwithstanding_otherLaw c)
    (planIncorporatesTitleIX : IncorporationHonored edge_1689c_incorporates_1681 c)
    (planIncorporatesCampusSecurity : IncorporationHonored edge_1689c_incorporates_1092f c)
    (schoolDefinitionIncorporated : IncorporationHonored edge_1689e2_incorporates_20usc7801 c)
    (schoolDefinitionSectionExists : ReferencedSectionExists edge_1689e2_incorporates_20usc7801 c)
    (iheDefinitionIncorporated : IncorporationHonored edge_1689e3_incorporates_20usc1002 c)
    (iheDefinitionSectionExists : ReferencedSectionExists edge_1689e3_incorporates_20usc1002 c)
    : Coherent1689 c :=
  { titleIXIncorporated, campusSecurityIncorporated, campusSecuritySectionExists,
    enforcementAuthorityIncorporated, detailAuthorityOverride, detailAuthorityClassIdentified,
    planIncorporatesTitleIX, planIncorporatesCampusSecurity, schoolDefinitionIncorporated,
    schoolDefinitionSectionExists, iheDefinitionIncorporated, iheDefinitionSectionExists }

theorem section1689DanglingCite_intro {c : ComplaintText}
    (vawaCiteUnresolved : ¬ ReferencedSectionExists edge_1689b1_incorporates_34usc13925 c)
    (ledgerCount : danglingReferenceCount c = 1)
    : Section1689DanglingCite c :=
  { vawaCiteUnresolved, ledgerCount }

theorem chapter38OverridePath_livingFacilities_intro {c : ComplaintText}
    (fires : OverrideTriggered edge_1686_notwithstanding_ch38 c)
    (controls : LexSpecialisControls edge_1686_lexSpecialis_1681 c)
    : Chapter38OverridePath c :=
  .livingFacilities fires controls

theorem chapter38OverridePath_insuranceGuaranty_intro {c : ComplaintText}
    (preserved : SavingsClauseRespected edge_1685_savings_ch38 c)
    : Chapter38OverridePath c :=
  .insuranceGuarantyAuthority preserved

theorem chapter38OverridePath_abortionNeutrality_intro {c : ComplaintText}
    (preserved : SavingsClauseRespected edge_1688_savings_ch38 c)
    : Chapter38OverridePath c :=
  .abortionNeutrality preserved

theorem chapter38Coherent_intro {c : ComplaintText}
    (s1681 : Coherent1681 c) (s1682 : Coherent1682 c) (s1683 : Coherent1683 c)
    (s1684 : Coherent1684 c) (s1685 : Coherent1685 c) (s1686 : Coherent1686 c)
    (s1687 : Section1687IncorporationsResolve c) (s1688 : Coherent1688 c)
    (s1689 : Coherent1689 c) (overridePath : Chapter38OverridePath c)
    : Chapter38Coherent c :=
  { s1681, s1682, s1683, s1684, s1685, s1686, s1687, s1688, s1689, overridePath }

end Proving.USC.T20.Ch38.Reearn.Structure
