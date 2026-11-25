import Proving.USC.T18.Ch113B.Wmd.Part2.Structure.Statute








set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Structure

open Proving.USC.Common

theorem section2332bInternalCoherence_intro {c : ComplaintText}
    (hCircPull : InternalCrossReferenceResolves edge_2332b_a1_incorporates_b c)
    (hCircBack : InternalCrossReferenceResolves edge_2332b_b1_incorporates_a c)
    (hPen1 : InternalCrossReferenceResolves edge_2332b_a1_subjectTo_c c)
    (hPen2 : InternalCrossReferenceResolves edge_2332b_a2_subjectTo_c c)
    (hInchoate : InternalCrossReferenceResolves edge_2332b_a2_incorporates_a1 c)
    (hPrecise : InternalCrossReferenceResolves edge_2332b_b2_incorporates_b1AF c)
    (hPenBack : InternalCrossReferenceResolves edge_2332b_c1_incorporates_a c)
    (hProof : InternalCrossReferenceResolves edge_2332b_d_incorporates_a c)
    (hExtra : InternalCrossReferenceResolves edge_2332b_e1_incorporates_a c)
    (hScienter : InternalCrossReferenceResolves edge_2332b_d1_lexSpecialis_b c)
    (hLimiter : InternalCrossReferenceResolves edge_2332b_d2_lexSpecialis_a1StateLaw c)
    : Section2332bInternalCoherence c :=
  { circumstancePull := hCircPull
    circumstanceBackRef := hCircBack
    penaltyPull_a1 := hPen1
    penaltyPull_a2 := hPen2
    inchoatePull := hInchoate
    precisePull_b2 := hPrecise
    penaltyBackRef := hPenBack
    proofRulesPull := hProof
    extraterritorialPull := hExtra
    jurisdictionalScienter := hScienter
    stateLawLimiter := hLimiter }

theorem section2332bDefinitionalCoherence_intro {c : ComplaintText}
    (hTrans : InternalCrossReferenceResolves edge_2332b_a1_incorporates_g1 c)
    (hFacTerm : InternalCrossReferenceResolves edge_2332b_b1A_incorporates_g2 c)
    (hFacTarget : ReferencedSubdivisionExists edge_2332b_g2_incorporates_1958b2 c)
    (hSbiTerm : InternalCrossReferenceResolves edge_2332b_a1_incorporates_g3 c)
    (hSbiHost : ReferencedSectionExists edge_2332b_g3_incorporates_1365g3 c)
    (hSbiEnacted : ReferencedSubdivisionExists edge_2332b_g3_incorporates_1365g3 c)
    (hSbiEvident : ReferencedSubdivisionExists edge_2332b_g3_incorporates_1365h3_evidentSense c)
    (hSea : InternalCrossReferenceResolves edge_2332b_b1E_incorporates_g4 c)
    (hSmtj : ReferencedSectionExists edge_2332b_b1F_incorporates_s7 c)
    : Section2332bDefinitionalCoherence c :=
  { transcendingBoundaries := hTrans
    commerceFacilityTerm := hFacTerm
    commerceFacilityTarget := hFacTarget
    seriousBodilyInjuryTerm := hSbiTerm
    seriousBodilyInjuryHost := hSbiHost
    seriousBodilyInjuryAsEnacted := hSbiEnacted
    seriousBodilyInjuryTarget := hSbiEvident
    territorialSeaTerm := hSea
    smtjTerm := hSmtj }

theorem section2332bg5IncorporationsResolve_intro {c : ComplaintText}
    (hRoster : EnumeratedRosterFullyResolves edge_2332b_g5Bi_incorporates_t18Roster c)
    (hHonored : IncorporationHonored edge_2332b_g5Bi_incorporates_t18Roster c)
    (hSelf : ReferencedSectionExists edge_2332b_g5Bi_incorporates_self c)
    (hAea : EnumeratedRosterFullyResolves edge_2332b_g5Bii_incorporates_aea c)
    (hT49 : EnumeratedRosterFullyResolves edge_2332b_g5Biii_incorporates_t49 c)
    (hNarco : ReferencedSectionExists edge_2332b_g5Biv_incorporates_csiea1010a c)
    : Section2332bg5IncorporationsResolve c :=
  { title18Roster := hRoster
    title18Honored := hHonored
    selfReference := hSelf
    atomicEnergyAct := hAea
    title49 := hT49
    narcoTerrorism := hNarco }

theorem section2332bInvestigativeAllocationCoherence_intro {c : ComplaintText}
    (hTerm : InternalCrossReferenceResolves edge_2332b_f_incorporates_g5 c)
    (hList : EnumeratedRosterFullyResolves edge_2332b_f_incorporates_t18Complement c)
    (hSaved : SavingsClausePreserved edge_2332b_f_savings_s3056 c)
    : Section2332bInvestigativeAllocationCoherence c :=
  { definedTermPull := hTerm
    complementRoster := hList
    secretService := hSaved }



theorem section2332bCircumstanceRefSatisfied_intro {c : ComplaintText}
    (h : InternalCrossReferenceResolves edge_2332b_a1_incorporates_b1A c)
    : Section2332bCircumstanceRefSatisfied c :=
  .mailOrCommerceFacility h


theorem section2332bOverridePath_intro {c : ComplaintText}
    (h : OverrideTriggered edge_2332b_c2_notwithstanding_probation c)
    : Section2332bOverridePath c :=
  .probationBar h



theorem section2332bOverridePath_concurrent_intro {c : ComplaintText}
    (h : OverrideTriggered edge_2332b_c2_notwithstanding_concurrentTerm c)
    : Section2332bOverridePath c :=
  .concurrentSentenceBar h

theorem coherent2332b_intro {c : ComplaintText}
    (hInternal : Section2332bInternalCoherence c)
    (hDefinitional : Section2332bDefinitionalCoherence c)
    (hFctDef : Section2332bg5IncorporationsResolve c)
    (hAllocation : Section2332bInvestigativeAllocationCoherence c)
    (hCircumstance : Section2332bCircumstanceRefSatisfied c)
    (hCircFit : ReferenceScopeIsCoextensive edge_2332b_a1_incorporates_b c)
    (hPreciseFit : ReferenceScopeIsCoextensive edge_2332b_b2_incorporates_b1AF c)
    (hStateLaw : AdoptedStateLawLimitedToElements edge_2332b_a1_incorporates_stateLaw c)
    (hAccessory : ReferencedSectionExists edge_2332b_e2_incorporates_s3 c)
    (hPenalty : PenaltyPrescriptionCoversConduct edge_2332b_a1_subjectTo_c c)
    (hOverride : Section2332bOverridePath c)
    : Coherent2332b c :=
  { internal := hInternal
    definitional := hDefinitional
    federalCrimeDef := hFctDef
    allocation := hAllocation
    circumstance := hCircumstance
    circumstanceFit := hCircFit
    preciseFit := hPreciseFit
    stateLaw := hStateLaw
    accessory := hAccessory
    penaltyCoverage := hPenalty
    override := hOverride }

end Proving.USC.T18.Ch113B.Wmd.Part2.Structure
