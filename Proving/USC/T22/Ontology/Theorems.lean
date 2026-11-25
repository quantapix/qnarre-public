





import Proving.USC.T22.Ontology.Statute

namespace Proving.USC.T22.Ontology
open Proving.USC.Common


theorem coercionViaLegalProcess_intro {cond : Condition} {lp : LegalProcess} {c : ComplaintText}
    (hLp : IsAbuseOfLegalProcess lp c) (hCoerce : IsCoercion cond c)
    : CoercionViaLegalProcess cond lp c :=
  ⟨hLp, hCoerce⟩


theorem involuntaryServitudeViaLegalProcess_intro {cond : Condition} {lp : LegalProcess} {c : ComplaintText}
    (hLp : IsAbuseOfLegalProcess lp c) (hServ : IsInvoluntaryServitude cond c)
    : InvoluntaryServitudeViaLegalProcess cond lp c :=
  ⟨hLp, hServ⟩


theorem sexTraffickingMembership_intro {pr : Practice} {a : SexAct} {c : ComplaintText}
    (hCsa : IsCommercialSexAct a c) (hSex : IsSexTrafficking pr c)
    : SexTraffickingMembership pr a c :=
  ⟨hCsa, hSex⟩


theorem severeForms_sexTrafficking_intro {pr : Practice} {a : SexAct} {c : ComplaintText}
    (hSex : IsSexTrafficking pr c) (hCsa : IsCommercialSexAct a c)
    (hSevere : IsSevereFormsOfTrafficking pr c)
    : SevereFormsCase pr c :=
  .sexTrafficking hSex hCsa hSevere


theorem severeForms_laborTrafficking_intro {pr : Practice} {cond : Condition} {c : ComplaintText}
    (hServ : IsInvoluntaryServitude cond c)
    (hSevere : IsSevereFormsOfTrafficking pr c)
    : SevereFormsCase pr c :=
  .laborTrafficking hServ hSevere


theorem victimOfSevereFormMembership_intro {p : Person} {pr : Practice} {c : ComplaintText}
    (hSevere : IsSevereFormsOfTrafficking pr c) (hVictim : IsVictimOfSevereFormOfTrafficking p c)
    : VictimOfSevereFormMembership p pr c :=
  ⟨hSevere, hVictim⟩


theorem victimOfTrafficking_viaSevereForm_intro {p : Person} {pr : Practice} {c : ComplaintText}
    (hPractice : IsSevereFormsOfTrafficking pr c) (hVictim : IsVictimOfTrafficking p c)
    : VictimOfTraffickingCase p pr c :=
  .viaSevereForm hPractice hVictim


theorem victimOfTrafficking_viaSexTrafficking_intro {p : Person} {pr : Practice} {c : ComplaintText}
    (hPractice : IsSexTrafficking pr c) (hVictim : IsVictimOfTrafficking p c)
    : VictimOfTraffickingCase p pr c :=
  .viaSexTrafficking hPractice hVictim

end Proving.USC.T22.Ontology
