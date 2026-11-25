





import Proving.USC.T18.Ch42.Elements.Statute

namespace Proving.USC.T18.Ch42.Elements

open Proving.USC.Common



theorem section892Making_intro {p cr c}
    (hMakes : MakesExtensionOfCredit p cr c)
    (hExtortionate : ExtensionIsExtortionate cr c) :
    Section892Making p cr c :=
  ⟨hMakes, hExtortionate⟩

theorem section892Conspiracy_intro {ag cr c}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hObject : ExtensionIsExtortionate cr c) :
    Section892Conspiracy ag cr c :=
  ⟨hAgreement, hObject⟩



theorem section893_intro {p c}
    (hScienter : ActedWithScienter p c)
    (hAdvances : AdvancesMoneyOrProperty p c)
    (hReasonableGrounds : ReasonableGroundsToBelieveExtortionatePurpose p c) :
    Section893 p c :=
  ⟨hScienter, hAdvances, hReasonableGrounds⟩



theorem section894Collect_intro {p c}
    (hScienter : ActedWithScienter p c)
    (hParticipates : ParticipatesInUseOfMeans p c)
    (hMeans : MeansAreExtortionate c)
    (hPurpose : ToCollectExtensionOfCredit p c) :
    Section894Collect p c :=
  ⟨hScienter, hParticipates, hMeans, hPurpose⟩

theorem section894Punish_intro {p c}
    (hScienter : ActedWithScienter p c)
    (hParticipates : ParticipatesInUseOfMeans p c)
    (hMeans : MeansAreExtortionate c)
    (hPurpose : ToPunishNonrepayment p c) :
    Section894Punish p c :=
  ⟨hScienter, hParticipates, hMeans, hPurpose⟩

theorem section894Conspiracy_intro {ag c}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hMeans : MeansAreExtortionate c) :
    Section894Conspiracy ag c :=
  ⟨hAgreement, hMeans⟩

end Proving.USC.T18.Ch42.Elements
