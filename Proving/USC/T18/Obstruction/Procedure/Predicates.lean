












import Proving.USC.T18.Obstruction.Procedure.Types

namespace Proving.USC.T18.Obstruction.Procedure

open Proving.USC.Common (Person ComplaintText)






axiom ObstructiveConductOccurred (p : Person) (c : ComplaintText) : Prop





axiom ProsecutionCommenced (p : Person) (c : ComplaintText) : Prop











axiom VenueInProceedingAffectedDistrict (p : Person) (c : ComplaintText) : Prop





axiom VenueInConductDistrict (p : Person) (c : ComplaintText) : Prop













axiom ProceedingIntendedToBeAffected (p : Person) (c : ComplaintText) : Prop










axiom FederalJurisdictionReaches (p : Person) (c : ComplaintText) : Prop












axiom AffirmativeDefenseNotEstablished (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Obstruction.Procedure
