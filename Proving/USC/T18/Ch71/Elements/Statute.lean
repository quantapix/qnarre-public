










import Proving.USC.T18.Ch71.Elements.Predicates

namespace Proving.USC.T18.Ch71.Elements

open Proving.USC.Common





structure ObsceneUnderMiller (m : Matter) (c : ComplaintText) : Prop where
  prurient          : AppealsToPrurientInterest m c
  patentlyOffensive : PatentlyOffensiveSexualConduct m c
  lacksValue        : LacksSeriousValue m c




abbrev IsObscene (m : Matter) (c : ComplaintText) : Prop := ObsceneUnderMiller m c






inductive NonmailableMatter1461 (m : Matter) (c : ComplaintText) : Prop where
  | obscene       (h : IsObscene m c)
  | abortion      (h : IsAbortionRelatedMatter m c)
  | crimeInciting (h : IsCrimeIncitingMatter m c)



structure Section1461 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  nonmailable : NonmailableMatter1461 m c
  usedMails   : UsedMailsForConveyance p m c
  scienter    : KnewCharacterOfMatter p c





inductive ProhibitedMatter1462 (m : Matter) (c : ComplaintText) : Prop where
  | obscene  (h : IsObscene m c)
  | abortion (h : IsAbortionRelatedMatter m c)



structure Section1462 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  prohibited  : ProhibitedMatter1462 m c
  transported : ImportedOrTransportedInCommerce p m c
  scienter    : KnewCharacterOfMatter p c






structure Section1463 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  wrapper   : BearsIndecentMatterOnWrapper m c
  usedMails : UsedMailsForConveyance p m c
  scienter  : KnewCharacterOfMatter p c





inductive ProhibitedLanguage1464 (m : Matter) (c : ComplaintText) : Prop where
  | obscene  (h : IsObscene m c)
  | indecent (h : IsIndecentLanguage m c)
  | profane  (h : IsProfaneLanguage m c)




structure Section1464 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  language : ProhibitedLanguage1464 m c
  uttered  : UtteredByRadioCommunication p m c






structure Section1465 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  obscene  : IsObscene m c
  produced : ProducedOrTransportedInCommerce p m c
  purpose  : ForPurposeOfSaleOrDistribution p m c
  scienter : KnewCharacterOfMatter p c

end Proving.USC.T18.Ch71.Elements
