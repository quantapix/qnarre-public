





import Proving.USC.T22.Elements.Statute

namespace Proving.USC.T22.Elements
open Proving.USC.Common


theorem coercion_ofThreats {pr c}
    (h : CoercionThreatOfSeriousHarmOrRestraint pr c) : Coercion pr c := .threats h
theorem coercion_ofScheme {pr c}
    (h : CoercionSchemeToInduceFearOfHarm pr c) : Coercion pr c := .scheme h
theorem coercion_ofLegalProcess {pr c}
    (h : IsAbuseOfLegalProcess pr c) : Coercion pr c := .legalProcess h


theorem involuntaryServitude_ofScheme {pr c}
    (h : ServitudeSchemeToInduceFearOfHarm pr c) : InvoluntaryServitude pr c := .scheme h
theorem involuntaryServitude_ofLegalProcess {pr c}
    (h : IsAbuseOfLegalProcess pr c) : InvoluntaryServitude pr c := .legalProcess h


theorem sexTraffickingSevere_ofForce {pr c}
    (hST : IsSexTrafficking pr c)
    (hForce : CommercialSexActInducedByForceFraudCoercion pr c) :
    SexTraffickingSevere pr c := .induced hST hForce
theorem sexTraffickingSevere_ofMinor {pr c}
    (hST : IsSexTrafficking pr c) (hAge : VictimUnderEighteen pr c) :
    SexTraffickingSevere pr c := .minor hST hAge


theorem laborTraffickingSevere_intro {pr c}
    (hAct : LaborServicesAct pr c) (hMeans : ThroughForceFraudCoercion pr c)
    (hPurpose : ForServitudePeonageDebtBondageOrSlavery pr c) :
    LaborTraffickingSevere pr c := ⟨hAct, hMeans, hPurpose⟩


theorem severeFormOfTrafficking_ofSex {pr c}
    (h : SexTraffickingSevere pr c) : SevereFormOfTrafficking pr c := .sex h
theorem severeFormOfTrafficking_ofLabor {pr c}
    (h : LaborTraffickingSevere pr c) : SevereFormOfTrafficking pr c := .labor h


theorem victimOfSevereForm_intro {p pr c}
    (hSubj : PersonSubjectToPractice p pr c) (hSevere : SevereFormOfTrafficking pr c) :
    VictimOfSevereForm p pr c := ⟨hSubj, hSevere⟩


theorem victimOfTrafficking_ofSevere {p pr c}
    (h : VictimOfSevereForm p pr c) : VictimOfTrafficking p pr c := .severe h
theorem victimOfTrafficking_ofSex {p pr c}
    (hSubj : PersonSubjectToPractice p pr c) (hST : IsSexTrafficking pr c) :
    VictimOfTrafficking p pr c := .sex hSubj hST

end Proving.USC.T22.Elements
