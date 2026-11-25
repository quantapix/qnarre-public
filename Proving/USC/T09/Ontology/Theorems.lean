





import Proving.USC.T09.Ontology.Statute

namespace Proving.USC.T09.Ontology

open Proving.USC.Common


theorem subjectTransaction_maritime_intro
    {c} (m : MaritimeTransaction) (h : IsMaritimeTransaction m c)
    : SubjectTransaction c :=
  .maritime m h


theorem subjectTransaction_commerce_intro
    {c} (t : CommerceTransaction) (h : IsCommerceTransaction t c)
    : SubjectTransaction c :=
  .commerce t h


theorem section2Arbitrability_intro
    {a x c}
    (hAgreement : IsArbitrationAgreement a c)
    (hControversy : IsControversy x c)
    (hSubject : SubjectTransaction c)
    : Section2Arbitrability a x c :=
  ⟨hAgreement, hControversy, hSubject⟩


theorem confirmableAward_intro
    {w j c} (hAward : IsAward w c) (hCourt : IsCourt j c)
    : ConfirmableAward w j c :=
  ⟨hAward, hCourt⟩


theorem conventionCoverage_intro
    {a r c}
    (hAgreement : IsArbitrationAgreement a c)
    (hRelationship : IsConventionRelationship r c)
    : ConventionCoverage a r c :=
  ⟨hAgreement, hRelationship⟩


theorem coveredEFAADispute_assault_intro
    {c} (d : SexualAssaultDispute) (h : IsSexualAssaultDispute d c)
    : CoveredEFAADispute c :=
  .assault d h


theorem coveredEFAADispute_harassment_intro
    {c} (d : SexualHarassmentDispute) (h : IsSexualHarassmentDispute d c)
    : CoveredEFAADispute c :=
  .harassment d h


theorem efaaNonEnforceable_agreement_intro
    {c} (p : PredisputeArbitrationAgreement) (d : CoveredEFAADispute c)
    (h : IsPredisputeArbitrationAgreement p c)
    : EFAANonEnforceable c :=
  .predisputeAgreement p d h


theorem efaaNonEnforceable_waiver_intro
    {c} (p : PredisputeJointActionWaiver) (d : CoveredEFAADispute c)
    (h : IsPredisputeJointActionWaiver p c)
    : EFAANonEnforceable c :=
  .jointActionWaiver p d h

end Proving.USC.T09.Ontology
