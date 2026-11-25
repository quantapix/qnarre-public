






import Proving.USC.T42.TitleVIIEnf.Structure.Statute

namespace Proving.USC.T42.TitleVIIEnf.Structure

open Proving.USC.Common

theorem coherent2000e4_intro {c : ComplaintText}
    (litExists : ReferencedSectionExists edge_2000e4_incorporates_2000e5 c)
    (litHonored : IncorporationHonored edge_2000e4_incorporates_2000e5 c)
    (agHonored : IncorporationHonored edge_2000e4_incorporates_2000e6 c)
    (intervHonored : IncorporationHonored edge_2000e4g_incorporates_2000e5 c)
    (gcException : ExceptionApplies edge_2000e4_exceptAsProvided_2000e4b c)
    (hatchOverride : OverrideTriggered edge_2000e4_notwithstanding_t5s7324 c)
    : Coherent2000e4 c :=
  ⟨litExists, litHonored, agHonored, intervHonored, gcException, hatchOverride⟩

theorem coherent2000e5_intro {c : ComplaintText}
    (uep2Exists : ReferencedSectionExists edge_2000e5_incorporates_2000e2 c)
    (uep2Honored : IncorporationHonored edge_2000e5_incorporates_2000e2 c)
    (uep3Honored : IncorporationHonored edge_2000e5_incorporates_2000e3 c)
    (mixedMotive : IncorporationHonored edge_2000e5g_incorporates_2000e2m c)
    (damagesRelief : IncorporationHonored edge_2000e5g_incorporates_1981a c)
    (norrisOverride : OverrideTriggered edge_2000e5_notwithstanding_t29ch6 c)
    : Coherent2000e5 c :=
  ⟨uep2Exists, uep2Honored, uep3Honored, mixedMotive, damagesRelief, norrisOverride⟩

theorem coherent2000e6_intro {c : ComplaintText}
    (procExists : ReferencedSectionExists edge_2000e6_incorporates_2000e5 c)
    (procHonored : IncorporationHonored edge_2000e6_incorporates_2000e5 c)
    (reorgConstraint : ConstraintSatisfied edge_2000e6_subjectTo_t5ch9 c)
    : Coherent2000e6 c :=
  ⟨procExists, procHonored, reorgConstraint⟩

theorem coherent2000e8_intro {c : ComplaintText}
    (chargeExists : ReferencedSectionExists edge_2000e8_incorporates_2000e5 c)
    (chargeHonored : IncorporationHonored edge_2000e8_incorporates_2000e5 c)
    (payOverride : OverrideTriggered edge_2000e8_notwithstanding_otherLaw c)
    : Coherent2000e8 c :=
  ⟨chargeExists, chargeHonored, payOverride⟩

theorem coherent2000e9_intro {c : ComplaintText}
    (nlraExists : ReferencedSectionExists edge_2000e9_incorporates_t29s161 c)
    (nlraHonored : IncorporationHonored edge_2000e9_incorporates_t29s161 c)
    : Coherent2000e9 c :=
  ⟨nlraExists, nlraHonored⟩

theorem coherent2000e12_intro {c : ComplaintText}
    (apaExists : ReferencedSectionExists edge_2000e12_subjectTo_t5apa c)
    (apaConstraint : ConstraintSatisfied edge_2000e12_subjectTo_t5apa c)
    (relianceSavings : SavingsHonored edge_2000e12_savings_reliance c)
    : Coherent2000e12 c :=
  ⟨apaExists, apaConstraint, relianceSavings⟩

theorem coherent2000e16_intro {c : ComplaintText}
    (remedyExists : ReferencedSectionExists edge_2000e16_incorporates_2000e5 c)
    (remedyHonored : IncorporationHonored edge_2000e16_incorporates_2000e5 c)
    (fkHonored : IncorporationHonored edge_2000e16_incorporates_2000e5fk c)
    (e3Honored : IncorporationHonored edge_2000e16_incorporates_2000e5e3 c)
    (authException : ExceptionApplies edge_2000e16_exceptAsProvided_self c)
    (dutySavings : SavingsHonored edge_2000e16_savings_constitution c)
    : Coherent2000e16 c :=
  ⟨remedyExists, remedyHonored, fkHonored, e3Honored, authException, dutySavings⟩

theorem enforcementAuthorityResolved_byAG_intro {c : ComplaintText}
    (h : IncorporationHonored edge_2000e6_incorporates_2000e5 c)
    : EnforcementAuthorityResolved c :=
  .byAttorneyGeneral h

theorem enforcementAuthorityResolved_byCommission_intro {c : ComplaintText}
    (h : IncorporationHonored edge_2000e6_incorporates_2000e5 c)
    (hc : ConstraintSatisfied edge_2000e6_subjectTo_t5ch9 c)
    : EnforcementAuthorityResolved c :=
  .byCommission h hc

end Proving.USC.T42.TitleVIIEnf.Structure
