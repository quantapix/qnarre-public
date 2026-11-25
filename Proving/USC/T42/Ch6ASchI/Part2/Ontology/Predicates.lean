import Proving.USC.T42.Ch6ASchI.Part2.Ontology.Types
import Proving.USC.Common.Types








namespace Proving.USC.T42.Ch6ASchI.Part2.Ontology
open Proving.USC.Common




axiom IsCommissionedOfficerOfService (o : Officer) (c : ComplaintText) : Prop





axiom IsRegularCorpsOfficer (o : Officer) (c : ComplaintText) : Prop




axiom IsReadyReserveCorpsOfficer (o : Officer) (c : ComplaintText) : Prop




axiom IsMedicalOfficer (o : Officer) (c : ComplaintText) : Prop




axiom IsPromotionRestrictingRegulationIssued (g : Grade) (c : ComplaintText) : Prop




axiom IsPermanentPromotion (p : Promotion) (c : ComplaintText) : Prop




axiom IsTemporaryPromotion (p : Promotion) (c : ComplaintText) : Prop




axiom IsProfessionalCategory (pc : ProfessionalCategory) (c : ComplaintText) : Prop




axiom IsUniformedServiceActiveService (s : ServicePeriod) (c : ComplaintText) : Prop





axiom IsComparablePHSService (s : ServicePeriod) (c : ComplaintText) : Prop




axiom IsOtherCreditableService (s : ServicePeriod) (c : ComplaintText) : Prop




axiom IsSeniorBiomedicalResearchService (s : ServicePeriod) (c : ComplaintText) : Prop




axiom IsMilitaryBenefit (b : Benefit) (c : ComplaintText) : Prop




axiom IsActiveMilitaryServiceEquivalent (s : ServicePeriod) (c : ComplaintText) : Prop




axiom IsDetailHost (h : DetailHost) (c : ComplaintText) : Prop



axiom IsAdvisoryBody (a : AdvisoryBody) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Part2.Ontology
