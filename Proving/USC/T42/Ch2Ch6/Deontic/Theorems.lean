






import Proving.USC.T42.Ch2Ch6.Deontic.Statute

namespace Proving.USC.T42.Ch2Ch6.Deontic
open Proving.USC.Common



theorem power88Exercised_intro {c : ComplaintText}
    (hEng : StateLawRestrictsPortEntry88 c) (hAct : GrantsUnladingPermit88 c)
    : Power88Exercised c := ⟨⟨hEng⟩, hAct⟩

theorem obligation89Breached_intro {c : ComplaintText}
    (hEng : RevenueSafetyRequiresWarehouse89 c) (hNot : ¬ WarehousesErected89 c)
    : Obligation89Breached c := ⟨⟨hEng⟩, hNot⟩

theorem obligation90Breached_intro {c : ComplaintText}
    (hEng : CargoUnladenElsewhere90 c) (hNot : ¬ CargoArticlesDeposited90 c)
    : Obligation90Breached c := ⟨⟨hEng⟩, hNot⟩

theorem power91Exercised_intro {c : ComplaintText}
    (hEng : ConformityRequiresExtension91 c) (hAct : ProlongsVesselEntryTerms91 c)
    : Power91Exercised c := ⟨⟨hEng⟩, hAct⟩

theorem prohibition91Violated_intro {c : ComplaintText}
    (hEng : VesselSubjectToQuarantine91 c)
    (hAct : CargoUnladenOtherwiseThanAllowed91 c)
    : Prohibition91Violated c := ⟨⟨hEng⟩, hAct⟩

theorem obligation97Breached_intro {c : ComplaintText}
    (hEng : StateQuarantineRespectingVessel97 c)
    (hNot : ¬ USOfficerObservesAndAidsHealthLaws97 c)
    : Obligation97Breached c := ⟨⟨hEng⟩, hNot⟩

theorem power98Exercised_intro {c : ComplaintText}
    (hEng : HHSRequestsSpareNavyVessels98 c)
    (hAct : PlacesVesselsAtQuarantineDisposal98 c)
    : Power98Exercised c := ⟨⟨hEng⟩, hAct⟩

theorem power112Exercised_intro {c : ComplaintText}
    (hEng : EpidemicEndangersOfficersAtPort112 c)
    (hAct : DirectsRemovalOfRevenueOfficers112 c)
    : Power112Exercised c := ⟨⟨hEng⟩, hAct⟩

theorem obligation112Breached_intro {c : ComplaintText}
    (hEng : RemovalOfOfficersDirected112 c)
    (hNot : ¬ PublicNoticeOfRemovalGiven112 c)
    : Obligation112Breached c := ⟨⟨hEng⟩, hNot⟩



theorem obligation191Breached_intro {c : ComplaintText}
    (hEng : DepartmentBoundToEstablishBureau191 c)
    (hNot : ¬ ChildrensBureauEstablished191 c)
    : Obligation191Breached c := ⟨⟨hEng⟩, hNot⟩

theorem obligation192Breached_intro {c : ComplaintText}
    (hEng : BureauBoundToInvestigate192 c)
    (hNot : ¬ InvestigatesAndReportsChildWelfare192 c)
    : Obligation192Breached c := ⟨⟨hEng⟩, hNot⟩

theorem prohibition192Violated_intro {c : ComplaintText}
    (hEng : HeadOfFamilyObjectsToEntry192 c)
    (hAct : BureauOfficialEntersFamilyResidence192 c)
    : Prohibition192Violated c := ⟨⟨hEng⟩, hAct⟩

theorem obligation193Breached_intro {c : ComplaintText}
    (hEng : SecretaryBoundToAppointAssistant193 c)
    (hNot : ¬ AssistantChiefAppointed193 c)
    : Obligation193Breached c := ⟨⟨hEng⟩, hNot⟩

theorem obligation194Breached_intro {c : ComplaintText}
    (hEng : SecretaryBoundToFurnishQuarters194 c) (hNot : ¬ QuartersFurnished194 c)
    : Obligation194Breached c := ⟨⟨hEng⟩, hNot⟩



theorem rentalWithinCap194_intro {c : ComplaintText}
    (h : ClaimedAnnualRentalDollars194 c ≤ 2000) : RentalWithinCap194 c := h

end Proving.USC.T42.Ch2Ch6.Deontic
