





import Proving.USC.T18.Ch73.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Elements

open Proving.USC.Common



theorem section1503Endeavor_intro {p t : Person} {c : ComplaintText}
    (hMeans : Section1503Means p c) (hEnd : EndeavoredToInfluenceOrObstruct p c)
    (hObj : Section1503Object t c) (hNexus : NexusToOfficialProceeding c)
    (hFed : FederalJurisdictionalNexus c) : Section1503Endeavor p t c :=
  ⟨hMeans, hEnd, hObj, hNexus, hFed⟩

theorem section1503Injury_intro {p t : Person} {c : ComplaintText}
    (hTgt : TargetIsJurorOrCourtOfficer t c) (hInj : InjuredOnAccountOfOfficialAct p t c)
    (hFed : FederalJurisdictionalNexus c) : Section1503Injury p t c :=
  ⟨hTgt, hInj, hFed⟩



theorem section1512Force_intro {p t : Person} {pr : Proceeding} {c : ComplaintText}
    (hAct : Section1512ForceAct p t c) (hInt : IntentToPreventOrObstruct p c)
    (hObj : ObstructionObject pr c) (hFed : FederalJurisdictionalNexus c)
    : Section1512Force p t pr c :=
  ⟨hAct, hInt, hObj, hFed⟩

theorem section1512Persuasion_intro {p t : Person} {pr : Proceeding} {c : ComplaintText}
    (hAct : UsedIntimidationOrCorruptPersuasion p t c) (hInt : IntentToPreventOrObstruct p c)
    (hObj : ObstructionObject pr c) (hFed : FederalJurisdictionalNexus c)
    : Section1512Persuasion p t pr c :=
  ⟨hAct, hInt, hObj, hFed⟩

theorem section1512Tampering_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hCorr : ActedCorruptly p c) (hAct : TamperedWithRecordOrProceeding p c)
    (hProc : IsOfficialProceeding pr c) (hNexus : NexusToOfficialProceeding c)
    (hFed : FederalJurisdictionalNexus c) : Section1512Tampering p pr c :=
  ⟨hCorr, hAct, hProc, hNexus, hFed⟩

theorem section1512Harassment_intro {p t : Person} {pr : Proceeding} {c : ComplaintText}
    (hAct : IntentionallyHarassed p t c) (hObj : ObstructionObject pr c)
    (hFed : FederalJurisdictionalNexus c) : Section1512Harassment p t pr c :=
  ⟨hAct, hObj, hFed⟩



theorem section1513Kill_intro {p t : Person} {c : ComplaintText}
    (hAct : KilledOrAttemptedToKill p t c) (hInt : IntentToRetaliate p c)
    (hTgt : TargetIsWitnessVictimOrInformant t c) (hFed : FederalJurisdictionalNexus c)
    : Section1513Kill p t c :=
  ⟨hAct, hInt, hTgt, hFed⟩

theorem section1513Injury_intro {p t : Person} {c : ComplaintText}
    (hAct : CausedBodilyInjuryOrThreat p t c) (hInt : IntentToRetaliate p c)
    (hTgt : TargetIsWitnessVictimOrInformant t c) (hFed : FederalJurisdictionalNexus c)
    : Section1513Injury p t c :=
  ⟨hAct, hInt, hTgt, hFed⟩

theorem section1513Livelihood_intro {p t : Person} {c : ComplaintText}
    (hAct : TookActionHarmfulToLivelihood p t c) (hInt : IntentToRetaliate p c)
    (hFed : FederalJurisdictionalNexus c) : Section1513Livelihood p t c :=
  ⟨hAct, hInt, hFed⟩

end Proving.USC.T18.Ch73.Elements
