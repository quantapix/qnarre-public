











import Proving.USC.T09.Deontic.Predicates

namespace Proving.USC.T09.Deontic

open Proving.USC.Common






structure EnforceabilityNorm2 (a : ArbitrationAgreement) (c : ComplaintText) : Prop where
  isAgreement : IsWrittenArbitrationAgreement a c



def EnforceabilityConferred2 (a : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  EnforceabilityNorm2 a c ∧ ¬ RevocationGroundExists a c






structure StayObligation3 (a : ArbitrationAgreement) (p : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  isAgreement   : IsWrittenArbitrationAgreement a c
  referable     : IssueReferableToArbitration a pr c
  applied       : PartyAppliedForRelief p c
  notInDefault  : ApplicantNotInDefault p c



def StayObligationBreached3 (a : ArbitrationAgreement) (p : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop :=
  StayObligation3 a p pr c ∧ ¬ CourtEnteredOrder pr c







structure CompelObligation4 (p : Person) (a : ArbitrationAgreement) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  isAgreement  : IsWrittenArbitrationAgreement a c
  failure      : FailureToArbitrate p a c
  petitioned   : PartyAppliedForRelief p c
  notInIssue   : MakingNotInIssue a c



def CompelObligationBreached4 (p : Person) (a : ArbitrationAgreement) (pr : Proceeding)
    (c : ComplaintText) : Prop :=
  CompelObligation4 p a pr c ∧ ¬ CourtEnteredOrder pr c






structure ConfirmObligation9 (w : ArbitralAward) (p : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  applied   : PartyAppliedForRelief p c
  timely    : AwardConfirmationTimely w c
  noGround  : NoGroundToRefuseConfirmation w c



def ConfirmObligationBreached9 (w : ArbitralAward) (p : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop :=
  ConfirmObligation9 w p pr c ∧ ¬ CourtEnteredOrder pr c








structure InvalidityProhibition402 (a : ArbitrationAgreement) (p : Person)
    (c : ComplaintText) : Prop where
  predispute  : IsPredisputeArbitrationAgreement a c
  elected     : SexualMisconductDisputeElected p c



def InvalidityProhibitionViolated402 (a : ArbitrationAgreement) (p : Person)
    (c : ComplaintText) : Prop :=
  InvalidityProhibition402 a p c ∧ EnforcementSought a c






structure AppointmentPower5 (a : ArbitrationAgreement) (court : Court)
    (c : ComplaintText) : Prop where
  isAgreement : IsWrittenArbitrationAgreement a c

end Proving.USC.T09.Deontic
