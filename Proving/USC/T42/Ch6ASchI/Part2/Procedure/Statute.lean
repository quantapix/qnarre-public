import Proving.USC.T42.Ch6ASchI.Part2.Procedure.Predicates










namespace Proving.USC.T42.Ch6ASchI.Part2.Procedure

open Proving.USC.Common





def CreditedYearsForPromotion (p : Person) (c : ComplaintText) : Nat :=
  YearsOfServiceAboveJunior p c + InternshipCreditYears p c




def MeetsPromotionServiceThreshold (p : Person) (c : ComplaintText) (threshold : Nat) : Prop :=
  CreditedYearsForPromotion p c ≥ threshold




structure TimelyPermanentPromotion (p : Person) (c : ComplaintText) (threshold : Nat) : Prop where
  qualified   : FoundQualified p c
  timeInGrade : MeetsPromotionServiceThreshold p c threshold




structure RetirementEligibleByAge (p : Person) (c : ComplaintText) : Prop where
  applied : AppliedForRetirement p c
  ageMet  : AgeInYears p c ≥ 64


structure RetirementEligibleByFullService (p : Person) (c : ComplaintText) : Prop where
  applied    : AppliedForRetirement p c
  serviceMet : YearsOfActiveService p c ≥ 30



structure RetirementEligibleByPartialService (p : Person) (c : ComplaintText) : Prop where
  serviceMet      : YearsOfActiveService p c ≥ 20
  commissionedMet : YearsOfCommissionedService p c ≥ 10



inductive RetirementEligible (p : Person) (c : ComplaintText) : Prop
  | byAge            (h : RetirementEligibleByAge p c)
  | byFullService    (h : RetirementEligibleByFullService p c)
  | byPartialService (h : RetirementEligibleByPartialService p c)





structure FlagPresentationRequired (p : Person) (c : ComplaintText) : Prop where
  released : ReleasedForRetirement p c
  noPrior  : ¬ PreviouslyPresentedFlag p c





structure CorpsMilitarization (p : Person) (c : ComplaintText) : Prop where
  proclaimed     : WarOrEmergencyProclaimed p c
  executiveOrder : ExecutiveOrderMilitarizingCorps p c




structure MilitaryBenefitEntitlement (p : Person) (c : ComplaintText) : Prop where
  triggered : ServiceInWartimeOrOnMilitaryDetail p c


structure ValidDetail (p : Person) (c : ComplaintText) : Prop where
  requested : DetailRequestMade p c



structure ValidAdvisoryAppointment (p : Person) (c : ComplaintText) : Prop where
  appointed  : AdvisoryCommitteeAppointed p c
  apolitical : AppointmentWithoutPoliticalAffiliation p c

end Proving.USC.T42.Ch6ASchI.Part2.Procedure
