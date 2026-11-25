









import Proving.USC.T18.Ch71.Elements.Statute

namespace Proving.USC.T18.Ch71.Elements

open Proving.USC.Common



theorem obscene_of_miller {m : Matter} {c : ComplaintText}
    (hPrurient : AppealsToPrurientInterest m c)
    (hOffensive : PatentlyOffensiveSexualConduct m c)
    (hValue : LacksSeriousValue m c) : IsObscene m c :=
  ⟨hPrurient, hOffensive, hValue⟩


theorem section1461_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hNon : NonmailableMatter1461 m c) (hMail : UsedMailsForConveyance p m c)
    (hScien : KnewCharacterOfMatter p c) : Section1461 p m c :=
  ⟨hNon, hMail, hScien⟩


theorem section1462_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hProhib : ProhibitedMatter1462 m c) (hTrans : ImportedOrTransportedInCommerce p m c)
    (hScien : KnewCharacterOfMatter p c) : Section1462 p m c :=
  ⟨hProhib, hTrans, hScien⟩


theorem section1463_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hWrap : BearsIndecentMatterOnWrapper m c) (hMail : UsedMailsForConveyance p m c)
    (hScien : KnewCharacterOfMatter p c) : Section1463 p m c :=
  ⟨hWrap, hMail, hScien⟩


theorem section1464_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hLang : ProhibitedLanguage1464 m c) (hUtter : UtteredByRadioCommunication p m c) :
    Section1464 p m c :=
  ⟨hLang, hUtter⟩


theorem section1465_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hObs : IsObscene m c) (hProd : ProducedOrTransportedInCommerce p m c)
    (hPurp : ForPurposeOfSaleOrDistribution p m c) (hScien : KnewCharacterOfMatter p c) :
    Section1465 p m c :=
  ⟨hObs, hProd, hPurp, hScien⟩

end Proving.USC.T18.Ch71.Elements
