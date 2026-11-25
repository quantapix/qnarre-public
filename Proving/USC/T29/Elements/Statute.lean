












import Proving.USC.T29.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T29.Elements

open Proving.USC.Common





inductive EmployerUlpTheory (p : Person) (c : ComplaintText) : Prop where
  | interferes  : EmployerInterferesWithRights p c          → EmployerUlpTheory p c
  | dominates   : EmployerDominatesUnion p c                → EmployerUlpTheory p c
  | discriminates : EmployerDiscriminatesUnionMembership p c → EmployerUlpTheory p c
  | retaliates  : EmployerRetaliatesForCharge p c           → EmployerUlpTheory p c
  | refusesBargain : EmployerRefusesToBargain p c           → EmployerUlpTheory p c




structure Section158a (p : Person) (c : ComplaintText) : Prop where
  coveredEmployer : IsCoveredEmployer p c
  theory          : EmployerUlpTheory p c
  notSpeechBarred : ¬ ProtectedByFreeSpeech c






inductive UnionUlpTheory (lo : LaborOrganization) (c : ComplaintText) : Prop where
  | restrains      : UnionRestrainsOrCoerces lo c            → UnionUlpTheory lo c
  | causesDiscrim  : UnionCausesEmployerDiscrimination lo c  → UnionUlpTheory lo c
  | refusesBargain : UnionRefusesToBargain lo c              → UnionUlpTheory lo c
  | secondary      : UnionSecondaryActivity lo c             → UnionUlpTheory lo c
  | picketing      : UnionRecognitionalPicketing lo c        → UnionUlpTheory lo c




structure Section158b (lo : LaborOrganization) (c : ComplaintText) : Prop where
  isLaborOrg      : IsLaborOrganization lo c
  theory          : UnionUlpTheory lo c
  notSpeechBarred : ¬ ProtectedByFreeSpeech c






structure Section158e (p : Person) (lo : LaborOrganization) (c : ComplaintText) : Prop where
  coveredEmployer : IsCoveredEmployer p c
  isLaborOrg      : IsLaborOrganization lo c
  hotCargo        : HotCargoAgreement p lo c







inductive Section158Violation (p : Person) (c : ComplaintText) : Prop where
  | employer : Section158a p c → Section158Violation p c
  | union    : (lo : LaborOrganization) → Section158b lo c → Section158Violation p c
  | hotCargo : (lo : LaborOrganization) → Section158e p lo c → Section158Violation p c












structure ValidUnfairLaborPracticeCharge (p : Person) (c : ComplaintText) : Prop where
  violation     : Section158Violation p c
  commerceNexus : FederalJurisdictionalNexus c
  chargeFiled   : ChargeFiledAndServed p c
  timely        : WithinSixMonthLimitations p c
  preponderance : BoardFindsByPreponderance p c






structure Section162Offense (p : Person) (c : ComplaintText) : Prop where
  isPerson    : IsPersonInUS p c
  willfulInterference : WillfullyInterferesWithBoard p c

end Proving.USC.T29.Elements
