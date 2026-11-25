




import Proving.USC.T18.Ch113B.MaterialSupport.Ontology.Statute
import Proving.USC.T18.Ch113B.MaterialSupport.Ontology.Predicates
import Proving.USC.T18.Ch113B.MaterialSupport.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Ontology

open Proving.USC.Common




theorem materialSupportGenusProperty_intro {x : SupportItem} {c : ComplaintText}
    (h : IsProperty x c) : MaterialSupportGenus x c :=
  MaterialSupportGenus.property h


theorem materialSupportGenusService_intro {x : SupportItem} {c : ComplaintText}
    (h : IsService x c) : MaterialSupportGenus x c :=
  MaterialSupportGenus.service h


theorem materialSupportMembership_intro {x : SupportItem} {c : ComplaintText}
    (hGenus : MaterialSupportGenus x c)
    (hNotMedicine : ¬ IsMedicine x c)
    (hNotReligious : ¬ IsReligiousMaterials x c)
    (hDenotes : IsMaterialSupportOrResources x c)
    : MaterialSupportMembership x c :=
  ⟨hGenus, hNotMedicine, hNotReligious, hDenotes⟩


theorem trainingIsMaterialSupport_intro {x : SupportItem} {c : ComplaintText}
    (hSpecies : IsTraining x c) (hGenus : IsMaterialSupportOrResources x c)
    : TrainingIsMaterialSupport x c :=
  ⟨hSpecies, hGenus⟩


theorem expertAdviceIsMaterialSupport_intro {x : SupportItem} {c : ComplaintText}
    (hSpecies : IsExpertAdviceOrAssistance x c) (hGenus : IsMaterialSupportOrResources x c)
    : ExpertAdviceIsMaterialSupport x c :=
  ⟨hSpecies, hGenus⟩


theorem personnelIsMaterialSupport_intro {x : SupportItem} {c : ComplaintText}
    (hSpecies : IsPersonnel x c) (hGenus : IsMaterialSupportOrResources x c)
    : PersonnelIsMaterialSupport x c :=
  ⟨hSpecies, hGenus⟩


theorem personnelUnder2339B_intro {x : SupportItem} {c : ComplaintText}
    (hPersonnel : IsPersonnel x c)
    (hControl : IsPersonnelUnderOrganizationDirectionOrControl x c)
    : PersonnelUnder2339B x c :=
  ⟨hPersonnel, hControl⟩


theorem incorporatedMaterialSupport_intro {x : SupportItem} {c : ComplaintText}
    (hSupport : IsMaterialSupportOrResources x c) : IncorporatedMaterialSupport x c :=
  ⟨hSupport⟩




theorem fundsTermReadingUnder2339B_intro {x : FundsItem} {c : ComplaintText}
    (h : IsFundsUnder2339B x c) : FundsTermReading x c :=
  FundsTermReading.under2339B h


theorem fundsTermReadingUnder2339C_intro {x : FundsItem} {c : ComplaintText}
    (h : IsFundsUnder2339C x c) : FundsTermReading x c :=
  FundsTermReading.under2339C h


theorem proceedsMembership_intro {x : FundsItem} {c : ComplaintText}
    (hSpecies : IsProceeds x c) (hGenus : IsFundsUnder2339C x c)
    : ProceedsMembership x c :=
  ⟨hSpecies, hGenus⟩


theorem predicateActRouteTreatyOffense_intro {a : PredicateAct} {c : ComplaintText}
    (h : IsActWithinScopeOfSpecifiedTreaty a c) : PredicateActRoute a c :=
  PredicateActRoute.treatyOffense h


theorem predicateActRouteIntimidateOrCompel_intro {a : PredicateAct} {c : ComplaintText}
    (h : IsActIntendedToIntimidateOrCompel a c) : PredicateActRoute a c :=
  PredicateActRoute.intimidateOrCompel h


theorem predicateActMembership_intro {a : PredicateAct} {c : ComplaintText}
    (hRoute : PredicateActRoute a c) (hDenotes : IsPredicateAct a c)
    : PredicateActMembership a c :=
  ⟨hRoute, hDenotes⟩


theorem fundingConductProvides_intro {x : Conduct} {c : ComplaintText}
    (h : IsProvides x c) : FundingConduct x c :=
  FundingConduct.provides h


theorem fundingConductCollects_intro {x : Conduct} {c : ComplaintText}
    (h : IsCollects x c) : FundingConduct x c :=
  FundingConduct.collects h


theorem armedConflictMembership_intro {s : ArmedConflictSituation} {c : ComplaintText}
    (hConflict : IsArmedConflict s c)
    (hNotInternal : ¬ IsInternalDisturbanceOrTension s c)
    : ArmedConflictMembership s c :=
  ⟨hConflict, hNotInternal⟩


theorem governmentFacilityMembership_intro {f : Facility} {s : ForeignState}
    {c : ComplaintText} (hFacility : IsGovernmentFacility f c) (hState : IsForeignState s c)
    : GovernmentFacilityMembership f s c :=
  ⟨hFacility, hState⟩


theorem intergovernmentalIncludesInternational_intro {o : Organization} {c : ComplaintText}
    (hIntl : IsInternationalOrganization o c) (hIgo : IsIntergovernmentalOrganization o c)
    : IntergovernmentalIncludesInternational o c :=
  ⟨hIntl, hIgo⟩




theorem militaryTypeTrainingMembership_intro {x : SupportItem} {c : ComplaintText}
    (hSpecies : IsMilitaryTypeTraining x c) (hGenus : IsTraining x c)
    : MilitaryTypeTrainingMembership x c :=
  ⟨hSpecies, hGenus⟩


theorem section219DesignationIdentity_intro {o : Organization} {c : ComplaintText}
    (h2339B : IsTerroristOrganization o c) (h2339D : IsForeignTerroristOrganization o c)
    : Section219DesignationIdentity o c :=
  ⟨h2339B, h2339D⟩




theorem section2339TermUse_intro {a : PredicateAct} {x : Conduct} {c : ComplaintText}
    (hOffense : IsEnumeratedTerrorismOffenseUnder2339 a c)
    (hConduct : IsHarborOrConcealConduct x c)
    : Section2339TermUse a x c :=
  ⟨hOffense, hConduct⟩


theorem section2339ATermUse_intro {x : SupportItem} {a : PredicateAct} {c : ComplaintText}
    (hSupport : IsMaterialSupportOrResources x c)
    (hOffense : IsEnumeratedOffenseUnder2339A a c)
    : Section2339ATermUse x a c :=
  ⟨hSupport, hOffense⟩


theorem section2339BTermUse_intro {x : SupportItem} {o : Organization} {c : ComplaintText}
    (hSupport : IsMaterialSupportOrResources x c) (hOrg : IsTerroristOrganization o c)
    : Section2339BTermUse x o c :=
  ⟨hSupport, hOrg⟩


theorem section2339CTermUse_intro {f : FundsItem} {x : Conduct} {a : PredicateAct}
    {c : ComplaintText} (hFunds : IsFundsUnder2339C f c) (hVerb : FundingConduct x c)
    (hAct : IsPredicateAct a c)
    : Section2339CTermUse f x a c :=
  ⟨hFunds, hVerb, hAct⟩


theorem section2339DTermUse_intro {x : SupportItem} {o : Organization} {c : ComplaintText}
    (hTraining : IsMilitaryTypeTraining x c) (hOrg : IsForeignTerroristOrganization o c)
    : Section2339DTermUse x o c :=
  ⟨hTraining, hOrg⟩

end Proving.USC.T18.Ch113B.MaterialSupport.Ontology
