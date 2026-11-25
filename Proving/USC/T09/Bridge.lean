





























import Proving.USC.T09.Elements.Statute
import Proving.USC.T09.Deontic.Statute
import Proving.USC.T09.Ontology.Statute
import Proving.USC.T09.Procedure.Statute
import Proving.USC.T09.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T09.Bridge

open Proving.USC.Common










axiom mapED_agreement : Elements.ArbitrationAgreement → Deontic.ArbitrationAgreement

axiom mapEO_agreement : Elements.ArbitrationAgreement → Ontology.ArbitrationAgreement
axiom mapEO_dispute_assault : Elements.Dispute → Ontology.SexualAssaultDispute
axiom mapEO_predispute : Elements.ArbitrationAgreement → Ontology.PredisputeArbitrationAgreement

axiom mapDO_agreement : Deontic.ArbitrationAgreement → Ontology.ArbitrationAgreement
axiom mapDO_predispute : Deontic.ArbitrationAgreement → Ontology.PredisputeArbitrationAgreement
axiom mapDO_dispute_assault : Deontic.ArbitrationAgreement → Ontology.SexualAssaultDispute












axiom corr_s2_writing_ED {a c} :
    Elements.AgreementInWriting a c → Deontic.IsWrittenArbitrationAgreement (mapED_agreement a) c


axiom corr_s2_noRevocation_ED {a c} :
    Elements.NoRevocationGround a c → ¬ Deontic.RevocationGroundExists (mapED_agreement a) c




theorem s2_elements_implies_deontic {a t d c}
    (h : Elements.Section2 a t d c) :
    Deontic.EnforceabilityConferred2 (mapED_agreement a) c :=
  ⟨⟨corr_s2_writing_ED h.inWriting⟩, corr_s2_noRevocation_ED h.noRevocation⟩

axiom corr_s2_writing_EO {a c} :
    Elements.AgreementInWriting a c → Ontology.IsArbitrationAgreement (mapEO_agreement a) c




axiom corr_s2_subject_EO {a t c} :
    Elements.MaritimeOrCommerceTransaction a t c → Ontology.SubjectTransaction c



axiom gap_s2_controversy_EO (c : ComplaintText) : Prop
axiom corr_s2_controversy_EO {c} :
    gap_s2_controversy_EO c → ∀ (x : Ontology.Controversy), Ontology.IsControversy x c





theorem s2_elements_implies_ontology_modulo_gaps {a t d c}
    (x : Ontology.Controversy)
    (gap : gap_s2_controversy_EO c)
    (h : Elements.Section2 a t d c) :
    Ontology.Section2Arbitrability (mapEO_agreement a) x c :=
  ⟨corr_s2_writing_EO h.inWriting,
   corr_s2_controversy_EO gap x,
   corr_s2_subject_EO h.commerce⟩










axiom corr_s3_referable_ED {a d pr c} :
    Elements.IssueReferableToArbitration a d c →
    Deontic.IssueReferableToArbitration (mapED_agreement a) pr c
axiom corr_s3_notInDefault_ED {p c} :
    Elements.ApplicantNotInDefault p c → Deontic.ApplicantNotInDefault p c

axiom gap_s3_isAgreement_ED {a : Elements.ArbitrationAgreement} (c : ComplaintText) : Prop
axiom corr_s3_isAgreement_ED {a c} :
    gap_s3_isAgreement_ED (a := a) c → Deontic.IsWrittenArbitrationAgreement (mapED_agreement a) c

axiom gap_s3_applied_ED {p : Person} (c : ComplaintText) : Prop
axiom corr_s3_applied_ED {p c} :
    gap_s3_applied_ED (p := p) c → Deontic.PartyAppliedForRelief p c





theorem s3_elements_implies_deontic_modulo_gaps {a d p c} (pr : Deontic.Proceeding)
    (gapAgr : gap_s3_isAgreement_ED (a := a) c)
    (gapApp : gap_s3_applied_ED (p := p) c)
    (h : Elements.Section3 a d p c) :
    Deontic.StayObligation3 (mapED_agreement a) p pr c :=
  ⟨corr_s3_isAgreement_ED gapAgr,
   corr_s3_referable_ED h.referable,
   corr_s3_applied_ED gapApp,
   corr_s3_notInDefault_ED h.notInDefault⟩











axiom corr_s4_writing_ED {a c} :
    Elements.AgreementInWriting a c → Deontic.IsWrittenArbitrationAgreement (mapED_agreement a) c

axiom corr_s4_aggrieved_to_failure_ED {p a c} :
    Elements.AggrievedByRefusalToArbitrate p a c →
    Deontic.FailureToArbitrate p (mapED_agreement a) c
axiom gap_s4_petitioned_ED {p : Person} (c : ComplaintText) : Prop
axiom corr_s4_petitioned_ED {p c} :
    gap_s4_petitioned_ED (p := p) c → Deontic.PartyAppliedForRelief p c
axiom gap_s4_notInIssue_ED {a : Elements.ArbitrationAgreement} (c : ComplaintText) : Prop
axiom corr_s4_notInIssue_ED {a c} :
    gap_s4_notInIssue_ED (a := a) c → Deontic.MakingNotInIssue (mapED_agreement a) c




theorem s4_elements_implies_deontic_modulo_gaps {p a d c} (pr : Deontic.Proceeding)
    (gapPet : gap_s4_petitioned_ED (p := p) c)
    (gapIss : gap_s4_notInIssue_ED (a := a) c)
    (h : Elements.Section4 p a d c) :
    Deontic.CompelObligation4 p (mapED_agreement a) pr c :=
  ⟨corr_s4_writing_ED h.inWriting,
   corr_s4_aggrieved_to_failure_ED h.aggrieved,
   corr_s4_petitioned_ED gapPet,
   corr_s4_notInIssue_ED gapIss⟩











axiom mapED_award : Elements.Award → Deontic.ArbitralAward
axiom corr_s9_timely_ED {w c} :
    Elements.WithinOneYearOfAward w c → Deontic.AwardConfirmationTimely (mapED_award w) c
axiom gap_s9_applied_ED {p : Person} (c : ComplaintText) : Prop
axiom corr_s9_applied_ED {p c} :
    gap_s9_applied_ED (p := p) c → Deontic.PartyAppliedForRelief p c
axiom gap_s9_noGround_ED {w : Elements.Award} (c : ComplaintText) : Prop
axiom corr_s9_noGround_ED {w c} :
    gap_s9_noGround_ED (w := w) c → Deontic.NoGroundToRefuseConfirmation (mapED_award w) c





theorem s9_elements_implies_deontic_modulo_gaps {w a c} (p : Person) (pr : Deontic.Proceeding)
    (gapApp : gap_s9_applied_ED (p := p) c)
    (gapNg : gap_s9_noGround_ED (w := w) c)
    (h : Elements.Section9 w a c) :
    Deontic.ConfirmObligation9 (mapED_award w) p pr c :=
  ⟨corr_s9_applied_ED gapApp,
   corr_s9_timely_ED h.timely,
   corr_s9_noGround_ED gapNg⟩















axiom corr_s402_predispute_ED {a c} :
    Elements.IsPredisputeAgreement a c →
    Deontic.IsPredisputeArbitrationAgreement (mapED_agreement a) c


axiom corr_s402_elected_ED {p d c} :
    Elements.SexualAssaultOrHarassmentDispute d c → Elements.PersonElectsInvalidity p c →
    Deontic.SexualMisconductDisputeElected p c





theorem s402_elements_implies_deontic {p a d c}
    (h : Elements.Section402 p a d c) :
    Deontic.InvalidityProhibition402 (mapED_agreement a) p c :=
  ⟨corr_s402_predispute_ED h.predispute,
   corr_s402_elected_ED h.coveredDispute h.elects⟩



axiom corr_s402_assault_EO {d c} :
    Elements.SexualAssaultOrHarassmentDispute d c →
    Ontology.IsSexualAssaultDispute (mapEO_dispute_assault d) c
axiom corr_s402_predispute_EO {a c} :
    Elements.IsPredisputeAgreement a c →
    Ontology.IsPredisputeArbitrationAgreement (mapEO_predispute a) c




theorem s402_elements_implies_ontology {p a d c}
    (h : Elements.Section402 p a d c) :
    Ontology.EFAANonEnforceable c :=
  Ontology.EFAANonEnforceable.predisputeAgreement
    (mapEO_predispute a)
    (Ontology.CoveredEFAADispute.assault (mapEO_dispute_assault d)
      (corr_s402_assault_EO h.coveredDispute))
    (corr_s402_predispute_EO h.predispute)






axiom corr_s402_predispute_DO {a c} :
    Deontic.IsPredisputeArbitrationAgreement a c →
    Ontology.IsPredisputeArbitrationAgreement (mapDO_predispute a) c
axiom gap_s402_disputeKind_DO (c : ComplaintText) : Prop
axiom corr_s402_disputeKind_DO {a c} :
    gap_s402_disputeKind_DO c →
    Ontology.IsSexualAssaultDispute (mapDO_dispute_assault a) c

theorem s402_deontic_implies_ontology_modulo_gaps {a p c}
    (gapKind : gap_s402_disputeKind_DO c)
    (h : Deontic.InvalidityProhibition402 a p c) :
    Ontology.EFAANonEnforceable c :=
  Ontology.EFAANonEnforceable.predisputeAgreement
    (mapDO_predispute a)
    (Ontology.CoveredEFAADispute.assault (mapDO_dispute_assault a)
      (corr_s402_disputeKind_DO gapKind))
    (corr_s402_predispute_DO h.predispute)

end Proving.USC.T09.Bridge
