





import Proving.USC.T18.PredicateDefs.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.PredicateDefs.Ontology

open Proving.USC.Common



theorem financialInstitutionCase_intro {x c}
    (hCase : IsInsuredDepositoryInstitution x c) (hFI : IsFinancialInstitution x c)
    : FinancialInstitutionCase x c :=
  .insuredDepository hCase hFI


theorem honestServicesSchemeMembership_intro {s c}
    (hHS : IsHonestServicesDeprivation s c) (hScheme : IsSchemeToDefraud s c)
    : HonestServicesSchemeMembership s c :=
  ⟨hHS, hScheme⟩


theorem officialProceedingCase_intro {x c}
    (hCourt : IsCourtProceeding x c) (hOP : IsOfficialProceeding x c)
    : OfficialProceedingCase x c :=
  .court hCourt hOP


theorem misleadingConductCase_intro {x c}
    (hFalse : IsFalseStatement x c) (hMC : IsMisleadingConduct x c)
    : MisleadingConductCase x c :=
  .falseStatement hFalse hMC


theorem bodilyInjuryCase_intro {x c}
    (hBI : IsBodilyInjury x c)
    : BodilyInjuryCase x c :=
  .physicalPain hBI


theorem corruptPersuasionMembership_intro {x c}
    (hPersuades : CorruptlyPersuades x c) (hNotExcluded : ¬ IsMisleadingButForStateOfMind x c)
    : CorruptPersuasionMembership x c :=
  ⟨hPersuades, hNotExcluded⟩

end Proving.USC.T18.PredicateDefs.Ontology
