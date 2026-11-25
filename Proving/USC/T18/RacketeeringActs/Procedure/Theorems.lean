






import Proving.USC.T18.RacketeeringActs.Procedure.Statute

namespace Proving.USC.T18.RacketeeringActs.Procedure

open Proving.USC.Common


theorem hobbsCommerceNexus_intro {t c}
    (hAff : ObstructsDelaysOrAffectsCommerce t c) : HobbsCommerceNexus t c :=
  ⟨hAff⟩


theorem travelActNexus_intro {t c}
    (hTrav : InterstateTravelOrFacilityUse t c) : TravelActNexus t c :=
  ⟨hTrav⟩


theorem launderingCommerceNexus_intro {t c}
    (hAff : TransactionAffectsCommerce t c) : LaunderingCommerceNexus t c :=
  ⟨hAff⟩



theorem wellPosedLaunderingAction_intro {t p c}
    (hNexus : TransactionAffectsCommerce t c)
    (hVenue : ProperLaunderingVenue p c)
    (hJur : ForeignPersonJurisdiction p c ∨ Section1957TerritorialCircumstance p c)
    : WellPosedLaunderingAction t p c :=
  ⟨hNexus, hVenue, hJur⟩




theorem timelyLaunderingProsecution_intro {offenseDay chargeDay c}
    (hWin : SevenYearWindowApplies c)
    (hOff : OffenseCommittedDay offenseDay c)
    (hChg : ChargeInstitutedDay chargeDay c)
    (hIn : withinSevenYears offenseDay chargeDay)
    : TimelyLaunderingProsecution offenseDay chargeDay c :=
  ⟨hWin, hOff, hChg, hIn⟩



example : withinSevenYears 0 1000 := by decide

end Proving.USC.T18.RacketeeringActs.Procedure
