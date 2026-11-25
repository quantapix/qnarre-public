












import Proving.USC.T29.Deontic.Predicates

namespace Proving.USC.T29.Deontic

open Proving.USC.Common





structure ProhibitionS158a (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : EmployerAddressee p c
  condition : AffectsCommerce e c




def ProhibitionViolatedS158a (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  ProhibitionS158a p e c ∧ EmployerULPActOccurred p c



structure ProhibitionS158b (l : LaborOrganization) (e : Entity) (c : ComplaintText) : Prop where
  addressee : LaborOrgAddressee l c
  condition : AffectsCommerce e c



def ProhibitionViolatedS158b (l : LaborOrganization) (e : Entity) (c : ComplaintText) : Prop :=
  ProhibitionS158b l e c ∧ LaborOrgULPActOccurred l c



structure ProhibitionS158e (p : Person) (l : LaborOrganization) (e : Entity)
    (c : ComplaintText) : Prop where
  employer  : EmployerAddressee p c
  laborOrg  : LaborOrgAddressee l c
  condition : AffectsCommerce e c



def ProhibitionViolatedS158e (p : Person) (l : LaborOrganization) (e : Entity)
    (c : ComplaintText) : Prop :=
  ProhibitionS158e p l e c ∧ HotCargoAgreementEntered p l c




structure ObligationS158d (p : Person) (c : ComplaintText) : Prop where
  condition : BargainingDutyCondition p c



def ObligationBreachedS158d (p : Person) (c : ComplaintText) : Prop :=
  ObligationS158d p c ∧ ¬ BargainingObligationDischarged p c



structure ObligationS158g (l : LaborOrganization) (c : ComplaintText) : Prop where
  condition : HealthcareNoticeCondition l c



def ObligationBreachedS158g (l : LaborOrganization) (c : ComplaintText) : Prop :=
  ObligationS158g l c ∧ ¬ HealthcareNoticeGiven l c



structure ObligationS153c (b : Board) (c : ComplaintText) : Prop where
  condition : FiscalYearClosed b c



def ObligationBreachedS153c (b : Board) (c : ComplaintText) : Prop :=
  ObligationS153c b c ∧ ¬ AnnualReportMade b c








def PowerExercisableS153b (b : Board) (c : ComplaintText) : Prop :=
  BoardDelegationPower b c


def PowerExercisableS160a (b : Board) (c : ComplaintText) : Prop :=
  BoardPreventionPower b c


def PowerExercisableS161 (b : Board) (c : ComplaintText) : Prop :=
  BoardInvestigatoryPower b c


structure BoardCompetenceSuite (b : Board) (c : ComplaintText) : Prop where
  delegation    : PowerExercisableS153b b c
  prevention    : PowerExercisableS160a b c
  investigatory : PowerExercisableS161 b c



structure ProhibitionS162 (p : Person) (c : ComplaintText) : Prop where
  addressee : AnyPersonAddressee p c




def ProhibitionViolatedS162 (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionS162 p c ∧ InterfereWithBoardOccurred p c

end Proving.USC.T29.Deontic
