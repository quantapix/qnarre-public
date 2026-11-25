










import Proving.USC.T18.Ch113B.MaterialSupport.Structure.Types
import Proving.USC.T18.Ch113B.MaterialSupport.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Structure

open Proving.USC.Common



structure Coherent2339 (c : ComplaintText) : Prop where
  predicateCatalogResolves : CatalogIncorporationResolves catalog2339 c
  atomicEnergyActRefExists : ReferencedSectionExists edge2339aIncorporatesAtomicEnergyAct c
  aircraftPiracyRefExists : ReferencedSectionExists edge2339aIncorporatesAircraftPiracy c
  venueSavingsPreserved : SavingsClausePreserved edge2339bSavingsVenue c




structure Coherent2339A (c : ComplaintText) : Prop where
  predicateCatalogResolves : CatalogIncorporationResolves catalog2339A c
  terrorismListIncorporated : IncorporationHonored edge2339AaIncorporates2332bg5B c
  selfCarveOutHonored : CarveOutExcludesTarget edge2339AaCarveOut2339A c
  companionCarveOutHonored : CarveOutExcludesTarget edge2339AaCarveOut2339B c
  venueSavingsPreserved : SavingsClausePreserved edge2339AaSavingsVenue c







structure Coherent2339B (c : ComplaintText) : Prop where
  designationRegimeExists : ReferencedSectionExists edge2339Bg6IncorporatesDesignation c
  materialSupportDefHonored : IncorporationHonored edge2339Bg4Incorporates2339Ab1 c
  trainingDefHonored : IncorporationHonored edge2339Bg4Incorporates2339Ab2 c
  expertAdviceDefHonored : IncorporationHonored edge2339Bg4Incorporates2339Ab3 c
  terroristActivityDefHonored : IncorporationHonored edge2339Ba1IncorporatesTerroristActivity c
  terrorismDefHonored : IncorporationHonored edge2339Ba1IncorporatesTerrorism c
  designatedOrgTermMatches : DefinedTermMatchesDefinition edge2339Ba1IncorporatesG6 c
  financialInstitutionDefExists : ReferencedSectionExists edge2339Bg2IncorporatesFinancialInstitution c
  classifiedInfoDefExists : ReferencedSectionExists edge2339Bg1IncorporatesCipa c
  civilPenaltyTracksDuty : IncorporationHonored edge2339BbIncorporatesA2 c
  nationalityRefsExist : ReferencedSectionExists edge2339Bd1AIncorporatesNational c
  lprRefExists : ReferencedSectionExists edge2339Bd1AIncorporatesLpr c
  appealRouteHonored : IncorporationHonored edge2339Bf1CIncorporatesF5 c
  privilegeSavingsPreserved : SavingsClausePreserved edge2339Bf6SavingsPrivileges c
  firstAmendmentSavingsPreserved : SavingsClausePreserved edge2339BiSavingsFirstAmendment c
  specificityOver2339A : LexSpecialisControls edge2339BLexSpecialisOver2339A c




inductive Section2339BProsecutionForeclosed (c : ComplaintText) : Prop where

  | personnelNarrowing (h : ExceptionApplies edge2339BhNarrowsA1 c) :
      Section2339BProsecutionForeclosed c

  | secretaryApproval (h : ExceptionApplies edge2339BjApprovalBarsA1 c) :
      Section2339BProsecutionForeclosed c





structure Coherent2339C (c : ComplaintText) : Prop where
  jurisdictionalCircumstanceBinds : ConstraintHonored edge2339Ca1SubjectToB c
  treatyListIncorporated : IncorporationHonored edge2339Ca1AIncorporatesTreatyList c
  penaltyCrossRefHonored : IncorporationHonored edge2339Ca1IncorporatesPenalty c
  attemptPenaltyCrossRefHonored : IncorporationHonored edge2339Ca2IncorporatesPenalty c
  concealmentTracks2339B : IncorporationHonored edge2339Cc2AIncorporates2339B c
  concealmentTracksSubsectionA : IncorporationHonored edge2339Cc2BIncorporatesA c
  concealmentPenaltyCrossRefHonored : IncorporationHonored edge2339CcIncorporatesPenalty c
  predicateActDefHonored : IncorporationHonored edge2339Ce6IncorporatesA1 c
  internationalOrgDefExists : ReferencedSectionExists edge2339Ce9IncorporatesInternationalOrg c
  nationalDefExists : ReferencedSectionExists edge2339Ce12IncorporatesNational c
  materialSupportChainResolves : DefinitionChainResolves materialSupportChain c
  seriousBodilyInjuryRefDangling :
    CrossReferenceDangling edge2339Ce11IncorporatesSeriousBodilyInjuryAsEnacted c
  additionalLiabilitySavingsPreserved : SavingsClausePreserved edge2339CfSavingsOtherLiability c






structure Coherent2339D (c : ComplaintText) : Prop where
  designationRefExists : ReferencedSectionExists edge2339DaIncorporatesDesignation c
  ftoTermMatches : DefinedTermMatchesDefinition edge2339DaIncorporatesC4 c
  terroristActivityDefHonored : IncorporationHonored edge2339DaIncorporatesTerroristActivity c
  terrorismDefHonored : IncorporationHonored edge2339DaIncorporatesTerrorism c
  nationalityRefCorrected : ScrivenersCorrectionApplied edge2339Db1IncorporatesNational c
  lprRefExists : ReferencedSectionExists edge2339Db1IncorporatesLpr c
  wmdRefDangling : CrossReferenceDangling edge2339Dc1IncorporatesWmdAsEnacted c
  wmdRefCorrected : ScrivenersCorrectionApplied edge2339Dc1IncorporatesWmdCorrected c
  seriousBodilyInjuryRefExists : ReferencedSectionExists edge2339Dc2IncorporatesSeriousBodilyInjury c




structure MaterialSupportIncorporationsResolve (c : ComplaintText) : Prop where
  bIncorporatesA : IncorporationHonored edge2339Bg4Incorporates2339Ab1 c
  cIncorporatesB : IncorporationHonored edge2339Ce13Incorporates2339Bg4 c
  chainResolves : DefinitionChainResolves materialSupportChain c
  operativeDefinitionExists : ReferencedSectionExists edge2339Bg4Incorporates2339Ab1 c



structure Ch113BMaterialSupportCoherent (c : ComplaintText) : Prop where
  s2339 : Coherent2339 c
  s2339A : Coherent2339A c
  s2339B : Coherent2339B c
  s2339C : Coherent2339C c
  s2339D : Coherent2339D c
  definitionalSpine : MaterialSupportIncorporationsResolve c
  danglingCountAsMeasured : unresolvedReferenceCount chapterEdges c = knownDanglingEdgeCount

end Proving.USC.T18.Ch113B.MaterialSupport.Structure
