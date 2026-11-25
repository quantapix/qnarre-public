import Proving.USC.T18.Ch117.Reslice.Ontology.Statute
import Proving.USC.T18.Ch117.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch117.Reslice.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false








namespace Proving.USC.T18.Ch117.Reslice.Ontology

open Proving.USC.Common


theorem illicitSexualConductMembership_intro_sexualActWithMinor
    {k : IllicitSexualConduct} {c : ComplaintText} {a : SexualAct} {v : Person}
    (hAct : IsSexualAct a c) (hMinor : IsUnderEighteen v c)
    (hCh109A : WouldViolateChapter109A a c) (hTerm : IsIllicitSexualConduct k c)
    : IllicitSexualConductMembership k c :=
  .sexualActWithMinor a v hAct hMinor hCh109A hTerm


theorem illicitSexualConductMembership_intro_commercialSexActWithMinor
    {k : IllicitSexualConduct} {c : ComplaintText} {a : CommercialSexAct} {v : Person}
    (hAct : IsCommercialSexAct a c) (hMinor : IsUnderEighteen v c)
    (hTerm : IsIllicitSexualConduct k c)
    : IllicitSexualConductMembership k c :=
  .commercialSexActWithMinor a v hAct hMinor hTerm


theorem illicitSexualConductMembership_intro_productionOfChildPornography
    {k : IllicitSexualConduct} {c : ComplaintText} {m : ChildPornography}
    (hMaterial : IsChildPornography m c) (hTerm : IsIllicitSexualConduct k c)
    : IllicitSexualConductMembership k c :=
  .productionOfChildPornography m hMaterial hTerm


theorem intentMembership_intro_toProstitution
    {i : Intent} {t : Travel} {c : ComplaintText} {p : Prostitution}
    (hObject : IsProstitution p c) (hIntent : IsIntent i c) (hWhen : IsTravel t c)
    : IntentMembership i t c :=
  .toProstitution p hObject hIntent hWhen


theorem intentMembership_intro_toChargeableSexualActivity
    {i : Intent} {t : Travel} {c : ComplaintText} {a : SexualActivityChargeableAsOffense}
    (hObject : IsSexualActivityChargeableAsOffense a c)
    (hIntent : IsIntent i c) (hWhen : IsTravel t c)
    : IntentMembership i t c :=
  .toChargeableSexualActivity a hObject hIntent hWhen


theorem intentMembership_intro_toIllicitSexualConduct
    {i : Intent} {t : Travel} {c : ComplaintText} {k : IllicitSexualConduct}
    (hObject : IsIllicitSexualConduct k c) (hIntent : IsIntent i c) (hWhen : IsTravel t c)
    : IntentMembership i t c :=
  .toIllicitSexualConduct k hObject hIntent hWhen


theorem coveredTravelerMembership_intro_citizen
    {p : Person} {c : ComplaintText} (h : IsUnitedStatesCitizen p c)
    : CoveredTravelerMembership p c :=
  .citizen h


theorem coveredTravelerMembership_intro_lawfulPermanentResident
    {p : Person} {c : ComplaintText} (h : IsAlienAdmittedForPermanentResidence p c)
    : CoveredTravelerMembership p c :=
  .lawfulPermanentResident h


theorem chapter109ACounterfactual_intro
    {a : SexualAct} {j : Jurisdiction} {c : ComplaintText}
    (act : IsSexualAct a c)
    (jurisdiction : IsWithinSpecialMaritimeAndTerritorialJurisdiction j c)
    (wouldViolate : WouldViolateChapter109A a c)
    : Chapter109ACounterfactual a j c :=
  ⟨act, jurisdiction, wouldViolate⟩


theorem commerceNexusServiceMembership_intro
    {s : InteractiveComputerService} {f : CommerceFacility} {c : ComplaintText}
    (service : IsInteractiveComputerService s c)
    (facility : IsFacilityOfInterstateOrForeignCommerce f c)
    : CommerceNexusServiceMembership s f c :=
  ⟨service, facility⟩


theorem organizationalAffiliationMembership_intro
    {p : Person} {o : Organization} {c : ComplaintText}
    (organization : IsOrganizationAffectingCommerce o c)
    (role : IsOfficerDirectorEmployeeOrAgent p o c)
    (traveler : CoveredTravelerMembership p c)
    : OrganizationalAffiliationMembership p o c :=
  ⟨organization, role, traveler⟩


theorem legalProstitutionJurisdictionMembership_intro
    {j : Jurisdiction} {p : Prostitution} {c : ComplaintText}
    (targeted : IsTargetedJurisdiction j c)
    (legal : IsJurisdictionWhereProstitutionLegal j c)
    (subject : IsProstitution p c)
    : LegalProstitutionJurisdictionMembership j p c :=
  ⟨targeted, legal, subject⟩


theorem injuredPersonMembership_intro
    {p : Person} {c : ComplaintText} (injured : IsPersonInjuredByViolation p c)
    : InjuredPersonMembership p c :=
  ⟨injured⟩



#check (ComplaintText : Type)
#check (Person : Type)
#check @Proving.USC.Common.ComplaintText
#check @Proving.USC.Common.Person
#print axioms illicitSexualConductMembership_intro_sexualActWithMinor
#print axioms intentMembership_intro_toIllicitSexualConduct
#print axioms organizationalAffiliationMembership_intro
#print axioms legalProstitutionJurisdictionMembership_intro

end Proving.USC.T18.Ch117.Reslice.Ontology
