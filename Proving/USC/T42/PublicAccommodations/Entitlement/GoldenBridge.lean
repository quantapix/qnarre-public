







































import Proving.TitleVI.Statute
import Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.PublicAccommodations.Entitlement.GoldenBridge
open Proving.USC.Common



axiom mapPerson    : Person → Proving.TitleVI.Person
axiom mapComplaint : ComplaintText → Proving.TitleVI.ComplaintText
axiom mapRecipient : Elements.Establishment → Proving.TitleVI.Recipient
axiom mapProgram   : Elements.Establishment → Proving.TitleVI.Program
axiom mapAction    : Elements.Establishment → Proving.TitleVI.Action
axiom mapGround    : Elements.Establishment → Proving.TitleVI.ProtectedGround





axiom corr_personInUS {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Proving.TitleVI.IsPersonInUS (mapPerson p) (mapComplaint c)



axiom corr_directed {p : Person} {e : Elements.Establishment} {c : ComplaintText} :
    Elements.DeniedFullAndEqualEnjoyment p e c →
    Proving.TitleVI.ActionDirectedAtPerson (mapAction e) (mapPerson p) (mapComplaint c)





axiom corr_intentional {p : Person} {e : Elements.Establishment} {c : ComplaintText} :
    Elements.DiscriminatedOnProhibitedGround p e c →
    Proving.TitleVI.IntentionalDiscrimination (mapAction e) (mapGround e) (mapComplaint c)








theorem cand_implies_golden_modulo_gaps
    {p : Person} {e : Elements.Establishment} {c : ComplaintText}
    (h : Elements.ValidTitleIIPublicAccommodationClaim p e c)
    (hDenied : Elements.DeniedFullAndEqualEnjoyment p e c)
    (hGround : Elements.DiscriminatedOnProhibitedGround p e c)
    (gap_notInstrumentality : Proving.TitleVI.NotAStateInstrumentality (mapPerson p) (mapComplaint c))
    (gap_isRecipient   : Proving.TitleVI.IsRecipient (mapRecipient e) (mapComplaint c))
    (gap_recipient     : Proving.TitleVI.ReceivesFederalFinancialAssistance (mapRecipient e) (mapComplaint c))
    (gap_programOf     : Proving.TitleVI.IsProgramOfRecipient (mapProgram e) (mapRecipient e) (mapComplaint c))
    (gap_underProgram  : Proving.TitleVI.OccursUnderProgram (mapAction e) (mapProgram e) (mapComplaint c))
    (gap_officialCap   : Proving.TitleVI.DefendantSuedInOfficialCapacity (mapRecipient e) (mapComplaint c)) :
    Proving.TitleVI.IntentionalDiscriminationClaim
      (mapPerson p) (mapRecipient e) (mapProgram e) (mapAction e) (mapGround e) (mapComplaint c) :=
  ⟨⟨corr_personInUS h.inUS, gap_notInstrumentality, gap_isRecipient,
    gap_recipient, gap_programOf, gap_underProgram⟩,
   corr_directed hDenied,
   corr_intentional hGround,
   gap_officialCap⟩

end Proving.USC.T42.PublicAccommodations.Entitlement.GoldenBridge
