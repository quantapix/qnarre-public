


import Proving.USC.Common.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Structure.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Structure.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Structure

open Proving.USC.Common



theorem testimonyReleasePath2000a4_nonRelease_intro {c : ComplaintText}
    (h : ConstrainingSectionSatisfied edge_2000a4_exceptAsProvided_partyAgreement c) :
    TestimonyReleasePath2000a4 c :=
  .nonReleaseHonored h

theorem testimonyReleasePath2000a4_exception_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2000a4_exceptAsProvided_partyAgreement c) :
    TestimonyReleasePath2000a4 c :=
  .exceptionTriggered h

theorem coherent2000a4_intro {c : ComplaintText}
    (hServiceExists : ReferencedSectionExists edge_2000a4_incorporates_2000g c)
    (hServiceHonored : IncorporationHonored edge_2000a4_incorporates_2000g c)
    (hReferralExists : ReferencedSectionExists edge_2000a4_incorporates_2000a3d c)
    (hReferralHonored : IncorporationHonored edge_2000a4_incorporates_2000a3d c)
    (hTestimony : TestimonyReleasePath2000a4 c) :
    Coherent2000a4 c :=
  ⟨hServiceExists, hServiceHonored, hReferralExists, hReferralHonored, hTestimony⟩



theorem coherent2000a5_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000a5_incorporates_subchapterII c)
    (hHonored : IncorporationHonored edge_2000a5_incorporates_subchapterII c) :
    Coherent2000a5 c :=
  ⟨hExists, hHonored⟩



theorem coherent2000d_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000d_incorporates_2000d4a c)
    (hHonored : IncorporationHonored edge_2000d_incorporates_2000d4a c) :
    Coherent2000d c :=
  ⟨hExists, hHonored⟩



theorem coherent2000d1_intro {c : ComplaintText}
    (hEffectuatedExists : ReferencedSectionExists edge_2000d1_incorporates_2000d c)
    (hEffectuatedHonored : IncorporationHonored edge_2000d1_incorporates_2000d c)
    (hProgramHonored : IncorporationHonored edge_2000d1_incorporates_2000d4a c)
    (hAuthorizing : ConstrainingSectionSatisfied edge_2000d1_subjectTo_authorizingStatute c)
    (hProviso : ConstrainingSectionSatisfied edge_2000d1_subjectTo_voluntaryComplianceProviso c)
    (hSavings : SavingsClausePreserves edge_2000d1_savings_otherMeans c) :
    Coherent2000d1 c :=
  ⟨hEffectuatedExists, hEffectuatedHonored, hProgramHonored, hAuthorizing, hProviso, hSavings⟩



theorem section2000d4aIncorporationsResolve_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2000d4a_incorporates_20usc7801 c)
    (hHonored : IncorporationHonored edge_2000d4a_incorporates_20usc7801 c) :
    Section2000d4aIncorporationsResolve c :=
  ⟨hExists, hHonored⟩



theorem abrogationPath2000d7_rehab504_intro {c : ComplaintText}
    (h : IncorporationHonored edge_2000d7_incorporates_29usc794 c) :
    AbrogationPath2000d7 c :=
  .rehab504 h

theorem abrogationPath2000d7_titleIX_intro {c : ComplaintText}
    (h : IncorporationHonored edge_2000d7_incorporates_20usc1681 c) :
    AbrogationPath2000d7 c :=
  .titleIX h

theorem abrogationPath2000d7_ageAct_intro {c : ComplaintText}
    (h : IncorporationHonored edge_2000d7_incorporates_42usc6101 c) :
    AbrogationPath2000d7 c :=
  .ageAct h

theorem abrogationPath2000d7_titleVI_intro {c : ComplaintText}
    (h : IncorporationHonored edge_2000d7_incorporates_2000d c) :
    AbrogationPath2000d7 c :=
  .titleVI h

theorem abrogationPath2000d7_otherFederalStatute_intro {c : ComplaintText}
    (h : OpenClassReferenceIdentified edge_2000d7_incorporates_openClass c) :
    AbrogationPath2000d7 c :=
  .otherFederalStatute h

theorem coherent2000d7_intro {c : ComplaintText}
    (hRehab : ReferencedSectionExists edge_2000d7_incorporates_29usc794 c)
    (hTitleIX : ReferencedSectionExists edge_2000d7_incorporates_20usc1681 c)
    (hAgeAct : ReferencedSectionExists edge_2000d7_incorporates_42usc6101 c)
    (hTitleVI : ReferencedSectionExists edge_2000d7_incorporates_2000d c)
    (hPath : AbrogationPath2000d7 c)
    (hRemediesBase : IncorporationHonored edge_2000d7a2_incorporates_2000d7a1 c)
    (hOverride : OverrideTriggered edge_2000d7_notwithstanding_amend11 c)
    (hEffective : ConstrainingSectionSatisfied edge_2000d7a_subjectTo_2000d7b c) :
    Coherent2000d7 c :=
  ⟨hRehab, hTitleIX, hAgeAct, hTitleVI, hPath, hRemediesBase, hOverride, hEffective⟩

end Proving.USC.T42.Ch21CivilRights.Recert.Structure
