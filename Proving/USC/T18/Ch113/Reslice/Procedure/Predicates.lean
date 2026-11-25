












import Proving.USC.T18.Ch113.Reslice.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch113.Reslice.Procedure



axiom ViolationDiscovered (p : Person) (c : ComplaintText) : Prop




axiom CivilActionCommenced (p : Person) (c : ComplaintText) : Prop




axiom DiscoveryDay (p : Person) (c : ComplaintText) : Nat



axiom CommencementDay (p : Person) (c : ComplaintText) : Nat



axiom FinalJudgmentDay (p : Person) (c : ComplaintText) : Nat



axiom StatutoryDamagesElected (p : Person) (c : ComplaintText) : Prop



axiom ElectionDay (p : Person) (c : ComplaintText) : Nat




axiom SubsequentViolation (p : Person) (c : ComplaintText) : Prop



axiom SubsequentViolationDay (p : Person) (c : ComplaintText) : Nat




axiom PriorFinalJudgmentDay (p : Person) (c : ComplaintText) : Nat




axiom PriorConvictionUnderSubsectionA (p : Person) (c : ComplaintText) : Prop




axiom PresentenceReportInPreparation (p : Person) (c : ComplaintText) : Prop




axiom VictimImpactStatementSubmitted (p : Person) (c : ComplaintText) : Prop




axiom AttorneyGeneralAnnualReportIncluded (p : Person) (c : ComplaintText) : Prop




axiom AffirmativeDefenseBurdenOnDefendant (p : Person) (c : ComplaintText) : Prop





axiom FederalProceduralJurisdictionNexus (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113.Reslice.Procedure
