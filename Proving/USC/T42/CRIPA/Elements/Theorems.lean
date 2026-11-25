






import Proving.USC.T42.CRIPA.Elements.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.CRIPA.Elements

open Proving.USC.Common


theorem section1997bCertification_intro
    {p cert c}
    (hNotice : Gave49DayWrittenNotice cert c)
    (hConcil : MadeGoodFaithConciliationEffort cert c)
    (hTime : AffordedReasonableTimeToCorrect cert c)
    (hPub : CertifiedGeneralPublicImportance cert c)
    (hSign : AGPersonallySignedCertification p cert c) :
    Section1997bCertification p cert c :=
  ⟨hNotice, hConcil, hTime, hPub, hSign⟩


theorem section1997aAction_intro
    {ag defendant i cert c}
    (hInst : IsCoveredInstitution i c)
    (hNexus : DefendantIsSovereign defendant c)
    (hCause : AGHasReasonableCause i c)
    (hEgreg : SubjectedToEgregiousConditions i c)
    (hDepr : DeprivesFederalRightsGrievousHarm i c)
    (hPat : PatternOrPracticeOfResistance i c)
    (hRelief : SeeksMinimumCorrectiveRelief i c)
    (hComplaint : AGPersonallySignedComplaint ag c)
    (hCert : Section1997bCertification ag cert c) :
    Section1997aAction ag defendant i cert c :=
  ⟨hInst, hNexus, hCause, hEgreg, hDepr, hPat, hRelief, hComplaint, hCert⟩


theorem section1997cIntervention_intro
    {ag defendant i cert c}
    (hInst : IsCoveredInstitution i c)
    (hNexus : DefendantIsSovereign defendant c)
    (hPending : PendingActionCommenced i c)
    (hCause : AGHasReasonableCause i c)
    (hEgreg : SubjectedToEgregiousConditions i c)
    (hDepr : DeprivesFederalRightsGrievousHarm i c)
    (hPat : PatternOrPracticeOfResistance i c)
    (hTiming : InterventionTimingSatisfied c)
    (hPub : CertifiedGeneralPublicImportance cert c)
    (hSign : AGPersonallySignedCertification ag cert c) :
    Section1997cIntervention ag defendant i cert c :=
  ⟨hInst, hNexus, hPending, hCause, hEgreg, hDepr, hPat, hTiming, hPub, hSign⟩


theorem section1997dRetaliation_intro
    {p c}
    (hReport : ReportedConditions p c)
    (hRetal : SubjectedToRetaliation p c) :
    Section1997dRetaliation p c :=
  ⟨hReport, hRetal⟩


theorem section1997ePrisonerSuitGate_intro
    {p c}
    (hPris : IsPrisoner p c)
    (hExh : ExhaustedAdministrativeRemedies p c)
    (hPhys : PriorPhysicalInjuryShowing p c) :
    Section1997ePrisonerSuitGate p c :=
  ⟨hPris, hExh, hPhys⟩


theorem validCRIPAEnforcementAction_ofOriginal
    {ag defendant i cert c}
    (h : Section1997aAction ag defendant i cert c) :
    ValidCRIPAEnforcementAction ag defendant i cert c :=
  .originalAction h


theorem validCRIPAEnforcementAction_ofIntervention
    {ag defendant i cert c}
    (h : Section1997cIntervention ag defendant i cert c) :
    ValidCRIPAEnforcementAction ag defendant i cert c :=
  .intervention h

end Proving.USC.T42.CRIPA.Elements
