import Proving.USC.T18.Ch2Ch3.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
set_option autoImplicit false









namespace Proving.USC.T18.Ch2Ch3.Elements

open Proving.USC.Common


theorem section32aOffense_intro {p : Person} {ac : Aircraft} {f : AirNavFacility}
    {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hCov : IsCoveredAircraft ac c)
    (hAct : AircraftSabotageAct ac f c) : Section32aOffense p ac f c :=
  ⟨hSci, hCov, hAct⟩


theorem section32bOffense_intro {p : Person} {ac : Aircraft} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hForeign : IsForeignRegisteredAircraft ac c)
    (hAct : ForeignAircraftAct ac c) (hJur : ExtraterritorialFederalJurisdiction p c)
    : Section32bOffense p ac c :=
  ⟨hSci, hForeign, hAct, hJur⟩


theorem section32cOffense_intro {p : Person} {c : ComplaintText}
    (hThreat : ConveysThreatToDestroyAircraft p c) : Section32cOffense p c :=
  ⟨hThreat⟩


theorem section36DriveBy_intro {p : Person} {c : ComplaintText}
    (hDrug : InFurtheranceOfMajorDrugOffense p c) (hIntent : IntentToIntimidateOrInjure p c)
    (hFires : FiresWeaponIntoGroup p c) (hRisk : CausesGraveRiskToLife p c)
    : Section36DriveBy p c :=
  ⟨hDrug, hIntent, hFires, hRisk⟩


theorem section36DriveByKilling_intro {p : Person} {c : ComplaintText}
    (hDrug : InFurtheranceOfMajorDrugOffense p c) (hIntent : IntentToIntimidateOrInjure p c)
    (hFires : FiresWeaponIntoGroup p c) (hDeath : ProximateCause p c)
    : Section36DriveByKilling p c :=
  ⟨hDrug, hIntent, hFires, hDeath⟩


theorem section37Offense_intro {p : Person} {ap : Airport} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hAirport : IsInternationalAirport ap c)
    (hAct : AirportViolenceAct ap c) (hEnd : EndangersAirportSafety ap c)
    (hJur : ExtraterritorialFederalJurisdiction p c)
    (hNotBar : ¬ LaborDisputeStateFelonyBar p c) : Section37Offense p ap c :=
  ⟨hSci, hAirport, hAct, hEnd, hJur, hNotBar⟩


theorem section38Offense_intro {p : Person} {part : AircraftPart} {c : ComplaintText}
    (hCom : ActInInterstateCommerce p c) (hSci : ActedWithScienter p c)
    (hFraud : IntentToDefraud p c) (hPart : IsAircraftOrSpaceVehiclePart part c)
    (hMat : MaterialFalsityConcerningPart part c) (hAct : PartFraudAct part c)
    : Section38Offense p part c :=
  ⟨hCom, hSci, hFraud, hPart, hMat, hAct⟩


theorem section39BInterference_intro {p : Person} {ua : UnmannedAircraft} {c : ComplaintText}
    (hOp : OperatesUnmannedAircraft ua c) (hSci : ActedWithScienter p c)
    (hInt : InterferesWithOccupiedAircraft ua c) (hHaz : PosesImminentSafetyHazard ua c)
    : Section39BInterference p ua c :=
  ⟨hOp, hSci, hInt, hHaz⟩


theorem section39BRunwayZone_intro {p : Person} {ua : UnmannedAircraft} {c : ComplaintText}
    (hOp : OperatesUnmannedAircraft ua c) (hSci : ActedWithScienter p c)
    (hNoAuth : WithoutAuthorization p c) (hZone : OperatesInRunwayExclusionZone ua c)
    : Section39BRunwayZone p ua c :=
  ⟨hOp, hSci, hNoAuth, hZone⟩


theorem section40AOffense_intro {p : Person} {ua : UnmannedAircraft} {c : ComplaintText}
    (hOp : OperatesUnmannedAircraft ua c) (hSci : ActedWithScienter p c)
    (hInt : InterferesWithWildfireSuppression ua c)
    (hNotEx : ¬ GovernmentWildfireOperationException p c) : Section40AOffense p ua c :=
  ⟨hOp, hSci, hInt, hNotEx⟩


theorem section42Importation_intro {p : Person} {sp : InjuriousSpecies} {c : ComplaintText}
    (hImp : ImportsOrShipsSpecies sp c) (hInj : IsInjuriousSpecies sp c)
    (hNotPerm : ¬ ImportationAuthorizedByPermitOrExemption p c)
    : Section42Importation p sp c :=
  ⟨hImp, hInj, hNotPerm⟩


theorem section42InhumaneTransport_intro {p : Person} {sp : InjuriousSpecies} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hTrans : KnowinglyTransportsUnderInhumaneConditions sp c)
    (hWild : IsWildAnimalOrBird sp c) : Section42InhumaneTransport p sp c :=
  ⟨hSci, hTrans, hWild⟩


theorem section43Offense_intro {p : Person} {ae : AnimalEnterprise} {c : ComplaintText}
    (hCom : ActInInterstateCommerce p c) (hPurp : PurposeToDamageAnimalEnterprise p c)
    (hEnt : IsAnimalEnterprise ae c) (hAct : AnimalEnterpriseAct p ae c)
    (hNotProt : ¬ ProtectedFirstAmendmentConduct p c) : Section43Offense p ae c :=
  ⟨hCom, hPurp, hEnt, hAct, hNotProt⟩

end Proving.USC.T18.Ch2Ch3.Elements
