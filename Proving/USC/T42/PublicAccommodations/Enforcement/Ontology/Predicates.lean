






import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Ontology.Types

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Ontology

open Proving.USC.Common




axiom IsCommunityRelationsService (e : CommunityRelationsService) (c : ComplaintText) : Prop




axiom IsPersonOrGroup (p : PersonOrGroup) (c : ComplaintText) : Prop




axiom IsPatternOrPractice (x : PatternOrPractice) (c : ComplaintText) : Prop



axiom IsSubchapterRight (r : SubchapterRight) (c : ComplaintText) : Prop




axiom IsPreventiveRelief (rel : PreventiveRelief) (c : ComplaintText) : Prop




axiom IsAttorneyGeneralCivilAction (act : AttorneyGeneralCivilAction) (c : ComplaintText) : Prop




axiom IsThreeJudgeCourt (ct : ThreeJudgeCourt) (c : ComplaintText) : Prop




axiom IsGeneralPublicImportanceCertificate (cert : GeneralPublicImportanceCertificate) (c : ComplaintText) : Prop



axiom IsVoluntarySettlement (s : VoluntarySettlement) (c : ComplaintText) : Prop




axiom IsReferredComplaint (rc : ReferredComplaint) (c : ComplaintText) : Prop

end Proving.USC.T42.PublicAccommodations.Enforcement.Ontology
