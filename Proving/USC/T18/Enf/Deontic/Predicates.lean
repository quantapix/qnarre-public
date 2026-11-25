







import Proving.USC.T18.Enf.Deontic.Types

namespace Proving.USC.T18.Enf.Deontic

open Proving.USC.Common








axiom ViolatedSection1962 (p : Person) (c : ComplaintText) : Prop





axiom PropertyForfeitable (pr : Property) (c : ComplaintText) : Prop





axiom ForfeitureNotTendered (p : Person) (pr : Property) (c : ComplaintText) : Prop









axiom InterestClaimant (p : Person) (pr : Property) (c : ComplaintText) : Prop





axiom IntervenedOutsideAncillary (p : Person) (pr : Property) (c : ComplaintText) : Prop










axiom RemedialPowerInvoked (c : ComplaintText) : Prop










axiom InjuredByViolation (p : Person) (c : ComplaintText) : Prop





axiom SecuritiesFraudBarInapplicable (p : Person) (c : ComplaintText) : Prop










axiom VenueProper (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Enf.Deontic
