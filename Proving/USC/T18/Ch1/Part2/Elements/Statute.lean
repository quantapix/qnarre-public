








import Proving.USC.T18.Ch1.Part2.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch1.Part2.Elements

open Proving.USC.Common




structure ForceRiskFelony (o : Offense) (c : ComplaintText) : Prop where
  felony : IsFelonyOffense o c
  substantialRisk : ByNatureSubstantialRiskOfForce o c


inductive CrimeOfViolence (o : Offense) (c : ComplaintText) : Prop where
  | forceElement (h : HasForceElement o c) : CrimeOfViolence o c
  | felonyRisk (h : ForceRiskFelony o c) : CrimeOfViolence o c





inductive InsanityCognitiveIncapacity (p : Person) (c : ComplaintText) : Prop where
  | natureQuality (h : UnableToAppreciateNatureAndQuality p c) : InsanityCognitiveIncapacity p c
  | wrongfulness (h : UnableToAppreciateWrongfulness p c) : InsanityCognitiveIncapacity p c



structure InsanityDefense (p : Person) (c : ComplaintText) : Prop where
  severeDefect : HasSevereMentalDiseaseOrDefect p c
  cognitiveIncapacity : InsanityCognitiveIncapacity p c
  atTime : MentalDefectAtTimeOfOffense p c





structure StolenPropertyElement (pr : Property) (p : Person) (c : ComplaintText) : Prop where
  character : PropertyOfStolenOrCounterfeitCharacter pr c
  knew : DefendantKnewStolenCharacter p c






inductive FederalHealthCareOffense (o : Offense) (c : ComplaintText) : Prop where
  | listOne (h : ViolatesEnumeratedHealthOffenseListOne o c) : FederalHealthCareOffense o c
  | listTwo (h : ViolatesEnumeratedHealthOffenseListTwo o c)
      (rel : RelatesToHealthCareBenefitProgram o c) : FederalHealthCareOffense o c



structure HealthCareBenefitProgram (e : Entity) (c : ComplaintText) : Prop where
  providesBenefit : ProvidesMedicalBenefitUnderPlanOrContract e c
  affectsCommerce : EngagedInInterstateCommerce e c





inductive UseOfMinorPurpose (p : Person) (c : ComplaintText) : Prop where
  | crimeOfViolence (h : UseToCommitCrimeOfViolence p c) : UseOfMinorPurpose p c
  | avoidDetection (h : UseToAvoidDetectionOrApprehension p c) : UseOfMinorPurpose p c



structure Section25 (p : Person) (c : ComplaintText) : Prop where
  adult : IsAdultEighteenOrOlder p c
  usesMinor : IntentionallyUsesMinor p c
  purpose : UseOfMinorPurpose p c
  prosecutable : ProsecutableInCourtOfUnitedStates p c





structure MortgageLendingBusiness (e : Entity) (c : ComplaintText) : Prop where
  financesRealEstate : FinancesOrRefinancesRealEstateDebt e c
  affectsCommerce : EngagedInInterstateCommerce e c






structure TraffickingDuressDefense (o : Offense) (p : Person) (c : ComplaintText) : Prop where
  coveredOffense : IsCoveredFederalOffense o c
  victim : WasVictimOfTrafficking p c
  atTime : VictimStatusAtTimeOfOffense p c

end Proving.USC.T18.Ch1.Part2.Elements
