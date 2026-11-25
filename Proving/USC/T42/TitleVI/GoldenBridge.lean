







































import Proving.TitleVI.Statute
import Proving.USC.T42.TitleVI.Elements.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVI.GoldenBridge

open Proving.USC.Common
open Proving.USC.T42.TitleVI.Elements (Program Section2000d SufferedCoveredAdverseAction)













axiom mapPerson    : Person        → Proving.TitleVI.Person
axiom mapComplaint : ComplaintText → Proving.TitleVI.ComplaintText
axiom mapRecipient : Entity        → Proving.TitleVI.Recipient
axiom mapProgram   : Program       → Proving.TitleVI.Program
axiom mapGround    : Program       → Proving.TitleVI.ProtectedGround
axiom mapAction    : Program       → Proving.TitleVI.Action



axiom corr_personInUS {p c} : IsPersonInUS p c →
    Proving.TitleVI.IsPersonInUS (mapPerson p) (mapComplaint c)
axiom corr_isRecipient {e c} : IsFederalFundingRecipient e c →
    Proving.TitleVI.IsRecipient (mapRecipient e) (mapComplaint c)
axiom corr_receivesFFA {e c} : IsFederalFundingRecipient e c →
    Proving.TitleVI.ReceivesFederalFinancialAssistance (mapRecipient e) (mapComplaint c)
axiom corr_isProgramOf {e pr c} : IsFederalFundingRecipient e c →
    Proving.TitleVI.IsProgramOfRecipient (mapProgram pr) (mapRecipient e) (mapComplaint c)
axiom corr_underProgram {p pr c} : SufferedCoveredAdverseAction p pr c →
    Proving.TitleVI.OccursUnderProgram (mapAction pr) (mapProgram pr) (mapComplaint c)
axiom corr_directed {p pr c} : SufferedCoveredAdverseAction p pr c →
    Proving.TitleVI.ActionDirectedAtPerson (mapAction pr) (mapPerson p) (mapComplaint c)
axiom corr_intentional {p pr c} :
    Proving.USC.T42.TitleVI.Elements.OnProtectedGround p c → IntentToDiscriminate p c →
    Proving.TitleVI.IntentionalDiscrimination (mapAction pr) (mapGround pr) (mapComplaint c)













theorem cand_implies_golden_modulo_gaps {p e pr c} (h : Section2000d p e pr c)
    (gap_notInstrumentality :
        Proving.TitleVI.NotAStateInstrumentality (mapPerson p) (mapComplaint c))
    (gap_officialCap :
        Proving.TitleVI.DefendantSuedInOfficialCapacity (mapRecipient e) (mapComplaint c)) :
    Proving.TitleVI.IntentionalDiscriminationClaim
      (mapPerson p) (mapRecipient e) (mapProgram pr) (mapAction pr) (mapGround pr) (mapComplaint c) :=
  ⟨⟨corr_personInUS h.personInUS, gap_notInstrumentality, corr_isRecipient h.fundedProgram,
    corr_receivesFFA h.fundedProgram, corr_isProgramOf h.fundedProgram,
    corr_underProgram h.adverseAction⟩,
   corr_directed h.adverseAction,
   corr_intentional h.protectedGround h.intent,
   gap_officialCap⟩




theorem cand_implies_judicial_claim_modulo_gaps {p e pr c} (h : Section2000d p e pr c)
    (gap_notInstrumentality :
        Proving.TitleVI.NotAStateInstrumentality (mapPerson p) (mapComplaint c))
    (gap_officialCap :
        Proving.TitleVI.DefendantSuedInOfficialCapacity (mapRecipient e) (mapComplaint c)) :
    Proving.TitleVI.ValidTitleVIJudicialClaim (mapPerson p) (mapRecipient e) (mapComplaint c) :=
  .viaIntentional (mapProgram pr) (mapAction pr) (mapGround pr)
    (cand_implies_golden_modulo_gaps h gap_notInstrumentality gap_officialCap)

end Proving.USC.T42.TitleVI.GoldenBridge
