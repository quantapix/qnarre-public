







import Proving.USC.T42.GoldenAdjacent.Ontology.Statute

namespace Proving.USC.T42.GoldenAdjacent.Ontology

open Proving.USC.Common


theorem propertyRightMembership_intro
    {x e p w c}
    (hCitizen : IsCitizen x c)
    (hExercise : IsPropertyRightExercise e c)
    (hProperty : IsProperty p c)
    (hComparator : IsWhiteCitizenComparator w c)
    : PropertyRightMembership x e p w c :=
  ⟨hCitizen, hExercise, hProperty, hComparator⟩


theorem attorneysFeeMembership_intro
    {a x f c}
    (hAction : IsCivilRightsEnforcementAction a c)
    (hPrevailing : IsPrevailingParty x c)
    (hFee : IsReasonableAttorneysFee f c)
    : AttorneysFeeMembership a x f c :=
  ⟨hAction, hPrevailing, hFee⟩


theorem expertFeeMembership_intro
    {f af c}
    (hExpert : IsExpertFee f c)
    (hAttorneysFee : IsReasonableAttorneysFee af c)
    : ExpertFeeMembership f af c :=
  ⟨hExpert, hAttorneysFee⟩



theorem propertyExerciseCase_intro
    {e c}
    (hExercise : IsPropertyRightExercise e c)
    : PropertyExerciseCase e c :=
  .purchase hExercise


theorem judicialOfficerFeePosture_intro
    {j c}
    (hOfficer : IsJudicialOfficer j c)
    : JudicialOfficerFeePosture j c :=
  .immune hOfficer

end Proving.USC.T42.GoldenAdjacent.Ontology
