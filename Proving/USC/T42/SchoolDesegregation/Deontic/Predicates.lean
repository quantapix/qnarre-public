











import Proving.USC.Common.Types
import Proving.USC.T42.SchoolDesegregation.Deontic.Types

namespace Proving.USC.T42.SchoolDesegregation.Deontic

open Proving.USC.Common

















axiom AddresseeIsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop







axiom SignedWrittenComplaintReceived (c : ComplaintText) : Prop






axiom AGSatisfiedMeritAndInability (c : ComplaintText) : Prop





axiom AGInstitutedCivilAction (p : Person) (c : ComplaintText) : Prop







axiom InabilityConditionMet (c : ComplaintText) : Prop






axiom AGDeemedSignersUnable (p : Person) (c : ComplaintText) : Prop











axiom AddresseeIsAnyPerson (p : Person) (c : ComplaintText) : Prop




axiom DiscriminationInPublicEducation (c : ComplaintText) : Prop





axiom PersonSuesForRelief (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.SchoolDesegregation.Deontic
