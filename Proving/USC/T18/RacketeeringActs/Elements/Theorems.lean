










import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.RacketeeringActs.Elements.Types
import Proving.USC.T18.RacketeeringActs.Elements.Predicates
import Proving.USC.T18.RacketeeringActs.Elements.Statute

namespace Proving.USC.T18.RacketeeringActs.Elements

open Proving.USC.Common


theorem section1951_intro {a c}
    (hMeans : HobbsMeans a c) (hCommerce : AffectsCommerce a c) : Section1951 a c :=
  ⟨hMeans, hCommerce⟩


theorem section1952_intro {a c}
    (hTravels : TravelsOrUsesFacility a c) (hPromotes : PromotesUnlawfulActivity a c)
    (hIntent : TravelActIntent a c) (hOvert : PerformsOvertAct a c) : Section1952 a c :=
  ⟨hTravels, hPromotes, hIntent, hOvert⟩


theorem section1956_intro {p t pr c}
    (hTxn : ConductsFinancialTransaction t c) (hProc : InvolvesProceeds pr c)
    (hSua : DerivedFromSpecifiedUnlawfulActivity pr c) (hScn : ActedWithScienter p c) :
    Section1956 p t pr c :=
  ⟨hTxn, hProc, hSua, hScn⟩


theorem section1956hConspiracy_intro {p ag t pr c}
    (hAg : AgreementAmongTwoOrMore ag c) (hProc : InvolvesProceeds pr c)
    (hSua : DerivedFromSpecifiedUnlawfulActivity pr c) (hScn : ActedWithScienter p c) :
    Section1956hConspiracy p ag t pr c :=
  ⟨hAg, hProc, hSua, hScn⟩


theorem section1957_intro {p t pr c}
    (hTxn : EngagesMonetaryTransaction t c) (hCdp : IsCriminallyDerivedProperty pr c)
    (hSua : CdpDerivedFromSpecifiedUnlawfulActivity pr c) (hValue : ExceedsTenThousand t c)
    (hJur : Section1957Jurisdiction t c) (hScn : ActedWithScienter p c) :
    Section1957 p t pr c :=
  ⟨hTxn, hCdp, hSua, hValue, hJur, hScn⟩


theorem patternOfRacketeering_intro {acts c}
    (hCount : AtLeastTwoActs acts c) (hSpan : WithinTenYears acts c)
    (hRel : ActsRelated acts c) (hCont : ActsContinuous acts c) :
    PatternOfRacketeering acts c :=
  ⟨hCount, hSpan, hRel, hCont⟩





example {t c} (hv : TransactionValueDollars t c = 25000) : ExceedsTenThousand t c := by
  unfold ExceedsTenThousand; omega



example {acts c} (hc : PredicateActCount acts c = 3) (hs : PredicateActSpanDays acts c = 365) :
    AtLeastTwoActs acts c ∧ WithinTenYears acts c := by
  unfold AtLeastTwoActs WithinTenYears; omega

end Proving.USC.T18.RacketeeringActs.Elements
