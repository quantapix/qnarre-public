










import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Deontic.Types

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Deontic

open Proving.USC.Common













axiom AddresseeIsService (c : ComplaintText) : Prop




axiom ComplaintReferredByCourt (c : ComplaintText) : Prop




axiom InvestigationConducted (c : ComplaintText) : Prop




axiom HearingsInExecutiveSession (c : ComplaintText) : Prop





axiom TestimonyReleased (c : ComplaintText) : Prop





axiom ReleaseAuthorized (c : ComplaintText) : Prop




axiom EndeavoredVoluntarySettlement (c : ComplaintText) : Prop















axiom PatternOrPracticeCause (c : ComplaintText) : Prop




axiom AGBroughtCivilAction (c : ComplaintText) : Prop





axiom ThreeJudgeRequestFiled (c : ComplaintText) : Prop




axiom AddresseeIsChiefJudge (j : JudicialOfficer) (c : ComplaintText) : Prop




axiom PanelDesignated (j : JudicialOfficer) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Enforcement.Deontic
