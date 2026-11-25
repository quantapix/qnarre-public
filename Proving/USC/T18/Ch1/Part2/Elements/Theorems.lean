




import Proving.USC.T18.Ch1.Part2.Elements.Statute

namespace Proving.USC.T18.Ch1.Part2.Elements

open Proving.USC.Common



theorem forceRiskFelony_intro {o c} (hFel : IsFelonyOffense o c)
    (hRisk : ByNatureSubstantialRiskOfForce o c) : ForceRiskFelony o c :=
  ⟨hFel, hRisk⟩

theorem crimeOfViolence_ofForce {o c} (h : HasForceElement o c) : CrimeOfViolence o c :=
  .forceElement h

theorem crimeOfViolence_ofFelonyRisk {o c} (h : ForceRiskFelony o c) : CrimeOfViolence o c :=
  .felonyRisk h



theorem insanityDefense_intro {p c} (hDef : HasSevereMentalDiseaseOrDefect p c)
    (hCog : InsanityCognitiveIncapacity p c) (hTime : MentalDefectAtTimeOfOffense p c) :
    InsanityDefense p c :=
  ⟨hDef, hCog, hTime⟩



theorem stolenPropertyElement_intro {pr p c}
    (hChar : PropertyOfStolenOrCounterfeitCharacter pr c)
    (hKnew : DefendantKnewStolenCharacter p c) : StolenPropertyElement pr p c :=
  ⟨hChar, hKnew⟩



theorem healthCareBenefitProgram_intro {e c}
    (hBen : ProvidesMedicalBenefitUnderPlanOrContract e c)
    (hCom : EngagedInInterstateCommerce e c) : HealthCareBenefitProgram e c :=
  ⟨hBen, hCom⟩



theorem section25_intro {p c} (hAdult : IsAdultEighteenOrOlder p c)
    (hUses : IntentionallyUsesMinor p c) (hPurpose : UseOfMinorPurpose p c)
    (hPros : ProsecutableInCourtOfUnitedStates p c) : Section25 p c :=
  ⟨hAdult, hUses, hPurpose, hPros⟩



theorem mortgageLendingBusiness_intro {e c}
    (hFin : FinancesOrRefinancesRealEstateDebt e c)
    (hCom : EngagedInInterstateCommerce e c) : MortgageLendingBusiness e c :=
  ⟨hFin, hCom⟩



theorem traffickingDuressDefense_intro {o p c} (hCov : IsCoveredFederalOffense o c)
    (hVic : WasVictimOfTrafficking p c) (hTime : VictimStatusAtTimeOfOffense p c) :
    TraffickingDuressDefense o p c :=
  ⟨hCov, hVic, hTime⟩

end Proving.USC.T18.Ch1.Part2.Elements
