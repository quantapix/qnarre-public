















import Proving.USC.T18.Ch113B.Wmd.Part3.Structure.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Structure

open Proving.USC.Common







structure Coherent2332a (c : ComplaintText) : Prop where

  definitionsScopeResolves : IncorporationHonored e2332a_ab_defs_c c

  nationalDefExists : ReferencedSectionExists e2332a_c1_ina c

  nationalDefResolves : IncorporationHonored e2332a_c1_ina c

  nationalDefCrossTitle : CrossTitleReferenceResolves e2332a_c1_ina c

  destructiveDeviceExists : ReferencedSectionExists e2332a_c2A_s921 c

  destructiveDeviceResolves : IncorporationHonored e2332a_c2A_s921 c

  bioTermsExist : ReferencedSectionExists e2332a_c2C_s178 c

  bioTermsResolve : IncorporationHonored e2332a_c2C_s178 c

  lawfulAuthorityCarveA :
    ExceptionApplies e2332a_a_lawfulAuthority c → ExceptionHonored e2332a_a_lawfulAuthority c

  lawfulAuthorityCarveB :
    ExceptionApplies e2332a_b_lawfulAuthority c → ExceptionHonored e2332a_b_lawfulAuthority c






inductive Section2332bCircumstanceIncorporation (c : ComplaintText) : Prop where

  | commerceFacility (h : IncorporationHonored e2332b_a1_b1A c)

  | commerceEffect (h : IncorporationHonored e2332b_a1_b1B c)

  | federalVictim (h : IncorporationHonored e2332b_a1_b1C c)

  | federalProperty (h : IncorporationHonored e2332b_a1_b1D c)

  | territorialSea (h : IncorporationHonored e2332b_a1_b1E c)

  | specialMaritimeJurisdiction (h : IncorporationHonored e2332b_a1_b1F c)









structure Section2332bg5IncorporationsResolve (c : ComplaintText) : Prop where

  title18Enum : EnumeratedIncorporationsResolve fctTitle18Targets c

  selfReferenceExists : ReferencedSectionExists e2332b_g5_self c

  wmdReferenceExists : ReferencedSectionExists e2332b_g5_2332a c

  atomicEnergyEnum : EnumeratedIncorporationsResolve fctAtomicEnergyTargets c

  atomicEnergyCrossTitle : CrossTitleReferenceResolves e2332b_g5_atomicEnergyAct c

  title49Enum : EnumeratedIncorporationsResolve fctTitle49Targets c

  title49CrossTitle : CrossTitleReferenceResolves e2332b_g5_title49 c

  narcoTerrorEnum : EnumeratedIncorporationsResolve fctTitle21Targets c

  narcoTerrorCrossTitle : CrossTitleReferenceResolves e2332b_g5_csiea c







structure Coherent2332b (c : ComplaintText) : Prop where

  circumstanceRefExists : ReferencedSectionExists e2332b_a1_circ_b c

  circumstancePath : Section2332bCircumstanceIncorporation c

  circumstanceReachesAllOffenders : JurisdictionalCircumstanceAttaches e2332b_b2_circ_b1 c

  jurisdictionalProofRule : ConstraintHonored e2332b_b1_subjectTo_d1 c

  stateLawAdoptionResolves : IncorporationHonored e2332b_a1_stateLaw c

  stateLawAdoptionLimited : ConstraintHonored e2332b_a1_subjectTo_d2 c

  stateLawElementsOnly : AdoptedStateLawElementsOnly e2332b_a1_stateLaw c

  penaltyRefExistsA1 : ReferencedSectionExists e2332b_a1_penalty_c c

  penaltyRefExistsA2 : ReferencedSectionExists e2332b_a2_penalty_c c

  derivativeOffenseRef : IncorporationHonored e2332b_a2_offense_a1 c

  sentencingOverride : OverrideTriggered e2332b_c2_notwithstanding c

  extraterritorialReach : IncorporationHonored e2332b_e1_extraterritorial_a c

  accessoryRefExists : ReferencedSectionExists e2332b_e2_accessory_s3 c

  accessoryRefResolves : IncorporationHonored e2332b_e2_accessory_s3 c

  agPredicateOffensesResolve : EnumeratedIncorporationsResolve agInvestigativeTargets c

  secretServiceSavings : SavingsClauseRespected e2332b_f_savings_s3056 c

  facilityDefResolves : IncorporationHonored e2332b_g2_s1958b2 c

  seriousBodilyInjuryDefResolves : IncorporationHonored e2332b_g3_s1365g3 c


  seriousBodilyInjuryTargetCurrent : ReferenceTargetIsCurrent e2332b_g3_s1365g3 c

  federalCrimeOfTerrorismIncorporations : Section2332bg5IncorporationsResolve c

end Proving.USC.T18.Ch113B.Wmd.Part3.Structure
