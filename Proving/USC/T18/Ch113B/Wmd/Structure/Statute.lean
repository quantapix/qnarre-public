











import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Structure.Types
import Proving.USC.T18.Ch113B.Wmd.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Structure

open Proving.USC.Common







structure Section2332aCIncorporationsResolve (c : ComplaintText) : Prop where
  nationalTargetExists : ReferencedSectionExists edge2332aC1IncorporatesIna101a22 c
  nationalHonored : IncorporationHonored edge2332aC1IncorporatesIna101a22 c
  destructiveDeviceTargetExists : ReferencedSectionExists edge2332aC2AIncorporates921 c
  destructiveDeviceHonored : IncorporationHonored edge2332aC2AIncorporates921 c
  biologicalAgentTargetExists : ReferencedSectionExists edge2332aC2CIncorporates178 c
  biologicalAgentHonored : IncorporationHonored edge2332aC2CIncorporates178 c
  scopeRespected : DefinitionScopeRespected edge2332aCScopedToSection c





inductive WmdTermResolutionPath (c : ComplaintText) : Prop where
  | viaDestructiveDevice921 :
      IncorporationHonored edge2332aC2AIncorporates921 c → WmdTermResolutionPath c
  | viaBiologicalAgent178 :
      IncorporationHonored edge2332aC2CIncorporates178 c → WmdTermResolutionPath c



structure Coherent2332a (c : ComplaintText) : Prop where
  definitionsResolve : Section2332aCIncorporationsResolve c
  operativeUsesDefinitions : IncorporationHonored edge2332aAIncorporatesC c
  extraterritorialUsesDefinitions : IncorporationHonored edge2332aBIncorporatesC c
  wmdTermResolves : WmdTermResolutionPath c









structure Section2332bG5IncorporationsResolve (c : ComplaintText) : Prop where
  title18TargetsExist : AllReferencedSectionsExist edges2332bG5BiTitle18 c
  title18Honored : AllIncorporationsHonored edges2332bG5BiTitle18 c
  atomicEnergyTargetsExist : AllReferencedSectionsExist edges2332bG5BiiTitle42 c
  atomicEnergyHonored : AllIncorporationsHonored edges2332bG5BiiTitle42 c
  title49TargetsExist : AllReferencedSectionsExist edges2332bG5BiiiTitle49 c
  title49Honored : AllIncorporationsHonored edges2332bG5BiiiTitle49 c
  narcoTerrorismHonored : AllIncorporationsHonored edges2332bG5BivActCite c
  scopeRespected : DefinitionScopeRespected edge2332bGScopedToSection c



structure Section2332bFInvestigativeRosterResolves (c : ComplaintText) : Prop where
  rosterTargetsExist : AllReferencedSectionsExist edges2332bFInvestigativeRoster c
  rosterHonored : AllIncorporationsHonored edges2332bFInvestigativeRoster c
  secretServiceSavings : SavingsClauseRespected edge2332bFSavings3056 c
  otherAuthoritySavings : SavingsClauseRespected edge2332bFSavingsOtherAuthority c




inductive Section2332bJurisdictionPath (c : ComplaintText) : Prop where
  | directOffense :
      IncorporationHonored edge2332bE1IncorporatesA c → Section2332bJurisdictionPath c
  | accessoryUnderSection3 :
      IncorporationHonored edge2332bE2IncorporatesS3 c → Section2332bJurisdictionPath c









structure Section2332bDanglingReference (c : ComplaintText) : Prop where
  seriousBodilyInjuryTargetMissing : ¬ ReferencedSectionExists edge2332bG3Incorporates1365g3 c



structure Coherent2332b (c : ComplaintText) : Prop where
  circumstancesResolve : IncorporationHonored edge2332bA1IncorporatesB c
  punishmentResolves : IncorporationHonored edge2332bA1IncorporatesC c
  stateLawIncorporationHonored : IncorporationHonored edge2332bA1IncorporatesStateLaw c
  stateLawCarveApplies : ExceptionApplies edge2332bA1ExceptAsProvidedD2 c
  derivativeOffenseResolves : IncorporationHonored edge2332bA2IncorporatesA1 c
  derivativePunishmentResolves : IncorporationHonored edge2332bA2IncorporatesC c
  circumstanceEnumerationResolves : IncorporationHonored edge2332bB2IncorporatesB1 c
  prosecutionRulesExist : ReferencedSectionExists edge2332bASubjectToD c
  sentencingOverrideFires : OverrideTriggered edge2332bC2NotwithstandingOtherLaw c
  jurisdictionResolves : Section2332bJurisdictionPath c
  investigativeAuthorityResolves : Section2332bFInvestigativeRosterResolves c
  facilityDefinitionResolves : IncorporationHonored edge2332bG2Incorporates1958b2 c
  terrorismEnumerationResolves : Section2332bG5IncorporationsResolve c




structure Ch113BWmdSliceCoherent (c : ComplaintText) : Prop where
  wmdCoherent : Coherent2332a c
  transnationalCoherent : Coherent2332b c

end Proving.USC.T18.Ch113B.Wmd.Structure
