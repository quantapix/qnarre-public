













import Proving.USC.T42.CRIPA.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.CRIPA.Elements

open Proving.USC.Common



structure Section1997bCertification
    (p : Person) (cert : Certification) (c : ComplaintText) : Prop where
  notice49Day        : Gave49DayWrittenNotice cert c
  conciliation       : MadeGoodFaithConciliationEffort cert c
  reasonableTime     : AffordedReasonableTimeToCorrect cert c
  publicImportance   : CertifiedGeneralPublicImportance cert c
  personallySigned   : AGPersonallySignedCertification p cert c





structure Section1997aAction
    (ag : Person) (defendant : Person) (i : Institution)
    (cert : Certification) (c : ComplaintText) : Prop where
  coveredInstitution : IsCoveredInstitution i c
  stateNexus         : DefendantIsSovereign defendant c
  reasonableCause    : AGHasReasonableCause i c
  egregious          : SubjectedToEgregiousConditions i c
  deprivesRights     : DeprivesFederalRightsGrievousHarm i c
  patternOrPractice  : PatternOrPracticeOfResistance i c
  minimumRelief      : SeeksMinimumCorrectiveRelief i c
  signedComplaint    : AGPersonallySignedComplaint ag c
  certification      : Section1997bCertification ag cert c





structure Section1997cIntervention
    (ag : Person) (defendant : Person) (i : Institution)
    (cert : Certification) (c : ComplaintText) : Prop where
  coveredInstitution : IsCoveredInstitution i c
  stateNexus         : DefendantIsSovereign defendant c
  pendingAction      : PendingActionCommenced i c
  reasonableCause    : AGHasReasonableCause i c
  egregious          : SubjectedToEgregiousConditions i c
  deprivesRights     : DeprivesFederalRightsGrievousHarm i c
  patternOrPractice  : PatternOrPracticeOfResistance i c
  timing             : InterventionTimingSatisfied c
  publicImportance   : CertifiedGeneralPublicImportance cert c
  signedMotion       : AGPersonallySignedCertification ag cert c




structure Section1997dRetaliation
    (p : Person) (c : ComplaintText) : Prop where
  reported     : ReportedConditions p c
  retaliated   : SubjectedToRetaliation p c




structure Section1997ePrisonerSuitGate
    (p : Person) (c : ComplaintText) : Prop where
  prisoner         : IsPrisoner p c
  exhausted        : ExhaustedAdministrativeRemedies p c
  physicalInjury   : PriorPhysicalInjuryShowing p c




inductive ValidCRIPAEnforcementAction
    (ag : Person) (defendant : Person) (i : Institution)
    (cert : Certification) (c : ComplaintText) : Prop where
  | originalAction
      (h : Section1997aAction ag defendant i cert c) :
      ValidCRIPAEnforcementAction ag defendant i cert c
  | intervention
      (h : Section1997cIntervention ag defendant i cert c) :
      ValidCRIPAEnforcementAction ag defendant i cert c

end Proving.USC.T42.CRIPA.Elements
