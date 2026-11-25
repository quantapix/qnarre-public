









import Proving.Rico.Predicates

namespace Proving.Rico














structure PatternOfRacketeering (acts : List Act) (c : ComplaintText) : Prop where

  twoOrMore       : acts.length ≥ 2

  allRacketeering : ∀ a ∈ acts, IsRacketeeringActivity a c

  withinWindow    : ∃ a ∈ acts, ∃ b ∈ acts, a ≠ b ∧ WithinTenYears a b c

  related         : ∃ a ∈ acts, ∃ b ∈ acts, a ≠ b ∧ Related a b c

  continuous      : Continuous acts c






structure CollectionOfUnlawfulDebt
    (defendant : Person) (e : Entity) (debts : List UnlawfulDebt)
    (c : ComplaintText) : Prop where
  oneOrMore       : debts.length ≥ 1
  allUnlawful     : ∀ d ∈ debts, IsUnlawfulDebt d c
  collected       : ∀ d ∈ debts, CollectedUnlawfulDebt defendant d e c



inductive RicoPredicate
    (defendant : Person) (e : Entity)
    (acts : List Act) (debts : List UnlawfulDebt) (c : ComplaintText) : Prop where
  | viaPattern (h : PatternOfRacketeering acts c) :
      RicoPredicate defendant e acts debts c
  | viaUnlawfulDebt (h : CollectionOfUnlawfulDebt defendant e debts c) :
      RicoPredicate defendant e acts debts c
















structure Section1962c
    (defendant : Person) (e : Entity) (acts : List Act) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent defendant c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  distinct           : PersonEnterpriseDistinct defendant e c
  associated         : EmployedOrAssociated defendant e c
  conducts           : ConductsOrParticipates defendant e c
  pattern            : PatternOfRacketeering acts c










structure Section1962a
    (defendant : Person) (e : Entity) (i : Investment)
    (acts : List Act) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent defendant c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  pattern            : PatternOfRacketeering acts c
  derived            : DerivedFromPattern i acts c
  invested           : InvestedInEnterprise defendant i e c





structure Section1962b
    (defendant : Person) (e : Entity) (ic : InterestOrControl)
    (acts : List Act) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent defendant c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  pattern            : PatternOfRacketeering acts c
  acquired           : AcquiredOrMaintainedControl defendant ic e c
  throughPattern     : AcquisitionThroughPattern ic acts c










structure Section1962d
    (defendant : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  culpable    : CulpablePersonCapableOfIntent defendant c
  agreed      : AgreementToViolateRico defendant ag c
  knew        : KnowledgeOfRicoObjective defendant ag c
  underlying  : UnderlyingSubstantiveViolationContemplated ag c




structure ValidCivilRicoComplaint1962c
    (plaintiff defendant : Person) (e : Entity)
    (acts : List Act) (c : ComplaintText) : Prop where
  violation : Section1962c defendant e acts c
  injury    : BusinessOrPropertyInjury plaintiff c
  causation : ProximateCause plaintiff acts c
  timely    : WithinFourYearLimitationsPeriod plaintiff c



structure ValidCivilRicoComplaint1962a
    (plaintiff defendant : Person) (e : Entity) (i : Investment)
    (acts : List Act) (c : ComplaintText) : Prop where
  violation : Section1962a defendant e i acts c
  injury    : BusinessOrPropertyInjury plaintiff c
  invInjury : InvestmentInjury plaintiff i c
  timely    : WithinFourYearLimitationsPeriod plaintiff c



structure ValidCivilRicoComplaint1962b
    (plaintiff defendant : Person) (e : Entity) (ic : InterestOrControl)
    (acts : List Act) (c : ComplaintText) : Prop where
  violation : Section1962b defendant e ic acts c
  injury    : BusinessOrPropertyInjury plaintiff c
  acqInjury : AcquisitionInjury plaintiff ic c
  timely    : WithinFourYearLimitationsPeriod plaintiff c



structure ValidCivilRicoComplaint1962d
    (plaintiff defendant : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  violation : Section1962d defendant ag c
  injury    : BusinessOrPropertyInjury plaintiff c
  causation : InjuryByOvertActOfRacketeering plaintiff ag c
  timely    : WithinFourYearLimitationsPeriod plaintiff c






inductive ValidCivilRicoComplaint
    (plaintiff defendant : Person) (c : ComplaintText) : Prop where
  | viaSection1962c (e : Entity) (acts : List Act)
      (h : ValidCivilRicoComplaint1962c plaintiff defendant e acts c) :
      ValidCivilRicoComplaint plaintiff defendant c
  | viaSection1962a (e : Entity) (i : Investment) (acts : List Act)
      (h : ValidCivilRicoComplaint1962a plaintiff defendant e i acts c) :
      ValidCivilRicoComplaint plaintiff defendant c
  | viaSection1962b (e : Entity) (ic : InterestOrControl) (acts : List Act)
      (h : ValidCivilRicoComplaint1962b plaintiff defendant e ic acts c) :
      ValidCivilRicoComplaint plaintiff defendant c
  | viaSection1962d (ag : Agreement)
      (h : ValidCivilRicoComplaint1962d plaintiff defendant ag c) :
      ValidCivilRicoComplaint plaintiff defendant c

end Proving.Rico
