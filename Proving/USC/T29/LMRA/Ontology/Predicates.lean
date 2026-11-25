









import Proving.USC.Common.Types
import Proving.USC.T29.LMRA.Ontology.Types

namespace Proving.USC.T29.LMRA.Ontology

open Proving.USC.Common




axiom IsService (s : Service) (c : ComplaintText) : Prop



axiom IsDirector (d : Director) (c : ComplaintText) : Prop



axiom IsNationalLaborManagementPanel (pan : Panel) (c : ComplaintText) : Prop




axiom IsBoardOfInquiry (b : BoardOfInquiry) (c : ComplaintText) : Prop




axiom IsLaborDispute (disp : LaborDispute) (c : ComplaintText) : Prop





axiom IsNationalEmergencyDispute (ned : NationalEmergencyDispute) (c : ComplaintText) : Prop




axiom IsHealthCareInstitution (h : HealthCareInstitution) (c : ComplaintText) : Prop




axiom IsLaborOrganization (org : LaborOrganization) (c : ComplaintText) : Prop




axiom IsEmployerAffectingCommerce (emp : Employer) (c : ComplaintText) : Prop




axiom IsCbaContract (k : CbaContract) (c : ComplaintText) : Prop




axiom IsEmployeeRepresentative (r : EmployeeRepresentative) (c : ComplaintText) : Prop




axiom IsTrustFund (tf : TrustFund) (c : ComplaintText) : Prop




axiom IsThingOfValue (v : ThingOfValue) (c : ComplaintText) : Prop





axiom ActsAsAgent (p : Person) (c : ComplaintText) : Prop






axiom IsSection158b4UnfairLaborPractice (c : ComplaintText) : Prop






axiom AffectsCommerce (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T29.LMRA.Ontology
