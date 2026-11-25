import Proving.USC.T18.Ch113B.Wmd.Part2.Structure.Predicates




















set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Structure

open Proving.USC.Common





inductive Section2332bCircumstanceRefSatisfied (c : ComplaintText) : Prop
  | mailOrCommerceFacility :
      InternalCrossReferenceResolves edge_2332b_a1_incorporates_b1A c →
      Section2332bCircumstanceRefSatisfied c
  | affectsCommerce :
      InternalCrossReferenceResolves edge_2332b_a1_incorporates_b1B c →
      Section2332bCircumstanceRefSatisfied c
  | federalVictim :
      InternalCrossReferenceResolves edge_2332b_a1_incorporates_b1C c →
      Section2332bCircumstanceRefSatisfied c
  | federalProperty :
      InternalCrossReferenceResolves edge_2332b_a1_incorporates_b1D c →
      Section2332bCircumstanceRefSatisfied c
  | territorialSea :
      InternalCrossReferenceResolves edge_2332b_a1_incorporates_b1E c →
      Section2332bCircumstanceRefSatisfied c
  | specialMaritimeAndTerritorialJurisdiction :
      InternalCrossReferenceResolves edge_2332b_a1_incorporates_b1F c →
      Section2332bCircumstanceRefSatisfied c



inductive Section2332bOverridePath (c : ComplaintText) : Prop
  | probationBar :
      OverrideTriggered edge_2332b_c2_notwithstanding_probation c →
      Section2332bOverridePath c
  | concurrentSentenceBar :
      OverrideTriggered edge_2332b_c2_notwithstanding_concurrentTerm c →
      Section2332bOverridePath c




structure Section2332bInternalCoherence (c : ComplaintText) : Prop where
  circumstancePull       : InternalCrossReferenceResolves edge_2332b_a1_incorporates_b c
  circumstanceBackRef    : InternalCrossReferenceResolves edge_2332b_b1_incorporates_a c
  penaltyPull_a1         : InternalCrossReferenceResolves edge_2332b_a1_subjectTo_c c
  penaltyPull_a2         : InternalCrossReferenceResolves edge_2332b_a2_subjectTo_c c
  inchoatePull           : InternalCrossReferenceResolves edge_2332b_a2_incorporates_a1 c
  precisePull_b2         : InternalCrossReferenceResolves edge_2332b_b2_incorporates_b1AF c
  penaltyBackRef         : InternalCrossReferenceResolves edge_2332b_c1_incorporates_a c
  proofRulesPull         : InternalCrossReferenceResolves edge_2332b_d_incorporates_a c
  extraterritorialPull   : InternalCrossReferenceResolves edge_2332b_e1_incorporates_a c
  jurisdictionalScienter : InternalCrossReferenceResolves edge_2332b_d1_lexSpecialis_b c
  stateLawLimiter        : InternalCrossReferenceResolves edge_2332b_d2_lexSpecialis_a1StateLaw c








structure Section2332bDefinitionalCoherence (c : ComplaintText) : Prop where
  transcendingBoundaries      : InternalCrossReferenceResolves edge_2332b_a1_incorporates_g1 c
  commerceFacilityTerm        : InternalCrossReferenceResolves edge_2332b_b1A_incorporates_g2 c
  commerceFacilityTarget      : ReferencedSubdivisionExists edge_2332b_g2_incorporates_1958b2 c
  seriousBodilyInjuryTerm     : InternalCrossReferenceResolves edge_2332b_a1_incorporates_g3 c
  seriousBodilyInjuryHost     : ReferencedSectionExists edge_2332b_g3_incorporates_1365g3 c
  seriousBodilyInjuryAsEnacted : ReferencedSubdivisionExists edge_2332b_g3_incorporates_1365g3 c
  seriousBodilyInjuryTarget   : ReferencedSubdivisionExists edge_2332b_g3_incorporates_1365h3_evidentSense c
  territorialSeaTerm          : InternalCrossReferenceResolves edge_2332b_b1E_incorporates_g4 c
  smtjTerm                    : ReferencedSectionExists edge_2332b_b1F_incorporates_s7 c





structure Section2332bg5IncorporationsResolve (c : ComplaintText) : Prop where
  title18Roster    : EnumeratedRosterFullyResolves edge_2332b_g5Bi_incorporates_t18Roster c
  title18Honored   : IncorporationHonored edge_2332b_g5Bi_incorporates_t18Roster c
  selfReference    : ReferencedSectionExists edge_2332b_g5Bi_incorporates_self c
  atomicEnergyAct  : EnumeratedRosterFullyResolves edge_2332b_g5Bii_incorporates_aea c
  title49          : EnumeratedRosterFullyResolves edge_2332b_g5Biii_incorporates_t49 c
  narcoTerrorism   : ReferencedSectionExists edge_2332b_g5Biv_incorporates_csiea1010a c




structure Section2332bInvestigativeAllocationCoherence (c : ComplaintText) : Prop where
  definedTermPull  : InternalCrossReferenceResolves edge_2332b_f_incorporates_g5 c
  complementRoster : EnumeratedRosterFullyResolves edge_2332b_f_incorporates_t18Complement c
  secretService    : SavingsClausePreserved edge_2332b_f_savings_s3056 c


structure Coherent2332b (c : ComplaintText) : Prop where
  internal        : Section2332bInternalCoherence c
  definitional    : Section2332bDefinitionalCoherence c
  federalCrimeDef : Section2332bg5IncorporationsResolve c
  allocation      : Section2332bInvestigativeAllocationCoherence c
  circumstance    : Section2332bCircumstanceRefSatisfied c
  circumstanceFit : ReferenceScopeIsCoextensive edge_2332b_a1_incorporates_b c
  preciseFit      : ReferenceScopeIsCoextensive edge_2332b_b2_incorporates_b1AF c
  stateLaw        : AdoptedStateLawLimitedToElements edge_2332b_a1_incorporates_stateLaw c
  accessory       : ReferencedSectionExists edge_2332b_e2_incorporates_s3 c
  penaltyCoverage : PenaltyPrescriptionCoversConduct edge_2332b_a1_subjectTo_c c
  override        : Section2332bOverridePath c

end Proving.USC.T18.Ch113B.Wmd.Part2.Structure
