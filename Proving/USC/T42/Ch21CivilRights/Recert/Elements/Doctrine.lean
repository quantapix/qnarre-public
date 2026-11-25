






import Proving.USC.Common.Tactic
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Elements

open Proving.USC.Common


@[grind →] theorem doctrine_privateOrg_asWhole {pr : Program} {c : ComplaintText}
    (h : AssistanceExtendedToOrganizationAsWhole pr c) : PrivateOrganizationRoute pr c :=
  .asWhole h


@[grind →] theorem doctrine_privateOrg_principallyEngaged {pr : Program} {c : ComplaintText}
    (h : PrincipallyEngagedInCoveredServices pr c) : PrivateOrganizationRoute pr c :=
  .principallyEngaged h


@[grind →] theorem doctrine_entirePrivateOrganization {pr : Program} {c : ComplaintText}
    (h1 : IsEntirePrivateOrganization pr c) (h2 : PrivateOrganizationRoute pr c) :
    EntirePrivateOrganization pr c := ⟨h1, h2⟩


@[grind →] theorem doctrine_category_stateOrLocalInstrumentality
    {pr : Program} {c : ComplaintText} (h : IsStateOrLocalInstrumentality pr c) :
    ProgramOrActivityCategory pr c := .stateOrLocalInstrumentality h


@[grind →] theorem doctrine_category_stateOrLocalDistributingEntity
    {pr : Program} {c : ComplaintText} (h : IsStateOrLocalDistributingEntity pr c) :
    ProgramOrActivityCategory pr c := .stateOrLocalDistributingEntity h


@[grind →] theorem doctrine_category_postsecondary
    {pr : Program} {c : ComplaintText} (h : IsPostsecondaryInstitution pr c) :
    ProgramOrActivityCategory pr c := .postsecondary h


@[grind →] theorem doctrine_category_schoolSystem
    {pr : Program} {c : ComplaintText} (h : IsSchoolSystemOrLocalEducationalAgency pr c) :
    ProgramOrActivityCategory pr c := .schoolSystem h


@[grind →] theorem doctrine_category_entirePrivateOrganization
    {pr : Program} {c : ComplaintText} (h : EntirePrivateOrganization pr c) :
    ProgramOrActivityCategory pr c := .entirePrivateOrganization h


@[grind →] theorem doctrine_category_separateFacility
    {pr : Program} {c : ComplaintText} (h : IsGeographicallySeparateFundedFacility pr c) :
    ProgramOrActivityCategory pr c := .separateFacility h


@[grind →] theorem doctrine_category_establishedByCoveredEntities
    {pr : Program} {c : ComplaintText} (h : EstablishedByTwoOrMoreCoveredEntities pr c) :
    ProgramOrActivityCategory pr c := .establishedByCoveredEntities h


@[grind →] theorem doctrine_programOrActivity {pr : Program} {c : ComplaintText}
    (h1 : ProgramOrActivityCategory pr c)
    (h2 : AnyPartExtendedFederalFinancialAssistance pr c) :
    ProgramOrActivity2000d4a pr c := ⟨h1, h2⟩


example {pr : Program} {c : ComplaintText}
    (h1 : IsStateOrLocalInstrumentality pr c)
    (h2 : AnyPartExtendedFederalFinancialAssistance pr c) :
    IsProgramOrActivity pr c := by prove_element



example {pr : Program} {c : ComplaintText}
    (h1 : IsEntirePrivateOrganization pr c)
    (h2 : PrincipallyEngagedInCoveredServices pr c)
    (h3 : AnyPartExtendedFederalFinancialAssistance pr c) :
    IsProgramOrActivity pr c := by prove_element

end Proving.USC.T42.Ch21CivilRights.Recert.Elements
