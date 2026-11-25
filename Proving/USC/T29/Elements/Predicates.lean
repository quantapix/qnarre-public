
















import Proving.USC.T29.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T29.Elements

open Proving.USC.Common








axiom IsCoveredEmployer (p : Person) (c : ComplaintText) : Prop






axiom IsCoveredEmployee (em : Employee) (c : ComplaintText) : Prop






axiom IsLaborOrganization (lo : LaborOrganization) (c : ComplaintText) : Prop







axiom EmployerInterferesWithRights (p : Person) (c : ComplaintText) : Prop





axiom EmployerDominatesUnion (p : Person) (c : ComplaintText) : Prop






axiom EmployerDiscriminatesUnionMembership (p : Person) (c : ComplaintText) : Prop





axiom EmployerRetaliatesForCharge (p : Person) (c : ComplaintText) : Prop




axiom EmployerRefusesToBargain (p : Person) (c : ComplaintText) : Prop







axiom UnionRestrainsOrCoerces (lo : LaborOrganization) (c : ComplaintText) : Prop





axiom UnionCausesEmployerDiscrimination (lo : LaborOrganization) (c : ComplaintText) : Prop




axiom UnionRefusesToBargain (lo : LaborOrganization) (c : ComplaintText) : Prop




axiom UnionSecondaryActivity (lo : LaborOrganization) (c : ComplaintText) : Prop





axiom UnionRecognitionalPicketing (lo : LaborOrganization) (c : ComplaintText) : Prop









axiom HotCargoAgreement (p : Person) (lo : LaborOrganization) (c : ComplaintText) : Prop








axiom ProtectedByFreeSpeech (c : ComplaintText) : Prop







axiom ChargeFiledAndServed (p : Person) (c : ComplaintText) : Prop






axiom WithinSixMonthLimitations (p : Person) (c : ComplaintText) : Prop




axiom BoardFindsByPreponderance (p : Person) (c : ComplaintText) : Prop







axiom WillfullyInterferesWithBoard (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T29.Elements
