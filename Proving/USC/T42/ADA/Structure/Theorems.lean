








import Proving.USC.T42.ADA.Structure.Types
import Proving.USC.T42.ADA.Structure.Predicates
import Proving.USC.T42.ADA.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Structure

open Proving.USC.Common

theorem coherent12102_intro {c : ComplaintText}
    (hReg   : ReferencedSectionExists edge_12102_incorporates_12102_3 c)
    (hRegH  : IncorporationHonored edge_12102_incorporates_12102_3 c)
    (hCons  : SavingsPreserved edge_12102_savings_construction c)
    : Coherent12102 c :=
  { regardedAsResolves := hReg, regardedAsHonored := hRegH, constructionPreserved := hCons }

theorem coherent12111_intro {c : ComplaintText}
    (hEeoc  : ReferencedSectionExists edge_12111_incorporates_2000e_4 c)
    (hVII   : ReferencedSectionExists edge_12111_incorporates_2000e c)
    (hClub  : ReferencedSectionExists edge_12111_incorporates_26_501c c)
    (hCsa   : ReferencedSectionExists edge_12111_incorporates_21_801 c)
    (hSub   : ReferencedSectionExists edge_12111_incorporates_21_812 c)
    : Coherent12111 c :=
  { eeocExists := hEeoc, titleVIIDefsExist := hVII, exemptClubExists := hClub,
    csaScheduleExists := hCsa, controlledSubstExists := hSub }

theorem coherent12112_intro {c : ComplaintText}
    (hDef   : ReferencedSectionExists edge_12112_incorporates_12111 c)
    (hDefH  : IncorporationHonored edge_12112_incorporates_12111 c)
    (hDis   : ReferencedSectionExists edge_12112_incorporates_12102 c)
    (hDisH  : IncorporationHonored edge_12112_incorporates_12102 c)
    (hExc   : ExceptionApplies edge_12112_exceptAsProvided_12112_d3 c)
    : Coherent12112 c :=
  { defnsExist := hDef, defnsHonored := hDefH, disabilityExists := hDis,
    disabilityHonored := hDisH, examExceptionApplies := hExc }

theorem coherent12131_intro {c : ComplaintText}
    (hAmtrak : ReferencedSectionExists edge_12131_incorporates_49_24102 c)
    : Coherent12131 c :=
  { amtrakDefnExists := hAmtrak }

theorem coherent12132_intro {c : ComplaintText}
    (hDef   : ReferencedSectionExists edge_12132_incorporates_12131 c)
    (hDefH  : IncorporationHonored edge_12132_incorporates_12131 c)
    (hSubj  : SubjectionSatisfied edge_12132_subjectTo_subchapterII c)
    : Coherent12132 c :=
  { defnsExist := hDef, defnsHonored := hDefH, subjectionMet := hSubj }

theorem coherent12181_intro {c : ComplaintText}
    (hPub   : ReferencedSectionExists edge_12181_incorporates_12131 c)
    (hPubH  : IncorporationHonored edge_12181_incorporates_12131 c)
    (hRail  : ReferencedSectionExists edge_12181_incorporates_49_20102 c)
    : Coherent12181 c :=
  { publicEntityExists := hPub, publicEntityHonored := hPubH, railDefnExists := hRail }

theorem coherent12182_intro {c : ComplaintText}
    (hDef   : ReferencedSectionExists edge_12182_incorporates_12181 c)
    (hDefH  : IncorporationHonored edge_12182_incorporates_12181 c)
    (hOver  : OverrideTriggered edge_12182_notwithstanding_separatePrograms c)
    (hSave  : SavingsPreserved edge_12182_savings_directThreat c)
    : Coherent12182 c :=
  { defnsExist := hDef, defnsHonored := hDefH, integrationOverride := hOver,
    directThreatSavings := hSave }

theorem coherent12203_intro {c : ComplaintText}
    (hSubExists : ReferencedSectionExists edge_12203_incorporates_chapter c)
    (hSubHonored : IncorporationHonored edge_12203_incorporates_chapter c)
    (hRoute : RemedyRoutingResolved c)
    : Coherent12203 c :=
  { substantiveExists := hSubExists, substantiveHonored := hSubHonored, remedyRouted := hRoute }

end Proving.USC.T42.ADA.Structure
