










import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.RacketeeringActs.Elements.Types
import Proving.USC.T18.RacketeeringActs.Elements.Predicates

namespace Proving.USC.T18.RacketeeringActs.Elements

open Proving.USC.Common




inductive HobbsMeans (a : Act) (c : ComplaintText) : Prop where
  | robbery   (h : IsRobbery a c)   : HobbsMeans a c
  | extortion (h : IsExtortion a c) : HobbsMeans a c


structure Section1951 (a : Act) (c : ComplaintText) : Prop where
  means   : HobbsMeans a c
  commerce : AffectsCommerce a c




structure Section1952 (a : Act) (c : ComplaintText) : Prop where
  travels : TravelsOrUsesFacility a c
  promotes : PromotesUnlawfulActivity a c
  intent  : TravelActIntent a c
  overt   : PerformsOvertAct a c







structure Section1956 (p : Person) (t : Txn) (pr : Property) (c : ComplaintText) : Prop where
  transaction : ConductsFinancialTransaction t c
  proceeds    : InvolvesProceeds pr c
  sua         : DerivedFromSpecifiedUnlawfulActivity pr c
  scienter    : ActedWithScienter p c



structure Section1956hConspiracy
    (p : Person) (ag : Agreement) (t : Txn) (pr : Property) (c : ComplaintText) : Prop where
  agreement   : AgreementAmongTwoOrMore ag c
  proceeds    : InvolvesProceeds pr c
  sua         : DerivedFromSpecifiedUnlawfulActivity pr c
  scienter    : ActedWithScienter p c





def ExceedsTenThousand (t : Txn) (c : ComplaintText) : Prop :=
  TransactionValueDollars t c > 10000




structure Section1957 (p : Person) (t : Txn) (pr : Property) (c : ComplaintText) : Prop where
  transaction  : EngagesMonetaryTransaction t c
  cdp          : IsCriminallyDerivedProperty pr c
  sua          : CdpDerivedFromSpecifiedUnlawfulActivity pr c
  value        : ExceedsTenThousand t c
  jurisdiction : Section1957Jurisdiction t c
  scienter     : ActedWithScienter p c






inductive RacketeeringActivity (a : Act) (c : ComplaintText) : Prop where
  | enumerated (h : ActIsEnumeratedRacketeering a c)        : RacketeeringActivity a c
  | hobbs      (h : Section1951 a c)                          : RacketeeringActivity a c
  | travel     (h : Section1952 a c)                          : RacketeeringActivity a c


def AtLeastTwoActs (acts : List Act) (c : ComplaintText) : Prop :=
  PredicateActCount acts c ≥ 2



def WithinTenYears (acts : List Act) (c : ComplaintText) : Prop :=
  PredicateActSpanDays acts c ≤ 3650




structure PatternOfRacketeering (acts : List Act) (c : ComplaintText) : Prop where
  count      : AtLeastTwoActs acts c
  span       : WithinTenYears acts c
  related    : ActsRelated acts c
  continuous : ActsContinuous acts c

end Proving.USC.T18.RacketeeringActs.Elements
