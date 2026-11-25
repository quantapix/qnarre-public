







import Proving.USC.T18.Ch2.Elements.Statute

namespace Proving.USC.T18.Ch2.Elements

open Proving.USC.Common

theorem section32a_intro {p ac c}
    (hWill : ActedWithScienter p c) (hCov : AircraftIsCovered ac c)
    (hAct : ProhibitedAct32a p c) : Section32a p ac c :=
  ⟨hWill, hCov, hAct⟩

theorem section32b_intro {p ac c}
    (hWill : ActedWithScienter p c) (hForeign : AircraftForeignRegistered ac c)
    (hAct : ProhibitedAct32b p c) : Section32b p ac c :=
  ⟨hWill, hForeign, hAct⟩

theorem section32c_intro {p c}
    (hWill : ActedWithScienter p c) (hThreat : ImpartsThreatToViolate32 p c)
    (hDet : WithApparentDeterminationToExecute p c) : Section32c p c :=
  ⟨hWill, hThreat, hDet⟩

theorem section33a_intro {p mv c}
    (hWill : ActedWithScienter p c) (hIntent : IntentToEndangerSafetyOrReckless p c)
    (hComm : MotorVehicleUsedInInterstateCommerce mv c) (hAct : ProhibitedAct33a p c) :
    Section33a p mv c :=
  ⟨hWill, hIntent, hComm, hAct⟩

theorem section35a_intro {p c}
    (hKnows : ActedWithScienter p c) (hImparts : ImpartsFalseInformation p c)
    (hConcerns : InformationConcernsChapterCrimeAttempt p c) : Section35a p c :=
  ⟨hKnows, hImparts, hConcerns⟩

theorem section35b_intro {p c}
    (hKnows : ActedWithScienter p c) (hAgg : WillfulMaliciousOrRecklessDisregard p c)
    (hImparts : ImpartsFalseInformation p c)
    (hConcerns : InformationConcernsChapterCrimeAttempt p c) : Section35b p c :=
  ⟨hKnows, hAgg, hImparts, hConcerns⟩

theorem section36b_intro {p c}
    (hFurth : InFurtheranceOfMajorDrugOffense p c)
    (hIntent : IntentToIntimidateHarassInjureMaim p c) (hFires : FiresWeaponIntoGroup p c)
    (hCount : GroupSizeFiredInto c ≥ 2) (hRisk : CausesGraveRiskToHumanLife p c) :
    Section36b p c :=
  ⟨hFurth, hIntent, hFires, hCount, hRisk⟩

theorem section37_intro {p c}
    (hSci : ActedWithScienter p c) (hMeans : UsingDeviceSubstanceOrWeapon p c)
    (hAct : ProhibitedAct37a p c) (hJur : Section37Jurisdiction p c)
    (hNoBar : ¬ Section37LaborDisputeBar p c) : Section37 p c :=
  ⟨hSci, hMeans, hAct, hJur, hNoBar⟩

theorem section38a_intro {p c}
    (hComm : InOrAffectingInterstateOrForeignCommerce p c) (hKnow : ActedWithScienter p c)
    (hDefraud : IntentToDefraud p c) (hAct : ProhibitedAct38a p c) : Section38a p c :=
  ⟨hComm, hKnow, hDefraud, hAct⟩

theorem section39a1_intro {p c}
    (hComm : InOrAffectingInterstateOrForeignCommerce p c) (hKnow : ActedWithScienter p c)
    (hSells : SellsPreemptionTransmitter p c) (hUser : ToNonqualifyingUser p c) :
    Section39a1 p c :=
  ⟨hComm, hKnow, hSells, hUser⟩

theorem section39a2_intro {p c}
    (hComm : InOrAffectingInterstateOrForeignCommerce p c)
    (hNonqual : IsNonqualifyingUser p c) (hUse : MakesUnauthorizedUseOfTransmitter p c) :
    Section39a2 p c :=
  ⟨hComm, hNonqual, hUse⟩

theorem section39A_intro {p c}
    (hKnow : ActedWithScienter p c) (hAims : AimsLaserPointerBeam p c)
    (hTarget : AtAircraftInSpecialJurisdictionOrFlightPath p c) : Section39A p c :=
  ⟨hKnow, hAims, hTarget⟩

theorem section39Ba_intro {p c}
    (hOp : OperatesUnmannedAircraft p c) (hMens : KnowinglyOrRecklessly p c)
    (hInt : InterferesWithOccupiedAircraftImminentHazard p c) : Section39Ba p c :=
  ⟨hOp, hMens, hInt⟩

theorem section39Bb_intro {p c}
    (hOp : OperatesUnmannedAircraft p c) (hKnow : ActedWithScienter p c)
    (hNoAuth : WithoutAuthorization p c) (hZone : OperatesWithinRunwayExclusionZone p c) :
    Section39Bb p c :=
  ⟨hOp, hKnow, hNoAuth, hZone⟩

theorem section40b_intro {p c}
    (hDriver : IsCommercialMotorVehicleDriver p c) (hKnow : ActedWithScienter p c)
    (hDirected : DirectedByAuthorizedEmployeeToStop p c)
    (hFails : FailsToStopOrLeavesInspection p c) : Section40b p c :=
  ⟨hDriver, hKnow, hDirected, hFails⟩

theorem section40Aa_intro {p c}
    (hOp : OperatesUnmannedAircraft p c) (hMens : KnowinglyOrRecklessly p c)
    (hInt : InterferesWithWildfireSuppression p c) : Section40Aa p c :=
  ⟨hOp, hMens, hInt⟩

end Proving.USC.T18.Ch2.Elements
