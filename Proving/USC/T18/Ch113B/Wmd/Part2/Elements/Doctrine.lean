














import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.Common.Tactic

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Elements

open Proving.USC.Common


@[grind →] theorem transnational_of_both {o : Offense} {c : ComplaintText}
    (h1 : ConductOccurringOutsideTheUnitedStates o c)
    (h2 : ConductOccurringWithinTheUnitedStates o c) :
    ConductTranscendingNationalBoundaries o c := ⟨h1, h2⟩


@[grind →] theorem territorialSea_of_locus {o : Offense} {c : ComplaintText}
    (h1 : OffenseCommittedInWatersSeawardOfTheBaselines o c)
    (h2 : nauticalMilesSeawardFromTheBaselines o c ≤ 12) :
    TerritorialSeaOfTheUnitedStates o c := ⟨h1, h2⟩


theorem circumstance_of_territorialSea
    {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : TerritorialSeaOfTheUnitedStates o c) :
    CircumstanceUnderSubsectionB o v pr c := .territorialSea h


theorem circumstance_of_facility
    {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : MailOrFacilityOfCommerceUsedInFurtherance o c) :
    CircumstanceUnderSubsectionB o v pr c := .facilityOfCommerce h




theorem circumstance_is_defendant_independent
    {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : CircumstanceUnderSubsectionB o v pr c) :
    CircumstanceProvedAgainstDefendant p o v pr c := h


@[grind →] theorem violentActRoute_of_kill
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (h1 : KillsPerson p o v c) (h2 : IsPersonInUS v c) :
    ViolentActRoute p o v c := ⟨.kills h1, h2⟩


theorem conduct_of_violentAct
    {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : ViolentActRoute p o v c) :
    ProhibitedConductUnderParagraph1 p o v pr c := .violentAct h


@[grind →] theorem unlawful_of_stateLaw
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : ViolatesTheLawOfAnyState p o c) :
    InViolationOfStateOrFederalLaw p o c := .stateLaw h


@[grind →] theorem section2332bA1_of_elements
    {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h1 : ConductTranscendingNationalBoundaries o c)
    (h2 : CircumstanceProvedAgainstDefendant p o v pr c)
    (h3 : ProhibitedConductUnderParagraph1 p o v pr c)
    (h4 : InViolationOfStateOrFederalLaw p o c) :
    Section2332bA1 p o v pr c := ⟨h1, h2, h3, h4⟩


@[grind →] theorem federalCrimeOfTerrorism_of_halves
    {o : Offense} {c : ComplaintText}
    (h1 : TerrorismMotive o c) (h2 : EnumeratedTerrorismOffense o c) :
    FederalCrimeOfTerrorism o c := ⟨h1, h2⟩





example {o : Offense} {c : ComplaintText}
    (h1 : ConductOccurringOutsideTheUnitedStates o c)
    (h2 : ConductOccurringWithinTheUnitedStates o c) :
    ConductTranscendingNationalBoundaries o c := by prove_element



example {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h1 : ConductOccurringOutsideTheUnitedStates o c)
    (h2 : ConductOccurringWithinTheUnitedStates o c)
    (h3 : MailOrFacilityOfCommerceUsedInFurtherance o c)
    (h4 : KillsPerson p o v c)
    (h5 : IsPersonInUS v c)
    (h6 : ViolatesTheLawOfAnyState p o c) :
    Section2332bA1 p o v pr c := by
  exact ⟨⟨h1, h2⟩, .facilityOfCommerce h3, .violentAct ⟨.kills h4, h5⟩, .stateLaw h6⟩


example {o : Offense} {c : ComplaintText}
    (hLocus : OffenseCommittedInWatersSeawardOfTheBaselines o c)
    (hMiles : nauticalMilesSeawardFromTheBaselines o c = 9) :
    TerritorialSeaOfTheUnitedStates o c := by
  refine ⟨hLocus, ?_⟩
  omega

end Proving.USC.T18.Ch113B.Wmd.Part2.Elements
