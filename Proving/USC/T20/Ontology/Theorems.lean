import Proving.USC.T20.Ontology.Types
import Proving.USC.T20.Ontology.Predicates
import Proving.USC.T20.Ontology.Statute
import Proving.USC.Common.Types






namespace Proving.USC.T20.Ontology



theorem educationalInstitutionDefinition_intro {i c}
    (h : IsPreschoolElementaryOrSecondarySchool i c) :
    EducationalInstitutionDefinition i c :=
  .school h



theorem federalAssistanceFormDefinition_intro {a c}
    (h : IsAssistanceByGrant a c) :
    FederalAssistanceFormDefinition a c :=
  .grant h



theorem exemptMembershipOrganizationDefinition_intro {o c}
    (h : IsTaxExemptSocialFraternityOrSorority o c) :
    ExemptMembershipOrganizationDefinition o c :=
  .fraternityOrSorority h



theorem coveredProgramMembership_intro {p a c}
    (hProg : IsEducationProgramOrActivity p c)
    (hAsst : IsFederalFinancialAssistance a c) :
    CoveredProgramMembership p a c :=
  ⟨hProg, hAsst⟩



theorem aggrievedPersonMembership_intro {p act c}
    (hAct : IsSection1682EnforcementAction act c)
    (hAgg : IsPersonAggrieved p act c) :
    AggrievedPersonMembership p act c :=
  ⟨hAct, hAgg⟩

end Proving.USC.T20.Ontology
