












import Proving.USC.T42.Ch6ASchI.Part3.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Part3.Ontology









axiom IsCommissionedOfficerOrEmployee (p : Common.Person) (c : Common.ComplaintText) : Prop






axiom ActsWithinScopeOfEmployment (p : Common.Person) (c : Common.ComplaintText) : Prop






axiom IsDeemedPHSEmployee (p : Common.Person) (c : Common.ComplaintText) : Prop







axiom IsDeemedEmployeeEntity (e : Common.Entity) (c : Common.ComplaintText) : Prop






axiom IsCoveredPerson (p : Common.Person) (c : Common.ComplaintText) : Prop





axiom IsCoveredCountermeasure (m : Countermeasure) (c : Common.ComplaintText) : Prop





axiom IsQualifiedPerson (p : Common.Person) (c : Common.ComplaintText) : Prop





axiom IsFreeClinic (e : Common.Entity) (c : Common.ComplaintText) : Prop






axiom IsFreeClinicHealthProfessional (p : Common.Person) (c : Common.ComplaintText) : Prop





axiom IsQualifyingHealthService (s : HealthService) (c : Common.ComplaintText) : Prop





axiom IsManagedCarePlan (e : Common.Entity) (c : Common.ComplaintText) : Prop






axiom IsHealthProfessionalVolunteer (p : Common.Person) (c : Common.ComplaintText) : Prop









axiom IsHealthCareProfessional (p : Common.Person) (c : Common.ComplaintText) : Prop






axiom IsHealthCareService (s : HealthService) (c : Common.ComplaintText) : Prop








axiom IsMigrantHealthCouncilMember (p : Common.Person) (c : Common.ComplaintText) : Prop







axiom IsConteServiceMember (p : Common.Person) (c : Common.ComplaintText) : Prop






axiom IsUnconditionalGift (g : Gift) (c : Common.ComplaintText) : Prop





axiom IsConditionalGift (g : Gift) (c : Common.ComplaintText) : Prop








axiom IsFiscalAgent (e : Common.Entity) (c : Common.ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Part3.Ontology
