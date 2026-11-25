







import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Reslice.Ontology.Types
import Proving.USC.T18.Ch77.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch77.Reslice.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Ontology

open Proving.USC.Common




theorem abuseOfLegalProcessMembership_intro
    {u : LegalProcessUse} {p : Person} {c : ComplaintText}
    (hAbuse : IsAbuseOrThreatenedAbuseOfLawOrLegalProcess u c)
    (hUse : IsUseOrThreatenedUseOfLawOrLegalProcess u c)
    (hPurpose : ForPurposeForWhichLawNotDesigned u c)
    (hPressure : ExertsPressureToCauseActionOrInaction u p c) :
    AbuseOfLegalProcessMembership u p c :=
  ⟨hAbuse, hUse, hPurpose, hPressure⟩




theorem coercionMembership_intro_threatOfSeriousHarm
    {m : CoerciveMeans} {c : ComplaintText} (h : Harm)
    (hSerious : IsSeriousHarm h c) (hThreat : ThreatensSeriousHarm m h c) :
    CoercionMembership m c :=
  CoercionMembership.threatOfSeriousHarm h hSerious hThreat


theorem coercionMembership_intro_threatOfPhysicalRestraint
    {m : CoerciveMeans} {c : ComplaintText} (p : Person)
    (hThreat : ThreatensPhysicalRestraint m p c) :
    CoercionMembership m c :=
  CoercionMembership.threatOfPhysicalRestraint p hThreat


theorem coercionMembership_intro_schemeCausingBeliefOfSeriousHarm
    {m : CoerciveMeans} {c : ComplaintText} (h : Harm)
    (hSerious : IsSeriousHarm h c)
    (hScheme : IsSchemeCausingBeliefOfSeriousHarm m h c) :
    CoercionMembership m c :=
  CoercionMembership.schemeCausingBeliefOfSeriousHarm h hSerious hScheme


theorem coercionMembership_intro_schemeCausingBeliefOfPhysicalRestraint
    {m : CoerciveMeans} {c : ComplaintText} (p : Person)
    (hScheme : IsSchemeCausingBeliefOfPhysicalRestraint m p c) :
    CoercionMembership m c :=
  CoercionMembership.schemeCausingBeliefOfPhysicalRestraint p hScheme


theorem coercionMembership_intro_abuseOfLegalProcess
    {m : CoerciveMeans} {c : ComplaintText} (u : LegalProcessUse)
    (hAbuse : IsAbuseOrThreatenedAbuseOfLawOrLegalProcess u c)
    (hMeans : EmployedAsCoerciveMeans u m c) :
    CoercionMembership m c :=
  CoercionMembership.abuseOfLegalProcess u hAbuse hMeans


theorem coercionTerm_intro
    {m : CoerciveMeans} {c : ComplaintText}
    (hCoercion : IsCoercion m c) (hCase : CoercionMembership m c) :
    CoercionTerm m c :=
  ⟨hCoercion, hCase⟩




theorem commercialSexActMembership_intro
    {s : SexAct} {c : ComplaintText}
    (hTerm : IsCommercialSexAct s c) (hSexAct : IsSexAct s c)
    (hValue : AnythingOfValueGivenOrReceivedOnAccountOfAct s c) :
    CommercialSexActMembership s c :=
  ⟨hTerm, hSexAct, hValue⟩


theorem ventureMembership_intro
    {v : Venture} {c : ComplaintText}
    (hTerm : IsVenture v c) (hGroup : IsGroupOfTwoOrMoreIndividuals v c)
    (hAssoc : IsAssociatedInFact v c) :
    VentureMembership v c :=
  ⟨hTerm, hGroup, hAssoc⟩


theorem participationInAVentureMembership_intro
    {a : Assistance} {v : Venture} {c : ComplaintText}
    (hTerm : IsParticipationInAVenture a c) (hVenture : VentureMembership v c)
    (hAssist : KnowinglyAssistsSupportsOrFacilitates a v c)
    (hViolation : IsViolationOfSection1591a1 v c) :
    ParticipationInAVentureMembership a v c :=
  ⟨hTerm, hVenture, hAssist, hViolation⟩


theorem seriousHarmMembership_intro
    {h : Harm} {p : Person} {c : ComplaintText}
    (hTerm : IsSeriousHarm h c) (hHarm : IsHarmPhysicalOrNonphysical h c)
    (hSerious : IsSufficientlySeriousUnderAllCircumstances h c)
    (hCompels : CompelsReasonablePersonToPerformCommercialSexualActivity h p c) :
    SeriousHarmMembership h p c :=
  ⟨hTerm, hHarm, hSerious, hCompels⟩




theorem documentKind_intro_passportOrImmigration
    {d : IdentificationDocument} {c : ComplaintText}
    (h : IsPassportOrOtherImmigrationDocument d c) : DocumentKind d c :=
  DocumentKind.passportOrImmigration h


theorem documentKind_intro_governmentIdentification
    {d : IdentificationDocument} {c : ComplaintText}
    (h : IsGovernmentIdentificationDocument d c) : DocumentKind d c :=
  DocumentKind.governmentIdentification h


theorem identificationDocumentMembership_intro
    {d : IdentificationDocument} {p : Person} {c : ComplaintText}
    (hKind : DocumentKind d c) (hActual : IsActualOrPurportedDocument d c)
    (hOther : IsDocumentOfAnotherPerson d p c) :
    IdentificationDocumentMembership d p c :=
  ⟨hKind, hActual, hOther⟩




theorem section1590aTermInventory_intro
    {p : Person} {l : LaborOrServices} {c : ComplaintText}
    (hPerson : IsPersonRecruitedHarboredTransportedProvidedOrObtained p c)
    (hLabor : IsLaborOrServices l c)
    (hChapter : IsChapter77Violation c) :
    Section1590aTermInventory p l c :=
  ⟨hPerson, hLabor, hChapter⟩


theorem section1590AggravatedClass_intro
    {p : Person} {l : LaborOrServices} {c : ComplaintText}
    (hBase : Section1590aTermInventory p l c)
    (hAgg : IsSection1590AggravatedViolationClass c) :
    Section1590AggravatedClass p l c :=
  ⟨hBase, hAgg⟩


theorem section1591aTermInventory_intro
    {p : Person} {s : SexAct} {c : ComplaintText}
    (hPerson : IsPersonRecruitedEnticedHarboredOrSolicited p c)
    (hAct : CommercialSexActMembership s c)
    (hJurisdiction : AffectsInterstateOrForeignCommerceOrIsWithinSMTJ c) :
    Section1591aTermInventory p s c :=
  ⟨hPerson, hAct, hJurisdiction⟩


theorem section1591VictimOrMeansClass_intro_byForceOrThreatOfForce
    {p : Person} {m : CoerciveMeans} {c : ComplaintText}
    (h : UsesForceOrThreatOfForce m c) : Section1591VictimOrMeansClass p m c :=
  Section1591VictimOrMeansClass.byForceOrThreatOfForce h


theorem section1591VictimOrMeansClass_intro_byFraud
    {p : Person} {m : CoerciveMeans} {c : ComplaintText}
    (h : UsesFraud m c) : Section1591VictimOrMeansClass p m c :=
  Section1591VictimOrMeansClass.byFraud h


theorem section1591VictimOrMeansClass_intro_byCoercion
    {p : Person} {m : CoerciveMeans} {c : ComplaintText}
    (h : CoercionTerm m c) : Section1591VictimOrMeansClass p m c :=
  Section1591VictimOrMeansClass.byCoercion h


theorem section1591VictimOrMeansClass_intro_byMinority
    {p : Person} {m : CoerciveMeans} {c : ComplaintText}
    (h : HasNotAttainedAge18 p c) : Section1591VictimOrMeansClass p m c :=
  Section1591VictimOrMeansClass.byMinority h


theorem section1591bAgeGradingClass_intro_underFourteen
    {p : Person} {c : ComplaintText}
    (h : HasNotAttainedAge14 p c) : Section1591bAgeGradingClass p c :=
  Section1591bAgeGradingClass.underFourteen h


theorem section1591bAgeGradingClass_intro_fourteenThroughSeventeen
    {p : Person} {c : ComplaintText}
    (hAtLeast : ¬ HasNotAttainedAge14 p c) (hUnder : HasNotAttainedAge18 p c) :
    Section1591bAgeGradingClass p c :=
  Section1591bAgeGradingClass.fourteenThroughSeventeen hAtLeast hUnder


theorem section1592aNexus_intro_inCourseOfEnumeratedViolation
    {d : IdentificationDocument} {p : Person} {c : ComplaintText}
    (h : IsInCourseOfEnumeratedChapter77Violation c) : Section1592aNexus d p c :=
  Section1592aNexus.inCourseOfEnumeratedViolation h


theorem section1592aNexus_intro_withIntentToViolate
    {d : IdentificationDocument} {p : Person} {c : ComplaintText}
    (h : HasIntentToViolateEnumeratedChapter77Section c) : Section1592aNexus d p c :=
  Section1592aNexus.withIntentToViolate h


theorem section1592aNexus_intro_toRestrictLibertyOfTraffickingVictim
    {d : IdentificationDocument} {p : Person} {c : ComplaintText}
    (hRestrict : RestrictsLibertyToMoveOrTravel d p c)
    (hAuthority : WithoutLawfulAuthority c)
    (hMaintain : InOrderToMaintainLaborOrServices p c)
    (hVictim : IsVictimOfSevereFormOfTraffickingInPersons p c) :
    Section1592aNexus d p c :=
  Section1592aNexus.toRestrictLibertyOfTraffickingVictim hRestrict hAuthority hMaintain hVictim


theorem section1592aTermInventory_intro
    {d : IdentificationDocument} {p : Person} {c : ComplaintText}
    (hDoc : IdentificationDocumentMembership d p c)
    (hNexus : Section1592aNexus d p c) :
    Section1592aTermInventory d p c :=
  ⟨hDoc, hNexus⟩


theorem section1592bVictimExemptionClass_intro
    {p : Person} {c : ComplaintText}
    (hVictim : IsVictimOfSevereFormOfTraffickingInPersons p c)
    (hIncidental : IsConductCausedByOrIncidentToTrafficking p c) :
    Section1592bVictimExemptionClass p c :=
  ⟨hVictim, hIncidental⟩


theorem enforcementObstructionMembership_intro_obstructs
    {a : ObstructiveAct} {c : ComplaintText}
    (h : ObstructsEnforcement a c) : EnforcementObstructionMembership a c :=
  EnforcementObstructionMembership.obstructs h


theorem enforcementObstructionMembership_intro_attemptsToObstruct
    {a : ObstructiveAct} {c : ComplaintText}
    (h : AttemptsToObstructEnforcement a c) : EnforcementObstructionMembership a c :=
  EnforcementObstructionMembership.attemptsToObstruct h


theorem enforcementObstructionMembership_intro_interferesWith
    {a : ObstructiveAct} {c : ComplaintText}
    (h : InterferesWithEnforcement a c) : EnforcementObstructionMembership a c :=
  EnforcementObstructionMembership.interferesWith h


theorem enforcementObstructionMembership_intro_prevents
    {a : ObstructiveAct} {c : ComplaintText}
    (h : PreventsEnforcement a c) : EnforcementObstructionMembership a c :=
  EnforcementObstructionMembership.prevents h






theorem hasNotAttainedAge14_implies_age18
    {p : Person} {c : ComplaintText} (h : HasNotAttainedAge14 p c) :
    HasNotAttainedAge18 p c :=
  (hasNotAttainedAge18_iff p c).mpr
    (Nat.lt_trans ((hasNotAttainedAge14_iff p c).mp h) (by decide))

end Proving.USC.T18.Ch77.Reslice.Ontology
