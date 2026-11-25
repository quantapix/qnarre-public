







import Proving.USC.T09.Ontology.Types

namespace Proving.USC.T09.Ontology

open Proving.USC.Common




axiom IsMaritimeTransaction (m : MaritimeTransaction) (c : ComplaintText) : Prop







axiom IsCommerceTransaction (t : CommerceTransaction) (c : ComplaintText) : Prop




axiom IsArbitrationAgreement (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom IsControversy (x : Controversy) (c : ComplaintText) : Prop




axiom IsAward (w : Award) (c : ComplaintText) : Prop




axiom IsCourt (j : Court) (c : ComplaintText) : Prop





axiom IsConventionRelationship (r : ConventionRelationship) (c : ComplaintText) : Prop




axiom IsPredisputeArbitrationAgreement
    (p : PredisputeArbitrationAgreement) (c : ComplaintText) : Prop



axiom IsPredisputeJointActionWaiver
    (p : PredisputeJointActionWaiver) (c : ComplaintText) : Prop



axiom IsSexualAssaultDispute (d : SexualAssaultDispute) (c : ComplaintText) : Prop



axiom IsSexualHarassmentDispute (d : SexualHarassmentDispute) (c : ComplaintText) : Prop

end Proving.USC.T09.Ontology
