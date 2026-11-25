




























import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.CalibBridge
open Proving.USC.Common








opaque Act : Type
opaque Income : Type
opaque InterestOrControl : Type

axiom mapPerson    : Person        → Proving.Rico.Person
axiom mapEntity    : Entity        → Proving.Rico.Entity
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom mapAgreement : Agreement     → Proving.Rico.Agreement
axiom mapActs      : List Act      → List Proving.Rico.Act
axiom mapIncome    : Income        → Proving.Rico.Investment
axiom mapIC        : InterestOrControl → Proving.Rico.InterestOrControl



namespace A
axiom CulpablePersonAsPrincipal (p : Person) (c : ComplaintText) : Prop
axiom PatternOfRacketeering (acts : List Act) (c : ComplaintText) : Prop
axiom IncomeDerivedFromPattern (income : Income) (acts : List Act) (c : ComplaintText) : Prop
axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop
axiom EngagedInInterstateCommerce (e : Entity) (c : ComplaintText) : Prop
axiom UsesOrInvestsIncomeInEnterprise (p : Person) (income : Income) (e : Entity) (c : ComplaintText) : Prop

structure CandSection1962a (p : Person) (income : Income) (e : Entity)
    (acts : List Act) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonAsPrincipal p c
  pattern            : PatternOfRacketeering acts c
  incomeDerived      : IncomeDerivedFromPattern income acts c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  usesOrInvests      : UsesOrInvestsIncomeInEnterprise p income e c

axiom corr_culpable {p c} : CulpablePersonAsPrincipal p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)
axiom corr_pattern {acts c} : PatternOfRacketeering acts c →
    Proving.Rico.PatternOfRacketeering (mapActs acts) (mapComplaint c)
axiom corr_derived {income acts c} : IncomeDerivedFromPattern income acts c →
    Proving.Rico.DerivedFromPattern (mapIncome income) (mapActs acts) (mapComplaint c)
axiom corr_enterprise {e c} : IsEnterprise e c →
    Proving.Rico.IsEnterprise (mapEntity e) (mapComplaint c)
axiom corr_commerce {e c} : EngagedInInterstateCommerce e c →
    Proving.Rico.EngagedInInterstateCommerce (mapEntity e) (mapComplaint c)
axiom corr_invested {p income e c} : UsesOrInvestsIncomeInEnterprise p income e c →
    Proving.Rico.InvestedInEnterprise (mapPerson p) (mapIncome income) (mapEntity e) (mapComplaint c)


theorem cand_a_implies_golden_a {p income e acts c} (h : CandSection1962a p income e acts c) :
    Proving.Rico.Section1962a (mapPerson p) (mapEntity e) (mapIncome income) (mapActs acts) (mapComplaint c) :=
  ⟨corr_culpable h.culpable, corr_enterprise h.enterprise, corr_commerce h.interstateCommerce,
   corr_pattern h.pattern, corr_derived h.incomeDerived, corr_invested h.usesOrInvests⟩
end A



namespace B
axiom CulpablePersonCapableOfIntent (p : Person) (c : ComplaintText) : Prop
axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop
axiom EngagedInInterstateCommerce (e : Entity) (c : ComplaintText) : Prop
axiom PatternOfRacketeering (acts : List Act) (c : ComplaintText) : Prop
axiom AcquiredOrMaintainedInterestOrControl (p : Person) (e : Entity) (ic : InterestOrControl) (c : ComplaintText) : Prop
axiom AcquisitionThroughPattern (p : Person) (ic : InterestOrControl) (acts : List Act) (c : ComplaintText) : Prop

structure CandSection1962b (p : Person) (e : Entity) (ic : InterestOrControl)
    (acts : List Act) (c : ComplaintText) : Prop where
  culpable             : CulpablePersonCapableOfIntent p c
  enterprise           : IsEnterprise e c
  interstateCommerce   : EngagedInInterstateCommerce e c
  pattern              : PatternOfRacketeering acts c
  acquiredOrMaintained : AcquiredOrMaintainedInterestOrControl p e ic c
  throughPattern       : AcquisitionThroughPattern p ic acts c

axiom corr_culpable {p c} : CulpablePersonCapableOfIntent p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)
axiom corr_enterprise {e c} : IsEnterprise e c →
    Proving.Rico.IsEnterprise (mapEntity e) (mapComplaint c)
axiom corr_commerce {e c} : EngagedInInterstateCommerce e c →
    Proving.Rico.EngagedInInterstateCommerce (mapEntity e) (mapComplaint c)
axiom corr_pattern {acts c} : PatternOfRacketeering acts c →
    Proving.Rico.PatternOfRacketeering (mapActs acts) (mapComplaint c)
axiom corr_acquired {p e ic c} : AcquiredOrMaintainedInterestOrControl p e ic c →
    Proving.Rico.AcquiredOrMaintainedControl (mapPerson p) (mapIC ic) (mapEntity e) (mapComplaint c)
axiom corr_through {p ic acts c} : AcquisitionThroughPattern p ic acts c →
    Proving.Rico.AcquisitionThroughPattern (mapIC ic) (mapActs acts) (mapComplaint c)


theorem cand_b_implies_golden_b {p e ic acts c} (h : CandSection1962b p e ic acts c) :
    Proving.Rico.Section1962b (mapPerson p) (mapEntity e) (mapIC ic) (mapActs acts) (mapComplaint c) :=
  ⟨corr_culpable h.culpable, corr_enterprise h.enterprise, corr_commerce h.interstateCommerce,
   corr_pattern h.pattern, corr_acquired h.acquiredOrMaintained, corr_through h.throughPattern⟩
end B



namespace D
axiom ConspiracyCulpablePerson (p : Person) (c : ComplaintText) : Prop
axiom ConspiratorialAgreement (ag : Agreement) (c : ComplaintText) : Prop
axiom EndeavorWouldViolateSubstantiveRico (ag : Agreement) (c : ComplaintText) : Prop
axiom DefendantKnewAndAgreedToObjective (p : Person) (ag : Agreement) (c : ComplaintText) : Prop

structure CandSection1962d (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  culpable       : ConspiracyCulpablePerson p c
  agreement      : ConspiratorialAgreement ag c
  unlawfulObject : EndeavorWouldViolateSubstantiveRico ag c
  agreedToObject : DefendantKnewAndAgreedToObjective p ag c




axiom corr_culpable {p c} : ConspiracyCulpablePerson p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)
axiom corr_agreed {p ag c} : ConspiratorialAgreement ag c → DefendantKnewAndAgreedToObjective p ag c →
    Proving.Rico.AgreementToViolateRico (mapPerson p) (mapAgreement ag) (mapComplaint c)
axiom corr_knew {p ag c} : DefendantKnewAndAgreedToObjective p ag c →
    Proving.Rico.KnowledgeOfRicoObjective (mapPerson p) (mapAgreement ag) (mapComplaint c)
axiom corr_underlying {ag c} : EndeavorWouldViolateSubstantiveRico ag c →
    Proving.Rico.UnderlyingSubstantiveViolationContemplated (mapAgreement ag) (mapComplaint c)



theorem cand_d_implies_golden_d {p ag c} (h : CandSection1962d p ag c) :
    Proving.Rico.Section1962d (mapPerson p) (mapAgreement ag) (mapComplaint c) :=
  ⟨corr_culpable h.culpable, corr_agreed h.agreement h.agreedToObject,
   corr_knew h.agreedToObject, corr_underlying h.unlawfulObject⟩
end D

end Proving.USC.T18.CalibBridge
