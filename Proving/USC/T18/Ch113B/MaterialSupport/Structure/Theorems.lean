


import Proving.USC.T18.Ch113B.MaterialSupport.Structure.Types
import Proving.USC.T18.Ch113B.MaterialSupport.Structure.Predicates
import Proving.USC.T18.Ch113B.MaterialSupport.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Structure

open Proving.USC.Common

theorem coherent2339_intro {c : ComplaintText}
    (hCat : CatalogIncorporationResolves catalog2339 c)
    (hAea : ReferencedSectionExists edge2339aIncorporatesAtomicEnergyAct c)
    (hPiracy : ReferencedSectionExists edge2339aIncorporatesAircraftPiracy c)
    (hVenue : SavingsClausePreserved edge2339bSavingsVenue c) :
    Coherent2339 c :=
  ⟨hCat, hAea, hPiracy, hVenue⟩

theorem coherent2339A_intro {c : ComplaintText}
    (hCat : CatalogIncorporationResolves catalog2339A c)
    (hList : IncorporationHonored edge2339AaIncorporates2332bg5B c)
    (hSelf : CarveOutExcludesTarget edge2339AaCarveOut2339A c)
    (hComp : CarveOutExcludesTarget edge2339AaCarveOut2339B c)
    (hVenue : SavingsClausePreserved edge2339AaSavingsVenue c) :
    Coherent2339A c :=
  ⟨hCat, hList, hSelf, hComp, hVenue⟩

theorem coherent2339B_intro {c : ComplaintText}
    (hDesig : ReferencedSectionExists edge2339Bg6IncorporatesDesignation c)
    (hMs : IncorporationHonored edge2339Bg4Incorporates2339Ab1 c)
    (hTrain : IncorporationHonored edge2339Bg4Incorporates2339Ab2 c)
    (hExpert : IncorporationHonored edge2339Bg4Incorporates2339Ab3 c)
    (hActivity : IncorporationHonored edge2339Ba1IncorporatesTerroristActivity c)
    (hTerrorism : IncorporationHonored edge2339Ba1IncorporatesTerrorism c)
    (hTerm : DefinedTermMatchesDefinition edge2339Ba1IncorporatesG6 c)
    (hFi : ReferencedSectionExists edge2339Bg2IncorporatesFinancialInstitution c)
    (hCipa : ReferencedSectionExists edge2339Bg1IncorporatesCipa c)
    (hPenalty : IncorporationHonored edge2339BbIncorporatesA2 c)
    (hNational : ReferencedSectionExists edge2339Bd1AIncorporatesNational c)
    (hLpr : ReferencedSectionExists edge2339Bd1AIncorporatesLpr c)
    (hAppeal : IncorporationHonored edge2339Bf1CIncorporatesF5 c)
    (hPriv : SavingsClausePreserved edge2339Bf6SavingsPrivileges c)
    (hFirstAm : SavingsClausePreserved edge2339BiSavingsFirstAmendment c)
    (hSpecific : LexSpecialisControls edge2339BLexSpecialisOver2339A c) :
    Coherent2339B c :=
  ⟨hDesig, hMs, hTrain, hExpert, hActivity, hTerrorism, hTerm, hFi, hCipa,
   hPenalty, hNational, hLpr, hAppeal, hPriv, hFirstAm, hSpecific⟩

theorem section2339BProsecutionForeclosed_personnelNarrowing_intro {c : ComplaintText}
    (h : ExceptionApplies edge2339BhNarrowsA1 c) :
    Section2339BProsecutionForeclosed c :=
  .personnelNarrowing h

theorem section2339BProsecutionForeclosed_secretaryApproval_intro {c : ComplaintText}
    (h : ExceptionApplies edge2339BjApprovalBarsA1 c) :
    Section2339BProsecutionForeclosed c :=
  .secretaryApproval h

theorem coherent2339C_intro {c : ComplaintText}
    (hJur : ConstraintHonored edge2339Ca1SubjectToB c)
    (hTreaty : IncorporationHonored edge2339Ca1AIncorporatesTreatyList c)
    (hPen1 : IncorporationHonored edge2339Ca1IncorporatesPenalty c)
    (hPen2 : IncorporationHonored edge2339Ca2IncorporatesPenalty c)
    (hConceal2339B : IncorporationHonored edge2339Cc2AIncorporates2339B c)
    (hConcealA : IncorporationHonored edge2339Cc2BIncorporatesA c)
    (hPen3 : IncorporationHonored edge2339CcIncorporatesPenalty c)
    (hPredAct : IncorporationHonored edge2339Ce6IncorporatesA1 c)
    (hIntlOrg : ReferencedSectionExists edge2339Ce9IncorporatesInternationalOrg c)
    (hNational : ReferencedSectionExists edge2339Ce12IncorporatesNational c)
    (hChain : DefinitionChainResolves materialSupportChain c)
    (hDangling :
      CrossReferenceDangling edge2339Ce11IncorporatesSeriousBodilyInjuryAsEnacted c)
    (hSavings : SavingsClausePreserved edge2339CfSavingsOtherLiability c) :
    Coherent2339C c :=
  ⟨hJur, hTreaty, hPen1, hPen2, hConceal2339B, hConcealA, hPen3, hPredAct,
   hIntlOrg, hNational, hChain, hDangling, hSavings⟩

theorem coherent2339D_intro {c : ComplaintText}
    (hDesig : ReferencedSectionExists edge2339DaIncorporatesDesignation c)
    (hTerm : DefinedTermMatchesDefinition edge2339DaIncorporatesC4 c)
    (hActivity : IncorporationHonored edge2339DaIncorporatesTerroristActivity c)
    (hTerrorism : IncorporationHonored edge2339DaIncorporatesTerrorism c)
    (hNationalFix : ScrivenersCorrectionApplied edge2339Db1IncorporatesNational c)
    (hLpr : ReferencedSectionExists edge2339Db1IncorporatesLpr c)
    (hWmdDangling : CrossReferenceDangling edge2339Dc1IncorporatesWmdAsEnacted c)
    (hWmdFix : ScrivenersCorrectionApplied edge2339Dc1IncorporatesWmdCorrected c)
    (hSbi : ReferencedSectionExists edge2339Dc2IncorporatesSeriousBodilyInjury c) :
    Coherent2339D c :=
  ⟨hDesig, hTerm, hActivity, hTerrorism, hNationalFix, hLpr, hWmdDangling,
   hWmdFix, hSbi⟩

theorem materialSupportIncorporationsResolve_intro {c : ComplaintText}
    (hBA : IncorporationHonored edge2339Bg4Incorporates2339Ab1 c)
    (hCB : IncorporationHonored edge2339Ce13Incorporates2339Bg4 c)
    (hChain : DefinitionChainResolves materialSupportChain c)
    (hExists : ReferencedSectionExists edge2339Bg4Incorporates2339Ab1 c) :
    MaterialSupportIncorporationsResolve c :=
  ⟨hBA, hCB, hChain, hExists⟩

theorem ch113BMaterialSupportCoherent_intro {c : ComplaintText}
    (h2339 : Coherent2339 c)
    (h2339A : Coherent2339A c)
    (h2339B : Coherent2339B c)
    (h2339C : Coherent2339C c)
    (h2339D : Coherent2339D c)
    (hSpine : MaterialSupportIncorporationsResolve c)
    (hCount : unresolvedReferenceCount chapterEdges c = knownDanglingEdgeCount) :
    Ch113BMaterialSupportCoherent c :=
  ⟨h2339, h2339A, h2339B, h2339C, h2339D, hSpine, hCount⟩

end Proving.USC.T18.Ch113B.MaterialSupport.Structure
