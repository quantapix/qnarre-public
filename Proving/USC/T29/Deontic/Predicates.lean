










import Proving.USC.T29.Deontic.Types

namespace Proving.USC.T29.Deontic

open Proving.USC.Common










axiom AffectsCommerce (e : Entity) (c : ComplaintText) : Prop





axiom EmployerAddressee (p : Person) (c : ComplaintText) : Prop






axiom EmployerULPActOccurred (p : Person) (c : ComplaintText) : Prop






axiom LaborOrgAddressee (l : LaborOrganization) (c : ComplaintText) : Prop






axiom LaborOrgULPActOccurred (l : LaborOrganization) (c : ComplaintText) : Prop








axiom HotCargoAgreementEntered (p : Person) (l : LaborOrganization) (c : ComplaintText) : Prop







axiom BargainingDutyCondition (p : Person) (c : ComplaintText) : Prop






axiom BargainingObligationDischarged (p : Person) (c : ComplaintText) : Prop






axiom HealthcareNoticeCondition (l : LaborOrganization) (c : ComplaintText) : Prop





axiom HealthcareNoticeGiven (l : LaborOrganization) (c : ComplaintText) : Prop






axiom FiscalYearClosed (b : Board) (c : ComplaintText) : Prop




axiom AnnualReportMade (b : Board) (c : ComplaintText) : Prop







axiom BoardDelegationPower (b : Board) (c : ComplaintText) : Prop




axiom BoardPreventionPower (b : Board) (c : ComplaintText) : Prop




axiom BoardInvestigatoryPower (b : Board) (c : ComplaintText) : Prop





axiom AnyPersonAddressee (p : Person) (c : ComplaintText) : Prop




axiom InterfereWithBoardOccurred (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T29.Deontic
