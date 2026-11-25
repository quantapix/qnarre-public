



import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Deontic.Types
import Proving.USC.T18.Ch77.Part5.Deontic.Predicates
import Proving.USC.T18.Ch77.Part5.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Deontic

open Proving.USC.Common





theorem coerciveMeansScienter_intro {d v : Person} {c : ComplaintText}
    (hKnew : KnewCoerciveMeansWillBeUsed d v c) : CoerciveMeansScienter d v c :=
  CoerciveMeansScienter.knowledge hKnew




theorem coerciveMeansScienter_recklessDisregard_intro {d v : Person}
    {c : ComplaintText} (hNotAd : ¬ ActConstitutingViolationIsAdvertising d c)
    (hReckless : RecklesslyDisregardedCoerciveMeans d v c) :
    CoerciveMeansScienter d v c :=
  CoerciveMeansScienter.recklessDisregard hNotAd hReckless



theorem minorityScienter_intro {d v : Person} {c : ComplaintText}
    (hKnew : KnewVictimUnderEighteen d v c) : MinorityScienter d v c :=
  MinorityScienter.knowledge hKnew



theorem minorityScienter_recklessDisregard_intro {d v : Person}
    {c : ComplaintText} (hNotAd : ¬ ActConstitutingViolationIsAdvertising d c)
    (hReckless : RecklesslyDisregardedVictimUnderEighteen d v c) :
    MinorityScienter d v c :=
  MinorityScienter.recklessDisregard hNotAd hReckless





theorem minorityScienter_reasonableOpportunityToObserve_intro {d v : Person}
    {c : ComplaintText} (hProsecution : ProsecutionUnderSubsectionAOne c)
    (hObserve : ReasonableOpportunityToObserve d v c) : MinorityScienter d v c :=
  MinorityScienter.reasonableOpportunityToObserve hProsecution hObserve



theorem scienter1591a_intro {d v : Person} {c : ComplaintText}
    (h : CoerciveMeansScienter d v c) : Scienter1591a d v c :=
  Scienter1591a.asToCoerciveMeans h



theorem scienter1591a_asToMinority_intro {d v : Person} {c : ComplaintText}
    (h : MinorityScienter d v c) : Scienter1591a d v c :=
  Scienter1591a.asToMinority h




theorem regulatedAct1591a_intro {d v : Person} {c : ComplaintText}
    (hNexus : JurisdictionalNexusMet d c)
    (hAct : TraffickingActOccurred d v c) : RegulatedAct1591a d v c :=
  RegulatedAct1591a.paragraphOne hNexus hAct


theorem regulatedAct1591a_paragraphTwo_intro {d v : Person} {c : ComplaintText}
    (vn : Venture) (hVenture : VentureEngagedInParagraphOneViolation vn v c)
    (hBenefit : BenefitFromVentureOccurred d vn c) : RegulatedAct1591a d v c :=
  RegulatedAct1591a.paragraphTwo vn hVenture hBenefit




theorem prohibition1591a_intro {d v : Person} {c : ComplaintText}
    (hAddressee : AddresseeAnyPerson d c) (hKnowingly : ActedKnowingly d c)
    (hScienter : Scienter1591a d v c) : Prohibition1591a d v c :=
  ⟨hAddressee, hKnowingly, hScienter⟩


theorem prohibition1591aViolated_intro {d v : Person} {c : ComplaintText}
    (hNorm : Prohibition1591a d v c) (hAct : RegulatedAct1591a d v c) :
    Prohibition1591aViolated d v c :=
  ⟨hNorm, hAct⟩




theorem prescribedPunishment1591b_intro {s : SentencingAuthority} {d v : Person}
    {c : ComplaintText}
    (hGrade : OffenseEffectedByCoerciveMeansOrVictimUnderFourteen d v c)
    (hImposed : ImposedFineAndImprisonmentFifteenYearsToLife s d c) :
    PrescribedPunishment1591b s d v c :=
  PrescribedPunishment1591b.gradeOne hGrade hImposed


theorem prescribedPunishment1591b_gradeTwo_intro {s : SentencingAuthority}
    {d v : Person} {c : ComplaintText}
    (hGrade : OffenseNotSoEffectedAndVictimFourteenToSeventeen d v c)
    (hImposed : ImposedFineAndImprisonmentTenYearsToLife s d c) :
    PrescribedPunishment1591b s d v c :=
  PrescribedPunishment1591b.gradeTwo hGrade hImposed


theorem obligation1591b_intro {s : SentencingAuthority} {d v : Person}
    {c : ComplaintText} (hAddressee : AddresseeSentencingAuthority s c)
    (hConvicted : ConvictedOfOffenseUnderSubsectionA d v c) :
    Obligation1591b s d v c :=
  ⟨hAddressee, hConvicted⟩


theorem obligation1591bDischarged_intro {s : SentencingAuthority} {d v : Person}
    {c : ComplaintText} (hNorm : Obligation1591b s d v c)
    (hImposed : PrescribedPunishment1591b s d v c) :
    Obligation1591bDischarged s d v c :=
  ⟨hNorm, hImposed⟩



theorem obligation1591bBreached_intro {s : SentencingAuthority} {d v : Person}
    {c : ComplaintText} (hNorm : Obligation1591b s d v c)
    (hOmitted : ¬ PrescribedPunishment1591b s d v c) :
    Obligation1591bBreached s d v c :=
  ⟨hNorm, hOmitted⟩




theorem prohibition1591d_intro {d : Person} {c : ComplaintText}
    (hAddressee : AddresseeAnyPerson d c)
    (hEnforcement : EnforcementOfSectionAtIssue c) : Prohibition1591d d c :=
  ⟨hAddressee, hEnforcement⟩


theorem prohibition1591dViolated_intro {d : Person} {c : ComplaintText}
    (hNorm : Prohibition1591d d c) (hAct : ObstructionActOccurred d c) :
    Prohibition1591dViolated d c :=
  ⟨hNorm, hAct⟩


theorem obligation1591dPunishment_intro {s : SentencingAuthority} {d : Person}
    {c : ComplaintText} (hAddressee : AddresseeSentencingAuthority s c)
    (hConvicted : ConvictedOfOffenseUnderSubsectionD d c) :
    Obligation1591dPunishment s d c :=
  ⟨hAddressee, hConvicted⟩


theorem obligation1591dPunishmentDischarged_intro {s : SentencingAuthority}
    {d : Person} {c : ComplaintText} (hNorm : Obligation1591dPunishment s d c)
    (hImposed : ImposedFineOrImprisonmentNotExceedingTwentyFiveYears s d c) :
    Obligation1591dPunishmentDischarged s d c :=
  ⟨hNorm, hImposed⟩


theorem obligation1591dPunishmentBreached_intro {s : SentencingAuthority}
    {d : Person} {c : ComplaintText} (hNorm : Obligation1591dPunishment s d c)
    (hOmitted : ¬ ImposedFineOrImprisonmentNotExceedingTwentyFiveYears s d c) :
    Obligation1591dPunishmentBreached s d c :=
  ⟨hNorm, hOmitted⟩




theorem section1591Violated_intro {d v : Person} {c : ComplaintText}
    (h : Prohibition1591aViolated d v c) : Section1591Violated d v c :=
  Section1591Violated.subsectionA h


theorem section1591Violated_subsectionD_intro {d v : Person}
    {c : ComplaintText} (h : Prohibition1591dViolated d c) :
    Section1591Violated d v c :=
  Section1591Violated.subsectionD h

end Proving.USC.T18.Ch77.Part5.Deontic
