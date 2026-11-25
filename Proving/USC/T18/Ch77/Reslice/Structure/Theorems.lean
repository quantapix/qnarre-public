import Proving.USC.T18.Ch77.Reslice.Structure.Types
import Proving.USC.T18.Ch77.Reslice.Structure.Predicates
import Proving.USC.T18.Ch77.Reslice.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false








namespace Proving.USC.T18.Ch77.Reslice.Structure

open Proving.USC.Common


theorem coherent1590_intro {c : ComplaintText}
    (hChapterPredicate   : ChapterWideIncorporationHonored edge_1590a_incorporates_ch77 c)
    (hChapterExists      : ReferencedSectionExists edge_1590a_incorporates_ch77 c)
    (hFineRegime         : IncorporationHonored edge_1590a_incorporates_3571 c)
    (hKidnapAggravator   : IncorporationHonored edge_1590a_incorporates_1201 c)
    (hSexAbuseAggravator : IncorporationHonored edge_1590a_incorporates_2241 c)
    (hObstructionPenalty : PenaltyIncorporationHonored edge_1590b_incorporates_1590a c)
    : Coherent1590 c :=
  { chapterPredicate := hChapterPredicate
    chapterExists := hChapterExists
    fineRegime := hFineRegime
    kidnapAggravator := hKidnapAggravator
    sexAbuseAggravator := hSexAbuseAggravator
    obstructionPenalty := hObstructionPenalty }


theorem coherent1591_intro {c : ComplaintText}
    (hSmtjResolves          : ReferencedSectionExists edge_1591a1_incorporates_t18s7 c)
    (hCoercionDefined       : DefinitionalTermResolves edge_1591a_incorporates_1591e2 c)
    (hCoercionDefinedGraded : DefinitionalTermResolves edge_1591b1_incorporates_1591e2 c)
    (hAbuseOfProcessDefined : DefinitionalTermResolves edge_1591e2C_incorporates_1591e1 c)
    (hVentureDefined        : DefinitionalTermResolves edge_1591e4_incorporates_1591a1 c)
    (hBeneficiaryChain      : IncorporationHonored edge_1591a2_incorporates_1591a1 c)
    (hPunishmentChain       : IncorporationHonored edge_1591a_incorporates_1591b c)
    (hFineRegime            : IncorporationHonored edge_1591b_incorporates_3571 c)
    (hAdvertisingCarve      : QualifyingProvisionHonored edge_1591a_exceptAsProvided_1591a1 c)
    (hObservationQualifier  : QualifyingProvisionHonored edge_1591a1_subjectTo_1591c c)
    (hObstructionScope      : ReferencedSectionExists edge_1591d_incorporates_1591 c)
    : Coherent1591 c :=
  { smtjResolves := hSmtjResolves
    coercionDefined := hCoercionDefined
    coercionDefinedGraded := hCoercionDefinedGraded
    abuseOfProcessDefined := hAbuseOfProcessDefined
    ventureDefined := hVentureDefined
    beneficiaryChain := hBeneficiaryChain
    punishmentChain := hPunishmentChain
    fineRegime := hFineRegime
    advertisingCarve := hAdvertisingCarve
    observationQualifier := hObservationQualifier
    obstructionScope := hObstructionScope }


theorem coherent1592_intro {c : ComplaintText}
    (hInCourseOffenses      : EnumeratedReferencesResolve edges_1592a1_predicateOffenses c)
    (hIntentOffenses        : EnumeratedReferencesResolve edges_1592a2_predicateOffenses c)
    (hTvpaDefinition        : CrossActReferenceResolves edge_1592a3_incorporates_tvpa103 c)
    (hVictimCarveHonored    : QualifyingProvisionHonored edge_1592a_exceptAsProvided_1592b c)
    (hVictimCarveDefinition : CrossActReferenceResolves edge_1592b_incorporates_tvpa103 c)
    (hFineRegime            : IncorporationHonored edge_1592a_incorporates_3571 c)
    (hObstructionPenalty    : PenaltyIncorporationHonored edge_1592c_incorporates_1592a c)
    : Coherent1592 c :=
  { inCourseOffenses := hInCourseOffenses
    intentOffenses := hIntentOffenses
    tvpaDefinition := hTvpaDefinition
    victimCarveHonored := hVictimCarveHonored
    victimCarveDefinition := hVictimCarveDefinition
    fineRegime := hFineRegime
    obstructionPenalty := hObstructionPenalty }


theorem section1591AgeProofPath_scienter_intro {c : ComplaintText}
    (hCoercion : DefinitionalTermResolves edge_1591a_incorporates_1591e2 c)
    (hCarve    : QualifyingProvisionHonored edge_1591a_exceptAsProvided_1591a1 c)
    : Section1591AgeProofPath c :=
  Section1591AgeProofPath.scienterPleaded hCoercion hCarve


theorem section1591AgeProofPath_observation_intro {c : ComplaintText}
    (hTrigger : OverrideTriggered edge_1591a1_subjectTo_1591c c)
    (hHonored : QualifyingProvisionHonored edge_1591a1_subjectTo_1591c c)
    : Section1591AgeProofPath c :=
  Section1591AgeProofPath.reasonableOpportunityToObserve hTrigger hHonored


theorem section1592Disposition_victimCarve_intro {c : ComplaintText}
    (hFires : ExceptionApplies edge_1592a_exceptAsProvided_1592b c)
    (hTvpa  : CrossActReferenceResolves edge_1592b_incorporates_tvpa103 c)
    : Section1592Disposition c :=
  Section1592Disposition.victimConductCarve hFires hTvpa


theorem section1592Disposition_predicateChain_intro {c : ComplaintText}
    (hPred    : EnumeratedReferencesResolve edges_1592a1_predicateOffenses c)
    (hPenalty : IncorporationHonored edge_1592a_incorporates_3571 c)
    : Section1592Disposition c :=
  Section1592Disposition.predicateOffenceChain hPred hPenalty


theorem ch77SliceReferenceGraphCoherent_intro {c : ComplaintText}
    (h1590 : Coherent1590 c) (h1591 : Coherent1591 c) (h1592 : Coherent1592 c)
    : Ch77SliceReferenceGraphCoherent c :=
  { s1590 := h1590, s1591 := h1591, s1592 := h1592 }

end Proving.USC.T18.Ch77.Reslice.Structure
