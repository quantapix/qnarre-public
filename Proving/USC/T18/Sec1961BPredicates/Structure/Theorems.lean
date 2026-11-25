





import Proving.USC.T18.Sec1961BPredicates.Structure.Statute

namespace Proving.USC.T18.Sec1961BPredicates.Structure

theorem coherent2314_intro {c}
    (refExists : ReferencedSectionExists edge_2314_incorporates_670 c)
    (incorporates : IncorporationHonored edge_2314_incorporates_670 c)
    (punishmentOverride : OverrideTriggered edge_2314_lexSpecialis_670 c)
    : Coherent2314 c :=
  ⟨refExists, incorporates, punishmentOverride⟩

theorem coherent2315_intro {c}
    (refExists : ReferencedSectionExists edge_2315_incorporates_670 c)
    (incorporates : IncorporationHonored edge_2315_incorporates_670 c)
    (punishmentOverride : OverrideTriggered edge_2315_lexSpecialis_670 c)
    : Coherent2315 c :=
  ⟨refExists, incorporates, punishmentOverride⟩

theorem coherent1028_intro {c}
    (drugDef : IncorporationHonored edge_1028_incorporates_929 c)
    (violenceDef : IncorporationHonored edge_1028_incorporates_924 c)
    (domTerrorDef : IncorporationHonored edge_1028_incorporates_2331_5 c)
    (intlTerrorDef : IncorporationHonored edge_1028_incorporates_2331_1 c)
    (sharedDefs : IncorporationHonored edge_1028_incorporates_1028A c)
    (accessDeviceDef : IncorporationHonored edge_1028_incorporates_1029e c)
    (forfeitureRegime : ReferencedSectionExists edge_1028_subjectTo_853 c)
    (leExempt : ExceptionApplies edge_1028_exceptAsProvided_ch224 c)
    : Coherent1028 c :=
  ⟨drugDef, violenceDef, domTerrorDef, intlTerrorDef, sharedDefs,
   accessDeviceDef, forfeitureRegime, leExempt⟩

theorem coherent1029_intro {c}
    (forfeitureRegime : ReferencedSectionExists edge_1029_subjectTo_853 c)
    (telecomDef : IncorporationHonored edge_1029_incorporates_47_153 c)
    (wireInterceptRef : ReferencedSectionExists edge_1029_incorporates_ch119 c)
    : Coherent1029 c :=
  ⟨forfeitureRegime, telecomDef, wireInterceptRef⟩

theorem coherent1955_intro {c}
    (stateLawPredicate : IncorporationHonored edge_1955_incorporates_stateLaw c)
    (creditUnionDef : IncorporationHonored edge_1955_incorporates_12_1752 c)
    (depositoryDef : IncorporationHonored edge_1955_incorporates_12_1813 c)
    (regulatorDef : IncorporationHonored edge_1955_incorporates_12_5481 c)
    (taxExemptException : ExceptionApplies edge_1955_exceptAsProvided_26_501 c)
    : Coherent1955 c :=
  ⟨stateLawPredicate, creditUnionDef, depositoryDef, regulatorDef, taxExemptException⟩

theorem coherent1084_intro {c}
    (stateSavings : SavingsPreserved edge_1084_savings_stateCriminal c)
    (legalToLegalSafeHarbor : ExceptionApplies edge_1084_exceptAsProvided_stateBetting c)
    : Coherent1084 c :=
  ⟨stateSavings, legalToLegalSafeHarbor⟩

end Proving.USC.T18.Sec1961BPredicates.Structure
