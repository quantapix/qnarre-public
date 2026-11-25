









import Proving.USC.T18.Obstruction.Elements.Statute

namespace Proving.USC.T18.Obstruction.Elements

open Proving.USC.Common



theorem section1503NamedActor_intro {p : Person} {j : JudicialActor} {c : ComplaintText}
    (means : UsedCorruptOrForcibleMeans p c) (scienter : ActedWithScienter p c)
    (endeavor : EndeavoredToInfluenceJudicialActor p j c) (federal : FederalJurisdictionalNexus c)
    : Section1503NamedActor p j c :=
  ⟨means, scienter, endeavor, federal⟩

theorem section1503Omnibus_intro {p : Person} {op : OfficialProceeding} {c : ComplaintText}
    (means : UsedCorruptOrForcibleMeans p c) (scienter : ActedWithScienter p c)
    (obstruct : ObstructedDueAdministrationOfJustice p op c) (federal : FederalJurisdictionalNexus c)
    : Section1503Omnibus p op c :=
  ⟨means, scienter, obstruct, federal⟩



theorem section1512Killing_intro {p : Person} {w : ProtectedWitness} {op : OfficialProceeding} {c : ComplaintText}
    (conduct : KilledOrAttemptedKilling p w c)
    (intent : IntentToAffectProceedingOrCommunication p op c)
    (notDefense : NotSolelyLawfulTruthfulConduct p c) (federal : FederalJurisdictionalNexus c)
    : Section1512Killing p w op c :=
  ⟨conduct, intent, notDefense, federal⟩

theorem section1512Force_intro {p : Person} {w : ProtectedWitness} {op : OfficialProceeding} {c : ComplaintText}
    (conduct : UsedPhysicalForceAgainstPerson p w c)
    (intent : IntentToAffectProceedingOrCommunication p op c)
    (notDefense : NotSolelyLawfulTruthfulConduct p c) (federal : FederalJurisdictionalNexus c)
    : Section1512Force p w op c :=
  ⟨conduct, intent, notDefense, federal⟩

theorem section1512Intimidation_intro {p : Person} {w : ProtectedWitness} {op : OfficialProceeding} {c : ComplaintText}
    (conduct : IntimidatedOrCorruptlyPersuaded p w c) (scienter : ActedWithScienter p c)
    (intent : IntentToAffectProceedingOrCommunication p op c)
    (notDefense : NotSolelyLawfulTruthfulConduct p c) (federal : FederalJurisdictionalNexus c)
    : Section1512Intimidation p w op c :=
  ⟨conduct, scienter, intent, notDefense, federal⟩

theorem section1512CorruptObstruction_intro {p : Person} {op : OfficialProceeding} {c : ComplaintText}
    (conduct : CorruptlyObstructedOfficialProceeding p op c) (scienter : ActedWithScienter p c)
    (notDefense : NotSolelyLawfulTruthfulConduct p c) (federal : FederalJurisdictionalNexus c)
    : Section1512CorruptObstruction p op c :=
  ⟨conduct, scienter, notDefense, federal⟩

theorem section1512Harassment_intro {p : Person} {w : ProtectedWitness} {op : OfficialProceeding} {c : ComplaintText}
    (conduct : IntentionallyHarassedToDissuade p w c)
    (intent : IntentToAffectProceedingOrCommunication p op c)
    (notDefense : NotSolelyLawfulTruthfulConduct p c) (federal : FederalJurisdictionalNexus c)
    : Section1512Harassment p w op c :=
  ⟨conduct, intent, notDefense, federal⟩



theorem section1513Killing_intro {p : Person} {w : ProtectedWitness} {op : OfficialProceeding} {c : ComplaintText}
    (conduct : KilledOrAttemptedKilling p w c)
    (intent : IntentToRetaliateForProtectedAct p op c) (federal : FederalJurisdictionalNexus c)
    : Section1513Killing p w op c :=
  ⟨conduct, intent, federal⟩

theorem section1513Injury_intro {p : Person} {w : ProtectedWitness} {op : OfficialProceeding} {c : ComplaintText}
    (conduct : CausedBodilyInjuryOrPropertyDamage p w c) (scienter : ActedWithScienter p c)
    (intent : IntentToRetaliateForProtectedAct p op c) (federal : FederalJurisdictionalNexus c)
    : Section1513Injury p w op c :=
  ⟨conduct, scienter, intent, federal⟩

theorem section1513HarmfulAction_intro {p : Person} {w : ProtectedWitness} {op : OfficialProceeding} {c : ComplaintText}
    (conduct : TookHarmfulActionAgainstInformant p w c) (scienter : ActedWithScienter p c)
    (intent : IntentToRetaliateForProtectedAct p op c) (federal : FederalJurisdictionalNexus c)
    : Section1513HarmfulAction p w op c :=
  ⟨conduct, scienter, intent, federal⟩

end Proving.USC.T18.Obstruction.Elements
