import Proving.USC.T18.Ch11.Procedure.Predicates
import Proving.USC.Common.Types













namespace Proving.USC.T18.Ch11.Procedure
open Proving.USC.Common




def WithinTwoYearBar (p : Person) (c : ComplaintText) : Prop :=
  DaysSinceServiceTermination p c ≤ 730


def WithinOneYearBar (p : Person) (c : ComplaintText) : Prop :=
  DaysSinceServiceTermination p c ≤ 365


def MeetsReceiptsThreshold (p : Person) (c : ComplaintText) : Prop :=
  GrossReceiptsInTwentyFourMonths p c ≥ 5000000


def MeetsConcertedCountThreshold (p : Person) (c : ComplaintText) : Prop :=
  PersonsActingInConcert p c ≥ 4


def IsSpecialGovernmentEmployee (p : Person) (c : ComplaintText) : Prop :=
  DaysServedInThreeSixtyFive p c ≤ 130


def ExceedsSixtyDayThreshold (p : Person) (c : ComplaintText) : Prop :=
  AggregateDaysServedPreceding p c > 60






structure PermanentRepresentationBar (p : Person) (c : ComplaintText) : Prop where
  heldPosition : PersonHeldCoveredPosition p c
  contact      : RestrictedContactMade p c
  intent       : IntentToInfluencePresent p c
  participated : ParticipatedPersonallyAndSubstantially p c



structure TwoYearRepresentationBar (p : Person) (c : ComplaintText) : Prop where
  heldPosition : PersonHeldCoveredPosition p c
  contact      : RestrictedContactMade p c
  intent       : IntentToInfluencePresent p c
  pending      : MatterPendingUnderResponsibility p c
  inWindow     : WithinTwoYearBar p c


structure OneYearContactBar (p : Person) (c : ComplaintText) : Prop where
  heldPosition : PersonHeldCoveredPosition p c
  contact      : RestrictedContactMade p c
  intent       : IntentToInfluencePresent p c
  inWindow     : WithinOneYearBar p c


structure ForeignEntityRepresentationBar (p : Person) (c : ComplaintText) : Prop where
  heldPosition : PersonHeldCoveredPosition p c
  foreign      : RepresentsForeignEntity p c
  intent       : IntentToInfluencePresent p c
  inWindow     : WithinOneYearBar p c


inductive Section207CoolingOffViolation (p : Person) (c : ComplaintText) : Prop
  | permanent (h : PermanentRepresentationBar p c)
  | twoYear   (h : TwoYearRepresentationBar p c)
  | oneYear   (h : OneYearContactBar p c)
  | foreign   (h : ForeignEntityRepresentationBar p c)




structure MisdemeanorPenaltyTrigger (p : Person) (c : ComplaintText) : Prop where
  offense : ConductConstitutesEnumeratedOffense p c


structure FelonyPenaltyTrigger (p : Person) (c : ComplaintText) : Prop where
  offense : ConductConstitutesEnumeratedOffense p c
  willful : WillfulViolation p c


structure CivilPenaltyLiability (p : Person) (c : ComplaintText) : Prop where
  offense       : ConductConstitutesEnumeratedOffense p c
  civilAction   : AttorneyGeneralCivilActionFiled p c
  preponderance : ProvedByPreponderance p c


structure InjunctionIssuable (p : Person) (c : ComplaintText) : Prop where
  petition   : AttorneyGeneralInjunctionPetitionFiled p c
  courtFinds : CourtFindsOffenseConduct p c



inductive Section216EnforcementDisposition (p : Person) (c : ComplaintText) : Prop
  | misdemeanor (h : MisdemeanorPenaltyTrigger p c)
  | felony      (h : FelonyPenaltyTrigger p c)
  | civil       (h : CivilPenaltyLiability p c)
  | injunction  (h : InjunctionIssuable p c)





inductive ConflictExemptionSatisfied (p : Person) (c : ComplaintText) : Prop
  | advanceDetermination (h : AdvanceWrittenDeterminationObtained p c)
  | regulatory           (h : RegulatoryExemptionApplies p c)



structure ConflictOfInterestViolation (p : Person) (c : ComplaintText) : Prop where
  participated  : ParticipatedPersonallyAndSubstantially p c
  interest      : FinancialInterestPresent p c
  noExemption   : ¬ ConflictExemptionSatisfied p c





structure RecoveryByUnitedStates (p : Person) (c : ComplaintText) : Prop where
  conviction : FinalConvictionForChapterViolation p c
  tainted    : TransactionTaintedByViolation p c
  voided     : VoidingDeclaredByExecutive p c





structure ContinuingFinancialCrimesEnterprise (p : Person) (c : ComplaintText) : Prop where
  series   : SeriesOfPredicateViolations p c
  receipts : MeetsReceiptsThreshold p c
  concert  : MeetsConcertedCountThreshold p c

end Proving.USC.T18.Ch11.Procedure
