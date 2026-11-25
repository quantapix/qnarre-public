










import Proving.USC.T18.Ch42.Elements.Predicates

namespace Proving.USC.T18.Ch42.Elements

open Proving.USC.Common




structure Section892Making (p : Person) (cr : Credit) (c : ComplaintText) : Prop where
  makes        : MakesExtensionOfCredit p cr c
  extortionate : ExtensionIsExtortionate cr c


structure Section892Conspiracy (ag : Agreement) (cr : Credit) (c : ComplaintText) : Prop where
  agreement    : AgreementAmongTwoOrMore ag c
  object       : ExtensionIsExtortionate cr c

inductive Section892 (p : Person) (ag : Agreement) (cr : Credit) (c : ComplaintText) : Prop where
  | making     (h : Section892Making p cr c)
  | conspiracy (h : Section892Conspiracy ag cr c)





structure Section893 (p : Person) (c : ComplaintText) : Prop where
  scienter          : ActedWithScienter p c
  advances          : AdvancesMoneyOrProperty p c
  reasonableGrounds : ReasonableGroundsToBelieveExtortionatePurpose p c





structure Section894Collect (p : Person) (c : ComplaintText) : Prop where
  scienter          : ActedWithScienter p c
  participates      : ParticipatesInUseOfMeans p c
  meansExtortionate : MeansAreExtortionate c
  purpose           : ToCollectExtensionOfCredit p c



structure Section894Punish (p : Person) (c : ComplaintText) : Prop where
  scienter          : ActedWithScienter p c
  participates      : ParticipatesInUseOfMeans p c
  meansExtortionate : MeansAreExtortionate c
  purpose           : ToPunishNonrepayment p c


structure Section894Conspiracy (ag : Agreement) (c : ComplaintText) : Prop where
  agreement         : AgreementAmongTwoOrMore ag c
  meansExtortionate : MeansAreExtortionate c

inductive Section894 (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | collect    (h : Section894Collect p c)
  | punish     (h : Section894Punish p c)
  | conspiracy (h : Section894Conspiracy ag c)





inductive ValidExtortionateCreditCharge
    (p : Person) (ag : Agreement) (cr : Credit) (c : ComplaintText) : Prop where
  | s892 (h : Section892 p ag cr c)
  | s893 (h : Section893 p c)
  | s894 (h : Section894 p ag c)

end Proving.USC.T18.Ch42.Elements
