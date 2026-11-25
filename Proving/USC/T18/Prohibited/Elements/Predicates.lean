




















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Prohibited.Elements.Types

namespace Proving.USC.T18.Prohibited.Elements

open Proving.USC.Common






axiom CulpablePersonCapableOfIntent (p : Person) (c : ComplaintText) : Prop








axiom IsJuridicalPerson (e : Entity) (c : ComplaintText) : Prop




axiom IsNaturalPerson (e : Entity) (c : ComplaintText) : Prop



axiom HasSharedPurpose (e : Entity) (c : ComplaintText) : Prop



axiom HasOngoingRelationships (e : Entity) (c : ComplaintText) : Prop




axiom HasLongevity (e : Entity) (c : ComplaintText) : Prop




axiom DistinctFromPattern (e : Entity) (c : ComplaintText) : Prop









axiom PredicateActCount (c : ComplaintText) : Nat




axiom ActsAreRelated (acts : List Act) (c : ComplaintText) : Prop




axiom ActsShowContinuity (acts : List Act) (c : ComplaintText) : Prop







axiom IncomeDerivedFromPattern (p : Person) (i : Income) (c : ComplaintText) : Prop





axiom InvestedIncomeInEnterprise (p : Person) (i : Income) (e : Entity) (c : ComplaintText) : Prop





axiom PassiveSecuritiesSafeHarbor (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom AcquiredOrMaintainedInterest (p : Person) (x : Interest) (e : Entity) (c : ComplaintText) : Prop





axiom ThroughPatternNexus (p : Person) (e : Entity) (c : ComplaintText) : Prop



axiom EmployedOrAssociated (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom ConductsOrParticipates (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom AgreedToSubstantiveOffense (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Prohibited.Elements
