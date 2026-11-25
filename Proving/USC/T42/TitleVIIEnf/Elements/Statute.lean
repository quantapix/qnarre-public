











import Proving.USC.T42.TitleVIIEnf.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Elements

open Proving.USC.Common







structure Section2000e5Private
    (p : Person) (r : Respondent) (ch : Charge) (c : ComplaintText) : Prop where
  aggrieved        : IsAggrievedPerson p c
  personInUS       : IsPersonInUS p c
  privateRight     : HasPrivateRightOfAction p c
  coveredRespondent: IsCoveredRespondent r c
  unlawfulPractice : UnlawfulEmploymentPractice r c
  chargeFiled      : ChargeFiledWithEEOC ch r c
  chargeTimely     : ChargeTimelyFiled ch c
  exhausted        : RightToSueExhausted ch c
  suitTimely       : SuitTimelyFiled p c
  noGoodFaith      : NoGoodFaithRelianceDefense r c





structure Section2000e6PatternOrPractice
    (pp : PatternOrPractice) (enforcer : Person) (c : ComplaintText) : Prop where
  resistance     : PatternOrPracticeOfResistance pp c
  intendedDenial : IntendedToDenyRights pp c
  intent         : IntentToDiscriminate enforcer c
  reasonableCause: EnforcerHasReasonableCause pp c





structure Section2000e16Federal
    (p : Person) (r : Respondent) (c : ComplaintText) : Prop where
  federalEmployee  : IsCoveredFederalEmployee p c
  personInUS       : IsPersonInUS p c
  privateRight     : HasPrivateRightOfAction p c
  unlawfulPractice : UnlawfulEmploymentPractice r c
  exhausted        : FederalAdministrativeExhaustion p c
  suitTimely       : FederalSuitTimelyFiled p c




structure Section2000e8Exemption
    (r : Respondent) (c : ComplaintText) : Prop where
  covered       : IsRecordkeepingCoveredEntity r c
  denied        : ExemptionApplicationDenied r c
  undueHardship : RecordkeepingUndueHardship r c





inductive ValidTitleVIIEnforcementClaim
    (p : Person) (r : Respondent) (ch : Charge)
    (pp : PatternOrPractice) (enforcer : Person) (c : ComplaintText) : Prop where
  | priv      (h : Section2000e5Private p r ch c)
  | federal   (h : Section2000e16Federal p r c)
  | agAction  (h : Section2000e6PatternOrPractice pp enforcer c)

end Proving.USC.T42.TitleVIIEnf.Elements
