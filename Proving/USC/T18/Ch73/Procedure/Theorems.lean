import Proving.USC.T18.Ch73.Procedure.Predicates
import Proving.USC.T18.Ch73.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Procedure

open Proving.USC.Common



theorem properCommencement_intro {p : Person} {c : ComplaintText}
    (hCommenced : ProsecutionCommenced p c)
    (hVenue : VenueProper p c)
    (hJuris : FederalJurisdictionEstablished p c) :
    ProperCommencement p c :=
  ⟨hCommenced, hVenue, hJuris⟩


theorem reachesAdjudication_intro {p : Person} {c : ComplaintText}
    (hCommencement : ProperCommencement p c)
    (hNexus : OfficialProceedingNexus p c)
    (hNoDefense : AffirmativeDefenseNotEstablished p c) :
    ReachesAdjudication p c :=
  ⟨hCommencement, hNexus, hNoDefense⟩


theorem enhancedSentencing_intro {p : Person} {c : ComplaintText}
    (hAdjudication : ReachesAdjudication p c)
    (hTrialNexus : CriminalTrialNexus p c) :
    EnhancedSentencing p c :=
  ⟨hAdjudication, hTrialNexus⟩

end Proving.USC.T18.Ch73.Procedure
