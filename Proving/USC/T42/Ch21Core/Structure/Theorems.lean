




import Proving.USC.T42.Ch21Core.Structure.Types
import Proving.USC.T42.Ch21Core.Structure.Predicates
import Proving.USC.T42.Ch21Core.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Core.Structure

open Proving.USC.Common

theorem coherent1981_intro {c : ComplaintText}
    (hScope : DefinitionalScopeRespected edge_1981b_defScope_1981 c)
    : Coherent1981 c := ⟨hScope⟩

theorem coherent1981a_intro {c : ComplaintText}
    (hEnfExists : ReferencedSectionExists edge_1981a_a1_inc_2000e5 c)
    (hEnf : IncorporationHonored edge_1981a_a1_inc_2000e5 c)
    (hFedSector : ReferencedSectionExists edge_1981a_a1_inc_2000e16 c)
    (hProhib : IncorporationHonored edge_1981a_a1_inc_2000e2 c)
    (hRetal : IncorporationHonored edge_1981a_a1_inc_2000e3 c)
    (hPriority : SubordinationRespected edge_1981a_a1_subjectTo_1981 c)
    (hBackpay : ExceptionApplies edge_1981a_b2_exc_2000e5g c)
    (hGoodFaith : ExceptionApplies edge_1981a_a3_exc_12112b5 c)
    (hSaved : SavingsClausePreserved edge_1981a_b4_savings_1981 c)
    (hRehab : CrossTitleReferenceResolves edge_1981a_a2_inc_29_791 c)
    (hRehabRem : CrossTitleReferenceResolves edge_1981a_a2_inc_29_794a c)
    (hAda : IncorporationHonored edge_1981a_a2_inc_12112 c)
    (hAdaProc : IncorporationHonored edge_1981a_a2_inc_12117a c)
    (hClaimant : IncorporationHonored edge_1981a_d1A_inc_2000e c)
    (hClaimantAda : IncorporationHonored edge_1981a_d1B_inc_12111 c)
    : Coherent1981a c :=
  ⟨hEnfExists, hEnf, hFedSector, hProhib, hRetal, hPriority, hBackpay, hGoodFaith,
   hSaved, hRehab, hRehabRem, hAda, hAdaProc, hClaimant, hClaimantAda⟩

theorem section1981aDamagesBasis_titleVII_intro {c : ComplaintText}
    (hEnf : IncorporationHonored edge_1981a_a1_inc_2000e5 c)
    (hProhib : IncorporationHonored edge_1981a_a1_inc_2000e2 c)
    (hNo1981 : SubordinationRespected edge_1981a_a1_subjectTo_1981 c)
    : Section1981aDamagesBasis c :=
  .titleVII hEnf hProhib hNo1981

theorem section1981aDamagesBasis_rehabOrAda_intro {c : ComplaintText}
    (hRehab : CrossTitleReferenceResolves edge_1981a_a2_inc_29_791 c)
    (hAda : IncorporationHonored edge_1981a_a2_inc_12112 c)
    : Section1981aDamagesBasis c :=
  .rehabOrAda hRehab hAda

theorem coherent1983_intro {c : ComplaintText}
    (hRight : OpenEndedIncorporationIdentified edge_1983_inc_constitutionAndLaws c)
    (hDc : IncorporationHonored edge_1983_inc_dcActs c)
    (hJudicial : ExceptionApplies edge_1983_exc_judicialOfficer c)
    (hExhaust : SubordinationRespected edge_1983_subjectTo_1997e_a c)
    (hScreen : SubordinationRespected edge_1983_subjectTo_1997e_c c)
    : Coherent1983 c := ⟨hRight, hDc, hJudicial, hExhaust, hScreen⟩

theorem coherent1985_intro {c : ComplaintText}
    (hClause1 : IncorporationHonored edge_1985_3_inc_1985_1 c)
    (hClause2 : IncorporationHonored edge_1985_3_inc_1985_2 c)
    : Coherent1985 c := ⟨hClause1, hClause2⟩

theorem coherent1986_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1986_inc_1985 c)
    (hWrongs : IncorporationHonored edge_1986_inc_1985 c)
    (hOneYear : ExceptionApplies edge_1986_exc_oneYear c)
    : Coherent1986 c := ⟨hExists, hWrongs, hOneYear⟩

theorem coherent1988_intro {c : ComplaintText}
    (hRs : ReferencedSectionExists edge_1988_a_inc_rsTitles c)
    (hFederalPrimary : LexSpecialisControls edge_1988_a_lexSpecialis_usLaws c)
    (hConsistent : SubordinationRespected edge_1988_a_subjectTo_usConstAndLaws c)
    (hRoster : EnumeratedIncorporationMembership edge_1988_b_inc_1983 c)
    (h1981 : ReferencedSectionExists edge_1988_b_inc_1981 c)
    (h1986 : ReferencedSectionExists edge_1988_b_inc_1986 c)
    (hTitleIX : CrossTitleReferenceResolves edge_1988_b_inc_20_1681 c)
    (hVawa : CrossTitleReferenceResolves edge_1988_b_inc_34_12361 c)
    (hJudicial : ExceptionApplies edge_1988_b_exc_judicialOfficer c)
    (hExpertRides : SubordinationRespected edge_1988_c_subjectTo_1988_b c)
    (hExpertRoster : EnumeratedIncorporationMembership edge_1988_c_inc_1981a c)
    (hPrisonerCap : SubordinationRespected edge_1988_subjectTo_1997e_d c)
    : Coherent1988 c :=
  ⟨hRs, hFederalPrimary, hConsistent, hRoster, h1981, h1986, hTitleIX, hVawa,
   hJudicial, hExpertRides, hExpertRoster, hPrisonerCap⟩

theorem section1988aGoverningLaw_federal_intro {c : ComplaintText}
    (h : LexSpecialisControls edge_1988_a_lexSpecialis_usLaws c)
    : Section1988aGoverningLaw c :=
  .federalLawSuffices h

theorem section1988aGoverningLaw_state_intro {c : ComplaintText}
    (hDeficient : LexSpecialisControls edge_1988_a_lexSpecialis_usLaws c)
    (hBorrowed : IncorporationHonored edge_1988_a_inc_stateCommonLaw c)
    (hConsistent : SubordinationRespected edge_1988_a_subjectTo_usConstAndLaws c)
    : Section1988aGoverningLaw c :=
  .stateCommonLawFills hDeficient hBorrowed hConsistent

theorem sec1997IncorporationsResolve_intro {c : ComplaintText}
    (hScope : DefinitionalScopeRespected edge_subchapter_inc_1997 c)
    (hCarveOut : ExceptionApplies edge_1997_1_exc_1997_2 c)
    (hXVI : ReferencedSectionExists edge_1997_2_inc_ssa_1381 c)
    (hXVIII : ReferencedSectionExists edge_1997_2_inc_ssa_1395 c)
    (hXIX : ReferencedSectionExists edge_1997_2_inc_ssa_1396 c)
    : Sec1997IncorporationsResolve c := ⟨hScope, hCarveOut, hXVI, hXVIII, hXIX⟩

theorem coherent1997a_intro {c : ComplaintText}
    (hInstitution : IncorporationHonored edge_1997a_a_inc_1997 c)
    (hCorrectional : ExceptionApplies edge_1997a_a_exc_1997_1Bii c)
    (hCertification : SubordinationRespected edge_1997a_subjectTo_1997b c)
    (hFederalNotice : SubordinationRespected edge_1997a_subjectTo_1997h c)
    (hGrievance : ExceptionApplies edge_1997a_exc_1997e_b c)
    : Coherent1997a c :=
  ⟨hInstitution, hCorrectional, hCertification, hFederalNotice, hGrievance⟩

theorem coherent1997a1_intro {c : ComplaintText}
    (hInstitution : IncorporationHonored edge_1997a1_a_inc_1997 c)
    (hInvestigation : IncorporationHonored edge_1997a1_a_inc_subchapter c)
    (hUse : ExceptionApplies edge_1997a1_c_exc_useRestriction c)
    (hContempt : EditorialDefectReadingApplied "42 USC § 1997a-1(b)(2)"
        "punished by the court as a contempt of that court" c)
    : Coherent1997a1 c := ⟨hInstitution, hInvestigation, hUse, hContempt⟩

theorem coherent1997b_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1997b_a_inc_1997a c)
    (hHonored : IncorporationHonored edge_1997b_a_inc_1997a c)
    : Coherent1997b c := ⟨hExists, hHonored⟩

theorem coherent1997c_intro {c : ComplaintText}
    (hInstitution : IncorporationHonored edge_1997c_a1_inc_1997 c)
    (hNinetyDay : ExceptionApplies edge_1997c_a1_exc_1997c_a2 c)
    (hFederalNotice : SubordinationRespected edge_1997c_subjectTo_1997h c)
    (hGrievance : ExceptionApplies edge_1997c_exc_1997e_b c)
    (hOtherFees : SavingsClausePreserved edge_1997c_d_savings_otherFees c)
    : Coherent1997c c :=
  ⟨hInstitution, hNinetyDay, hFederalNotice, hGrievance, hOtherFees⟩

theorem coherent1997e_intro {c : ComplaintText}
    (hExh1983 : IncorporationHonored edge_1997e_a_inc_1983 c)
    (hExhOther : OpenEndedIncorporationIdentified edge_1997e_a_inc_otherFederalLaw c)
    (hPreDismiss : ExceptionApplies edge_1997e_a_exc_1997e_c2 c)
    (hScreen1983 : IncorporationHonored edge_1997e_c1_inc_1983 c)
    (hCripa1 : EnumeratedIncorporationMembership edge_1997e_b_inc_1997a c)
    (hCripa2 : EnumeratedIncorporationMembership edge_1997e_b_inc_1997c c)
    (hFeeCap : IncorporationHonored edge_1997e_d1_inc_1988 c)
    (hCja : CrossTitleReferenceResolves edge_1997e_d3_inc_18_3006A c)
    (hSexualAct : CrossTitleReferenceResolves edge_1997e_e_inc_18_2246 c)
    (hPretrial : IncorporationHonored edge_1997e_f1_inc_1983 c)
    (hWaiver : OverrideTriggered edge_1997e_g1_notwithstanding_otherLaw c)
    (hPrisoner : DefinitionalScopeRespected edge_1997e_h_defScope_1997e c)
    : Coherent1997e c :=
  ⟨hExh1983, hExhOther, hPreDismiss, hScreen1983, hCripa1, hCripa2, hFeeCap, hCja,
   hSexualAct, hPretrial, hWaiver, hPrisoner⟩

theorem prisonConditionsActionPathway_exhausted_intro {c : ComplaintText}
    (h : SubordinationRespected edge_1983_subjectTo_1997e_a c)
    : PrisonConditionsActionPathway c :=
  .exhausted h

theorem prisonConditionsActionPathway_dismissed_intro {c : ComplaintText}
    (h : ExceptionApplies edge_1997e_a_exc_1997e_c2 c)
    (hScreen : SubordinationRespected edge_1983_subjectTo_1997e_c c)
    : PrisonConditionsActionPathway c :=
  .dismissedPreExhaustion h hScreen

theorem coherent1997f_intro {c : ComplaintText}
    (hVehicle : CrossTitleReferenceResolves edge_1997f_inc_28_522 c)
    (hSubchapter : IncorporationHonored edge_1997f_inc_subchapter c)
    : Coherent1997f c := ⟨hVehicle, hSubchapter⟩

theorem coherent1997h_intro {c : ComplaintText}
    (hInitiation : IncorporationHonored edge_1997h_inc_1997a c)
    (hIntervention : IncorporationHonored edge_1997h_inc_1997c c)
    : Coherent1997h c := ⟨hInitiation, hIntervention⟩

theorem coherent1997i_intro {c : ComplaintText}
    (h : DisclaimerScopeHonored edge_1997i_savings_subchapter c)
    : Coherent1997i c := ⟨h⟩

theorem coherent1997j_intro {c : ComplaintText}
    (hPrivate : SavingsClausePreserved edge_1997j_savings_existingLaw c)
    (hNoDelay : DisclaimerScopeHonored edge_1997j_savings_privateLitigation c)
    : Coherent1997j c := ⟨hPrivate, hNoDelay⟩

theorem cripaUnitedStatesParticipation_initiation_intro {c : ComplaintText}
    (h : Coherent1997a c) : CripaUnitedStatesParticipation c :=
  .initiation h

theorem cripaUnitedStatesParticipation_intervention_intro {c : ComplaintText}
    (h : Coherent1997c c) : CripaUnitedStatesParticipation c :=
  .intervention h

end Proving.USC.T42.Ch21Core.Structure
