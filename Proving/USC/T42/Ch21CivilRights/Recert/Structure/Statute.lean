











import Proving.USC.Common.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Structure.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Structure

open Proving.USC.Common






inductive TestimonyReleasePath2000a4 (c : ComplaintText) : Prop where
  | nonReleaseHonored :
      ConstrainingSectionSatisfied edge_2000a4_exceptAsProvided_partyAgreement c →
      TestimonyReleasePath2000a4 c
  | exceptionTriggered :
      ExceptionApplies edge_2000a4_exceptAsProvided_partyAgreement c →
      TestimonyReleasePath2000a4 c





structure Coherent2000a4 (c : ComplaintText) : Prop where
  serviceDefinitionExists : ReferencedSectionExists edge_2000a4_incorporates_2000g c
  serviceDefinitionHonored : IncorporationHonored edge_2000a4_incorporates_2000g c
  referralBasisExists : ReferencedSectionExists edge_2000a4_incorporates_2000a3d c
  referralIncorporationHonored : IncorporationHonored edge_2000a4_incorporates_2000a3d c
  testimonyRelease : TestimonyReleasePath2000a4 c






structure Coherent2000a5 (c : ComplaintText) : Prop where
  subchapterRightsExist : ReferencedSectionExists edge_2000a5_incorporates_subchapterII c
  subchapterRightsHonored : IncorporationHonored edge_2000a5_incorporates_subchapterII c






structure Coherent2000d (c : ComplaintText) : Prop where
  programOrActivityDefinitionExists : ReferencedSectionExists edge_2000d_incorporates_2000d4a c
  programOrActivityHonored : IncorporationHonored edge_2000d_incorporates_2000d4a c









structure Coherent2000d1 (c : ComplaintText) : Prop where
  effectuatedSectionExists : ReferencedSectionExists edge_2000d1_incorporates_2000d c
  effectuatedSectionHonored : IncorporationHonored edge_2000d1_incorporates_2000d c
  programOrActivityHonored : IncorporationHonored edge_2000d1_incorporates_2000d4a c
  authorizingStatuteConstraintSatisfied :
    ConstrainingSectionSatisfied edge_2000d1_subjectTo_authorizingStatute c
  voluntaryComplianceProvisoSatisfied :
    ConstrainingSectionSatisfied edge_2000d1_subjectTo_voluntaryComplianceProviso c
  otherMeansPreserved : SavingsClausePreserves edge_2000d1_savings_otherMeans c










structure Section2000d4aIncorporationsResolve (c : ComplaintText) : Prop where
  leaDefinitionExists : ReferencedSectionExists edge_2000d4a_incorporates_20usc7801 c
  leaDefinitionHonored : IncorporationHonored edge_2000d4a_incorporates_20usc7801 c






inductive AbrogationPath2000d7 (c : ComplaintText) : Prop where
  | rehab504 : IncorporationHonored edge_2000d7_incorporates_29usc794 c → AbrogationPath2000d7 c
  | titleIX : IncorporationHonored edge_2000d7_incorporates_20usc1681 c → AbrogationPath2000d7 c
  | ageAct : IncorporationHonored edge_2000d7_incorporates_42usc6101 c → AbrogationPath2000d7 c
  | titleVI : IncorporationHonored edge_2000d7_incorporates_2000d c → AbrogationPath2000d7 c
  | otherFederalStatute :
      OpenClassReferenceIdentified edge_2000d7_incorporates_openClass c →
      AbrogationPath2000d7 c






structure Coherent2000d7 (c : ComplaintText) : Prop where
  rehab504Exists : ReferencedSectionExists edge_2000d7_incorporates_29usc794 c
  titleIXExists : ReferencedSectionExists edge_2000d7_incorporates_20usc1681 c
  ageActExists : ReferencedSectionExists edge_2000d7_incorporates_42usc6101 c
  titleVIExists : ReferencedSectionExists edge_2000d7_incorporates_2000d c
  predicateStatuteResolves : AbrogationPath2000d7 c
  remediesBaseResolves : IncorporationHonored edge_2000d7a2_incorporates_2000d7a1 c
  eleventhAmendmentOverride : OverrideTriggered edge_2000d7_notwithstanding_amend11 c
  effectiveDateConstraint : ConstrainingSectionSatisfied edge_2000d7a_subjectTo_2000d7b c

end Proving.USC.T42.Ch21CivilRights.Recert.Structure
