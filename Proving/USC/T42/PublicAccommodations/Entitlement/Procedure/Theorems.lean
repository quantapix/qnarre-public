




import Proving.USC.T42.PublicAccommodations.Entitlement.Procedure.Statute

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Procedure

open Proving.USC.Common


theorem timelyFilingNoticeBranch_intro {p c}
    (hTrig : AggrievedTriggerExists p c)
    (hBy   : InstitutedByAggrieved p c)
    (hLaw  : StateLawExists p c)
    (hNote : StateNoticeGiven p c)
    (hWin  : WithinThirtyDayNoticeWindow p c) :
    TimelyFilingNoticeBranch p c :=
  ⟨hTrig, hBy, hLaw, hNote, hWin⟩


theorem timelyFilingNoStateLawBranch_intro {p c}
    (hTrig : AggrievedTriggerExists p c)
    (hBy   : InstitutedByAggrieved p c)
    (hNoLaw : ¬ StateLawExists p c)
    (hRef  : WithinReferralWindow p c) :
    TimelyFilingNoStateLawBranch p c :=
  ⟨hTrig, hBy, hNoLaw, hRef⟩


theorem reachesMerits_intro {p c}
    (hJur : DistrictCourtJurisdiction p c)
    (hNoEx : ExhaustionNotRequired p c) :
    ReachesMerits p c :=
  ⟨hJur, hNoEx⟩


theorem wellFoundedTitleIIAction_viaNotice_intro {p c}
    (h : TimelyFilingNoticeBranch p c) (m : ReachesMerits p c) :
    WellFoundedTitleIIAction p c :=
  .viaNotice h m


theorem wellFoundedTitleIIAction_viaNoStateLaw_intro {p c}
    (h : TimelyFilingNoStateLawBranch p c) (m : ReachesMerits p c) :
    WellFoundedTitleIIAction p c :=
  .viaNoStateLaw h m

end Proving.USC.T42.PublicAccommodations.Entitlement.Procedure
