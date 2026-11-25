import Proving.USC.T18.Ch117.Reslice.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false








namespace Proving.USC.T18.Ch117.Reslice.Ontology

open Proving.USC.Common




axiom IsInteractiveComputerService
    (s : InteractiveComputerService) (c : ComplaintText) : Prop





axiom IsFacilityOfInterstateOrForeignCommerce
    (f : CommerceFacility) (c : ComplaintText) : Prop




axiom IsProstitution (p : Prostitution) (c : ComplaintText) : Prop




axiom IsSexTrafficking (x : SexTrafficking) (c : ComplaintText) : Prop




axiom IsTargetedJurisdiction (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsJurisdictionWhereProstitutionLegal
    (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsWithinSpecialMaritimeAndTerritorialJurisdiction
    (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsSexualAct (a : SexualAct) (c : ComplaintText) : Prop





axiom WouldViolateChapter109A (a : SexualAct) (c : ComplaintText) : Prop




axiom IsSexualActivityChargeableAsOffense
    (a : SexualActivityChargeableAsOffense) (c : ComplaintText) : Prop



axiom IsCommercialSexAct (a : CommercialSexAct) (c : ComplaintText) : Prop



axiom IsChildPornography (m : ChildPornography) (c : ComplaintText) : Prop



axiom IsIllicitSexualConduct (k : IllicitSexualConduct) (c : ComplaintText) : Prop



axiom IsIntent (i : Intent) (c : ComplaintText) : Prop




axiom IsTravel (t : Travel) (c : ComplaintText) : Prop




axiom IsUnderEighteen (p : Person) (c : ComplaintText) : Prop




axiom IsUnitedStatesCitizen (p : Person) (c : ComplaintText) : Prop



axiom IsAlienAdmittedForPermanentResidence (p : Person) (c : ComplaintText) : Prop




axiom IsOrganizationAffectingCommerce (o : Organization) (c : ComplaintText) : Prop





axiom IsOfficerDirectorEmployeeOrAgent
    (p : Person) (o : Organization) (c : ComplaintText) : Prop




axiom IsPersonInjuredByViolation (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Reslice.Ontology
