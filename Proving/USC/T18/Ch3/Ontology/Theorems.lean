








import Proving.USC.T18.Ch3.Ontology.Statute

namespace Proving.USC.T18.Ch3.Ontology

open Proving.USC.Common



theorem animalEnterpriseMembership_intro {e c}
    (h : IsCommercialOrAcademicEnterprise e c ∨ IsAnimalDisplayEnterprise e c
          ∨ IsAgriculturalFairEvent e c)
    : AnimalEnterpriseMembership e c := by
  rcases h with h | h | h
  · exact .commercialAcademic h
  · exact .display h
  · exact .agriculturalFair h



theorem seriousBodilyInjuryMembership_intro {x c}
    (h : InjuryPosesSubstantialRiskOfDeath x c ∨ InjuryIsExtremePhysicalPain x c
          ∨ InjuryIsProtractedDisfigurement x c ∨ InjuryIsProtractedLossOfFunction x c)
    : SeriousBodilyInjuryMembership x c := by
  rcases h with h | h | h | h
  · exact .riskOfDeath h
  · exact .extremePain h
  · exact .disfigurement h
  · exact .lossOfFunction h



theorem euthanizingMembership_intro {m c}
    (h : MethodProducesRapidPainlessDeath m c ∨ MethodUsesPainlessAnesthesia m c)
    : EuthanizingMembership m c := by
  rcases h with h | h
  · exact .rapidPainlessDeath h
  · exact .painlessAnesthesia h



theorem animalCrushVideoMembership_intro {v c}
    (hDepict : VideoDepictsAnimalCrushing v c) (hObscene : VideoIsObscene v c)
    : AnimalCrushVideoMembership v c :=
  ⟨hDepict, hObscene⟩

end Proving.USC.T18.Ch3.Ontology
