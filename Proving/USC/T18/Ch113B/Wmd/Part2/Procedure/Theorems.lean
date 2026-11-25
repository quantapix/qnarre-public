






import Proving.USC.T18.Ch113B.Wmd.Part2.Procedure.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Procedure.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part2.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Procedure

open Proving.USC.Common



theorem conductTranscendsNationalBoundaries_intro
    {o : Offense} {c : ComplaintText}
    (hWithin : ConductOccurredWithinUnitedStates o c)
    (hOutside : ConductOccurredOutsideUnitedStates o c) :
    ConductTranscendsNationalBoundaries o c :=
  ⟨hWithin, hOutside⟩



theorem commerceEffectCircumstance_actual_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : OffenseObstructedDelayedOrAffectedCommerce o x c) :
    CommerceEffectCircumstance o x c :=
  .actual h

theorem commerceEffectCircumstance_ifConsummated_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : OffenseWouldHaveAffectedCommerceIfConsummated o x c) :
    CommerceEffectCircumstance o x c :=
  .ifConsummated h

theorem federalVictimCircumstance_unitedStatesGovernment_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : VictimIsUnitedStatesGovernment o x c) : FederalVictimCircumstance o x c :=
  .unitedStatesGovernment h

theorem federalVictimCircumstance_uniformedServicesMember_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : VictimIsMemberOfUniformedServices o x c) : FederalVictimCircumstance o x c :=
  .uniformedServicesMember h

theorem federalVictimCircumstance_federalOfficialOrEmployee_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : VictimIsFederalOfficialOfficerEmployeeOrAgent o x c) :
    FederalVictimCircumstance o x c :=
  .federalOfficialOrEmployee h



theorem withinTwelveNauticalMilesOfBaseline_intro
    {o : Offense} {c : ComplaintText} {n : Nat}
    (hExtracted : nauticalMilesSeawardFromBaseline o c = n) (hLine : n ≤ 12) :
    WithinTwelveNauticalMilesOfBaseline o c := by
  unfold WithinTwelveNauticalMilesOfBaseline
  omega

theorem territorialSeaCircumstance_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (hLocus : OffenseSiteWithinTerritorialSeaLocus o x c)
    (hWithin : WithinTwelveNauticalMilesOfBaseline o c) :
    TerritorialSeaCircumstance o x c :=
  ⟨hLocus, hWithin⟩

theorem section2332bCircumstance_mailOrInterstateFacility_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : MailOrInterstateFacilityUsedInFurtherance o x c) :
    Section2332bCircumstance o x c :=
  .mailOrInterstateFacility h

theorem section2332bCircumstance_commerceEffect_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : CommerceEffectCircumstance o x c) : Section2332bCircumstance o x c :=
  .commerceEffect h

theorem section2332bCircumstance_federalVictim_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : FederalVictimCircumstance o x c) : Section2332bCircumstance o x c :=
  .federalVictim h

theorem section2332bCircumstance_federalProperty_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : PropertyOwnedPossessedOrLeasedByUnitedStates o x c) :
    Section2332bCircumstance o x c :=
  .federalProperty h

theorem section2332bCircumstance_territorialSea_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : TerritorialSeaCircumstance o x c) : Section2332bCircumstance o x c :=
  .territorialSea h

theorem section2332bCircumstance_specialMaritimeAndTerritorialJurisdiction_intro
    {o : Offense} {x : Person} {c : ComplaintText}
    (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o x c) :
    Section2332bCircumstance o x c :=
  .specialMaritimeAndTerritorialJurisdiction h



theorem circumstanceApplicableToSomeOffender_intro
    {o : Offense} {c : ComplaintText} (y : Person)
    (h : Section2332bCircumstance o y c) :
    CircumstanceApplicableToSomeOffender o c :=
  ⟨y, h⟩



theorem coveredOffenderRole_principal_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : IsPrincipalOfOffense x o c) : CoveredOffenderRole x o c :=
  .principal h

theorem coveredOffenderRole_coConspirator_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : IsCoConspiratorOfOffense x o c) : CoveredOffenderRole x o c :=
  .coConspirator h

theorem coveredOffenderRole_accessoryAfterTheFact_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : IsAccessoryAfterTheFactToOffense x o c) : CoveredOffenderRole x o c :=
  .accessoryAfterTheFact h

theorem jurisdictionOverOffender_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (hCharged : ChargedAsOffenseUnderThisSection o c)
    (hRole : CoveredOffenderRole x o c)
    (hCircumstance : CircumstanceApplicableToSomeOffender o c) :
    JurisdictionOverOffender x o c :=
  ⟨hCharged, hRole, hCircumstance⟩



theorem extraterritorialJurisdiction_subsectionAOffense_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : OffenseIsUnderSubsectionA o c) : ExtraterritorialJurisdiction x o c :=
  .subsectionAOffense h

theorem extraterritorialJurisdiction_inchoateOffense_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : OffenseIsThreatAttemptOrConspiracy o c) : ExtraterritorialJurisdiction x o c :=
  .inchoateOffense h

theorem extraterritorialJurisdiction_accessoryAfterTheFact_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (hOffense : OffenseIsUnderSubsectionA o c)
    (hAccessory : ConductRendersAccessoryAfterTheFactUnderSection3 x o c) :
    ExtraterritorialJurisdiction x o c :=
  .accessoryAfterTheFact hOffense hAccessory



theorem jurisdictionalBaseEstablished_intro
    {i : Indictment} {o : Offense} {c : ComplaintText}
    (hAlleged : JurisdictionalBaseAllegedInIndictment i o c)
    (hCircumstance : CircumstanceApplicableToSomeOffender o c) :
    JurisdictionalBaseEstablished i o c :=
  ⟨hAlleged, hCircumstance⟩





theorem jurisdictionalBaseEstablished_knowledge_not_required
    {i : Indictment} {o : Offense} {x : Person} {c : ComplaintText}
    (h : JurisdictionalBaseEstablished i o c)
    (_hNoKnowledge : ¬ DefendantKnewJurisdictionalBase x o c) :
    JurisdictionalBaseEstablished i o c :=
  h

theorem stateLawAdoptionScope_intro
    {o : Offense} {s : StateLawProvision} {c : ComplaintText}
    (hBased : ProsecutionBasedOnAdoptedStateLaw o c)
    (hElement : StateProvisionDefinesElementOfOffense s o c)
    (hNotProcedure : ¬ StateProvisionPertainsToCriminalProcedureOrEvidence s c) :
    StateLawAdoptionScope o s c :=
  ⟨hBased, hElement, hNotProcedure⟩



theorem stateLawAdoptionScope_excludes_procedure_and_evidence
    {o : Offense} {s : StateLawProvision} {c : ComplaintText}
    (h : StateLawAdoptionScope o s c)
    (hProcedure : StateProvisionPertainsToCriminalProcedureOrEvidence s c) : False :=
  h.notProcedureOrEvidence hProcedure



theorem terrorismMotive_influenceOrAffectGovernmentConduct_intro
    {o : Offense} {c : ComplaintText}
    (h : CalculatedToInfluenceGovernmentConduct o c) : TerrorismMotive o c :=
  .influenceOrAffectGovernmentConduct h

theorem terrorismMotive_retaliateAgainstGovernmentConduct_intro
    {o : Offense} {c : ComplaintText}
    (h : CalculatedToRetaliateAgainstGovernmentConduct o c) : TerrorismMotive o c :=
  .retaliateAgainstGovernmentConduct h

theorem enumeratedTerrorismPredicateViolation_title18Offense_intro
    {o : Offense} {c : ComplaintText}
    (h : ViolatesEnumeratedTitle18TerrorismOffense o c) :
    EnumeratedTerrorismPredicateViolation o c :=
  .title18Offense h

theorem enumeratedTerrorismPredicateViolation_atomicEnergyActOffense_intro
    {o : Offense} {c : ComplaintText}
    (h : ViolatesAtomicEnergyActOffense o c) :
    EnumeratedTerrorismPredicateViolation o c :=
  .atomicEnergyActOffense h

theorem enumeratedTerrorismPredicateViolation_title49Offense_intro
    {o : Offense} {c : ComplaintText}
    (h : ViolatesEnumeratedTitle49Offense o c) :
    EnumeratedTerrorismPredicateViolation o c :=
  .title49Offense h

theorem enumeratedTerrorismPredicateViolation_narcoterrorismOffense_intro
    {o : Offense} {c : ComplaintText}
    (h : ViolatesNarcoterrorismOffense o c) :
    EnumeratedTerrorismPredicateViolation o c :=
  .narcoterrorismOffense h

theorem federalCrimeOfTerrorism_intro
    {o : Offense} {c : ComplaintText}
    (hMotive : TerrorismMotive o c)
    (hViolation : EnumeratedTerrorismPredicateViolation o c) :
    FederalCrimeOfTerrorism o c :=
  ⟨hMotive, hViolation⟩

theorem attorneyGeneralPrimaryInvestigativeResponsibility_federalCrimeOfTerrorism_intro
    {o : Offense} {c : ComplaintText}
    (h : FederalCrimeOfTerrorism o c) :
    AttorneyGeneralPrimaryInvestigativeResponsibility o c :=
  .federalCrimeOfTerrorism h

theorem attorneyGeneralPrimaryInvestigativeResponsibility_listedSectionViolation_intro
    {o : Offense} {c : ComplaintText}
    (h : ViolatesSectionListedInSubsectionF o c) :
    AttorneyGeneralPrimaryInvestigativeResponsibility o c :=
  .listedSectionViolation h

theorem treasuryAssistanceDuty_intro
    {o : Offense} {c : ComplaintText}
    (hPrimary : AttorneyGeneralPrimaryInvestigativeResponsibility o c)
    (hRequested : AttorneyGeneralRequestedTreasuryAssistance o c) :
    TreasuryAssistanceDuty o c :=
  ⟨hPrimary, hRequested⟩






theorem secretServiceAuthority_preserved
    {o : Offense} {c : ComplaintText}
    (hPrimary : AttorneyGeneralPrimaryInvestigativeResponsibility o c)
    (hSecretService : SecretServiceActingUnderSection3056Authority o c) :
    AttorneyGeneralPrimaryInvestigativeResponsibility o c ∧
      SecretServiceActingUnderSection3056Authority o c :=
  ⟨hPrimary, hSecretService⟩





theorem runsConsecutivelyToPriorTerm_intro
    {s : Sentence} {c : ComplaintText} {completionDay commencementDay : Nat}
    (hCompletion : priorTermCompletionDay s c = completionDay)
    (hCommencement : sentenceCommencementDay s c = commencementDay)
    (hOrder : completionDay ≤ commencementDay) :
    RunsConsecutivelyToPriorTerm s c := by
  unfold RunsConsecutivelyToPriorTerm
  omega

theorem concurrencyBarSatisfied_noOtherTerm_intro
    {s : Sentence} {c : ComplaintText}
    (h : ¬ SubjectToAnotherTermOfImprisonment s c) : ConcurrencyBarSatisfied s c :=
  .noOtherTerm h

theorem concurrencyBarSatisfied_consecutive_intro
    {s : Sentence} {c : ComplaintText}
    (hOther : SubjectToAnotherTermOfImprisonment s c)
    (hOrder : RunsConsecutivelyToPriorTerm s c) : ConcurrencyBarSatisfied s c :=
  .consecutive hOther hOrder

theorem lawfulSentenceUnderSection2332b_intro
    {x : Person} {o : Offense} {s : Sentence} {c : ComplaintText}
    (hConvicted : ConvictedOfViolationOfThisSection x o c)
    (hNoProbation : ¬ SentencePlacesDefendantOnProbation s c)
    (hConcurrency : ConcurrencyBarSatisfied s c) :
    LawfulSentenceUnderSection2332b x o s c :=
  ⟨hConvicted, hNoProbation, hConcurrency⟩



theorem lawfulSentenceUnderSection2332b_excludes_probation
    {x : Person} {o : Offense} {s : Sentence} {c : ComplaintText}
    (h : LawfulSentenceUnderSection2332b x o s c)
    (hProbation : SentencePlacesDefendantOnProbation s c) : False :=
  h.noProbation hProbation



theorem prosecutableUnderSection2332b_intro
    {x : Person} {o : Offense} {i : Indictment} {c : ComplaintText}
    (hTranscends : ConductTranscendsNationalBoundaries o c)
    (hJurisdiction : JurisdictionOverOffender x o c)
    (hBase : JurisdictionalBaseEstablished i o c) :
    ProsecutableUnderSection2332b x o i c :=
  ⟨hTranscends, hJurisdiction, hBase⟩

theorem stepEstablishJurisdiction_guard
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : JurisdictionOverOffender x o c) : (stepEstablishJurisdiction x o c).guard :=
  h

theorem stepOpenInvestigation_guard
    {o : Offense} {c : ComplaintText}
    (h : AttorneyGeneralPrimaryInvestigativeResponsibility o c) :
    (stepOpenInvestigation o c).guard :=
  h

theorem stepCommenceProsecution_guard
    {x : Person} {o : Offense} {i : Indictment} {c : ComplaintText}
    (hBase : JurisdictionalBaseEstablished i o c)
    (hCommenced : ProsecutionCommencedUnderThisSection x o c) :
    (stepCommenceProsecution x o i c).guard :=
  ⟨hBase, hCommenced⟩

theorem stepConvict_guard
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : ConvictedOfViolationOfThisSection x o c) : (stepConvict x o c).guard :=
  h

theorem stepSentence_guard
    {x : Person} {o : Offense} {s : Sentence} {c : ComplaintText}
    (h : LawfulSentenceUnderSection2332b x o s c) : (stepSentence x o s c).guard :=
  h



theorem reaches_sentenced_intro
    {x : Person} {o : Offense} {i : Indictment} {s : Sentence} {c : ComplaintText}
    (hJurisdiction : JurisdictionOverOffender x o c)
    (hResponsibility : AttorneyGeneralPrimaryInvestigativeResponsibility o c)
    (hBase : JurisdictionalBaseEstablished i o c)
    (hCommenced : ProsecutionCommencedUnderThisSection x o c)
    (hConvicted : ConvictedOfViolationOfThisSection x o c)
    (hSentence : LawfulSentenceUnderSection2332b x o s c) :
    Reaches x o i s c Stage.conductAlleged Stage.sentenced :=
  .trans (.establishJurisdiction hJurisdiction)
    (.trans (.openInvestigation hResponsibility)
      (.trans (.commenceProsecution hBase hCommenced)
        (.trans (.convict hConvicted) (.sentence hSentence))))

end Proving.USC.T18.Ch113B.Wmd.Part2.Procedure
