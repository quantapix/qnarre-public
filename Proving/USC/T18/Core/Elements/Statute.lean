















import Proving.USC.T18.Core.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Core.Elements

open Proving.USC.Common




inductive PredicateBasis (acts : List Act) (d : UnlawfulDebt) (c : ComplaintText) : Prop where

  | pattern      (h : PatternOfRacketeering acts c)    : PredicateBasis acts d c

  | unlawfulDebt (h : CollectionOfUnlawfulDebt d c)    : PredicateBasis acts d c



structure Section1962a
    (p : Person) (e : Entity) (i : Income) (acts : List Act) (d : UnlawfulDebt)
    (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  basis              : PredicateBasis acts d c
  receivedIncome     : ReceivedIncomeFromPattern p i c
  usesOrInvests      : UsesOrInvestsIncomeInEnterprise p i e c



structure Section1962b
    (p : Person) (e : Entity) (acts : List Act) (d : UnlawfulDebt)
    (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  basis              : PredicateBasis acts d c
  acquiresOrMaintains : AcquiresOrMaintainsInterest p e c



structure Section1962c
    (p : Person) (e : Entity) (acts : List Act) (d : UnlawfulDebt)
    (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  distinct           : PersonEnterpriseDistinct p e c
  associated         : EmployedOrAssociated p e c
  conducts           : ConductsOrParticipates p e c
  basis              : PredicateBasis acts d c




structure Section1962d
    (ag : Agreement) (target : Prop) (c : ComplaintText) : Prop where
  agreement       : AgreementAmongTwoOrMore ag c


  objectViolation : target



inductive ViolationOfSection1962
    (p : Person) (e : Entity) (i : Income) (ag : Agreement)
    (acts : List Act) (d : UnlawfulDebt) (target : Prop) (c : ComplaintText) : Prop where
  | subA (h : Section1962a p e i acts d c)   : ViolationOfSection1962 p e i ag acts d target c
  | subB (h : Section1962b p e acts d c)     : ViolationOfSection1962 p e i ag acts d target c
  | subC (h : Section1962c p e acts d c)     : ViolationOfSection1962 p e i ag acts d target c
  | subD (h : Section1962d ag target c)      : ViolationOfSection1962 p e i ag acts d target c

end Proving.USC.T18.Core.Elements
