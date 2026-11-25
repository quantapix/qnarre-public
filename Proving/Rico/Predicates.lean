




















import Proving.Rico.Types

namespace Proving.Rico









axiom CulpablePersonCapableOfIntent (p : Person) (c : ComplaintText) : Prop





axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop



axiom EngagedInInterstateCommerce (e : Entity) (c : ComplaintText) : Prop






axiom PersonEnterpriseDistinct (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom EmployedOrAssociated (p : Person) (e : Entity) (c : ComplaintText) : Prop



axiom ConductsOrParticipates (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom IsRacketeeringActivity (a : Act) (c : ComplaintText) : Prop



axiom WithinTenYears (a b : Act) (c : ComplaintText) : Prop




axiom Related (a b : Act) (c : ComplaintText) : Prop



axiom Continuous (acts : List Act) (c : ComplaintText) : Prop






axiom IsUnlawfulDebt (d : UnlawfulDebt) (c : ComplaintText) : Prop



axiom CollectedUnlawfulDebt (p : Person) (d : UnlawfulDebt) (e : Entity) (c : ComplaintText) : Prop





axiom DerivedFromPattern (i : Investment) (acts : List Act) (c : ComplaintText) : Prop



axiom InvestedInEnterprise (p : Person) (i : Investment) (e : Entity) (c : ComplaintText) : Prop







axiom InvestmentInjury (plaintiff : Person) (i : Investment) (c : ComplaintText) : Prop






axiom AcquiredOrMaintainedControl (p : Person) (ic : InterestOrControl) (e : Entity) (c : ComplaintText) : Prop



axiom AcquisitionThroughPattern (ic : InterestOrControl) (acts : List Act) (c : ComplaintText) : Prop




axiom AcquisitionInjury (plaintiff : Person) (ic : InterestOrControl) (c : ComplaintText) : Prop






axiom AgreementToViolateRico (p : Person) (ag : Agreement) (c : ComplaintText) : Prop



axiom KnowledgeOfRicoObjective (p : Person) (ag : Agreement) (c : ComplaintText) : Prop




axiom UnderlyingSubstantiveViolationContemplated (ag : Agreement) (c : ComplaintText) : Prop





axiom InjuryByOvertActOfRacketeering (plaintiff : Person) (ag : Agreement) (c : ComplaintText) : Prop




axiom BusinessOrPropertyInjury (p : Person) (c : ComplaintText) : Prop




axiom ProximateCause (p : Person) (acts : List Act) (c : ComplaintText) : Prop










axiom WithinFourYearLimitationsPeriod (plaintiff : Person) (c : ComplaintText) : Prop

end Proving.Rico
