












import Proving.USC.T18.Ch113B.Wmd.Part2.Procedure.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Procedure

open Proving.USC.Common





structure ConductTranscendsNationalBoundaries (o : Offense) (c : ComplaintText) : Prop where
  withinUnitedStates : ConductOccurredWithinUnitedStates o c
  outsideUnitedStates : ConductOccurredOutsideUnitedStates o c






inductive CommerceEffectCircumstance (o : Offense) (x : Person) (c : ComplaintText) : Prop
  | actual (h : OffenseObstructedDelayedOrAffectedCommerce o x c)
  | ifConsummated (h : OffenseWouldHaveAffectedCommerceIfConsummated o x c)


inductive FederalVictimCircumstance (o : Offense) (x : Person) (c : ComplaintText) : Prop
  | unitedStatesGovernment (h : VictimIsUnitedStatesGovernment o x c)
  | uniformedServicesMember (h : VictimIsMemberOfUniformedServices o x c)
  | federalOfficialOrEmployee (h : VictimIsFederalOfficialOfficerEmployeeOrAgent o x c)




def WithinTwelveNauticalMilesOfBaseline (o : Offense) (c : ComplaintText) : Prop :=
  nauticalMilesSeawardFromBaseline o c ≤ 12




structure TerritorialSeaCircumstance (o : Offense) (x : Person) (c : ComplaintText) : Prop where
  locus : OffenseSiteWithinTerritorialSeaLocus o x c
  withinTwelveNauticalMiles : WithinTwelveNauticalMilesOfBaseline o c




inductive Section2332bCircumstance (o : Offense) (x : Person) (c : ComplaintText) : Prop
  | mailOrInterstateFacility (h : MailOrInterstateFacilityUsedInFurtherance o x c)
  | commerceEffect (h : CommerceEffectCircumstance o x c)
  | federalVictim (h : FederalVictimCircumstance o x c)
  | federalProperty (h : PropertyOwnedPossessedOrLeasedByUnitedStates o x c)
  | territorialSea (h : TerritorialSeaCircumstance o x c)
  | specialMaritimeAndTerritorialJurisdiction
      (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o x c)





def CircumstanceApplicableToSomeOffender (o : Offense) (c : ComplaintText) : Prop :=
  ∃ y : Person, Section2332bCircumstance o y c




inductive CoveredOffenderRole (x : Person) (o : Offense) (c : ComplaintText) : Prop
  | principal (h : IsPrincipalOfOffense x o c)
  | coConspirator (h : IsCoConspiratorOfOffense x o c)
  | accessoryAfterTheFact (h : IsAccessoryAfterTheFactToOffense x o c)




structure JurisdictionOverOffender (x : Person) (o : Offense) (c : ComplaintText) : Prop where
  charged : ChargedAsOffenseUnderThisSection o c
  role : CoveredOffenderRole x o c
  circumstance : CircumstanceApplicableToSomeOffender o c








inductive ExtraterritorialJurisdiction (x : Person) (o : Offense) (c : ComplaintText) : Prop
  | subsectionAOffense (h : OffenseIsUnderSubsectionA o c)
  | inchoateOffense (h : OffenseIsThreatAttemptOrConspiracy o c)
  | accessoryAfterTheFact
      (hOffense : OffenseIsUnderSubsectionA o c)
      (hAccessory : ConductRendersAccessoryAfterTheFactUnderSection3 x o c)







structure JurisdictionalBaseEstablished
    (i : Indictment) (o : Offense) (c : ComplaintText) : Prop where
  alleged : JurisdictionalBaseAllegedInIndictment i o c
  circumstance : CircumstanceApplicableToSomeOffender o c







structure StateLawAdoptionScope
    (o : Offense) (s : StateLawProvision) (c : ComplaintText) : Prop where
  basedOnStateLaw : ProsecutionBasedOnAdoptedStateLaw o c
  definesElement : StateProvisionDefinesElementOfOffense s o c
  notProcedureOrEvidence : ¬ StateProvisionPertainsToCriminalProcedureOrEvidence s c




inductive TerrorismMotive (o : Offense) (c : ComplaintText) : Prop
  | influenceOrAffectGovernmentConduct (h : CalculatedToInfluenceGovernmentConduct o c)
  | retaliateAgainstGovernmentConduct (h : CalculatedToRetaliateAgainstGovernmentConduct o c)





inductive EnumeratedTerrorismPredicateViolation (o : Offense) (c : ComplaintText) : Prop
  | title18Offense (h : ViolatesEnumeratedTitle18TerrorismOffense o c)
  | atomicEnergyActOffense (h : ViolatesAtomicEnergyActOffense o c)
  | title49Offense (h : ViolatesEnumeratedTitle49Offense o c)
  | narcoterrorismOffense (h : ViolatesNarcoterrorismOffense o c)




structure FederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop where
  motive : TerrorismMotive o c
  enumeratedViolation : EnumeratedTerrorismPredicateViolation o c





inductive AttorneyGeneralPrimaryInvestigativeResponsibility
    (o : Offense) (c : ComplaintText) : Prop
  | federalCrimeOfTerrorism (h : FederalCrimeOfTerrorism o c)
  | listedSectionViolation (h : ViolatesSectionListedInSubsectionF o c)




structure TreasuryAssistanceDuty (o : Offense) (c : ComplaintText) : Prop where
  primaryResponsibility : AttorneyGeneralPrimaryInvestigativeResponsibility o c
  requested : AttorneyGeneralRequestedTreasuryAssistance o c






def RunsConsecutivelyToPriorTerm (s : Sentence) (c : ComplaintText) : Prop :=
  priorTermCompletionDay s c ≤ sentenceCommencementDay s c




inductive ConcurrencyBarSatisfied (s : Sentence) (c : ComplaintText) : Prop
  | noOtherTerm (h : ¬ SubjectToAnotherTermOfImprisonment s c)
  | consecutive
      (hOther : SubjectToAnotherTermOfImprisonment s c)
      (hOrder : RunsConsecutivelyToPriorTerm s c)




structure LawfulSentenceUnderSection2332b
    (x : Person) (o : Offense) (s : Sentence) (c : ComplaintText) : Prop where
  convicted : ConvictedOfViolationOfThisSection x o c
  noProbation : ¬ SentencePlacesDefendantOnProbation s c
  concurrencyBar : ConcurrencyBarSatisfied s c






structure ProsecutableUnderSection2332b
    (x : Person) (o : Offense) (i : Indictment) (c : ComplaintText) : Prop where
  transcendsNationalBoundaries : ConductTranscendsNationalBoundaries o c
  jurisdiction : JurisdictionOverOffender x o c
  jurisdictionalBase : JurisdictionalBaseEstablished i o c




def stepEstablishJurisdiction (x : Person) (o : Offense) (c : ComplaintText) :
    GuardedTransition :=
  { source := Stage.conductAlleged
    target := Stage.jurisdictionEstablished
    guard := JurisdictionOverOffender x o c }


def stepOpenInvestigation (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := Stage.jurisdictionEstablished
    target := Stage.investigationOpened
    guard := AttorneyGeneralPrimaryInvestigativeResponsibility o c }


def stepCommenceProsecution
    (x : Person) (o : Offense) (i : Indictment) (c : ComplaintText) : GuardedTransition :=
  { source := Stage.investigationOpened
    target := Stage.prosecutionCommenced
    guard := JurisdictionalBaseEstablished i o c ∧ ProsecutionCommencedUnderThisSection x o c }


def stepConvict (x : Person) (o : Offense) (c : ComplaintText) : GuardedTransition :=
  { source := Stage.prosecutionCommenced
    target := Stage.convicted
    guard := ConvictedOfViolationOfThisSection x o c }


def stepSentence
    (x : Person) (o : Offense) (s : Sentence) (c : ComplaintText) : GuardedTransition :=
  { source := Stage.convicted
    target := Stage.sentenced
    guard := LawfulSentenceUnderSection2332b x o s c }



inductive Reaches
    (x : Person) (o : Offense) (i : Indictment) (s : Sentence) (c : ComplaintText) :
    Stage → Stage → Prop
  | refl (st : Stage) : Reaches x o i s c st st
  | establishJurisdiction (h : JurisdictionOverOffender x o c) :
      Reaches x o i s c Stage.conductAlleged Stage.jurisdictionEstablished
  | openInvestigation (h : AttorneyGeneralPrimaryInvestigativeResponsibility o c) :
      Reaches x o i s c Stage.jurisdictionEstablished Stage.investigationOpened
  | commenceProsecution
      (hBase : JurisdictionalBaseEstablished i o c)
      (hCommenced : ProsecutionCommencedUnderThisSection x o c) :
      Reaches x o i s c Stage.investigationOpened Stage.prosecutionCommenced
  | convict (h : ConvictedOfViolationOfThisSection x o c) :
      Reaches x o i s c Stage.prosecutionCommenced Stage.convicted
  | sentence (h : LawfulSentenceUnderSection2332b x o s c) :
      Reaches x o i s c Stage.convicted Stage.sentenced
  | trans {a b d : Stage} (h₁ : Reaches x o i s c a b) (h₂ : Reaches x o i s c b d) :
      Reaches x o i s c a d

end Proving.USC.T18.Ch113B.Wmd.Part2.Procedure
