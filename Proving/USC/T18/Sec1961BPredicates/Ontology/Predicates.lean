










import Proving.USC.T18.Sec1961BPredicates.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Sec1961BPredicates.Ontology

open Proving.USC.Common


axiom IsIdentificationDocument (d : IdentificationDocument) (c : ComplaintText) : Prop


axiom IsFalseIdentificationDocument (d : FalseIdentificationDocument) (c : ComplaintText) : Prop


axiom IsAuthenticationFeature (f : AuthenticationFeature) (c : ComplaintText) : Prop


axiom IsFalseAuthenticationFeature (f : FalseAuthenticationFeature) (c : ComplaintText) : Prop


axiom IsDocumentMakingImplement (i : DocumentMakingImplement) (c : ComplaintText) : Prop


axiom IsMeansOfIdentification (m : MeansOfIdentification) (c : ComplaintText) : Prop


axiom IsPersonalIdentificationCard (p : PersonalIdentificationCard) (c : ComplaintText) : Prop


axiom IsIssuingAuthority (e : Entity) (c : ComplaintText) : Prop


axiom IsAccessDevice (a : AccessDevice) (c : ComplaintText) : Prop


axiom IsCounterfeitAccessDevice (a : AccessDevice) (c : ComplaintText) : Prop


axiom IsUnauthorizedAccessDevice (a : AccessDevice) (c : ComplaintText) : Prop


axiom IsDeviceMakingEquipment (q : DeviceMakingEquipment) (c : ComplaintText) : Prop


axiom IsScanningReceiver (r : ScanningReceiver) (c : ComplaintText) : Prop


axiom IsTelecommunicationIdentifyingInformation (t : TelecommunicationIdentifyingInformation) (c : ComplaintText) : Prop


axiom IsCreditCardSystemMember (e : Entity) (c : ComplaintText) : Prop


axiom IsFacilitiesBasedCarrier (e : Entity) (c : ComplaintText) : Prop


axiom IsIllegalGamblingBusiness (g : GamblingBusiness) (c : ComplaintText) : Prop


axiom ViolatesStateGamblingLaw (g : GamblingBusiness) (c : ComplaintText) : Prop


axiom InvolvesFiveOrMorePersons (g : GamblingBusiness) (c : ComplaintText) : Prop


axiom MeetsContinuityOrRevenueThreshold (g : GamblingBusiness) (c : ComplaintText) : Prop


axiom IsGamblingActivity (a : GamblingActivity) (c : ComplaintText) : Prop


axiom IsSavingsPromotionRaffle (s : SavingsPromotionRaffle) (c : ComplaintText) : Prop


axiom IsVeteransMemorialObject (o : VeteransMemorialObject) (c : ComplaintText) : Prop



axiom IsState (e : Entity) (c : ComplaintText) : Prop


axiom IsTraffic (k : TraffickingConduct) (c : ComplaintText) : Prop

end Proving.USC.T18.Sec1961BPredicates.Ontology
