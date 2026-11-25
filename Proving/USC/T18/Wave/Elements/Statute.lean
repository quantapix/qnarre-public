











import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Wave.Elements.Types
import Proving.USC.T18.Wave.Elements.Predicates

namespace Proving.USC.T18.Wave.Elements

open Proving.USC.Common



structure Section1962a (p : Person) (e : Entity) (inc : Income) (i : Interest)
    (acts : List Act) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  racketeering       : PatternOfRacketeering acts c ∨ CollectionOfUnlawfulDebt acts c
  incomeDerived      : IncomeDerivedFromPattern inc acts c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  invested           : InvestedIncomeInEnterprise inc e i c



structure Section1962b (p : Person) (e : Entity) (i : Interest)
    (acts : List Act) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  racketeering       : PatternOfRacketeering acts c ∨ CollectionOfUnlawfulDebt acts c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  acquired           : AcquiredOrMaintainedInterest p e i acts c



structure Section1962c (p : Person) (e : Entity) (acts : List Act)
    (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  distinct           : PersonEnterpriseDistinct p e c
  associated         : EmployedOrAssociated p e c
  conducts           : ConductsOrParticipates p e c
  racketeering       : PatternOfRacketeering acts c ∨ CollectionOfUnlawfulDebt acts c





structure Section1962d (p : Person) (ag : Agreement) (c : ComplaintText)
    (substantiveObject : Prop) : Prop where
  culpable          : CulpablePersonCapableOfIntent p c
  agreement         : AgreementAmongTwoOrMore ag c
  objectIsViolation : substantiveObject



inductive Section1962Violation (c : ComplaintText) : Prop where
  | subA {p e inc i acts} : Section1962a p e inc i acts c → Section1962Violation c
  | subB {p e i acts}     : Section1962b p e i acts c     → Section1962Violation c
  | subC {p e acts}       : Section1962c p e acts c       → Section1962Violation c
  | subD {p ag obj}       : Section1962d p ag c obj       → Section1962Violation c





structure ValidCivilRicoClaim (p : Person) (c : ComplaintText) : Prop where
  violation         : Section1962Violation c
  injury            : InjuredInBusinessOrProperty p c
  proximateCause    : ProximateCause p c
  withinLimitations : WithinLimitations p c
  notSecuritiesBar  : NotSecuritiesFraudBarred p c

end Proving.USC.T18.Wave.Elements
