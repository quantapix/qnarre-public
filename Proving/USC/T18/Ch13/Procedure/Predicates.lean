











import Proving.USC.T18.Ch13.Procedure.Types

namespace Proving.USC.T18.Ch13.Procedure

open Proving.USC.Common








axiom ProsecutionCertified (p : Person) (c : ComplaintText) : Prop







axiom CertificationGroundEstablished (p : Person) (c : ComplaintText) : Prop




axiom ProsecutionFollowsAGGuidelines (p : Person) (c : ComplaintText) : Prop






axiom AffectsInterstateCommerce (p : Person) (c : ComplaintText) : Prop






axiom IsNoncapitalOffense (p : Person) (c : ComplaintText) : Prop





axiom DeathResulted (p : Person) (c : ComplaintText) : Prop







axiom PriorConvictionUnderSection (p : Person) (c : ComplaintText) : Prop



axiom CivilActionCommenced (p : Person) (c : ComplaintText) : Prop







axiom PlaintiffIsAggrievedPerson (p : Person) (c : ComplaintText) : Prop





axiom AGHasReasonableCause (p : Person) (c : ComplaintText) : Prop




axiom StateAGParensPatriae (p : Person) (c : ComplaintText) : Prop




axiom FiledInAppropriateDistrictCourt (p : Person) (c : ComplaintText) : Prop







axiom offenseDay (c : ComplaintText) : Nat



axiom chargeInstitutedDay (c : ComplaintText) : Nat



axiom electionDay (c : ComplaintText) : Nat



axiom finalJudgmentDay (c : ComplaintText) : Nat

end Proving.USC.T18.Ch13.Procedure
