import Proving.USC.T42.Ch6ASchI.Part2.Procedure.Statute






namespace Proving.USC.T42.Ch6ASchI.Part2.Procedure

open Proving.USC.Common



theorem timelyPermanentPromotion_intro {p c threshold}
    (hQual : FoundQualified p c)
    (hTime : MeetsPromotionServiceThreshold p c threshold) :
    TimelyPermanentPromotion p c threshold :=
  ⟨hQual, hTime⟩


theorem retirementEligibleByAge_intro {p c}
    (hApplied : AppliedForRetirement p c) (hAge : AgeInYears p c ≥ 64) :
    RetirementEligibleByAge p c :=
  ⟨hApplied, hAge⟩


theorem retirementEligibleByFullService_intro {p c}
    (hApplied : AppliedForRetirement p c) (hSvc : YearsOfActiveService p c ≥ 30) :
    RetirementEligibleByFullService p c :=
  ⟨hApplied, hSvc⟩


theorem retirementEligibleByPartialService_intro {p c}
    (hSvc : YearsOfActiveService p c ≥ 20)
    (hComm : YearsOfCommissionedService p c ≥ 10) :
    RetirementEligibleByPartialService p c :=
  ⟨hSvc, hComm⟩


theorem retirementEligible_ofAge {p c}
    (h : RetirementEligibleByAge p c) : RetirementEligible p c :=
  .byAge h


theorem retirementEligible_ofFullService {p c}
    (h : RetirementEligibleByFullService p c) : RetirementEligible p c :=
  .byFullService h


theorem retirementEligible_ofPartialService {p c}
    (h : RetirementEligibleByPartialService p c) : RetirementEligible p c :=
  .byPartialService h


theorem flagPresentationRequired_intro {p c}
    (hRel : ReleasedForRetirement p c) (hNoPrior : ¬ PreviouslyPresentedFlag p c) :
    FlagPresentationRequired p c :=
  ⟨hRel, hNoPrior⟩


theorem corpsMilitarization_intro {p c}
    (hProc : WarOrEmergencyProclaimed p c)
    (hEO : ExecutiveOrderMilitarizingCorps p c) :
    CorpsMilitarization p c :=
  ⟨hProc, hEO⟩


theorem militaryBenefitEntitlement_intro {p c}
    (hTrig : ServiceInWartimeOrOnMilitaryDetail p c) :
    MilitaryBenefitEntitlement p c :=
  ⟨hTrig⟩


theorem validDetail_intro {p c}
    (hReq : DetailRequestMade p c) : ValidDetail p c :=
  ⟨hReq⟩


theorem validAdvisoryAppointment_intro {p c}
    (hApp : AdvisoryCommitteeAppointed p c)
    (hApolitical : AppointmentWithoutPoliticalAffiliation p c) :
    ValidAdvisoryAppointment p c :=
  ⟨hApp, hApolitical⟩

end Proving.USC.T42.Ch6ASchI.Part2.Procedure
